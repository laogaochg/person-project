package com.csair.admin.dao;

import java.util.List;

import com.csair.admin.po.core.UserQueryObject;
import org.apache.ibatis.annotations.Param;

import com.csair.admin.po.core.User;
import com.csair.admin.po.core.UserQuery;

public interface UserDao {
    int countByExample(UserQuery example);

    int deleteByExample(UserQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(User record);

    int insertSelective(User record);

    List<User> selectByExample(UserQuery example);

    User selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") User record, @Param("example") UserQuery example);

    int updateByExample(@Param("record") User record, @Param("example") UserQuery example);

    int updateByPrimaryKeySelective(User record);

    int updateByPrimaryKey(User record);

    List<User> pageQueryUserList(UserQueryObject qo);

    Integer pageQueryCount(UserQueryObject qo);

}