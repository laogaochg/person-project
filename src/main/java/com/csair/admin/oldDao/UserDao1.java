package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.User;
import com.csair.admin.po.UserQueryObject;

/**
 * Created by lenovo on 2017/6/27.
 */
public interface UserDao1 {
    /**
     * 分页查询用户
     */
    List<User> pageQueryUser(UserQueryObject qo);

    /**
     * 查询符合条件的用户数量
     */
    int countPageQueryUser(UserQueryObject qo);

    /**
     * 用户登陆查询
     * @param email        用户邮箱
     * @param platFormFlag 平台标识
     */
    List<User> queryUserForLogin(String email,String platFormFlag);

    /**
     * 新建一个用户返回id
     */
    Long insertUser(User u);

    /**
     * 编辑用户
     * 如果对应的内容为空则该内容不更改
     */
    int upDateSelect(User vo);
}
