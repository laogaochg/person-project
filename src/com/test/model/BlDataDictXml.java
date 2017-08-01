package com.test.model;

import java.util.ArrayList;
import java.util.List;

import lombok.Getter;
import lombok.Setter;

/**
 * bl数据字典
 */
@Setter
@Getter
public class BlDataDictXml {
    //0是字段；1是数组
    public static final int LIST = 1;
    public static final int ALONE = 0;
    private List<Field> dataField = new ArrayList<>();

    /**
     * 检查数据字典里面有没有这个变量
     */
    public boolean checkParamExist(String paramName) {
        for (Field field : dataField) {
            if (paramName.trim().equals(field.getName().trim())){
                System.out.println("变量"+paramName+ "已经存在了");
                return true;
            }
        }
        System.out.println("变量"+paramName+ "没有存在，去新建");
        return false;
    }

    @Override
    public String toString() {
        return "BlDataDictXml{" + "dataField=" + dataField + '}';
    }

    @Setter
    @Getter
    public static class Field {
        private String name;
        private String desc;
        private String defaultValue;
        private int type = 0;//0是字段；1是数组
        private List<Field> dataField = new ArrayList<>(0);

        public Field(int type,String name,String desc,String defaultValue) {
            this.type = type;
            this.name = name;
            this.defaultValue = defaultValue;
            this.desc = desc;
        }

        public Field() {
        }

        @Override
        public String toString() {
            return "Field{" + "name='" + name + '\'' + ", desc='" + desc + '\'' + ", defaultValue='" + defaultValue + '\'' + ", type=" + type + ", dataField=" + dataField + '}';
        }
    }
}
