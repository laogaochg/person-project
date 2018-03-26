package com.csair.admin.core.po.core;

import lombok.Getter;
import lombok.Setter;

import java.util.List;

/**
 * 后台管理角色实体
 */
@Setter
@Getter
public class Role {
    private Long id;
    private String name;//角色名称
    private String type;//角色类型
    private String remark;//备注
    private List<Permission> permissionList;// 一个角色对应多个权限
    private List<User> userList;// 一个角色对应多个用户
    public static final String  ADMIN ="admin";
    private Long shopId;

}
