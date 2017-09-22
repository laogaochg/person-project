package com.csair.admin.core.controller;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/22 15:58
 */

import com.csair.admin.Application;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.UserQueryObject;
import com.csair.admin.core.service.UserService;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.test.context.transaction.TransactionConfiguration;
import org.springframework.transaction.annotation.Transactional;

import javax.annotation.Resource;

/**
 * 声明用的是Spring的测试类
 **/
@RunWith(SpringJUnit4ClassRunner.class) // SpringJUnit支持，由此引入Spring-Test框架支持！
@SpringBootTest
public class TestJunit4 {

    @Resource
    private UserService userService;

    @Test // 新增（来个20条数据） 注意新增的时候先把事务注掉，要不会回滚操作
    public void testSaveUser() {
        PageResult<User> query = userService.query(new UserQueryObject());
        System.out.println(query.getListData());
    }

}
