package com.csair.admin.core.po.core.query;

/**
 * 权限查询参数封装
 */
public class PermissionQueryObject extends QueryObject {
    /**
     * 查询角色下的权限
     */
    private Long roleId;
    /**
     * 查询名字是**的权限
     */
    private String name;
    /**
     * 查询
     */
    private String type;

    public Long getRoleId() {
        return roleId;
    }

    public void setRoleId(Long roleId) {
        this.roleId = roleId;
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

}
