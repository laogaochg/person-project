package com.csair.admin.po;

import java.io.Serializable;
import java.util.Date;

public class Brand implements Serializable {
    /**
     * 品牌id
     */
    private Long brandId;

    /**
     * 品牌名称
     */
    private String brandName;

    /**
     * logo图片
     */
    private String brandLogo;

    /**
     * logo图片缩略图
     */
    private String brandLogoThumb;

    /**
     * 品牌官网地址
     */
    private String brandWebsite;

    /**
     * 品牌排序
     */
    private Integer brandOrder;

    /**
     * 状态 0-停用，1-启用
     */
    private Byte status;

    /**
     * 添加时间
     */
    private Date addTime;

    /**
     * 添加人
     */
    private Long addBy;

    /**
     * 品牌描述
     */
    private String brandDesc;

    private static final long serialVersionUID = 1L;

    public Long getBrandId() {
        return brandId;
    }

    public void setBrandId(Long brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName == null ? null : brandName.trim();
    }

    public String getBrandLogo() {
        return brandLogo;
    }

    public void setBrandLogo(String brandLogo) {
        this.brandLogo = brandLogo == null ? null : brandLogo.trim();
    }

    public String getBrandLogoThumb() {
        return brandLogoThumb;
    }

    public void setBrandLogoThumb(String brandLogoThumb) {
        this.brandLogoThumb = brandLogoThumb == null ? null : brandLogoThumb.trim();
    }

    public String getBrandWebsite() {
        return brandWebsite;
    }

    public void setBrandWebsite(String brandWebsite) {
        this.brandWebsite = brandWebsite == null ? null : brandWebsite.trim();
    }

    public Integer getBrandOrder() {
        return brandOrder;
    }

    public void setBrandOrder(Integer brandOrder) {
        this.brandOrder = brandOrder;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Long getAddBy() {
        return addBy;
    }

    public void setAddBy(Long addBy) {
        this.addBy = addBy;
    }

    public String getBrandDesc() {
        return brandDesc;
    }

    public void setBrandDesc(String brandDesc) {
        this.brandDesc = brandDesc == null ? null : brandDesc.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", brandId=").append(brandId);
        sb.append(", brandName=").append(brandName);
        sb.append(", brandLogo=").append(brandLogo);
        sb.append(", brandLogoThumb=").append(brandLogoThumb);
        sb.append(", brandWebsite=").append(brandWebsite);
        sb.append(", brandOrder=").append(brandOrder);
        sb.append(", status=").append(status);
        sb.append(", addTime=").append(addTime);
        sb.append(", addBy=").append(addBy);
        sb.append(", brandDesc=").append(brandDesc);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}