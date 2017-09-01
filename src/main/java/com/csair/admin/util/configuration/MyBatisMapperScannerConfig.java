package com.csair.admin.util.configuration;
/**
 * laogaochg
 * 2017/9/1.
 */

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.mapper.MapperScannerConfigurer;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.autoconfigure.AutoConfigureAfter;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;

/**
 * MyBatis扫描接口
 *
 * @author liuzh
 * @since 2015-12-19 14:46
 */
@Configuration
// 注意，由于MapperScannerConfigurer执行的比较早，所以必须有下面的注解
@AutoConfigureAfter(BeanConfig.class)
public class MyBatisMapperScannerConfig {

    @Autowired
    SqlSessionFactory sqlSessionFactory;

    @Bean
    public MapperScannerConfigurer mapperScannerConfigurer() {
        MapperScannerConfigurer mapperScannerConfigurer = new MapperScannerConfigurer();
        System.out.println("mapperScannerConfigurer ====================================== " + mapperScannerConfigurer);
        System.out.println("sqlSessionFactory = " + sqlSessionFactory);
        mapperScannerConfigurer.setSqlSessionFactoryBeanName("sqlSessionFactory");
        mapperScannerConfigurer.setBasePackage("tk.mybatis.springboot.mapper");
        return mapperScannerConfigurer;
    }

}