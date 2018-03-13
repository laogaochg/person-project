package com.csair.admin.core.controller;
//test 

import com.alibaba.fastjson.JSON;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.HttpClientUtils;
import com.csair.admin.core.po.HttpResultDto;
import com.csair.admin.weixing.dto.WeiXingButton;
import com.csair.admin.weixing.util.AccessTokenUtil;

/**
 * laogaochg
 * 2017/6/30.
 */
public class TestA {
    public static void main(String[] args) throws Exception {
        WeiXingButton button = new WeiXingButton();
        WeiXingButton.Button button1 = new WeiXingButton.Button();
        button1.setName("视频");
        button1.setType("click");
        button1.setKey("1001");
        WeiXingButton.Button button2 = new WeiXingButton.Button();
        button2.setName("文章");
        button2.setType("click");
        button2.setKey("1002");
        button.getButton().add(button1);
        button.getButton().add(button2);
        String url;
        url = "https://api.weixin.qq.com/cgi-bin/menu/get?access_token="+ AccessTokenUtil.getInstance().getToken();
        System.out.println("url = " + url);
        String content = JSON.toJSONString(button);
        System.out.println("content = " + content);
        HttpResultDto httpResultDto = HttpClientUtils.sendHttpPostMsg(url, content);
        System.out.println("httpResultDto = " + httpResultDto);
    }
}
