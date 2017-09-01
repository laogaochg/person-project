package com.csair.admin;

import java.io.InputStreamReader;
import java.util.Properties;

import javax.sql.DataSource;

import org.apache.ibatis.session.SqlSessionFactory;
import org.mybatis.spring.SqlSessionFactoryBean;
import org.mybatis.spring.annotation.MapperScan;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.EnableAutoConfiguration;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.boot.web.support.SpringBootServletInitializer;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;
import org.springframework.jdbc.datasource.DataSourceTransactionManager;
import org.springframework.transaction.PlatformTransactionManager;

import com.alibaba.druid.pool.DruidDataSource;
import com.csair.admin.util.PlatformException;

@EnableAutoConfiguration
@SpringBootApplication
@ComponentScan
@MapperScan("com.csair.admin.dao")
public class Application extends SpringBootServletInitializer {

    private static Properties property;
    private static DataSource dataSource;

    static {
        property = new Properties();
        try {
            property.load(new InputStreamReader(Application.class.getClassLoader().getResourceAsStream("jdbc.properties"),"UTF-8"));
        } catch (Exception e) {
            e.printStackTrace();
            throw new PlatformException(e.getMessage());
        }
    }

    //DataSource配置
    @Bean
    @ConfigurationProperties(prefix = "spring.datasource")
    public DataSource dataSource() {
        DruidDataSource data = new DruidDataSource();
        data.setUrl(property.get("jdbc_url") + "");
        data.setUsername(property.get("jdbc_username") + "");
        data.setPassword(property.get("jdbc_password") + "");
        dataSource = data;
        return data;
    }

    @Bean //提供SqlSeesion
    public SqlSessionFactory sqlSessionFactoryBean() throws Exception {
        SqlSessionFactoryBean sqlSessionFactoryBean = new SqlSessionFactoryBean();
        sqlSessionFactoryBean.setDataSource(dataSource);
        PathMatchingResourcePatternResolver resolver = new PathMatchingResourcePatternResolver();
        sqlSessionFactoryBean.setMapperLocations(resolver.getResources("classpath:com/csair/admin/dao/mapper/*.xml"));
        return sqlSessionFactoryBean.getObject();
    }

    @Bean
    public PlatformTransactionManager transactionManager() {
        return new DataSourceTransactionManager(dataSource);
    }

    public static void main(String[] args) throws Exception {
        SpringApplication.run(Application.class,args);//test123
    }
}