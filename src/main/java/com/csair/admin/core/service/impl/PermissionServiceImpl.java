package com.csair.admin.core.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.csair.admin.config.core.PermissionName;
import com.csair.admin.core.dao.PermissionDao;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.query.PermissionQuery;
import com.csair.admin.core.service.MenuService;
import com.csair.admin.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.query.PermissionQueryObject;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.query.RoleQueryObject;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.RoleService;

import javax.annotation.Resource;

@Service
public class PermissionServiceImpl implements PermissionService {
    @Resource
    private PermissionDao permissionDao;
    @Resource
    private RoleService roleService;
    @Resource
    private OperationLogService operationLogService;
    @Resource
    private MenuService menuService;

    /**
     * 没有建立对应权限的url集合。
     * 考虑到修改这个共享变量不多
     * 所有为共享变量
     */
    public static final Map<String, Method> noPermissionRequestMapping = new HashMap<>();

    private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Override
    public int insertPermission(Permission p) {
        return permissionDao.insert(p);
    }

    @Override
    public int editPermission(Permission permission, User u) {
        int i = 0;
        String action;
        if (permission.getId() == null) {
            i = permissionDao.insert(permission);
            action = "添加权限";
        } else {
            i = permissionDao.updateByPrimaryKey(permission);
            action = "修改权限";
        }
        if (i > 0) {
            String content = "权限名字：" + permission.getName() + " ,URL: " + permission.getUrl();
            operationLogService.log(u.getId(), action, content, u.getLastIp());
        }
        return i;
    }

    @Override
    public Permission queryById(Long id) {
        return permissionDao.selectByPrimaryKey(id);
    }

    @Override
    public int batchDelete(Long[] ids, User u) {
        PermissionQuery qo = new PermissionQuery();
        qo.createCriteria().andIdIn(Arrays.asList(ids));
        int i = permissionDao.deleteByExample(qo);
        if (i > 0) {
            String content = "权限id：" + Arrays.toString(ids);
            String action = "删除权限";
            operationLogService.log(u.getId(), action, content, u.getLastIp());
        }
        return 0;
    }

    @Override
    public Map<String, Object> editRolePermission(Long roleId, Long[] permissionIds, User user) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        List<Long> newPermissionIds = new ArrayList<Long>();
        Collections.addAll(newPermissionIds, permissionIds);
        logger.debug("操作人修改角色权限:userId:" + user.getId() + "roleId:" + roleId + "permissionIds" + newPermissionIds);
        Role role = roleService.queryById(roleId);
        if (role != null && Role.ADMIN.equalsIgnoreCase(role.getType())) {
            resultMap.put("mes", "超级管理员不能修改其权限。");
            return resultMap;
        }
        List<Long> oldPermissionIds = queryPermissionIdByRoleId(roleId);
        //需要新增的权限的ID集合
        List<Long> addPermissionIds = new ArrayList<Long>();
        //需要删除的权限的ID集合
        List<Long> removePermissionIds = new ArrayList<Long>();
        for (Long old : oldPermissionIds) {
            //如果旧的东西在新的里面没有；执行删除操作
            if (!newPermissionIds.contains(old)) {
                removePermissionIds.add(old);
            }
        }
        for (Long newPermissionId : newPermissionIds) {
            //如果旧的东西里面没有新的id；执行添加操作
            if (!oldPermissionIds.contains(newPermissionId)) {
                addPermissionIds.add(newPermissionId);
            }
        }
        if (addPermissionIds.size() > 0) {
            for (Long id : addPermissionIds) {
                permissionDao.addRolePermission(roleId, id);
            }
        }
        if (removePermissionIds.size() > 0) {
            for (Long permissionId : removePermissionIds) {
                permissionDao.removeRolePermission(roleId, permissionId);
            }
        }
        StringBuilder sb = new StringBuilder("角色的id" + roleId);
        if (addPermissionIds.size() > 0) {
            String add = StringUtil.join(addPermissionIds, ",");
            if (StringUtils.hasText(add)) {
                add = "；增加角色的id集合：" + add;
                sb.append(add);
            }
        }
        if (removePermissionIds.size() > 0) {
            String add = StringUtil.join(removePermissionIds, ",");
            if (StringUtils.hasText(add)) {
                add = "；删除角色的id集合：" + add;
                sb.append(add);
            }
        }
        operationLogService.log(user.getId(), "修改角色权限", sb.toString(), user.getLastIp());
        resultMap.put("mes", "保存成功！");
        return resultMap;
    }

    private List<Long> queryPermissionIdByRoleId(Long roleId) {
        return permissionDao.queryRolePermission(roleId);
    }


    @Override
    public Map<String, Method> getNoPermissionRequestMapping() {
        return noPermissionRequestMapping;
    }

    /**
     * 查询权限；按菜单的id归类并且查询菜单权限放在数组的第一个
     */
    @Override
    public Map<String, List<Permission>> queryAllPermissionSort() {
        List<Permission> allPermission = permissionDao.selectByExample(new PermissionQuery());
        List<Menu> allMenu = menuService.getAllMenu(false, false);
        Map<String, List<Permission>> result = new HashMap<>();
        for (Menu menu : allMenu) {
            List<Permission> ps = new ArrayList<>();
            result.put(String.valueOf(menu.getMid()), ps);
            for (Permission permission : allPermission) {
                boolean hasAdd = false;
                for (String url : permission.getUrl().split("\\|\\|")) {
                    if (url.equals(menu.getUrl())) {
                        ps.add(permission);
                        hasAdd = true;
                    }
                }
                if (!hasAdd) {//权限的菜单id加进来
                    if (menu.getMid().equals(permission.getMid())) {
                        ps.add(permission);
                    }
                }
            }
        }
        return result;
    }

    @Override
    public int updatePermissionByPid(Permission p, User u) {
        operationLogService.log(u.getId(), "修改权限", "权限的id：" + p.getId() + "权限的名字：" + p.getName() + "  权限的url：" + p.getUrl(), u.getLastIp());
        //维护共享变量
        if (StringUtils.hasText(p.getUrl())) {
            String[] split = p.getUrl().split("\\|\\|");
            for (String s : split) {
                noPermissionRequestMapping.remove(s);
            }
        }
        return permissionDao.updateByPrimaryKey(p);
    }

    /**
     * 维护超级管理员的权限
     * 给超级管理员添加对应的权限
     */
    @Override
    public synchronized int addAdminPermission() {
        RoleQueryObject qo = new RoleQueryObject();
        qo.setType(Role.ADMIN);
        qo.setPageSize(99999);
        List<Role> listData = roleService.query(qo).getListData();
        for (Role r : listData) {
            List<Long> hasPermission = queryPermissionIdByRoleId(r.getId());
            PermissionQuery ex = new PermissionQuery();
            List<Permission> newPids = permissionDao.selectByExample(ex);
            for (Permission p : newPids) {
                if (!hasPermission.contains(p.getId())) {
                    permissionDao.addRolePermission(r.getId(), p.getId());
                }
            }
        }
        return 1;
    }

    /**
     * 添加权限
     */
    @Override
    public Long addPermission(Permission p, User u) {
        permissionDao.insert(p);
        Long id = p.getId();
        //维护共享变量
        if (StringUtils.hasText(p.getUrl())) {
            String[] split = p.getUrl().split("\\|\\|");
            for (String s : split) {
                noPermissionRequestMapping.remove(s);
            }
        }
        operationLogService.log(u.getId(), "新增权限", "权限的id：" + id + "权限的名字：" + p.getName() + "  权限的url：" + p.getUrl(), u.getLastIp());
        //维护超级管理员权限
        addAdminPermission();
        return id;
    }

    @Override
    public List<Permission> queryPermissionByUserId(Long id) {
        return permissionDao.queryPermissionByUserId(id);
    }

    @Override
    public List<Permission> findAllPermission() {
        return permissionDao.selectByExample(new PermissionQuery());
    }

    @Override
    public int reloadPermission(Map<String, Method> urlAndMethod) {
        //给共享变量赋值
        updatePermissionMap(urlAndMethod);
        //维护超级管理员权限
        return addAdminPermission();
    }

    private void updatePermissionMap(Map<String, Method> urlAndMethod) {
        //把多余的去掉;去掉404和项目外的
        removeUnnecessary(urlAndMethod);
        List<Permission> ps = findAllPermission();
        List<Permission> update = new ArrayList<>();
        for (Permission o : ps) {
            //去掉数据库里面一样的
            urlAndMethod.remove(o.getUrl());
//            Method method = urlAndMethod.get(o.getUrl());
//            String name = null;
//            if(method==null) continue;
//            PermissionName annotation = method.getAnnotation(PermissionName.class);
//            if (annotation != null) name = annotation.value();
//            if (!(method.getDeclaringClass().getName().equals(o.getClassName())
//                    &&
//                    ((name != null && name.equals(o.getName())) || (name == null && o.getName() == null))
//            )) {
//                o.setClassName(method.getDeclaringClass().getName());
//                o.setName(name);
//                update.add(o);
//            }
        }
//        for (Permission permission : update) {
//            permissionDao.updateByPrimaryKey(permission);
//        }
//
//        for (String key : urlAndMethod.keySet()) {
//            Method method = urlAndMethod.get(key);
//            Permission p = new Permission();
//            String name = null;
//            PermissionName annotation = method.getAnnotation(PermissionName.class);
//            if (annotation != null) name = annotation.value();
//            p.setName(name);
//            p.setUrl(key);
//            p.setClassName(method.getDeclaringClass().getName());
//            permissionDao.insert(p);
//        }
        logger.debug("没有权限的url:" + urlAndMethod.keySet().toString());
        //把没有权限的url放到共享变量
        PermissionServiceImpl.noPermissionRequestMapping.putAll(urlAndMethod);
    }


    /**
     * 把多余的去掉
     */
    private void removeUnnecessary(Map<String, Method> urlAndMethod) {
        List<String> removeUrl = new ArrayList<>();
        for (String url : urlAndMethod.keySet()) {
            if (url.contains("{")//
                    || url.contains(".json")//
                    || url.contains("404")//
                    || url.contains("login")//
                    || url.contains("logout")//
                    || url.contains("index")//
                    || url.contains("test")//
                    || url.contains("Exception")//
                    || url.contains("exception")//
                    || "/health".equals(url)//健康检查不算
                    || "/beans".equals(url)//
                    || "/trace".equals(url)//
                    || "/error".equals(url)//错误页面不算
                    || "/autoconfig".equals(url)) {
                removeUrl.add(url);
            }
            Method m = urlAndMethod.get(url);
            if (m != null) {
                //如果不是本项目包里面的
                if (!(m.getDeclaringClass()).toString().startsWith("class com.csair")) {
                    removeUrl.add(url);
                }
            }
        }
        for (String s : removeUrl) {
            urlAndMethod.remove(s);
        }
    }

    @Override
    public PageResult<Permission> query(PermissionQueryObject qo) {
        if (qo.getPageSize() == -1) {
            return new PageResult<>(permissionDao.queryPermission(qo), 1, 1, 1);
        } else {
            return new PageResult<>(permissionDao.queryPermission(qo), permissionDao.queryCountPermission(qo), qo.getCurrentPage(), qo.getPageSize());
        }
    }

}

