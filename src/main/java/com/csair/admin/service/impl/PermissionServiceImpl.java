package com.csair.admin.service.impl;

import java.lang.reflect.Method;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.PermissionDao;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.Permission;
import com.csair.admin.po.PermissionQueryObject;
import com.csair.admin.po.Role;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.User;
import com.csair.admin.service.OperationLogService;
import com.csair.admin.service.PermissionService;
import com.csair.admin.service.RoleService;

@Service("permissionService")
public class PermissionServiceImpl implements PermissionService {
    @Autowired
    private PermissionDao permissionDao;
    @Autowired
    private RoleService roleService;
    @Autowired
    private OperationLogService operationLogService;
    /**
     * 没有建立对应权限的url集合。
     * 考虑到修改这个共享变量不多
     * 所有为共享变量
     */
    public static Map<String,Method> noPermissionRequestMapping;

    @Override
    public Map<String,Method> getNoPermissionRequestMapping() {
        return noPermissionRequestMapping;
    }

    /**
     * //查询权限；按菜单的id归类并且查询菜单权限放在数组的第一个
     *
     * @return
     */
    @Override
    public Map<String,List<Permission>> queryAllPermissionSort() {
        List<Permission> permissionList = permissionDao.queryAllPermission();
        Map<String,List<Permission>> map = new HashMap<String,List<Permission>>();
        for (Permission p : permissionList) {
            //如果之前；就新建
            if (!map.containsKey(p.getMid() + "")) {
                List<Permission> ps = new ArrayList<Permission>();
                ps.add(p);
                map.put(p.getMid() + "",ps);
            } else {
                List<Permission> ps = map.get(p.getMid() + "");
                if (p.getName().startsWith("查看菜单")) {
                    ps.add(ps.get(0));
                }
                ps.add(0,p);
            }
        }
        return map;
    }

    @Override
    public int updatePermissByPid(Permission p,User u) {
        operationLogService.log(u.getId(),"修改权限","权限的id：" + p.getId() + "权限的名字：" + p.getName() + "  权限的url：" + p.getUrl(),u.getLastIp());
        //维护共享变量
        if (StringUtils.hasText(p.getUrl())) {
            String[] split = p.getUrl().split("\\|\\|");
            for (String s : split) {
                noPermissionRequestMapping.remove(s);
            }
        }
        return permissionDao.updatePermisssionByPid(p);
    }

    @Override
    public Permission findByNameMid(String mname,Long mid) {
        return permissionDao.findByNameMid(mname,mid);
    }

    @Override
    public int deleteRolePermissionByPid(Long pid) {
        return permissionDao.deleteRolePermissionByPid(pid);
    }

    @Override
    public Long deleteByMenuId(Long mid,String mname) {
        return permissionDao.deleteByMenuId(mid,mname);
    }

    //考虑到有共同资源所以用了synchronized
    @Override
    public synchronized int addAdminPermission() {
        RoleQueryObject qo = new RoleQueryObject();
        qo.setType(Role.ADMIN);
        qo.setPageSize(1111);
        List<Role> listData = roleService.query(qo).getListData();
        for (Role r : listData) {
            List<Long> hasPermission = roleService.queryPermissionIdByRoleId(r.getId());
            List<Permission> newPids = permissionDao.queryAllPermission();
            List<Long> pids = new ArrayList<Long>();
            for (Permission p : newPids) {
                if (!hasPermission.contains(p.getId())) {
                    pids.add(p.getId());
                }
            }
            List<Long> rids = new ArrayList<Long>();
            rids.add(r.getId());
            if (pids.size() > 0) {
                permissionDao.insertPermissionRole(rids,pids);
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
    public Long addPermission(Permission p,User u) {
        Long id = permissionDao.addPermission(p);
        //维护共享变量
        if (StringUtils.hasText(p.getUrl())) {
            String[] split = p.getUrl().split("\\|\\|");
            for (String s : split) {
                noPermissionRequestMapping.remove(s);
            }
        }
        operationLogService.log(u.getId(),"新增权限","权限的id：" + id + "权限的名字：" + p.getName() + "  权限的url：" + p.getUrl(),u.getLastIp());
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
        return permissionDao.selectByMenuId(mid);
    }

    @Override
    public List<Permission> queryNoMenuPermission() {
        return permissionDao.selectByMenuId(null);
    }

    @Override
    public List<Permission> findAllPermission() {
        return permissionDao.queryAllPermission();
    }

    @Override
    public int reloadPermission(Map<String,Method> urlAndMethod) {
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
        List<Permission> list = permissionDao.query(qo);
        return new PageResult<Permission>(list,1,1,1);
    }

}

