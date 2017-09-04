package com.itmuch.cloud.entiey;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class Menu implements Serializable {
    public static final String u = "aaaa";

    public static void main(String[] args) {
        String s = u;
        s = "22";
        System.out.println(u);
    }

    /**
     * 菜单ID
     */
    private Long mid;

    /**
     * 菜单名
     */
    private String mname;

    /**
     * 父菜单id
     */
    private Long pid;
    /**
     * 子菜单
     */
    private List<Menu> menuList = new ArrayList<Menu>();

    public List<Menu> getMenuList() {
        return menuList;
    }

    public void setMenuList(List<Menu> menuList) {
        this.menuList = menuList;
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

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", mid=").append(mid);
        sb.append(", mname=").append(mname);
        sb.append(", pid=").append(pid);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}