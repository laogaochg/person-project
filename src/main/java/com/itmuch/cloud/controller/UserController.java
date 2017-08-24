package com.itmuch.cloud.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.time.DateUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.itmuch.cloud.entiey.ResponseEntity;
import com.itmuch.cloud.entiey.RoleQueryObject;
import com.itmuch.cloud.entiey.User;

@RestController
public class UserController {
    @Autowired
    private RestTemplate restTemplate;

    @RequestMapping("/getUserList")
    public Object getUserList() {
        List<User> users = new ArrayList<>();
        for (int i = 0;i < 20;i++) {
            User u = new User();
            u.setAge(new Short(i * 2 + ""));
            u.setId(new Long(i + ""));
            u.setName("名字" + i);
            u.setMan(i % 2 == 0);
            u.setRemark("备注" + i);
            u.setBorthDate(DateUtils.addDays(new Date(),i));
            users.add(u);
        }
//        total	总页数
//        page	当前页
//        records	查询出的记录数
//        rows	包含实际数据的数组
//        id	行id
//        cell	当前行的所有单元格
//        "page": "1",
//                "total": 2,
//                "records": "13",
//                "rows": [
        Map<String,Object > result = new HashMap<>();
        result.put("page",1);
        result.put("total",2);
        result.put("records",20);
        result.put("rows",users);
        return result;
    }

    public static void main(String[] args) {
        long a1 = 1503125104321l;
        long a2 = 1503125106375l;
        long a3 = 1503125109211l;
        System.out.println(a3 - a2);
        long a4 = 1503125111057l;
        System.out.println(a4 - a3);
        long a5 = 1503125116795l;
        System.out.println(a5 - a4);
        long a6 = 1503125118842l;
        System.out.println(a6 - a5);
        long b = 1503125118863l;
        System.out.println(b - a6);
        System.out.println(b - a1);
        List<Long> ids = new ArrayList<Long>();
        ids.add(11L);
        ids.add(22L);
        ids.add(33L);
        ids.add(44L);
        Long[] longs = ids.toArray(new Long[]{});
        System.out.println(Arrays.toString(longs));
    }

    @GetMapping("/movie/{id}")
    public Object fingById(@PathVariable Long id) {
        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id",1);
        List<Long> ids = new ArrayList<Long>();
        ids.add(11L);
        ids.add(22L);
        ids.add(33L);
        ids.add(44L);
        Long[] longs = ids.toArray(new Long[]{});
        System.out.println(Arrays.toString(longs));
        map.put("ids",ids);
        RoleQueryObject qo = new RoleQueryObject();
        qo.setCurrentPage(1);
        qo.setId(8L);
        TestUser u = new TestUser();
        u.setAge(1);
        u.setUsername("aaa");
        Object ua = restTemplate.postForObject("http://map9090.ngrok.cc/permission/test",u,ResponseEntity.class);
        return ua;
    }
}
