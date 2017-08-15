package com.itmuch.cloud.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.itmuch.cloud.entiey.ResponseEntity;
import com.itmuch.cloud.entiey.RoleQueryObject;

@RestController
public class UserController {
    @Autowired
    private RestTemplate restTemplate;
    @GetMapping("/movie/{id}")
    public Object fingById(@PathVariable Long id ){
    	Map<String ,Object > map = new HashMap<String,Object>();
    	map.put("id", 1);
    	List<String> ids = new ArrayList<String> ();
    	ids.add("11");
    	ids.add("11");
    	ids.add("11");
    	ids.add("11");
    	map.put("ids", ids);
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
