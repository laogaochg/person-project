package com.csair.admin.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.client.RestTemplate;

import javax.annotation.Resource;
import javax.sql.DataSource;

/**
 * laogaochg
 * 2017/7/1.
 */
@Configuration
public class BeanConfig {
    @Resource
    private DataSource dataSource;

    //消费者bean
    // 可以自己订制
    @Bean
    public RestTemplate getRestTemplate() {
        RestTemplate ds = new RestTemplate();
        return ds;
    }


}
