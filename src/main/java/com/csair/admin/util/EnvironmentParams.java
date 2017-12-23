package com.csair.admin.util;

import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

import com.csair.admin.config.PlatformException;
import com.csair.admin.config.SpringRefreshListener;

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
     * 平台保存图片的真实路径
     * spring启动好了后会自动给这个变量赋量
     *
     * @see SpringRefreshListener#onApplicationEvent(org.springframework.context.event.ContextRefreshedEvent)
     */
    public static String uploadPath;

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
    /**
     * 公钥
     */
    public static String PUBLIC_KEY;
    /**
     * 公钥
     */
    public static String PRIVATE_KEY;

    static {
        try {
            property = new Properties();
            InputStream inputStream = EnvironmentParams.class.getClassLoader().getResourceAsStream("config.properties");
            property.load(new InputStreamReader(inputStream,"UTF-8"));
            PLATFORM_FLAG = String.valueOf(property.get("PLATFORM_FLAG"));
            DAO_URL = String.valueOf(property.get("DAO_URL"));
            TEST_ENVIRONMENT = String.valueOf(property.get("TEST_ENVIRONMENT"));
            AppSecret = String.valueOf(property.get("AppSecret"));
            AppID = String.valueOf(property.get("AppID"));
            ENCODING_AESKEY = String.valueOf(property.get("EncodingAESKey"));
            WEIXING_TOKEN = String.valueOf(property.get("WEIXING_TOKEN"));
            GET_TOKEN_URL = String.valueOf(property.get("GET_TOKEN_URL"));
            PUBLIC_KEY = String.valueOf(property.get("PUBLIC_KEY"));
            PRIVATE_KEY = String.valueOf(property.get("PRIVATE_KEY"));
            GET_TOKEN_URL = String.format(GET_TOKEN_URL,AppID,AppSecret);
            CREATE_MENU_URL = String.valueOf(property.get("CREATE_MENU_URL"));
            inputStream.close();
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
