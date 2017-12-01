package com.csair.admin.core.service;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.PermissionQueryObject;

/**
 * Created by laogaochg on 2017/6/27.
 */
public interface PermissionService {
    /**
     * 查询角色下的权限
     * 支持分页
     */
    PageResult<Permission> query(PermissionQueryObject qo);

    /**
     * 重新加载controller方法里面的权限
     *
     * @param urlAndMethod 所有RequestMapping对应的URL和它对应的方法
     */
    int reloadPermission(Map<String, Method> urlAndMethod);

    /**
     * 查询所有权限
     *
     * @return
     */
    List<Permission> findAllPermission();


    /**
     * 查询用户的所有权限
     *
     * @param id
     * @return
     */
    List<Permission> queryPermissionByUserId(Long id);

    /**
     * 添加权限
     */
    Long addPermission(Permission p, User u);

    /**
     * 维护超级管理员的权限
     * 给超级管理员添加对应的权限
     */
    int addAdminPermission();

    /**
     * 根据id修改
     *
     * @param p
     * @return
     */
    int updatePermissionByPid(Permission p, User u);

    /**
     * 查询权限；按菜单的id归类并且查询菜单权限放在数组里，并权限名字去重
     */
    Map<String, List<Permission>> queryAllPermissionSort();

    /**
     * 得到所有没有对应权限的url和它的方法
     */
    Map<String, Method> getNoPermissionRequestMapping();

    /**
     * 修改角色下的权限
     */
    Map<String, Object> editRolePermission(Long roleId, Long[] permissionIds, User user);

    /**
     *
     * @return 受影响的行数
     */
    int batchDelete(Long[] ids, User u);

    Permission queryById(Long id);
}
