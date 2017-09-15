package com.csair.admin.core.po.core;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Menu implements Serializable {
    /**
     * 菜单ID
     */
    private Long mid;

    /**
     * 菜单名
     */
    private String mname;

    private String url;

    /**
     * 1:可见，0：不可见
     */
    private Byte state;

    public static final Byte STATE_SHOW = 1;
    public static final Byte STATE_HIDDEN = 0;

    /**
     * 排序
     */
    private Integer sort;

    /**
     * 菜单的等级：一级菜单：1；二级菜单：2
     */
    private Integer rank;

    /**
     * 父菜单id
     */
    private Long pid;
    private String logoFileName;
    /**
     * NULL为管理平台的权限；2为商家权限
     */
    private Byte type;
    /**
     * 子菜单
     */
    private List<Menu> menuList = new ArrayList<Menu>();

    /**
     * 菜单下的权限
     */
    private List<Permission> permissionList = new ArrayList<Permission>(0);

    public Byte getType() {
        return type;
    }

    public void setType(Byte type) {
        this.type = type;
    }

    public String getLogoFileName() {
        return logoFileName;
    }

    public void setLogoFileName(String logoFileName) {
        this.logoFileName = logoFileName;
    }

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
    }

    public List<Permission> getPermissionList() {
        return permissionList;
    }

    public void setPermissionList(List<Permission> permissionList) {
        this.permissionList = permissionList;
    }

    private static final long serialVersionUID = 1L;

    public Long getMid() {
        return mid;
    }

    public void setMid(Long mid) {
        this.mid = mid;
    }

    public String getMname() {
        return mname;
    }

    public void setMname(String mname) {
        this.mname = mname == null ? null : mname.trim();
    }

    public Long getPid() {
        return pid;
    }

    public void setPid(Long pid) {
        this.pid = pid;
    }

    public String getUrl() {
        return url;
    }

    public void setUrl(String url) {
        this.url = url == null ? null : url.trim();
    }

    public Byte getState() {
        return state;
    }

    public void setState(Byte state) {
        this.state = state;
    }

    public Integer getSort() {
        return sort;
    }

    public void setSort(Integer sort) {
        this.sort = sort;
    }

    public Integer getRank() {
        return rank;
    }

    public void setRank(Integer rank) {
        this.rank = rank;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", mid=").append(mid);
        sb.append(", mname=").append(mname);
        sb.append(", pid=").append(pid);
        sb.append(", url=").append(url);
        sb.append(", state=").append(state);
        sb.append(", sort=").append(sort);
        sb.append(", rank=").append(rank);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}