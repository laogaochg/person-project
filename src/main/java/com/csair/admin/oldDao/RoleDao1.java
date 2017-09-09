package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.Role;
import com.csair.admin.po.User;
import com.csair.admin.po.RoleQueryObject;
import com.csair.admin.po.RoleUserQueryObject;

public interface RoleDao1 {
    /**
     * 分布查询角色
     */
    List<Role> pageQueryRole(RoleQueryObject qo);
    /**
     * 统计符合条件的数量
     */
    Integer countPageQueryRole(RoleQueryObject qo);

    /**
     * 根据用户的角色查询用户
     */
    List<User> pageQueryUserByRole(RoleUserQueryObject qo);

    /**
     * 统计符合条件的数量
     */
    Integer countUserByRole(RoleUserQueryObject qo);

    List<Role> queryAllRole();


    /**
     * 根据角色的id查询角色下的权限的id
     */
    List<Long> queryPermissionIdByRoleId(Long roleId);

    /**
     * 批量插入角色与权限；
     * @param roleId 角色id
     * @param addPermissionIds 权限ids
     * batchInsertRoleUser into e_admin_role_permission ( rid , pid ) values
     */
    Integer batchInsert(Long roleId,List<Long> addPermissionIds);

    /**
     * 删除角色和权限的关系；
     * @param roleId 角色id
     * @param removePermissionIds 权限id
     */
    Integer batchRemove(Long roleId,List<Long> removePermissionIds);

    /**
     * 删除id为指定值的角色
     *  String sql = " DELETE FROM  e_admin_role  where id = ? ";
     */
    Integer delete(Long roleId);

    /**
     * 删除角色下的用户
     * String sql = " DELETE FROM e_admin_user_role WHERE rid = ? AND uid IN ( " + StringUtils.collectionToDelimitedString(ids," , ") + " ) ";
     */
    Integer deleteRoleUser(Long roleId,List<String> ids);

    /**
     * String sql = " UPDATE e_admin_role SET  name = ?  , type  = ? , remark = ?  where id = ? ";
     * 根据id修改角色
     */
    Integer updateRole(Role role);

    /**
     * String sql = " INSERT INTO e_admin_role ( NAME , TYPE , REMARK ) VALUES ( ? , ? , ? )";
     *dataSourceUtils.doUpdateGetId(sql,role.getName(),role.getType(),role.getRemark());
     * @return 返回新增的id
     */
    Long addRole(Role role);

    /**
     *
     * 根据用户的ID查询用户所有的角色
     */
    List<Role> queryRoleByUserId(Long id);


    /**
     * 批量插入用户和角色 的关系
     */
    int batchInsertUserRole(Long userId,List<Long> addRoleIds);

    /**
     * 批量删除用户和角色的关系
     */
    int removeUserRole(Long userId,List<Long> addRoleIds);
}
