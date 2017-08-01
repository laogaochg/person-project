package com.test.util;

import java.util.ArrayList;
import java.util.List;
import java.util.concurrent.Callable;

import com.test.model.Login;

public class QueryTestDataCallable implements Callable<Login> {
    public static  long count = 10;
    @Override
    public Login call() throws Exception {
        Login login = new Login();
        login.setId(QueryTestDataCallable.count);
        Thread.sleep(10);// 可能做一些事情
        count++;
        List<Login> list = new ArrayList<>();
        return login;
    }
}
