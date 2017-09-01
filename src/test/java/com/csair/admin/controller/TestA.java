package com.csair.admin.controller;
//test 

/**
 * laogaochg
 * 2017/6/30.
 */
public class TestA {
    public static void main(String[] args) throws Exception {
        String s = "/user||/test";
        String[] split = s.split("\\|\\|");
        for (String s1 : split) {
            System.out.println(s1);
        }
    }
}
