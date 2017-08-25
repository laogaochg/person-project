package com.test.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;

import com.alibaba.fastjson.JSON;
import com.test.model.CouponDto;
import com.test.model.JavaBeanInfo;

/**
 * laogaochg
 * 2017/8/12.
 * java主体类文档编写
 */
public class JavaDocUtil {
    public static void main(String[] args) throws Exception {
        String className = "CouponDto";
        Class<CouponDto> couponDtoClass = CouponDto.class;
        File file = new File("D:\\laogao2\\WorkPlace-0810\\dubbo_frontend_dataservice\\mall-service\\src\\main\\java\\com\\nanhang\\mall\\dto\\resp/" + className + ".java");
        List<String> propertiesText = getPropertiesText(file);
        List<String> nameList = JavaBeanUtils.getNameList(couponDtoClass);
        Map<String,String> map = get注解Map(propertiesText,nameList);
        System.out.println(JSON.toJSONString(map));
        List<List<String>> data = new ArrayList<>();
        for (String s : map.keySet()) {
            List<String> l = new ArrayList<>();
            l.add(s);
            l.add(map.get(s));
            data.add(l);
        }
//        ExcelUtils.createExcel("d:/test.xls",data);
    }

    /**
     * @param propertiesText
     * @param nameList       所有字段名
     * @return
     */
    public static Map<String,String> get注解Map(List<String> propertiesText,List<String> nameList) {
        List<JavaBeanInfo> list = new ArrayList<>();
        Map<String,String> map = new HashMap<>();
        //sb记录这个字段之前的注释
        StringBuilder sb = new StringBuilder();
        for (String s : propertiesText) {
            System.out.println(s);
            if (s.contains("private ") && s.contains(";")) {
                String paramType = s.split(" ")[1];
                String paramName = s.split(" ")[2];
                JavaBeanInfo bean = new JavaBeanInfo();
                bean.setName(paramName);
                bean.setType(paramType);
                list.add(bean);
            }
            boolean add = true;
            for (String name : nameList) {
                if (s.contains(" " + name)) {
                    add = false;
                }
            }
            if (add) sb.append(get注释String(s));
            for (String name : nameList) {
                if (s.contains(" " + name)) {
                    //如果之前的注释不为空就把放进去
                    if (StringUtils.isNotBlank(sb.toString())) {
                        map.put(name,sb.toString());
                    } else {
                        //如果有//字符证明采用了这种方式注释
                        if (s.contains("//")) {
                            s = s.split("//")[1];
                            map.put(name,s);
                        } else {
                            map.put(name,name);
                        }
                    }
                    sb = new StringBuilder();
                }
            }
        }
        System.out.println(list);
        return map;
    }

    private static String get注释String(String s) {
        //如果之前注释以/** 、* 、 开头 */结尾
        s = s.replace("/**","").replace("*/","");
        if (s.startsWith("*")) {
            s = s.substring(1,s.length() - 1);
        }
        return s;
    }

    /**
     * 解析源代码文件 返回对应的字段和它们的注解
     * 就是去除源代码多余的getset方法代码
     *
     * @param file java文件
     * @return
     */
    private static List<String> getPropertiesText(File file) {
        List<String> list = FileUtils.getList(file);
        //用public 分割这些数组
        boolean add = false;
        List<String> temp = new ArrayList<>();
        List<String> result = new ArrayList<>();
        for (String s : list) {
            temp.add(s);
            //如果下面出现了一个public 那么temp清空
            if (s.contains("public ")) temp = new ArrayList<>();
            //如果出现了private  那么放到结果集里面
            if (s.contains("private ")) {
                result.addAll(temp);
                temp = new ArrayList<>();
            }

        }
        return result;
    }
}
