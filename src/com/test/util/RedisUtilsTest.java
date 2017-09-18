package com.test.util;

import java.util.Date;

import org.apache.commons.lang.time.DateUtils;

/**
 * laogaochg
 * 2017/8/31.
 */
public class RedisUtilsTest {
    public static void main(String[] args) {
        Date d = new Date();
        d = DateUtils.addSeconds(d,60);
        while(d.before(new Date())){

        }
    }
}
