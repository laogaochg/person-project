package com.csair.admin.po.core;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.csair.admin.util.DateUtil;

public class User implements Serializable {
    public static final String PLATFORMFLAG = "cse";
    /**
     * 用户id
     */
    private Long id;

    /**
     * 用户昵称
     */
    private String nickname;

    /**
     * 邮箱|登录帐号
     */
    private String email;

    /**
     * 密码
     */
    private String pswd;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 最后登录时间
     */
    private Date lastLoginTime;

    /**
     * 1:有效，0:禁止登录
     */
    private Integer status;

    /**
     * 手机
     */
    private String mobile;

    /**
     * 微信unionid
     */
    private String wxUnionid;

    /**
     * 上次登录ip
     */
    private String lastIp;

    /**
     * 备注
     */
    private String remark;

    /**
     * 管理员类型 1 平台  ，2 商家
     */
    private Integer type;

    /**
     * 商家id
     */
    private Integer shopId;

    private String platformFlag;

    /**
     * hash
     */
    private String hashCode;

    /**
     * 用户拥有的菜单列表
     */
    private List<Menu> menus = new ArrayList<Menu>();

    /**
     * 用户状态有效
     */
    public static final Integer STATUS_VALID  = 1;
    /**
     * 用户状态无效
     */
    public static final Integer STATUS_INVALID = 0;



    /**
     * '管理员类型 1 平台  ，2 商家',
     */
    public static final Integer PLATFORM = 1;//1 平台
    public static final Integer MERCHANT  = 2;//2 商家
    private List<Role> roleList; //一个用户拥有多个角色

    private static final long serialVersionUID = 1L;

    public Map<String,Object> getUserData(){

        Map<String,Object> map = new HashMap<String,Object>();
        map.put("id",getId());
        map.put("昵称",getNickname());
        map.put("邮箱|登录账号",getEmail());
        map.put("创建时间",DateUtil.formatDate(getCreateTime()));
        map.put("最后登录时间",DateUtil.formatDate(getLastLoginTime()));
        map.put("登录IP",getLastIp());
        map.put("备注",getRemark());
        map.put("状态",getStatusDisPlay());
        return map ;
    }

    public String getStatusDisPlay() {
        if(status==1) {
            return "有效";
        }else if(status==2){
            return "无效";
        }else{
            return "未知状态";
        }
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
        this.nickname = nickname == null ? null : nickname.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getPswd() {
        return pswd;
    }

    public void setPswd(String pswd) {
        this.pswd = pswd == null ? null : pswd.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastLoginTime() {
        return lastLoginTime;
    }

    public void setLastLoginTime(Date lastLoginTime) {
        this.lastLoginTime = lastLoginTime;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getWxUnionid() {
        return wxUnionid;
    }

    public void setWxUnionid(String wxUnionid) {
        this.wxUnionid = wxUnionid == null ? null : wxUnionid.trim();
    }

    public String getLastIp() {
        return lastIp;
    }

    public void setLastIp(String lastIp) {
        this.lastIp = lastIp == null ? null : lastIp.trim();
    }

    public String getRemark() {
        return remark;
    }

    public void setRemark(String remark) {
        this.remark = remark == null ? null : remark.trim();
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public String getPlatformFlag() {
        return platformFlag;
    }

    public void setPlatformFlag(String platformFlag) {
        this.platformFlag = platformFlag == null ? null : platformFlag.trim();
    }

    public String getHashCode() {
        return hashCode;
    }

    public void setHashCode(String hashCode) {
        this.hashCode = hashCode == null ? null : hashCode.trim();
    }

    public List<Menu> getMenus() {
        return menus;
    }

    public void setMenus(List<Menu> menus) {
        this.menus = menus;
    }

    public List<Role> getRoleList() {
        return roleList;
    }

    public void setRoleList(List<Role> roleList) {
        this.roleList = roleList;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", nickname=").append(nickname);
        sb.append(", email=").append(email);
        sb.append(", pswd=").append(pswd);
        sb.append(", createTime=").append(createTime);
        sb.append(", lastLoginTime=").append(lastLoginTime);
        sb.append(", status=").append(status);
        sb.append(", mobile=").append(mobile);
        sb.append(", wxUnionid=").append(wxUnionid);
        sb.append(", lastIp=").append(lastIp);
        sb.append(", remark=").append(remark);
        sb.append(", type=").append(type);
        sb.append(", shopId=").append(shopId);
        sb.append(", platformFlag=").append(platformFlag);
        sb.append(", hashCode=").append(hashCode);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}