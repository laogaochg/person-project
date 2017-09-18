package com.test.util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;

import com.alibaba.fastjson.JSON;
import org.apache.commons.lang.StringUtils;

import com.test.model.JavaBeanInfo;

/**
 * laogaochg
 * 2017/8/12.
 *
 * @see JavaBeanInfo
 * java主体类文档编写
 */
public class JavaBeanInfoUtil {
    public static void main(String[] args) throws Exception {
        String className = "UserMessage";
        String path = //
                "D:\\laogao2\\WorkPlace-0815\\dubbo\\" +//
                        "mall-service\\src\\main\\java\\com\\" +//
                        "nanhang\\mall\\dto\\resp"//
                ;
        File file = new File(path + "/" + className + ".java");
        List<String> propertiesText = getPropertiesText(file);
        List<JavaBeanInfo> beanInfoList = getBeanInfoList(propertiesText);
        //得到所有的字段名
        ExcelUtils.createExcel("d:/test.xls", "11", createExcelData(beanInfoList));
    }

    public static List<List<String>> createExcelData(List<JavaBeanInfo> list) {
        List<List<String>> result = new ArrayList<>();
        for (JavaBeanInfo info : list) {
            List<String> row = new ArrayList<>();
            row.add(info.getName());
            row.add(info.getType());
            row.add("");
            row.add("是");
            row.add("");
            row.add(info.getInfo());
            result.add(row);
        }
        return result;
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

    /**
     * @param propertiesText
     * @return
     */
    public static List<JavaBeanInfo> getBeanInfoList(List<String> propertiesText) {
        List<JavaBeanInfo> resultList = new ArrayList<>();
        //sb记录这个字段之前的注释
        StringBuilder sb = new StringBuilder();
        Set<String> nameSet = new HashSet<>();
        for (String s : propertiesText) {
            if (s.startsWith("private ") && s.contains(";")) {
                String name = s.split(" ")[2].split(";")[0].trim();
                String type = s.split(" ")[1].trim();
                JavaBeanInfo bean = new JavaBeanInfo();
                bean.setName(name);
                nameSet.add(name);
                bean.setType(type);
                resultList.add(bean);
            }
        }
        int begain = 0;
        List<String> infoList = new ArrayList<>();
        for (String s : propertiesText) {
            boolean add = true;
            String name = "";
            for (JavaBeanInfo j : resultList) {
                String name1 = j.getName();
                if (s.contains(" " + name1)) {
                    name = j.getName();
                    add = false;
                }
            }
            if (add) {
                //如果之前注释以/** 、* 、 开头 */结尾
                String s1 = s.replace("/**", "").replace("*/", "");
                if (s1.startsWith("*") && s1.length() > 1) s1 = s1.substring(1);
                sb.append(s1.trim());
            }
            //如果之前的注释不为空就把放进去
            if (s.contains("private ")) {
                if (StringUtils.isNotBlank(sb.toString())) {
                    infoList.add(sb.toString().trim());
                } else if (s.contains("//")) { //如果有//字符证明采用了这种方式注释
                    s = s.split("//")[1];
                    infoList.add(s.trim());
                } else {
                    infoList.add(name.trim());
                }
                sb = new StringBuilder();
            }
        }
        if (infoList.size() != resultList.size()) throw new NullPointerException("注释和字段个数对不上");
        for (int i = 0; i < resultList.size(); i++) {
            resultList.get(i).setInfo(infoList.get(i));
        }
        return resultList;
    }

}
