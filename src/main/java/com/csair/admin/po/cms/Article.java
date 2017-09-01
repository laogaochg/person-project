package com.csair.admin.po.cms;

import java.io.Serializable;
import java.util.Date;

public class Article implements Serializable {
    /**
     * 文章id
     */
    private Long arId;

    /**
     * 文章名称
     */
    private String arName;

    /**
     * 创建时间
     */
    private Date createTime;

    /**
     * 文章摘要
     */
    private String arAbs;

    /**
     * 文章描述
     */

    private String arDesc;

    /**
     * 文章分类
     */
    private Integer acId;

    /**
     * 文章状态 0否（待审核），1审核通过
     */
    private Byte isAuth;

    /**
     * 文章状态 0关闭，1正常,2删除
     */
    private Byte status;

    /**
     * 排序
     */
    private Integer sortorder;

    /**
     * 是否推荐 0否（默认），1是
     */
    private Integer isCommend;

    /**
     * 是否禁用
     */
    private Integer isDis;
    /**
     * 文章分类引用
     */
    private ArtiCleclassify acf;

    public ArtiCleclassify getAcf() {
        return acf;
    }

    public void setAcf(ArtiCleclassify acf) {
        this.acf = acf;
    }

    public String getArDesc() {
        return arDesc;
    }

    public void setArDesc(String arDesc) {
        this.arDesc = arDesc;
    }

    private static final long serialVersionUID = 1L;

    public Long getArId() {
        return arId;
    }

    public void setArId(Long arId) {
        this.arId = arId;
    }

    public String getArName() {
        return arName;
    }

    public void setArName(String arName) {
        this.arName = arName == null ? null : arName.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public String getArAbs() {
        return arAbs;
    }

    public void setArAbs(String arAbs) {
        this.arAbs = arAbs == null ? null : arAbs.trim();
    }

    public Integer getAcId() {
        return acId;
    }

    public void setAcId(Integer acId) {
        this.acId = acId;
    }

    public Byte getIsAuth() {
        return isAuth;
    }

    public void setIsAuth(Byte isAuth) {
        this.isAuth = isAuth;
    }

    public Byte getStatus() {
        return status;
    }

    public void setStatus(Byte status) {
        this.status = status;
    }

    public Integer getSortorder() {
        return sortorder;
    }

    public void setSortorder(Integer sortorder) {
        this.sortorder = sortorder;
    }

    public Integer getIsCommend() {
        return isCommend;
    }

    public void setIsCommend(Integer isCommend) {
        this.isCommend = isCommend;
    }

    public Integer getIsDis() {
        return isDis;
    }

    public void setIsDis(Integer isDis) {
        this.isDis = isDis;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", arId=").append(arId);
        sb.append(", arName=").append(arName);
        sb.append(", createTime=").append(createTime);
        sb.append(", arAbs=").append(arAbs);
        sb.append(", acId=").append(acId);
        sb.append(", isAuth=").append(isAuth);
        sb.append(", status=").append(status);
        sb.append(", sortorder=").append(sortorder);
        sb.append(", isCommend=").append(isCommend);
        sb.append(", isDis=").append(isDis);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}