package com.csair.admin.weixing.util;

import com.alibaba.fastjson.JSON;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.HttpClientUtils;
import com.csair.admin.util.HttpResultDto;
import com.csair.admin.util.ParamConstants;
import com.csair.admin.config.core.PlatformException;
import org.apache.commons.lang3.StringUtils;
import org.apache.commons.lang3.time.DateUtils;

import java.util.Date;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/14 11:49
 * 用于处理登陆TOKEN的管理
 */
public class AccessTokenUtil {
    private static Date lastDate;
    private static String token;
    private static final int VALIDITY_TIME_HOUR = 2;//有效时间:两小时
    private static final int OFFSET_SECOND = -10 * 60;//偏移秒数
    private static AccessTokenUtil instance = new AccessTokenUtil();

    public static AccessTokenUtil getInstance() {
        return instance;
    }

    private AccessTokenUtil() {
    }

    public String getToken() {
        //如果距离过期超过5分钟就没有必要锁,肯定不会修改直接返回
        if (lastDate != null) {
            Date invailDate = DateUtils.addHours(lastDate, VALIDITY_TIME_HOUR);
            invailDate = DateUtils.addSeconds(invailDate, OFFSET_SECOND);
            invailDate = DateUtils.addSeconds(invailDate, -5 * 60);
            if (new Date().before(invailDate)) {
                return token;
            }
        }
        synchronized (this) {
            if (StringUtils.isBlank(token)) {//没有请求过TOKEN
                token = processHttpGetToken();
                return token;
            }
            Date invailDate = DateUtils.addHours(lastDate, VALIDITY_TIME_HOUR);
            invailDate = DateUtils.addSeconds(invailDate, OFFSET_SECOND);
            if (new Date().after(invailDate)) {//已经过期
                token = processHttpGetToken();
                return token;
            }
        }
        return token;
    }

    private String processHttpGetToken() {
        lastDate = new Date();
        String url = EnvironmentParams.GET_TOKEN_URL;
        HttpResultDto httpResultDto = HttpClientUtils.sendHttpGetMsg(url);
        if (!httpResultDto.getSuccess()) throw new PlatformException(ParamConstants.GET_TOKEN_FAIL);
        Token token = JSON.parseObject(httpResultDto.getResult() + "", Token.class);
        //有返回码且码不是0
        if (token.getErrcode() != null && token.getErrcode() != 0) {
            throw new PlatformException(ParamConstants.GET_TOKEN_FAIL);
        }
        //没有返回token
        if (StringUtils.isNotBlank(token.getAccess_token())) {
            return token.getAccess_token();
        }
        throw new PlatformException(ParamConstants.GET_TOKEN_FAIL);
    }

    public static void main(String[] args) {
        AccessTokenUtil instance = getInstance();
        System.out.println(instance.getToken().length());;

    }

    public static class Token {
        private String access_token;
        private String expires_in;
        private Integer errcode;
        private String errmsg;

        public String getAccess_token() {
            return access_token;
        }

        public void setAccess_token(String access_token) {
            this.access_token = access_token;
        }

        public String getExpires_in() {
            return expires_in;
        }

        public void setExpires_in(String expires_in) {
            this.expires_in = expires_in;
        }

        public Integer getErrcode() {
            return errcode;
        }

        public void setErrcode(Integer errcode) {
            this.errcode = errcode;
        }

        public String getErrmsg() {
            return errmsg;
        }

        public void setErrmsg(String errmsg) {
            this.errmsg = errmsg;
        }
    }
}
