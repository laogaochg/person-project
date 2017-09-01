package com.csair.admin.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

public class Shop implements Serializable {
    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 店铺名称
     */
    private String shopName;

    /**
     * 开店时间
     */
    private Date createTime;

    /**
     *  是否推荐商家 0否（默认），1是
     */
    private Integer isCommend;

    /**
     * 店铺状态 0关闭，1正常，2删除F
     */
    private Byte status;

    /**
     * 联系人
     */
    private String contacts;

    /**
     * 邮箱
     */
    private String email;

    /**
     * 手机
     */
    private String mobile;

    /**
     * 电话
     */
    private String phone;

    /**
     * 申请店铺id 用户在申请店铺时生成的申请id
     */
    private Integer applyId;

    /**
     * 进驻费率
     */
    private BigDecimal ratio;

    /**
     * 国家id
     */
    private Integer countryId;

    /**
     * 省id
     */
    private Integer provinceId;

    /**
     * 城市id
     */
    private Integer cityId;

    /**
     * 区县id
     */
    private Integer districtId;

    /**
     * 排序
     */
    private Integer shopOrder;

    /**
     * 审核状态:0待审核,1审核通过,2审核不通过
     */
    private Byte isAuth;

    /**
     * 审核提交时间
     */
    private Date authTime;

    /**
     * 审核不通过原因
     */
    private String authDesc;

    /**
     * 关联用户的id
     */
    private Long id;

    /**
     * '店铺商品类型：1.普通商品、2.跨境购、3.机上免税品、4.线下自提、5里程兑换',
     */
    private Integer shopType;

    /**
     * 店铺描述
     */
    private String shopDesc;

    private static final long serialVersionUID = 1L;

    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName == null ? null : shopName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Integer getIsCommend() {
        return isCommend;
    }

    public void setIsCommend(Integer isCommend) {
        this.isCommend = isCommend;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public String getContacts() {
        return contacts;
    }

    public void setContacts(String contacts) {
        this.contacts = contacts == null ? null : contacts.trim();
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email == null ? null : email.trim();
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile == null ? null : mobile.trim();
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone == null ? null : phone.trim();
    }

    public Integer getApplyId() {
        return applyId;
    }

    public void setApplyId(Integer applyId) {
        this.applyId = applyId;
    }

    public BigDecimal getRatio() {
        return ratio;
    }

    public void setRatio(BigDecimal ratio) {
        this.ratio = ratio;
    }

    public Integer getCountryId() {
        return countryId;
    }

    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }

    public Integer getShopOrder() {
        return shopOrder;
    }

    public void setShopOrder(Integer shopOrder) {
        this.shopOrder = shopOrder;
    }

    public Byte getIsAuth() {
        return isAuth;
    }

    public void setIsAuth(Byte isAuth) {
        this.isAuth = isAuth;
    }

    public Date getAuthTime() {
        return authTime;
    }

    public void setAuthTime(Date authTime) {
        this.authTime = authTime;
    }

    public String getAuthDesc() {
        return authDesc;
    }

    public void setAuthDesc(String authDesc) {
        this.authDesc = authDesc == null ? null : authDesc.trim();
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Integer getShopType() {
        return shopType;
    }

    public void setShopType(Integer shopType) {
        this.shopType = shopType;
    }

    public String getShopDesc() {
        return shopDesc;
    }

    public void setShopDesc(String shopDesc) {
        this.shopDesc = shopDesc == null ? null : shopDesc.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", shopId=").append(shopId);
        sb.append(", shopName=").append(shopName);
        sb.append(", createTime=").append(createTime);
        sb.append(", isCommend=").append(isCommend);
        sb.append(", status=").append(status);
        sb.append(", contacts=").append(contacts);
        sb.append(", email=").append(email);
        sb.append(", mobile=").append(mobile);
        sb.append(", phone=").append(phone);
        sb.append(", applyId=").append(applyId);
        sb.append(", ratio=").append(ratio);
        sb.append(", countryId=").append(countryId);
        sb.append(", provinceId=").append(provinceId);
        sb.append(", cityId=").append(cityId);
        sb.append(", districtId=").append(districtId);
        sb.append(", shopOrder=").append(shopOrder);
        sb.append(", isAuth=").append(isAuth);
        sb.append(", authTime=").append(authTime);
        sb.append(", authDesc=").append(authDesc);
        sb.append(", id=").append(id);
        sb.append(", shopType=").append(shopType);
        sb.append(", shopDesc=").append(shopDesc);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}