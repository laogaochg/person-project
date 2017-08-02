package com.test.web.controller;

import java.util.concurrent.Callable;

import com.test.model.Login;

/**
 * laogaochg
 * 2017/8/2.
 */
public class QueryTestDataCallable implements Callable<Login> {
    @Override
    public Login call() throws Exception {

        return new Login();
    }
}
