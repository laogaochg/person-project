package com.csair.admin.po;

import java.util.List;

/**
 * 后台管理权限实体
 */
public class Permission {
    private Long id;
    private String url;//url地址
    private String name;//url描述
    private List<Role> roleList;//一个权限对应多个角色
    private Long mid;//对应菜单的id
    /**
     * 对应父菜单的名字
     */
//    private String menuName;

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public Permission() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    @Override
    public String toString() {
        return "Permission{" +
                "id=" + id +
                ", url='" + url + '\'' +
                ", name='" + name + '\'' +
                ", roleList=" + roleList +
                '}';
    }
}
