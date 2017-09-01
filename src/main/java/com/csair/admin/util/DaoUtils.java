package com.csair.admin.util;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.client.RestTemplate;

import com.alibaba.fastjson.JSON;
import com.csair.admin.po.ResponseEntity;

/**
 * laogaochg
 * 2017/7/1.test
 */
@RestController
public class DaoUtils {
    @Autowired
    private RestTemplate restTemplate;

    private static Logger logger = LoggerFactory.getLogger(DaoUtils.class);

    /**
     * dao层调用接口的模板
     *
     * @param url  接口的地址
     * @param data 输出的参数
     * @return 返回参数
     */
    public String process(String url,Object data) {
        logger.info("DaoUtils.process:\n url:" + url + "\n data：" + JSON.toJSONString(data));
        ResponseEntity res;
        res = restTemplate.postForObject(url,data,ResponseEntity.class);
        if (res.getCode() != 200) {
            throw new PlatformException("调用服务器异常:\n返回代码：" + res.getCode() //
                    + "\n返回信息msg:" + res.getMes() + "\n" +//
                    " url:" + url + "\\n data：" + JSON.toJSONString(data));
        }
        String s = JSON.toJSONString(res.getData());
        logger.info("调用服务器返回：\n" + s);
        return s;
    }
    /**
     * dao层调用接口的模板
     *
     * @param url  接口的地址
     * @param data 输出的参数
     * @return 返回参数
     */
    public <T> ResponseEntity<T> processTest(String url,Object data,T t) {
        logger.info("DaoUtils.process:\n url:" + url + "\n data：" + JSON.toJSONString(data));
        ResponseEntity<T> res = new ResponseEntity<T>();
        res = restTemplate.postForObject(url,data,res.getClass());
        if (res.getCode() != 200) {
            throw new PlatformException("调用服务器异常:\n返回代码：" + res.getCode() //
                    + "\n返回信息msg:" + res.getMes() + "\n" +//
                    " url:" + url + "\\n data：" + JSON.toJSONString(data));
        }
        logger.info("调用服务器返回：\n" +res);
        return res;
    }

}
