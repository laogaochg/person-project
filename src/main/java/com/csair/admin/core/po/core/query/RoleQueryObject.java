package com.csair.admin.core.po.core.query;

/**
 * 角色查询参数封装
 */
public class RoleQueryObject extends QueryObject {
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
        return "RoleQueryObject{" + "id=" + ", name='" + name + '\'' + ", type='" + type + '\'' + "} " + super.toString();
    }
}