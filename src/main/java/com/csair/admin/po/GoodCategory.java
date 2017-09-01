package com.csair.admin.po;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class GoodCategory implements Serializable {
    /**
     * 分类id
     */
    private Long categoryId;

    /**
     * 分类名称
     */
    private String categoryName;

    /**
     * 父分类id
     */
    private Long parentId;

    /**
     * 类型图片
     */
    private String img;

    /**
     * 类型图片缩略图
     */
    private String thumbImg;

    /**
     * 排序
     */
    private Integer categoryOrder;

    /**
     * 添加时间
     */
    private Date addTime;

    /**
     * 添加人
     */
    private Long addBy;

    /**
     * 状态，0删除，1 显示，2 不显示
     */
    private Byte status;
    public static final Byte STATUS_DELETE = 0;
    public static final Byte STATUS_SHOW = 1;
    public static final Byte STATUS_HIDDEN = 2;
    private String keyword;

    private String categoryDesc;


    /**
     * 佣金_一级类目属性
     */
    private BigDecimal commission;

    /**
     * 保证金_一级类目属性
     */
    private BigDecimal deposit;
    /**
     * 入驻资质证书id 二级类目属性
     */
    private List<Long> certificateId = new ArrayList<>();

    /**
     * 属性模板id三级类目属性
     */
    private Long propertyTempleId;
    /**
     * 品牌ID三级类目属性
     */
    private List<Long> brandIds = new ArrayList<>();

    /**
     *级别：1：一级；2：二级；3：三级
     */
    private Byte rank;

    public static final Byte RAND_1 = 1;
    public static final Byte RAND_2 = 2;
    public static final Byte RAND_3 = 3;


    private List<GoodCategory> children = new ArrayList<>();

    public List<GoodCategory> getChildren() {
        return children;
    }

    public void setChildren(List<GoodCategory> children) {
        this.children = children;
    }

    public Byte getRank() {
        return rank;
    }

    public void setRank(Byte rank) {
        this.rank = rank;
    }

    public BigDecimal getCommission() {
        return commission;
    }

    public void setCommission(BigDecimal commission) {
        this.commission = commission;
    }

    public BigDecimal getDeposit() {
        return deposit;
    }

    public void setDeposit(BigDecimal deposit) {
        this.deposit = deposit;
    }

    public List<Long> getCertificateId() {
        return certificateId;
    }

    public void setCertificateId(List<Long> certificateId) {
        this.certificateId = certificateId;
    }

    public Long getPropertyTempleId() {
        return propertyTempleId;
    }

    public void setPropertyTempleId(Long propertyTempleId) {
        this.propertyTempleId = propertyTempleId;
    }

    public List<Long> getBrandIds() {
        return brandIds;
    }

    public void setBrandIds(List<Long> brandIds) {
        this.brandIds = brandIds;
    }

    public static long getSerialVersionUID() {
        return serialVersionUID;
    }

    private static final long serialVersionUID = 1L;

    public Long getCategoryId() {
        return categoryId;
    }

    public void setCategoryId(Long categoryId) {
        this.categoryId = categoryId;
    }

    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(String categoryName) {
        this.categoryName = categoryName == null ? null : categoryName.trim();
    }

    public Long getParentId() {
        return parentId;
    }

    public void setParentId(Long parentId) {
        this.parentId = parentId;
    }

    public String getImg() {
        return img;
    }

    public void setImg(String img) {
        this.img = img == null ? null : img.trim();
    }

    public String getThumbImg() {
        return thumbImg;
    }

    public void setThumbImg(String thumbImg) {
        this.thumbImg = thumbImg == null ? null : thumbImg.trim();
    }

    public Integer getCategoryOrder() {
        return categoryOrder;
    }

    public void setCategoryOrder(Integer categoryOrder) {
        this.categoryOrder = categoryOrder;
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

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", categoryId=").append(categoryId);
        sb.append(", categoryName=").append(categoryName);
        sb.append(", parentId=").append(parentId);
        sb.append(", img=").append(img);
        sb.append(", thumbImg=").append(thumbImg);
        sb.append(", categoryOrder=").append(categoryOrder);
        sb.append(", addTime=").append(addTime);
        sb.append(", addBy=").append(addBy);
        sb.append(", status=").append(status);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }

    public String getKeyword() {
        return keyword;
    }

    public void setKeyword(String keyword) {
        this.keyword = keyword;
    }

    public String getCategoryDesc() {
        return categoryDesc;
    }

    public void setCategoryDesc(String categoryDesc) {
        this.categoryDesc = categoryDesc;
    }
}