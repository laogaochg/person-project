package com.csair.admin.service;

import java.util.List;
import java.util.Map;

import org.apache.shiro.subject.Subject;

import com.csair.admin.po.Role;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.RoleUserQueryObject;

public interface RoleService {

    PageResult<Role> query(RoleQueryObject qo);

    Map<String,Object> add(Role role, Subject subject);

    /**
     * 删除角色
     * @param roleId
     * @param user
     * @return
     */
    Map<String,Object> deleteRole(Long roleId,User user);


    /**
     * 删除指定角色下的用户
     * @param userIds 要删除的用户ID
     * @param roleId 角色ID
     * @param user 操作人
     * @return
     */
    Map<String,Object> removeRoleUser(Long[] userIds,Long roleId,User user);
    /**
     * 查看角色成员账号
     * @return
     */
    PageResult queryUserByRole(RoleUserQueryObject qo);

    /**
     * 查询所有角色
     * @return
     */
    List<Role> queryAllRole();

    /**
     * 编辑角色的权限
     * @param roleId
     * @param permissionIds
     * @return
     */
    Map<String,Object> editRolePermission(Long roleId,Long[] permissionIds,User user);

    /**
     *
     * 根据用户的ID查询用户所有的角色
     * @param id
     * @return
     */
    List<Role> queryRoleByUserId(Long id);

    List<Long> queryPermissionIdByRoleId(Long id);
}
