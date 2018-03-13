package com.csair.admin.util;

import ch.qos.logback.classic.PatternLayout;
import ch.qos.logback.classic.encoder.PatternLayoutEncoder;
import com.csair.admin.config.UserIdConverter;

/**
 * @Author: ZhangQingrong
 * @Date : 2017/10/17 10:07
 */
public class LocalPatternLayoutEncoder extends PatternLayoutEncoder {
    static {
        //用户id
        PatternLayout.defaultConverterMap.put("userId", UserIdConverter.class.getName());
    }
}
