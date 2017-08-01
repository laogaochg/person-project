package com.test.service.impl;

import org.springframework.stereotype.Service;

import com.test.service.UserService;
@Service
public class UserServiceImpl implements UserService {
    @Override
    public int login(String userId) {
        System.out.println("userId = " + userId);
        return 1;
    }
}
