package com.csair.admin.core.po.core.resp;

import com.csair.admin.core.po.core.Menu;
import lombok.Getter;
import lombok.Setter;

import java.util.ArrayList;
import java.util.List;

/**
 * laogaochg
 * 2017/7/5.
 */
@Setter
@Getter
public class MenuVo {
    private Long id;
    private String title;
    private String href;
    private String icon = "fa-cube";
    private Long pid;
    private boolean spread = true;
    private boolean checked = false;
    private List<MenuVo> children = new ArrayList<>();


    public MenuVo(Menu m) {
        this.id = m.getMid();
        this.title = m.getMname();
        this.href = m.getUrl();
        this.pid = m.getPid() == null ? 0 : m.getPid();
    }

    public MenuVo() {
    }

}
