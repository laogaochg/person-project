package com.csair.admin.service;

import java.lang.reflect.Method;
import java.util.List;
import java.util.Map;

import com.csair.admin.po.Permission;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.PermissionQueryObject;

/**
 * Created by lenovo on 2017/6/27.
 */
public interface PermissionService {
    /**
     * 查询角色下的权限
     */
    PageResult<Permission> query(PermissionQueryObject qo);

    /**
     * 重新加载controller方法里面的权限
     *
     * @param urlAndMethod 所有RequestMapping对应的URL和它对应的方法
     */
    int reloadPermission(Map<String,Method> urlAndMethod);

    /**
     * 查询所有权限
     *
     * @return
     */
    List<Permission> findAllPermission();

    /**
     * 查询没有菜单的权限
     */
    List<Permission> queryNoMenuPermission();

    /**
     * 根据权限id查权限
     */
    List<Permission> selectByMenuId(Long mid);

    /**
     * 查询用户的所有权限
     *
     * @param id
     * @return
     */
    List<Permission> queryPermissionByUserId(Long id);

    /**
     * 添加权限
     *
     * @param p
     * @return
     */
    Long addPermission(Permission p,User u);

    /**
     * 维护超级管理员的权限
     * 给超级管理员添加对应的权限
     */
    int addAdminPermission();

    /**
     * 返回删除的权限的主键
     *
     * @param mid
     * @return
     */
    Long deleteByMenuId(Long mid,String mname);

    /**
     * 删除指定指定权限下角色与权限的关系
     *
     * @param pid
     * @return
     */
    int deleteRolePermissionByPid(Long pid);

    /**
     * 根据名字和菜单id查询权限
     */
    Permission findByNameMid(String mname,Long mid);

    /**
     * 根据id修改内宅
     *
     * @param p
     * @return
     */
    int updatePermissByPid(Permission p,User u);

    /**
     * 查询权限；按菜单的id归类并且查询菜单权限放在数组的第一个
     */
    Map<String,List<Permission>> queryAllPermissionSort();

    /**
     * 得到所有没有对应权限的url和它的方法
     */
    Map<String,Method> getNoPermissionRequestMapping();

}
