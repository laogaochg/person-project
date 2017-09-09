package com.csair.admin.dao;

import com.csair.admin.po.Permission;
import com.csair.admin.po.PermissionQuery;
import java.util.List;
import com.csair.admin.po.PermissionQueryObject;
import org.apache.ibatis.annotations.Param;

public interface PermissionDao {
    int countByExample(PermissionQuery example);

    int deleteByExample(PermissionQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(Permission record);

    int insertSelective(Permission record);

    List<Permission> selectByExample(PermissionQuery example);

    Permission selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Permission record, @Param("example") PermissionQuery example);

    int updateByExample(@Param("record") Permission record, @Param("example") PermissionQuery example);

    int updateByPrimaryKeySelective(Permission record);

    int updateByPrimaryKey(Permission record);

    List<Permission> queryPermissionByUserId(Long userId);

    List<Permission> queryPermission(PermissionQueryObject qo);

    int addRolePermission(@Param("roleId")Long roleId, @Param("permissionId")Long permissionId);

    int removeRolePermission(@Param("roleId")Long roleId, @Param("permissionId")Long permissionId);
}