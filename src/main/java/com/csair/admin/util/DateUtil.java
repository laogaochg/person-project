package com.csair.admin.util;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

import org.springframework.util.StringUtils;

public class DateUtil {
    public static String formatDate(Date date) {
        return formatDate(date,null);
    }

    public static String formatDate(Date date,String pattern) {
        if (date == null) {
            return "";
        }
        if (!StringUtils.hasText(pattern)) {
            pattern = "yyyyMMdd hh:mm:ss";
        }
        SimpleDateFormat sdf = new SimpleDateFormat(pattern);
        String dateTemp = sdf.format(date);
        return dateTemp;
    }

    /**
     * 得到今天的最后时间
     */
    public static Date getTodayEndTime(Date date) {
        if(date==null) return null;
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(Calendar.HOUR_OF_DAY,0);
        c.set(Calendar.MINUTE,0);
        c.set(Calendar.SECOND,0);
        c.set(Calendar.MILLISECOND,0);
        c.add(Calendar.DAY_OF_YEAR,1);
        c.add(Calendar.MILLISECOND,-1);
        return c.getTime();
    }
    /**
     * 得到指定时间的0点
     */
    public static Date getBeginTime(Date date) {
        if(date==null) return null;
        Calendar c = Calendar.getInstance();
        c.setTime(date);
        c.set(Calendar.HOUR_OF_DAY,0);
        c.set(Calendar.MINUTE,0);
        c.set(Calendar.SECOND,0);
        c.set(Calendar.MILLISECOND,0);
        return c.getTime();
    }

    /**
     * 字符串转换为Date
     */
    public static Date getDate(String date) {
        SimpleDateFormat s = new SimpleDateFormat();
        if (!StringUtils.hasText(date)) {
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
