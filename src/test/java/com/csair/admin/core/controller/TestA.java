package com.csair.admin.core.controller;
//test 

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.HttpClientUtils;
import com.csair.admin.core.po.HttpResultDto;
import com.csair.admin.weixing.dto.WeiXingButton;
import com.csair.admin.weixing.util.AccessTokenUtil;

import java.util.HashMap;
import java.util.Map;

/**
 * laogaochg
 * 2017/6/30.
 */
public class TestA {
    public static void main(String[] args) throws Exception {
        Map<String, Object> map = new HashMap<>();
        map.put("111", 33);
        Map<String, Object> map0 = new HashMap<>();
        map0.put("111", 33);
        map0.put("222", JSON.toJSONString(map));
        Map<String, Object> map1 = new HashMap<>();
        map1.put("111", 33);
        map1.put("222", JSON.toJSONString(map0));
        Map<String, Object> map2 = new HashMap<>();
        map2.put("111", 33);
        map2.put("222", JSON.toJSONString(map1));
        String s = JSON.toJSONString(map2);
        System.out.println(s);
        JSONObject jsonObject = JSON.parseObject(s);
        System.out.println(JSON.parseObject(jsonObject.get("222")+"").get("222"));
    }
}
