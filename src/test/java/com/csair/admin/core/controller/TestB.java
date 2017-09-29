package com.csair.admin.core.controller;

import com.csair.admin.core.po.core.User;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/26 16:26
 */
public class TestB {
    public static void main(String[] args) {
        User u = null;
        if((u = new User())!=null){
            System.out.println(u);
        }
    }
}
