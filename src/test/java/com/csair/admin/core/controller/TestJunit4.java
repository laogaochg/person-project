package com.csair.admin.core.controller;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/22 15:58
 */

import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.po.core.query.UserQueryObject;
import com.csair.admin.core.service.UserService;
import org.junit.Before;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.mock.web.MockHttpServletRequest;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.test.web.servlet.setup.MockMvcBuilders;

import javax.annotation.Resource;
import javax.servlet.ServletContext;
import javax.servlet.http.Cookie;
import java.io.IOException;

/**
 * 声明用的是Spring的测试类
 **/
@RunWith(SpringJUnit4ClassRunner.class) // SpringJUnit支持，由此引入Spring-Test框架支持！
public class TestJunit4 {
//    @Autowired
//    private ServletContext context;
//    @Autowired
//    private BrandController brandController;
//    //mock模拟request
//    private MockHttpServletRequest request;
//
//    private MockMvc mockMvc;
//    @Before
//    public void setup() throws IOException {
//        mockMvc = MockMvcBuilders.standaloneSetup(brandController).build();
//        request = new MockHttpServletRequest();
//        Cookie cookie = new Cookie("1","2");
//        request.setCookies(cookie);
//    }
//    @Test
//    public void brandList() throws Exception {
//        TestUtils.doGetMethod("/brand/list",false,mockMvc);
//    }

    @Resource
    private UserService userService;

    public static void main(String[] args) {

    }
    @Test // 新增（来个20条数据） 注意新增的时候先把事务注掉，要不会回滚操作
    public void testSaveUser() {
        PageResult<User> query = userService.query(new UserQueryObject());
        System.out.println(query.getListData());
    }

}
