package com.csair.admin.core.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.csair.admin.core.dao.PermissionDao;
import com.csair.admin.core.po.core.PermissionQuery;
import com.csair.admin.util.StringUtil;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.PermissionQueryObject;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.RoleQueryObject;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.core.service.PermissionService;
import com.csair.admin.core.service.RoleService;

@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OperationLogService operationLogService;
    private static Logger logger = LoggerFactory.getLogger(RoleServiceImpl.class);

    @Override
    public int deletePermissionByPid(Long pid) {
        //todo 考虑关系表也删除
        return permissionDao.deleteByPrimaryKey(pid);
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
        PermissionQueryObject qo = new PermissionQueryObject();
        qo.setRoleId(roleId);
        List<Permission> list = permissionDao.queryPermission(qo);
        List<Long> result = new ArrayList<>();
        for (Permission p : list) {
            result.add(p.getId());
        }
        return result;
    }

    /**
     * 没有建立对应权限的url集合。
     * 考虑到修改这个共享变量不多
     * 所有为共享变量
     */
    public static Map<String, Method> noPermissionRequestMapping;

    @Override
    public Map<String, Method> getNoPermissionRequestMapping() {
        return noPermissionRequestMapping;
    }

    /**
     * //查询权限；按菜单的id归类并且查询菜单权限放在数组的第一个
     *
     * @return
     */
    @Override
    public Map<String, List<Permission>> queryAllPermissionSort() {
        PermissionQuery ex = new PermissionQuery();
        List<Permission> permissionList = permissionDao.selectByExample(ex);
        Map<String, List<Permission>> map = new HashMap<String, List<Permission>>();
        for (Permission p : permissionList) {
            //如果之前；就新建
            if (!map.containsKey(p.getMid() + "")) {
                List<Permission> ps = new ArrayList<Permission>();
                ps.add(p);
                map.put(p.getMid() + "", ps);
            } else {
                List<Permission> ps = map.get(p.getMid() + "");
                if (p.getName().startsWith("查看菜单")) {
                    ps.add(ps.get(0));
                }
                ps.add(0, p);
            }
        }
        return map;
    }

    @Override
    public int updatePermissByPid(Permission p, User u) {
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

    @Override
    public Permission findByNameMid(String mname, Long mid) {
        PermissionQuery qo = new PermissionQuery();
        qo.createCriteria().andNameEqualTo(mname).andMidEqualTo(mid);
        List<Permission> permissions = permissionDao.selectByExample(qo);
        if (permissions.size() > 0) {
            return permissions.get(0);
        } else {
            return null;
        }
    }


    @Override
    public Long queryPermissionByMidAndMname(Long mid, String mname) {
        PermissionQuery ex = new PermissionQuery();
        ex.createCriteria().andMidEqualTo(mid).andNameEqualTo(mname);
        List<Permission> permissions = permissionDao.selectByExample(ex);
        if (permissions.size() > 0) {
            return permissions.get(0).getId();
        }
        return null;
    }

    //考虑到有共同资源所以用了synchronized
    @Override
    public synchronized int addAdminPermission() {
        RoleQueryObject qo = new RoleQueryObject();
        qo.setType(Role.ADMIN);
        qo.setPageSize(99999999);
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
     *
     * @param p
     * @return
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
    public List<Permission> selectByMenuId(Long mid) {
        PermissionQuery qo = new PermissionQuery();
        qo.createCriteria().andMidEqualTo(mid);
        return permissionDao.selectByExample(qo);
    }

    @Override
    public List<Permission> queryNoMenuPermission() {
        PermissionQuery qo = new PermissionQuery();
        qo.createCriteria().andMidIsNull();
        return permissionDao.selectByExample(qo);
    }

    @Override
    public List<Permission> findAllPermission() {
        PermissionQuery qo = new PermissionQuery();
        return permissionDao.selectByExample(qo);
    }

    @Override
    public int reloadPermission(Map<String, Method> urlAndMethod) {
        List<Permission> ps = findAllPermission();
        Set<String> hasPattern = new HashSet<>();
        for (Permission o : ps) {
            //去掉已经有的；
            if (StringUtils.hasText(o.getUrl())) {
                String[] split = o.getUrl().split("\\|\\|");
                for (String s : split) {
                    urlAndMethod.remove(s);
                }
            }
            //已经有的匹配
            hasPattern.add(o.getUrl());
        }
        for (String s : hasPattern) {
            urlAndMethod.remove(s);
        }
        Set<String> urls = new HashSet<>(urlAndMethod.keySet());
        //把多余的去掉
        for (String temp : urls) {
            if (temp.contains("{")//
                    || temp.contains(".json")//
                    || temp.contains("404")//
                    || temp.contains("login")//
                    || temp.contains("logout")//
                    || temp.contains("index")//
                    || temp.contains("test")//
                    || temp.contains("Exception")//
                    || temp.contains("exception")//
                    || "/health".equals(temp)//
                    || "/beans".equals(temp)//
                    || "/trace".equals(temp)//
                    || "/error".equals(temp)//
                    || "/autoconfig".equals(temp)) {
                urlAndMethod.remove(temp);
            }
            Method m = urlAndMethod.get(temp);
            if (m != null) {
                //如果不是本项目包里面的
                if (!(m.getDeclaringClass()).toString().startsWith("class com.csair")) {
                    urlAndMethod.remove(temp);
                }
            }

        }
        /**
         * 把没有权限的url放到共享变量
         */
        PermissionServiceImpl.noPermissionRequestMapping = urlAndMethod;
        return addAdminPermission();
    }

    @Override
    public PageResult<Permission> query(PermissionQueryObject qo) {
        qo.setPageSize(-1);
        List<Permission> list = permissionDao.queryPermission(qo);
        return new PageResult<Permission>(list, 1, 1, 1);
    }

}

