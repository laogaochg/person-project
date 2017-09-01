package com.csair.admin.po;

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

    public String getSqlString(){
        return " select p.* from e_admin_role_permission rp " +
                "JOIN e_admin_permission p on rp.pid = p.id AND  p.type IS NULL  ";
    }
    public String getCountSqlString(){
        return " select count(1) " +
                "from e_admin_role_permission rp " +
                "JOIN e_admin_permission p on rp.pid = p.id  AND  p.type IS NULL ";
    }

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
