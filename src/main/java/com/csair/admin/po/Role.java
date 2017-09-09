package com.csair.admin.po;

import java.util.List;

/**
 * 后台管理角色实体
 */
public class Role {
    private Long id;
    private String name;//角色名称
    private String type;//角色类型
    private String remark;//备注
    private List<Permission> permissionList;// 一个角色对应多个权限
    private List<User> userList;// 一个角色对应多个用户
    public static final String  ADMIN ="admin";
    private Long shopId;

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public Role() {
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
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

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }

    public List<User> getUserList() {
        return userList;
    }

    public void setUserList(List<User> userList) {
        this.userList = userList;
    }

    @Override
    public String toString() {
        return "Role{" +
                "id=" + id +
                ", name='" + name + '\'' +
                ", type='" + type + '\'' +
                ", permissionList=" + permissionList +
                ", userList=" + userList +
                '}';
    }
}
