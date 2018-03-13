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
     * 平台保存图片的真实路径
     * spring启动好了后会自动给这个变量赋量
     *
     * @see SpringRefreshListener#onApplicationEvent(org.springframework.context.event.ContextRefreshedEvent)
     */
    public static String uploadPath;
    public static String getParams(String key){
        return String.valueOf(property.get(key));
    }

    static {
        try {
            property = new Properties();
            InputStream inputStream = EnvironmentParams.class.getClassLoader().getResourceAsStream("config.properties");
            property.load(new InputStreamReader(inputStream, "UTF-8"));
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new PlatformException(999, e + "");
        }
    }

    public static void main(String[] args) {
        System.out.println(1);
    }

    public static boolean isTestEnvironment() {
        return "true".equals(property.get("TEST_ENVIRONMENT") + "");
    }

}
