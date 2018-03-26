package com.csair.admin.core.service;

import java.util.List;
import java.util.Map;

import org.apache.shiro.subject.Subject;

import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.query.RoleQueryObject;

public interface RoleService {

    PageResult<Role> query(RoleQueryObject qo);

    Map<String, Object> add(Role role, Subject subject);

    /**
     * 删除角色
     *
     * @param roleId
     * @param user
     * @return
     */
    int deleteRole(Long roleId, User user);


    /**
     * 删除指定角色下的用户
     *
     * @param userIds 要删除的用户ID
     * @param roleId  角色ID
     * @param user    操作人
     * @return
     */
    Map<String, Object> removeRoleUser(Long[] userIds, Long roleId, User user);


    /**
     * 查询所有角色
     *
     * @return
     */
    List<Role> queryAllRole();


    /**
     * 根据用户的ID查询用户所有的角色
     *
     * @param id
     * @return
     */
    List<Role> queryRoleByUserId(Long id);

    Role queryById(Long roleId);

    /**
     * 删除用户角色
     *
     * @param userId
     * @return
     */
    int removeUserRole(Long userId, Long roleId);

    /**
     * 添加用户角色
     *
     * @param userId
     * @param roleId
     * @return
     */
    int addUserRole(Long userId, Long roleId);
}
