package com.csair.admin.util;

import java.io.InputStreamReader;
import java.util.Properties;

import org.springframework.context.event.ContextRefreshedEvent;

/**
 * laogaochg
 * 2017/6/30.
 * 环镜参数配置
 */
public class EnvironmentParams {
    public static Properties property;
    /**
     * 调用dao的url
     */
    public static String DAO_URL;
    /**
     * 是不是测试状态
     */
    public static String TEST_ENVIRONMENT;
    /**
     * 平台标识
     */
    public static String PLATFORM_FLAG;
    /**
     * 平台保存图片的URL目录
     */
    public static String IMG_URL_PATH = "/image";
    /**
     * 平台常用缩略图宽度
     */
    public static int IMG_THUMBNAIL_WIDTH;
    /**
     * 平台常用缩略图宽度
     */
    public static int IMG_THUMBNAIL_HIGHT;

    /**
     * 平台保存图片的真实路径
     * spring启动好了后会自动给这个变量赋量
     * 具体是配置文件里面upload-path的值+IMG_URL_PATH的值
     *
     * @see SpringRefreshListener#onApplicationEvent(ContextRefreshedEvent event)
     */
    public static String IMG_PATH;

    /**
     * 微信token
     */
    public static String WEIXING_TOKEN;
    /**
     * 微信 ENCODING_AESKEY
     */
    public static String ENCODING_AESKEY;
    /**
     * 微信 AppID
     */
    public static String AppID;
    /**
     * 微信 AppSecret
     */
    public static String AppSecret;
    /**
     * 微信 自定义菜单创建接口 后面还要是再拼ACCESS_TOKEN
     */
    public static String CREATE_MENU_URL;
    /**
     * 微信 得到TOKEN的url，已经拼好参数
     */
    public static String GET_TOKEN_URL;

    static {
        property = new Properties();
        try {
            property.load(new InputStreamReader(EnvironmentParams.class.getClassLoader().getResourceAsStream("config.properties"), "UTF-8"));
            PLATFORM_FLAG = "" + property.get("PLATFORM_FLAG");
            DAO_URL = "" + property.get("DAO_URL");
            TEST_ENVIRONMENT = "" + property.get("TEST_ENVIRONMENT");
            AppSecret = "" + property.get("AppSecret");
            AppID = "" + property.get("AppID");
            ENCODING_AESKEY = "" + property.get("EncodingAESKey");
            IMG_THUMBNAIL_WIDTH = new Integer("" + property.get("IMG_THUMBNAIL_WIDTH"));
            IMG_THUMBNAIL_HIGHT = new Integer("" + property.get("IMG_THUMBNAIL_HIGHT"));
            WEIXING_TOKEN = "" + property.get("WEIXING_TOKEN");
            GET_TOKEN_URL = "" + property.get("GET_TOKEN_URL");
            GET_TOKEN_URL = String.format(GET_TOKEN_URL, AppID, AppSecret);
            CREATE_MENU_URL = "" + property.get("CREATE_MENU_URL");
        } catch (Exception e) {
            e.printStackTrace();
            throw new PlatformException(99999,e + "");
        }
    }

    public static void main(String[] args) {
        System.out.println(1);
    }

    public static boolean isTestEnvironment() {
        return "true".equals(property.get("TEST_ENVIRONMENT") + "");
    }

}
