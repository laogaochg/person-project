package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.Permission;
import com.csair.admin.po.PermissionQueryObject;

/**
 * Created by lenovo on 2017/6/27.
 */
public interface PermissionDao1 {
    /**
     * 不用分页
     * 查询角色下的权限
     * select p.* from e_admin_role_permission rp JOIN e_admin_permission p on rp.pid = p.id
     */
    List<Permission> query(PermissionQueryObject qo);


    /**
     * 根据菜单ID查询菜单的权限
     * 如果传null；就查为null的
     */
    List<Permission> selectByMenuId(Long mid);

    /**
     * 给指定的权限添加菜单
     */
    Integer updateMenu(Long menuId,Long permissionId);

    /**
     * 批量插入权限与角色的关系；rids为角色id集合；ids为权限id集合
     *  StringBuilder sbd = new StringBuilder("       ");
     *   for (Long rid : rids) {
     *       for (Long pid : ids) {
     *       sbd.append(" ( " + rid + " , " + pid + " ) ,");
     *       }
     *   }
     *   sql = " batchInsertRoleUser into e_admin_role_permission values " + sbd.substring(0,sbd.length() - 2);
     */
    Integer insertPermissionRole(List<Long> rids,List<Long> ids);

    /**
     * 添加权限
     */
    Long addPermission(Permission p);

    /**
     * 查询用户的所有权限（去重！）
     */
    List<Permission> queryPermissionByUserId(Long id);


    /**
     * 删除菜单对应的权限；采用双匹配
     * 删除的权限的id
     */
    Long deleteByMenuId(Long mid,String mname);

    /**
     * 根据权限id删除角色与权限的关系
     */
    int deleteRolePermissionByPid(Long pid);

    /**
     * 根据名字和菜单id查询权限
     */
    Permission findByNameMid(String mname,Long mid);

    /**
     * 根据id修改权限
     */
    int updatePermisssionByPid(Permission p);

    /**
     * 查询全部的权限
     */
    List<Permission> queryAllPermission();

    /**
     * 插入权限返回自增id
     */
    Long insertPermission(Permission p);
}
