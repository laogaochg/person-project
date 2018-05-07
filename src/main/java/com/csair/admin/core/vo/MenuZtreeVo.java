package com.csair.admin.core.vo;

import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.Permission;
import com.csair.admin.core.po.core.resp.MenuVo;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/30 16:38
 */
@Data
public class MenuZtreeVo {
    private Long id;
    private Long permissionId;
    private String name;
    private String href;
    //    private String icon = "fa-cube";
    private Long pid;
    //    private boolean spread = true;
    private boolean open = true;
    private Boolean checked;
    private List<MenuVo> children = new ArrayList<>();
    private int type = 0;//0菜单，1权限


    public MenuZtreeVo(Menu m) {
        this.id = m.getMid();
        this.name = m.getMname();
        this.href = m.getUrl();
        this.pid = m.getPid();
        this.type=0;
    }

    public MenuZtreeVo(Permission p) {
        id =0L;
        this.permissionId = p.getId();
        this.pid = p.getMid();
        this.name = p.getName();
        this.href = p.getUrl();
        this.type=1;
    }
}
