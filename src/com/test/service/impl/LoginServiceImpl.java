package com.test.service.impl;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.test.dao.LoginDao;
import com.test.model.Login;
import com.test.service.LoginService;

@Service
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginDao loginDao;
	@Override
	public Map<Object, Object> test(String id) {
		Map<Object, Object> map = new HashMap<>();
		map.put("id", id);
        Login l=new Login();
        l.setAge("17");
        l.setId(1L);
        l.setName("laogao");
        l.setPassword("111111");
        l.setUserName("laogao");
        loginDao.insert(l);
		System.out.println("==================>"+l.getId());
		return map;
	}

}
