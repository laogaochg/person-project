package com.csair.admin.core.controller;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.FileCopyUtils;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;

/**
 * Created by 钟述林 393156105@qq.com on 2016/10/24 0:44.
 */
//@SpringBootTest
//@RunWith(SpringRunner.class)
public class FileTest {

    @Value("${web.upload-path}")
    private String path;

    /** 文件上传测试 */
    public void uploadTest() throws Exception {
        BufferedReader d = new BufferedReader(new FileReader("fileName"));
        File f = new File("D:/pic.jpg");
        String s = f.getPath();
        System.out.println("s = " + s);
    }
}
