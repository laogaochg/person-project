package com.csair.admin.core.vo;

import com.csair.admin.core.po.core.Permission;
import lombok.Data;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/30 16:38
 */
@Data
public class MenuZtreeVo {
    private Long id;
    private String name;
    private String href;
    private Long pid;
    private Long permissionId;
    private boolean open = true;
    private Boolean checked;
    private int type = 0;//0菜单，1权限

    public MenuZtreeVo(Permission p) {
        this.id = p.getId();
        this.pid = p.getMid();
        this.name = p.getName();
        this.href = p.getUrl();
        this.permissionId =p.getId();
    }
}
