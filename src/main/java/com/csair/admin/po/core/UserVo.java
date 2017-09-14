package com.csair.admin.po.core;

public class UserVo {
    //id=18&email=hgt&nickname=9uh&pswd=888&roleIds=5&state=2&remark=
    private Long id;
    private String nickname;//昵称
    private String pswd;//密码
    private String email;//邮箱|登录账号
    private Integer state;//1：有效，0：禁止登录
    private String remark;//备注
    private Long[] roleIds;

    public UserVo() {
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark;
    }

    public Long[] getRoleIds() {
        return roleIds;
    }

    public void setRoleIds(Long[] roleIds) {
        this.roleIds = roleIds;
    }
}
