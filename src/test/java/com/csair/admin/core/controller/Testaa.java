package com.csair.admin.core.controller;

import com.alibaba.fastjson.JSON;
import com.csair.admin.core.vo.GoodsVo;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;
import org.springframework.util.StreamUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.nio.charset.Charset;

@SpringBootTest
@RunWith(SpringRunner.class)
public class Testaa {
    @Autowired
    private GoodsController goodsController;
    @Test
    public void testInsert() throws Exception {
        File file = new File("G:\\daima\\springboot-layui\\springboot-layui\\log\\GoodsVo.json");
        String s = StreamUtils.copyToString(new FileInputStream(file), Charset.forName("utf-8"));
        System.out.println(s);
        GoodsVo goodsVo = JSON.parseObject(s, GoodsVo.class);
        System.out.println("goodsVo = " + goodsVo);
        goodsController.delete(goodsVo);
    }
}
