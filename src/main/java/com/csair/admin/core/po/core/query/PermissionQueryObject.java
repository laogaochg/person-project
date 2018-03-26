package com.csair.admin.core.po.core.query;

import lombok.Getter;
import lombok.Setter;

/**
 * 权限查询参数封装
 */
@Setter
@Getter
public class PermissionQueryObject extends QueryObject {
    /**
     * 查询角色下的权限
     */
    private Long roleId;
    /**
     * 菜单id
     */
    private Long mid;
    /**
     * 查询名字是**的权限
     */
    private String name;
    /**
     * 查询
     */
    private String type;


}
