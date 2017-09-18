package com.test.util;
/**
 * laogaochg
 * 2017/6/29.
 */

import com.alibaba.fastjson.JSON;
import com.itmuch.cloud.entiey.Menu;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StreamUtils;

import java.io.BufferedReader;
import java.io.InputStream;
import java.io.ObjectInputStream;
import java.io.PrintWriter;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.Charset;
import java.util.List;
import java.util.Map;

public class HttpRequestUtil {
    private static Logger logger = LoggerFactory.getLogger(HttpRequestUtil.class);

    /**
     * 向指定URL发送GET方法的请求
     *
     * @param url   发送请求的URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return URL 所代表远程资源的响应结果
     */
    public static String sendGet(String url, Object param) {
        String result = "";
        BufferedReader in = null;
        try {
            String urlNameString = url + "?params=" + JSON.toJSONString(param);
            URL realUrl = new URL(urlNameString);
            // 打开和URL之间的连接
            URLConnection connection = realUrl.openConnection();
            // 设置通用的请求属性
            connection.setRequestProperty("accept", "*/*");
            connection.setRequestProperty("connection", "Keep-Alive");
            // 建立实际的连接
            connection.connect();
            // 获取所有响应头字段
            Map<String, List<String>> map = connection.getHeaderFields();
            // 遍历所有的响应头字段
            for (String key : map.keySet()) {
                System.out.println(key + "--->" + map.get(key));
            }
            // 定义 BufferedReader输入流来读取URL的响应
            result = StreamUtils.copyToString(connection.getInputStream(), Charset.defaultCharset());
        } catch (Exception e) {
            logger.warn(e.toString());
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) throws Exception {
        String url = "http://10.101.173.68/eshopzuul/service/permission/rootmenu";
        url = "http://127.0.0.1:7902/ObjectOutputStream";
        InputStream inputStream = sendPost(url, null);
        ObjectInputStream in = new ObjectInputStream(inputStream);
        Menu menu = (Menu) in.readObject();
        System.out.println(menu.getMname());
        System.out.println(menu.getMenuList().get(0).getMname());
    }


    /**
     * 向指定 URL 发送POST方法的请求
     *
     * @param url   发送请求的 URL
     * @param param 请求参数，请求参数应该是 name1=value1&name2=value2 的形式。
     * @return 所代表远程资源的响应结果
     */
    public static InputStream sendPost(String url, Object param) {
        PrintWriter out = null;
        String result = "";
        try {
            URL realUrl = new URL(url);
            // 打开和URL之间的连接
            URLConnection conn = realUrl.openConnection();
            // 设置通用的请求属性
            conn.setRequestProperty("accept", "*/*");
            conn.setRequestProperty("connection", "Keep-Alive");
            conn.setRequestProperty("user-agent", "Mozilla/4.0 (compatible; MSIE 6.0; Windows NT 5.1;SV1)");
            // 发送POST请求必须设置如下两行
            conn.setDoOutput(true);
            conn.setDoInput(true);
            // 获取URLConnection对象对应的输出流
            out = new PrintWriter(conn.getOutputStream());
            // 发送请求参数
            out.print(JSON.toJSONString(param));
            // flush输出流的缓冲
            out.flush();
            // 定义BufferedReader输入流来读取URL的响应
//            result = StreamUtils.copyToString(conn.getInputStream(), Charset.defaultCharset());
            return conn.getInputStream();
        } catch (Exception e) {
            logger.warn(e.toString());
            e.printStackTrace();
        }
        //使用finally块来关闭输出流、输入流
        finally {
            if (out != null) {
                out.close();
            }
        }
//        return result;
        return null;
    }
}