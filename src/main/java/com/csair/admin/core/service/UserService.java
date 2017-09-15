package com.csair.admin.core.service;

import org.apache.shiro.subject.Subject;

import com.csair.admin.core.po.core.ResponseEntity;
import com.csair.admin.core.po.core.ReturnMessage;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.UserVo;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.UserQueryObject;

/**
 * laogaochg
 * 2017/7/1.
 */
public interface UserService {
    /**
     * 根据id查询用户
     * @param id
     * @return
     */
    User queryUserById(Long id);
    /**
     * 根据用户名查询用户
     * 用于登陆本项目
     * @param email
     * @return
     */
    User userLogin(String email);

    /**
     *
     * @param vo 数据封装
     * @param admin 操作者
     * @return
     */
    ReturnMessage editUse(UserVo vo ,Subject admin);

    PageResult<User> query(UserQueryObject qo);

    int changePassword(String oldPassword,String newPassword,User u);

    /**
     * 根据用户id修改用户
     */
    int editUser(User user);

    /**
     * 禁止用户登陆
     * @param id 被禁止人ID
     * @param user 操作人
     * @return
     */
    ResponseEntity<Object> forbidUserLogin(Long id,User user);

    /**
     * 取消禁止用户登录
     * @param id
     * @param user
     * @return
     */
    ResponseEntity<Object> cancelForbidUserLogin(Long id,User user);
}
