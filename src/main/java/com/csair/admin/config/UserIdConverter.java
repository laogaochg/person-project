package com.csair.admin.config;

import ch.qos.logback.classic.pattern.ClassicConverter;
import ch.qos.logback.classic.spi.ILoggingEvent;
import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;
import com.csair.admin.util.ParamConstants;
import org.apache.shiro.SecurityUtils;

import java.lang.reflect.Field;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/11/15 15:06
 */
public class UserIdConverter extends ClassicConverter {

    @Override
    public String convert(ILoggingEvent iLoggingEvent) {
        try {
            Object o = SecurityUtils.getSubject().getSession().getAttribute(ParamConstants.USER_SESSION);
            Field field = o.getClass().getDeclaredField("id");
            field.setAccessible(true);
            return field.get(o).toString();
        } catch (Exception e) {
            return "";
        }
    }
}
