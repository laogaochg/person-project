package com.csair.admin.util;

/**
 * 平台用到的常量
 */
public class ParamConstants {
    public static final int UNKNOWNCODE = 99999;
    public static final String UNKNOWNMSG = "服务品繁忙";
    public static final String SYSTEM_ERROR_CODE = "999999";
    public static final String SYSTEM_ERROR_MSG = "系统繁忙";
    public static final String USER_SESSION = "user";
    /**
     * 用户名已经存在！
     */
    public static final String EMAIL_REPEAT = "000002";
    /**
     * 对不起，你账号已经被禁止登录。"
     */
    public static final int FORDI_LOGIN = 000004;

    /**
     * 用户不存在。
     */
    public static final int NO_USER = 000005;
    /**
     * 图片压缩前缀
     */
    public static final String IMG_THUMBNAIL_PERFIX = "small_";
    /**
     */
    public static final int ERROR_PARAM = 1;
    /**
     * 处理文件出现异常
     */
    public static final int PANDLE_FILE_ERROR = 10002;
    /**
     * 禁止的用户有超级管理员的角色，只有超级管理员才能禁止
     */
    public static final int ADMIN_ROLE_EDIT_FORBID = 10003;
    /**
     * 得到TOKEN失败
     */
    public static final int GET_TOKEN_FAIL = 10004;
}
