package com.csair.admin.core.po.core;

/**
 * laogaochg
 * 2017/7/5.
 */
public class MenuVo {
    private Long id;
    private String name;
    private Long pId;
    private boolean checked= false;

    public boolean isChecked() {
        return checked;
    }

    public void setChecked(boolean checked) {
        this.checked = checked;
    }

    public MenuVo(Menu m) {
        this.id = m.getMid();
        this.name = m.getMname();
        this.pId = m.getPid();
    }

    public MenuVo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Long getpId() {
        return pId;
    }

    public void setpId(Long pId) {
        this.pId = pId;
    }
}
