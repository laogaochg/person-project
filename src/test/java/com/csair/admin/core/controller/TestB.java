package com.csair.admin.core.controller;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.csair.admin.core.po.core.User;
import org.springframework.util.StreamUtils;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/26 16:26
 */
public class TestB {
    public static void main(String[] args) throws IOException {
        File f = new File("g:/机场三字码.js");
        String s = StreamUtils.copyToString(new FileInputStream(f), Charset.forName("utf-8"));
        List<Object> objects = JSON.parseArray(s);
        List<AAAA> a = new ArrayList<>(objects.size());
        for (Object object : objects) {
            JSONObject o = (JSONObject) object;
            String text  = (String) o.values().toArray()[0];
            o.put("text",text);
        }
        System.out.println(objects);
    }

    private static class AAAA {
        private String text;
        private String code;

        public String getText() {
            return text;
        }

        public void setText(String text) {
            this.text = text;
        }
    }
}
