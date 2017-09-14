package com.csair.admin.po.core;

/**
 * 角色查询参数封装
 */
public class RoleQueryObject extends QueryObject {
    private String name;
    private String type;

    public String getSqlString() {
        return " select r.* from e_admin_role r ";
    }

    public String getCountSqlString() {
        return " select count(1) from e_admin_role r ";
    }

    public String getConditionString() {
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        conditionString = sb.toString();
        return sb.toString();
    }

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