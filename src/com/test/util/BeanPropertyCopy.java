package com.test.util;

import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import java.lang.reflect.Modifier;
import java.util.Arrays;
import java.util.List;
import java.util.Map;

import org.apache.commons.beanutils.PropertyUtils;
import org.apache.commons.lang.StringUtils;

/**
 * laogaochg
 * 2017/8/25.
 * 两个类之间
 */
public class BeanPropertyCopy {

    /**
     * 两个类之间属性内容转换；如果目标是String；来源的不是；也会执行赋值操作
     *
     * @param source     来源
     * @param target     目源
     * @param convertMap 要转换的字段Map; key:目标字段;value：来源字段
     */
    private static void copyPropertiesByMap(Object source,Object target,Map<String,String> convertMap) throws Exception {
        PropertyDescriptor[] targetPds = Introspector.getBeanInfo(target.getClass(),Object.class).getPropertyDescriptors();
        for (PropertyDescriptor targetPd : targetPds) {
            //如果目标有写方法；而且在要转换的字段里面
            if (targetPd.getWriteMethod() != null //
                    && convertMap.containsKey(targetPd.getName())//包含在转换的字段列表里面
                    ) {
                PropertyDescriptor sourcePd = PropertyUtils.getPropertyDescriptor(source.getClass(),convertMap.get(targetPd.getName()));
                //如果来源有读方法
                copyValue(source,target,targetPd,sourcePd);
            }
        }
    }

    /**
     * 两个类之间属性内容转换；如果目标是String；来源的不是；也会执行赋值操作
     *
     * @param source           来源
     * @param target           目源
     * @param ignoreProperties 要忽略的字段
     */
    private static void copyProperties(Object source,Object target,String... ignoreProperties) throws Exception {
        PropertyDescriptor[] targetPds = Introspector.getBeanInfo(target.getClass(),Object.class).getPropertyDescriptors();
        List<String> ignoreList = (ignoreProperties != null) ? Arrays.asList(ignoreProperties) : null;
        for (PropertyDescriptor targetPd : targetPds) {
            //如果目标有写方法；而且不在忽略的字段里面
            if (targetPd.getWriteMethod() != null //
                    && (ignoreProperties == null || (!ignoreList.contains(targetPd.getName())))//
                    ) {
                PropertyDescriptor sourcePd = PropertyUtils.getPropertyDescriptor(source.getClass(),targetPd.getName());
                //如果来源有读方法
                copyValue(source,target,targetPd,sourcePd);
            }
        }
    }

    /**
     * 两个类之间属性内容转换；如果目标是String；来源的不是；也会执行赋值操作
     *
     * @param source             来源
     * @param target             目源
     * @param copyPropertiesName 要转换的字段列表
     */
    private static void copyPropertiesByList(Object source,Object target,String... copyPropertiesName) throws Exception {
        PropertyDescriptor[] targetPds = Introspector.getBeanInfo(target.getClass(),Object.class).getPropertyDescriptors();
        List<String> copyList = (copyPropertiesName != null) ? Arrays.asList(copyPropertiesName) : null;
        for (PropertyDescriptor targetPd : targetPds) {
            //如果目标有写方法；而且在要转换的字段里面
            if (targetPd.getWriteMethod() != null //
                    && copyList.contains(targetPd.getName())//包含在转换的字段列表里面
                    ) {
                PropertyDescriptor sourcePd = PropertyUtils.getPropertyDescriptor(source.getClass(),targetPd.getName());
                //如果来源有读方法
                copyValue(source,target,targetPd,sourcePd);
            }
        }
    }

    private static void copyValue(Object source,Object target,PropertyDescriptor targetPd,PropertyDescriptor sourcePd) throws IllegalAccessException, InvocationTargetException {
        if (sourcePd != null && sourcePd.getReadMethod() != null) {
            Method readMethod = sourcePd.getReadMethod();
            if (!Modifier.isPublic(readMethod.getDeclaringClass().getModifiers())) {
                readMethod.setAccessible(true);
            }
            //得到里面的值
            Object value = readMethod.invoke(source);
            //如果目标的类类型是String；那么不为空的话；执行操作
            if (value instanceof String) {
                String v = value + "";
                if (StringUtils.isNotBlank(v)) value = v;
            }
            Method writeMethod = targetPd.getWriteMethod();
            if (!Modifier.isPublic(writeMethod.getDeclaringClass().getModifiers())) {
                writeMethod.setAccessible(true);
            }
            //赋值操作
            writeMethod.invoke(target,value);
        }
    }
}
