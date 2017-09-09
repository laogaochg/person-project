package com.csair.admin.dao;

import com.csair.admin.po.Role;
import com.csair.admin.po.RoleQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface RoleDao {
    int countByExample(RoleQuery example);

    int deleteByExample(RoleQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(Role record);

    int insertSelective(Role record);

    List<Role> selectByExample(RoleQuery example);

    Role selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") Role record, @Param("example") RoleQuery example);

    int updateByExample(@Param("record") Role record, @Param("example") RoleQuery example);

    int updateByPrimaryKeySelective(Role record);

    int updateByPrimaryKey(Role record);

    int removeUserRole(@Param("userId") Long userId,@Param("roleId") Long roleId);

    int addUserRole(@Param("userId") Long userId,@Param("roleId") Long roleId);

    List<Role> queryRoleByUserId(Long userId);
}