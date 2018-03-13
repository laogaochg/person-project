package com.csair.admin.config;

import lombok.Getter;
import lombok.Setter;
import org.springframework.boot.context.properties.ConfigurationProperties;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/2 14:33
 */
@Component
@ConfigurationProperties(prefix = "myYml")
public class YmlConfig {
    @Setter
    @Getter
    private String simpleProp;
    @Setter @Getter
    private String[] arrayProps;
    @Setter @Getter
    private List<Map<String, String>> listProp1 = new ArrayList<>(); //接收prop1里面的属性值
}
