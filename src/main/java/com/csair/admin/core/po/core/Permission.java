package com.csair.admin.core.po.core;

import lombok.Data;

import java.util.List;

/**
 * 后台管理权限实体
 */
@Data
public class Permission {
    private Long id;
    private String url;//url地址
    private String name;//url描述
    private List<Role> roleList;//一个权限对应多个角色
    private Long mid;//对应菜单的id
    /**** 0:菜单自动添加进来的,1:用户添加的 */
    private Byte type;
    /**
     * 对应父菜单的名字
     */
//    private String menuName;
    /**
     * 归属类的类名，用于确定菜单下的权限列表
     */
    private String className;
    /*** 菜单名 */
    private String menuName;

}
