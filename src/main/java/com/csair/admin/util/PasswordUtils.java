package com.csair.admin.util;

import com.csair.admin.core.po.core.User;

/**
 * laogaochg
 * 2017/7/18.
 * 密码处理
 */
public class PasswordUtils {
    public static String getPassword(String input,String salt) {
        return MD5.encode(MD5.encode(input) + salt);
    }

    public static boolean checkPassword(String input,User u) {
        return u.getPswd().equals(MD5.encode(MD5.encode(input) + u.getHashCode()));
    }
}
