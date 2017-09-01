package com.csair.admin.util;

/**
 * 平台用到的常量
 */
public class ParamConstants {
    public static final String UNKNOWNCODE = "99999";
    public static final String UNKNOWNMSG = "服务品繁忙";
    public static final String SYSTEM_ERROR_CODE = "999999";
    public static final String SYSTEM_ERROR_MSG = "系统繁忙";
    public static final String USER_SESSION = "user";
    /**
     * 用户名已经存在！
     */
    public static final String EMAIL_REPEAT = "000002";
    /**
     * 参数异常！
     */
    public static final java.lang.String PARAMS_ERROR = "000003";
    /**
     * 对不起，你账号已经被禁止登录。"
     */
    public static final java.lang.String FORDI_LOGIN = "000004";

    /**
     * 用户不存在。
     */
    public static final java.lang.String NO_USER = "000005";
    public static final String IMG_THUMBNAIL_PERFIX = "small_";
    /**
     * 1 => 'No permission to access data',//没有权限访问数据
     * 2 => 'Unknown error',//未知错误
     * 3 => 'Service temporarily unavailable',
     * 4 => 'Unsupported openapi method api',//api接口不被支持
     * 5 => 'Api request limit reached',//应用对api接口的调用请求数达到上限
     * 6 => 'Unauthorized client IP address:%s open api',//open api调用端的IP未被授权
     * 7 => 'No relevant data',//没有相关数据
     * 100 => 'Invalid parameter',//参数无效或缺失
     * 101 => 'Invalid token Api key',//Api key无效
     * 103 => 'Invalid call_id parameter Call_id',
     * 104 => 'Incorrect signature',//签名无效
     * 105 => 'Too many parameters',//参数过多
     * 106 => 'Unsupported signature method',//参数签名算法未被平台所支持
     * 900 => 'No such application exists',//应用不存在
     * 1001 => 'Update Failed',//修改失败
     */
    public static final int ERROR_PARAM = 1;
    public static final int UNKNOWN_ERROR = 2;//未知错误
    public static final int SERVICE_TEMPORARILY_UNAVAILABLE = 3;//后端服务暂时不可用
    public static final int UNSUPPORTED_OPENAPI_METHOD_API = 4;//api接口不被支持
    public static final int API_REQUEST_LIMIT_REACHED = 5;//应用对api接口的调用请求数达到上限
    public static final int UNAUTHORIZED_CLIENT_IP_ADDRESS = 6;//open api调用端的IP未被授权
    public static final int NO_RELEVANT_DATA = 7;//没有相关数据
    public static final int INVALID_PARAMETER = 100;//参数无效或缺失
    public static final int INVALID_TOKEN_API_KEY = 101;//Api key无效
    public static final int INVALID_CALL_ID_PARAMETER_CALL_ID = 103;//Call_id参数无效或已被使用过
    public static final int INCORRECT_SIGNATURE = 104;//签名无效
    public static final int TOO_MANY_PARAMETERS = 105;//参数过多
    public static final int UNSUPPORTED_SIGNATURE_METHOD = 106;//参数签名算法未被平台所支持
    public static final int NO_SUCH_APPLICATION_EXISTS = 900;//应用不存在
    public static final int UPDATE_FAILED = 1001;//修改失败
    /**
     * 已经有类目采用这个证书。
     */
    public static final int HAS_GOODCATEGORY_USING = 10001;
    /**
     * 处理文件出现异常
     */
    public static final int PANDLE_FILE_ERROR = 10002;
    /**
     * 禁止的用户有超级管理员的角色，只有超级管理员才能禁止
     */
    public static final int ADMIN_ROLE_EDIT_FORBID = 10003;
}
