package com.csair.admin.controller;

import java.io.InputStream;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.csair.admin.dao.UserDao;
import com.csair.admin.po.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.server.ServletServerHttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.util.StreamUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.client.RestTemplate;

import com.csair.admin.service.OperationLogService;
import com.csair.admin.po.Permission;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.RoleQueryObject;

@Controller
@RequestMapping("/test")
public class TestController {

    @Value("${application.hello:Hello Angel}")
    private String hello;

    @Autowired
    private UserDao userDao;

    @Autowired
    private OperationLogService operationLogService;

    @RequestMapping("/jsp")
    public String helloJsp(Map<String,Object> map) {
        return "";
    }

    public static class PermissionEntity extends ResponseEntity<List<Permission>> {
        private List<Permission> permission;

        @Override
        public List<Permission> getData() {
            return permission;
        }

        @Override
        public void setData(List<Permission> p) {
            permission = p;
        }
    }

    @ResponseBody
    @RequestMapping("/redis")
    public String testRedis(RoleQueryObject qo,HttpServletRequest request) throws Exception {
        ServletServerHttpRequest ssq = new ServletServerHttpRequest(request);
        InputStream body = ssq.getBody();
        HttpHeaders headers = ssq.getHeaders();
        MediaType contentType = headers.getContentType();
        String type = "";
        String s = StreamUtils.copyToString(body,Charset.forName("utf-8"));
        System.out.println("s = " + s);
        return "Done";
    }

    @RequestMapping("/freemarker")
    public String hello(Map<String,Object> map) {
        map.put("name","Alise");
        return "index";
    }

}
