package com.csair.admin.util;

import java.util.Collection;

import org.springframework.util.StringUtils;

/**
 * laogaochg
 * 2017/7/6.
 */
public class StringUtil {
    /**
     * 检查字符串有没有值；
     * 有就返回这个字符串；
     * 没有就返回空字符串
     */
    public static String getString(String s) {
        return StringUtils.hasText(s) ? s : "";
    }

    /**
     * 给数组中间加指定的String
     */
    public static String join(Collection<?> coll,String delim) {
        return StringUtils.collectionToDelimitedString(coll,delim);
    }
}
