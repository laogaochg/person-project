package com.test.util;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.util.ArrayList;
import java.util.List;

import com.test.domain.User;

/**
 * laogaochg
 * 2017/8/12.
 * java Bean 工具
 */
public class JavaBeanUtils {

    public static void main(String[] args) throws IntrospectionException, InvocationTargetException, IllegalAccessException {
        getNameList(User.class);
        User u = new User();
        u.setNickname("天天");
        BeanInfo beanInfo = Introspector.getBeanInfo(u.getClass(),Object.class);
        for (PropertyDescriptor propertyDescriptor : beanInfo.getPropertyDescriptors()) {
            Object invoke = propertyDescriptor.getReadMethod().invoke(u);
            System.out.println(invoke instanceof String);
        }
    }

    /**
     * 返回属性名字列表
     *
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
