package com.test.model;

/**
 * laogaochg
 * 2017/8/17.
 */
public class JavaBeanInfo {
    /**
     * 名字
     */
    private String name;
    /**
     * 类型
     */
    private String type;
    /**
     * 注释
     */
    private String info;

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

    public String getInfo() {
        return info;
    }

    public void setInfo(String info) {
        this.info = info;
    }

    @Override
    public String toString() {
        return "JavaBeanInfo{" + "name='" + name + '\'' + ", type='" + type + '\'' + ", info='" + info + '\'' + '}';
    }
}

