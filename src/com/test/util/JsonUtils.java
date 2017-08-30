package com.test.util;

import java.io.File;
import java.io.FileInputStream;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.List;

import org.springframework.util.StreamUtils;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

/**
 * laogaochg
 * 2017/8/29.
 */
public class JsonUtils {
    public static void main(String[] args) throws Exception {
        File file = new File("a.json");
        String s = StreamUtils.copyToString(new FileInputStream(file),Charset.defaultCharset());
        JSONObject jsonObject = JSON.parseObject(s);
        JsonUtils.ClassData cd = new ClassData();
        List<ClassData> result = new ArrayList<>();
        List<ClassData> classDataList = getClassDataList(jsonObject,result);
        System.out.println(classDataList);
    }

    public static List<ClassData> getClassDataList(JSONObject jsonObject,List<ClassData> result) {
        JsonUtils.ClassData cd = new ClassData();
        result.add(cd);
        for (String key : jsonObject.keySet()) {
            ClassProperty property = new ClassProperty();
            cd.getProperties().add(property);
            property.setName(key);
            Object value = jsonObject.get(key);
            property.setType(value.getClass().getSimpleName());
            if (value instanceof JSONObject) getClassDataList((JSONObject)value,result);
            if (value instanceof JSONArray) {
                JSONArray array = (JSONArray)value;
                if (array.size() > 0) {
                    Object o = array.get(0);
                    if (o instanceof JSONObject) getClassDataList((JSONObject)o,result);
                }
            }
        }
        return result;
    }

    public static class ClassData {
        private List<ClassProperty> properties = new ArrayList<>();

        @Override
        public String toString() {
            return "ClassData{" + "properties=" + properties + '}';
        }

        public List<ClassProperty> getProperties() {
            return properties;
        }

        public void setProperties(List<ClassProperty> properties) {
            this.properties = properties;
        }
    }

    public static class ClassProperty {
        private String name;
        private String type;

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getType() {
            return type;
        }

        public void setType(String type) {
            this.type = type;
        }

        @Override
        public String toString() {
            return "ClassProperty{" + "name='" + name + '\'' + ", type='" + type + '\'' + '}';
        }
    }
}
