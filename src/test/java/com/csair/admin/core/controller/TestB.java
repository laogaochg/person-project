package com.csair.admin.core.controller;

import com.csair.admin.core.po.core.User;

import java.io.File;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/26 16:26
 */
public class TestB {
    public static void main(String[] args) {
        File f = new File("D:/a/as/pic.jpg");
        String s = f.getParent();
        System.out.println("s = " + s);
    }
}
