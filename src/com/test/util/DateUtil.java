package com.test.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

/**
 * laogaochg
 * 2017/7/11.
 */
public class DateUtil {
    /**
     * 得到指定时间的第二天的开始时间
     */
    public static Date getTomorrowBegain(Date date) {
        date = org.apache.commons.lang.time.DateUtils.setHours(date,0);
        date = org.apache.commons.lang.time.DateUtils.setMinutes(date,0);
        date = org.apache.commons.lang.time.DateUtils.setSeconds(date,0);
        date = org.apache.commons.lang.time.DateUtils.setMilliseconds(date,0);
        date = org.apache.commons.lang.time.DateUtils.addDays(date,1);
        return date;
    }

    /**
     * 字符串转换为Date
     */
    public static Date getDate(String date) {
        SimpleDateFormat s = new SimpleDateFormat();
        if (date == null) {
            return null;
        }
        int length = date.length();
        if (length == 6) {
            date = date + "01";
            s.applyPattern("yyyyMMdd");
        }
        if (length == 8) s.applyPattern("yyyyMMdd");
        if (length == 10) s.applyPattern("yyyy-MM-dd");
        if (length == 17) s.applyPattern("yyyyMMdd hh:mm:ss");
        if (length == 19) s.applyPattern("yyyy-MM-dd hh:mm:ss");
        Date time;
        try {
            time = s.parse(date);
            return time;
        } catch (ParseException e) {
            e.printStackTrace();
            return null;
        }
    }
}
