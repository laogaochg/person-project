package com.csair.admin.weixing.dto;

import com.alibaba.druid.sql.visitor.functions.Char;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import javax.servlet.http.HttpServletRequest;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/14 21:01
 */
@RestController
@RequestMapping("weixing")
public class TokenController {
    @RequestMapping("1212")
    public String getToken(HttpServletRequest request) {

        String signature = request.getParameter("signature");
        String timestamp = request.getParameter("timestamp");
        String nonce = request.getParameter("nonce");
        String echostr = request.getParameter("echostr");
        System.out.println("echostr = " + echostr);
        System.out.println("nonce = " + nonce);
        System.out.println("signature = " + signature);
        return echostr;
    }
}
