package com.itmuch.cloud.entiey;

import org.springframework.util.StringUtils;

/**
 * 角色查询参数封装
 */
public class RoleQueryObject extends QueryObject {
    private Long id;
    private String name;
    private String type;
//    public String getSqlString(){
//        return " select r.* from e_admin_role r ";
//    }
//    public String getCountSqlString(){
//        return " select count(1) from e_admin_role r ";
//    }
    public String getConditionString() {
        if(StringUtils.hasText(conditionString)){
            return conditionString;
        }
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        if (id != null) {
            sb.append(" AND r.id = ? ");
            paramList.add(id);
        }
        if (StringUtils.hasText(name)) {
            sb.append(" AND r.name = ? ");
            paramList.add(name);
        }
        if (StringUtils.hasText(type)) {
            sb.append(" AND r.type = ? ");
            paramList.add(type);
        }
        conditionString= sb.toString();
        return sb.toString();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
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
        return "RoleQueryObject{" + "id=" + id + ", name='" + name + '\'' + ", type='" + type + '\'' + "} " + super.toString();
    }
}
