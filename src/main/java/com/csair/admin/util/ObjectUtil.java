package com.csair.admin.util;

import org.springframework.util.StringUtils;

/**
 * laogaochg
 * 2017/7/18.
 */
public class ObjectUtil {
    /**
     * 判断目标内容有没有值
     * 如果是字符串判断是不是空字符串
     * 空或NULL返回false
     */
    public static boolean hasContent(Object o) {
        if (o instanceof String) {
            return StringUtils.hasText(o + "");
        }
        return o != null;
    }

}
