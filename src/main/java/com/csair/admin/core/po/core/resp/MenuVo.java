package com.csair.admin.core.po.core.resp;

import com.csair.admin.core.po.core.Menu;
import lombok.Getter;
import lombok.Setter;

/**
 * laogaochg
 * 2017/7/5.
 */
@Setter
@Getter
public class MenuVo {
    private Long id;
    private String name;
    private Long parentId;
    private boolean open= false;
    private boolean checked= false;


    public MenuVo(Menu m) {
        this.id = m.getMid();
        this.name = m.getMname();
        this.parentId = m.getPid()==null?0:m.getPid();
    }

    public MenuVo() {
    }

}
