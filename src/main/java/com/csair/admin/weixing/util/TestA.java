package com.csair.admin.weixing.util;

import com.csair.admin.core.po.core.User;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/10/26 14:31
 */
public class TestA {
    public <T extends User> T getT(T t) {
        System.out.println(t.getId());
        return t;
    }
}
