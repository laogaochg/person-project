package com.test.freeMark;
/**
 * laogaochg
 * 2017/7/14.
 */

import lombok.Getter;
import lombok.Setter;

/**
 * 用于记录sql语句里面的字段
 */
@Setter
@Getter
public class SqlField {
    private String name;//字段名
    private String sqlName;//sql里面的字段名
    private String type;//类型
    private String upName;//字段名头字母大写

    public String getUpName() {
        return name.substring(0,1).toUpperCase() + name.substring(1,name.length());
    }

    public SqlField(String name,String sqlName,String type) {
        this.name = name;
        this.sqlName = sqlName;
        this.type = type;
    }

    public SqlField() {
    }

    @Override
    public String toString() {
        return "SqlField{" + "name='" + name + '\'' + ", sqlName='" + sqlName + '\'' + ", type='" + type + '\'' + ", upName='" + getUpName() + '\'' + '}';
    }
}
