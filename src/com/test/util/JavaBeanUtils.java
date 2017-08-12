package com.test.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.util.ArrayList;
import java.util.List;

/**
 * laogaochg
 * 2017/8/12.
 * java Bean 工具
 */
public class JavaBeanUtils {
    /**
     * 返回属性名字列表
     * @param clzz
     * @return
     */
    public static List<String> getNameList(Class<?> clzz) {
        BeanInfo beanInfo = null;
        try {
            beanInfo = Introspector.getBeanInfo(clzz,Object.class);
        } catch (IntrospectionException e) {
            e.printStackTrace();
        }
        List names = new ArrayList();
        for (PropertyDescriptor propertyDescriptor : beanInfo.getPropertyDescriptors()) {
            String name = propertyDescriptor.getName();
            names.add(name);
        }
        return names;
    }
}
