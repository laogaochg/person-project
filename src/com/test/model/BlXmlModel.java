package com.test.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * bl数据的封装对象
 */
@Setter
@Getter
public class BlXmlModel {

    private String fileName;//文件名
    private List<Field> input = new ArrayList<>();//输入参数
    private List<Field> out = new ArrayList<>();//输出参数
    private List<Field> dict = new ArrayList<>();//字典

    public List<Field> getDict() {
        if (dict.size() != (input.size() + out.size())) {
            dict.clear();
            dict.addAll(input);
            dict.addAll(out);
        }
        return dict;
    }

    @Override
    public String toString() {
        return "BlXmlModel{" + "fileName='" + fileName + '\'' + ", input=" + input + ", out=" + out + ", dict=" + dict + '}';
    }

    @Setter
    @Getter
    public static class Field {
        private String id;
        private String desc;
        private String defaultValue;
        private List<Field> list = new ArrayList<>();

        public Field(String id,String desc,String defaultValue) {
            this.id = id;
            this.defaultValue = defaultValue;
            this.desc = desc;
        }

        @Override
        public String toString() {
            return "Field{" + "id='" + id + '\'' + ", desc='" + desc + '\'' + ", defaultValue='" + defaultValue + '\'' + ", list=" + list + '}';
        }
    }
}
