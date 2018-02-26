package com.csair.admin.util;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.Inet4Address;
import java.net.InetAddress;
import java.net.NetworkInterface;
import java.net.SocketException;
import java.nio.charset.Charset;
import java.security.KeyManagementException;
import java.security.NoSuchAlgorithmException;
import java.security.cert.CertificateException;
import java.security.cert.X509Certificate;
import java.util.ArrayList;
import java.util.Enumeration;
import java.util.List;
import java.util.Map;
import java.util.Set;

import javax.net.ssl.SSLContext;
import javax.net.ssl.TrustManager;
import javax.net.ssl.X509TrustManager;

import com.csair.admin.core.po.HttpResultDto;
import org.apache.http.HttpEntity;
import org.apache.http.NameValuePair;
import org.apache.http.client.config.RequestConfig;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.CloseableHttpResponse;
import org.apache.http.client.methods.HttpGet;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.client.methods.HttpUriRequest;
import org.apache.http.config.Registry;
import org.apache.http.config.RegistryBuilder;
import org.apache.http.conn.socket.ConnectionSocketFactory;
import org.apache.http.conn.socket.PlainConnectionSocketFactory;
import org.apache.http.conn.ssl.NoopHostnameVerifier;
import org.apache.http.conn.ssl.SSLConnectionSocketFactory;
import org.apache.http.entity.StringEntity;
import org.apache.http.impl.client.CloseableHttpClient;
import org.apache.http.impl.client.HttpClients;
import org.apache.http.impl.conn.PoolingHttpClientConnectionManager;
import org.apache.http.message.BasicNameValuePair;
import org.apache.http.util.EntityUtils;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * HttpClient工具类
 *
 * @Author: ZhangQingrong
 * @Date : 2017/8/30 15:15
 */
public class HttpClientUtils {

    private static final Logger log = LoggerFactory.getLogger(HttpClientUtils.class);

    /**
     * 与服务器建立连接的timeout ,单位 : 毫秒
     */
    private static final int defaultConnectTimeout = 20000;
    /**
     * 从服务器读取数据的timeout ,单位 : 毫秒
     */
    private static final int defaultSocketTimeout = 30000;
    /**
     * 默认编码格式
     */
    private static final String encoding = "UTF-8";
    private static String IP;

    /**
     * 得到本机IP
     */
    private static String getIp() {
        if (IP != null) return IP;
        String result;
        Enumeration allNetInterfaces = null;
        try {
            allNetInterfaces = NetworkInterface.getNetworkInterfaces();
        } catch (SocketException e) {
            e.printStackTrace();
        }
        InetAddress ip = null;
        while (allNetInterfaces.hasMoreElements()) {
            NetworkInterface netInterface = (NetworkInterface)allNetInterfaces.nextElement();
            Enumeration addresses = netInterface.getInetAddresses();
            while (addresses.hasMoreElements()) {
                ip = (InetAddress)addresses.nextElement();
                if (ip != null && ip instanceof Inet4Address && !"127.0.0.1".equals(ip.getHostAddress())) {
                    IP = ip.getHostAddress();
                    return ip.getHostAddress();
                }
            }
        }
        return null;
    }

    public static HttpResultDto sendHttpPostMsg(HttpPost httpPost, Map<String,Object> params) {
        setPostParams(httpPost,params);
        return sendHttpMsg(httpPost,encoding,defaultConnectTimeout,defaultSocketTimeout);
    }

    public static HttpResultDto sendHttpPostMsg(String url,String params) {
        HttpPost httpPost = new HttpPost(url);
        setPostParams(httpPost,params);
        return sendHttpMsg(httpPost,encoding,defaultConnectTimeout,defaultSocketTimeout);
    }

    public static HttpResultDto sendHttpGetMsg(HttpGet httpGet) {
        return sendHttpMsg(httpGet,encoding,defaultConnectTimeout,defaultSocketTimeout);
    }

    public static HttpResultDto sendHttpGetMsg(String url) {
        HttpGet httpGet = new HttpGet(url);
        return sendHttpMsg(httpGet,encoding,defaultConnectTimeout,defaultSocketTimeout);
    }

    private static void setPostParams(HttpPost httpost,String params) {
        try {
            httpost.setEntity(new StringEntity(params,Charset.defaultCharset()));
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void setPostParams(HttpPost httpost,Map<String,Object> params) {
        List<NameValuePair> nvps = new ArrayList<NameValuePair>();
        Set<String> keySet = params.keySet();
        for (String key : keySet) {
            nvps.add(new BasicNameValuePair(key,params.get(key).toString()));
        }
        try {
            httpost.setEntity(new UrlEncodedFormEntity(nvps,"UTF-8"));
        } catch (UnsupportedEncodingException e) {
            e.printStackTrace();
        }
    }

    /**
     * 发送http请求
     */
    private static HttpResultDto sendHttpMsg(HttpUriRequest httpRequest,String encoding,int connectTimeout,int socketTimeout) {
        CloseableHttpClient httpClient = null;
        CloseableHttpResponse httpResponse = null;
        String respMsg;
        HttpResultDto<String> httpResultDto = new HttpResultDto<>();
        try {
            httpClient = getHttpClient(connectTimeout,socketTimeout);
            log.info("Start to send http request: " + httpRequest);
            httpResponse = httpClient.execute(httpRequest);
            if (200 == httpResponse.getStatusLine().getStatusCode()) {
                HttpEntity entity = httpResponse.getEntity();
                respMsg = EntityUtils.toString(entity,encoding);
                EntityUtils.consume(entity);
                log.info("Finish handle http request,result is:" + respMsg);
                httpResultDto.setResult(respMsg);
            } else {
                log.info("Finish handle http request,result is: " + httpResponse);
                httpResultDto.setError("9999","网络异常");
            }
        } catch (Exception e) {
            log.error("there is some error while send msg . Exception=[{}] .",e);
            httpResultDto.setError("9999","网络异常");
            return httpResultDto;
        } finally {
            try {
                if (null != httpResponse) {
                    httpResponse.close();
                }
                if (null != httpClient) {
                    httpClient.close();
                }
            } catch (IOException e) {
                log.error("there is some error while send msg . Exception=[{}] .",e);
            }
        }
        return httpResultDto;
    }

    /**
     * 发送http请求（异常需调用方处理）
     */
    private static HttpResultDto sendHttpMsgWithoutExceptionHandle(HttpUriRequest httpRequest,String encoding,int connectTimeout,int socketTimeout) throws Exception {
        String respMsg;
        CloseableHttpClient httpClient = null;
        CloseableHttpResponse httpResponse = null;
        HttpResultDto<String> httpResultDto = new HttpResultDto<>();
        try {
            httpClient = getHttpClient(connectTimeout,socketTimeout);
            httpResponse = httpClient.execute(httpRequest);
            if (200 == httpResponse.getStatusLine().getStatusCode()) {
                HttpEntity entity = httpResponse.getEntity();
                respMsg = EntityUtils.toString(entity,encoding);
                EntityUtils.consume(entity);
                log.info("Finish handling Http Result: " + respMsg);
                httpResultDto.setResult(respMsg);
            } else {
                httpResultDto.setError("9999","网络异常");
            }
        } finally {
            try {
                if (null != httpResponse) {
                    httpResponse.close();
                }
                if (null != httpClient) {
                    httpClient.close();
                }
            } catch (IOException e) {
                log.error("there is some error while send msg . Exception=[{}] .",e);
            }
        }
        return httpResultDto;
    }

    private static CloseableHttpClient getHttpClient(int connectTimeout,int socketTimeout) throws NoSuchAlgorithmException, KeyManagementException {
        PoolingHttpClientConnectionManager connectionManager = new PoolingHttpClientConnectionManager(getRegistry());
        CloseableHttpClient httpClient = HttpClients.custom().setConnectionManager(connectionManager).setDefaultRequestConfig(getRequestConfig(connectTimeout,socketTimeout)).build();
        return httpClient;
    }

    private static RequestConfig getRequestConfig(int connectTimeout,int socketTimeout) {
        RequestConfig requestConfig = RequestConfig.custom().setConnectTimeout(connectTimeout).setSocketTimeout(socketTimeout).build();
        return requestConfig;
    }

    private static Registry getRegistry() throws KeyManagementException, NoSuchAlgorithmException {
        Registry<ConnectionSocketFactory> socketFactoryRegistry = RegistryBuilder.<ConnectionSocketFactory>create().register("http",PlainConnectionSocketFactory.INSTANCE).register("https",getSSLSocketFactory()).build();
        return socketFactoryRegistry;
    }

    private static SSLConnectionSocketFactory getSSLSocketFactory() throws NoSuchAlgorithmException, KeyManagementException {
        SSLContext ctx = SSLContext.getInstance("TLS");
        X509TrustManager tm = new X509TrustManager() {
            public X509Certificate[] getAcceptedIssuers() {
                return null;
            }

            public void checkClientTrusted(X509Certificate[] chain,String authType) throws CertificateException {
            }

            public void checkServerTrusted(X509Certificate[] chain,String authType) throws CertificateException {
            }
        };
        ctx.init(null,new TrustManager[]{tm},null);
        SSLConnectionSocketFactory ssf = new SSLConnectionSocketFactory(ctx,NoopHostnameVerifier.INSTANCE);
        return ssf;
    }

    public static void main(String[] args) throws UnsupportedEncodingException {
        String ip = getIp();
        System.out.println("ip = " + ip);
        //        HttpPost httpPost = new HttpPost("http://10.79.0.217:9080/upp_payment_ps/gateway/v10/queryOrderForAll.upp");
//        List<BasicNameValuePair> nameValuePairList = new ArrayList<>();
//        nameValuePairList.add(new BasicNameValuePair("EncodeMsg", "asd"));
//        nameValuePairList.add(new BasicNameValuePair("SignMsg", "asd"));
//        nameValuePairList.add(new BasicNameValuePair("MerAppId", "asdfdas"));
//        UrlEncodedFormEntity formEntity = new UrlEncodedFormEntity(nameValuePairList, "UTF-8");
//        httpPost.setEntity(formEntity);
//        HttpResultDto httpResultDto = sendHttpPostMsg(httpPost, null);
    }
}
