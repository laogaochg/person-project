package com.csair.admin.core.po;

import java.io.Serializable;

public class GoodsSku implements Serializable {
    private Long id;

    private String sellPrice;

    /**
     * 属性值id组合，用,号分开：备用字段
     */
    private String attrDesc;

    /**
     * 商品id
     */
    private Long goodId;

    /**
     * 属性名id和属性值id组合：2:33,3:24
     */
    private String attrId;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(String sellPrice) {
        this.sellPrice = sellPrice == null ? null : sellPrice.trim();
    }

    public String getAttrDesc() {
        return attrDesc;
    }

    public void setAttrDesc(String attrDesc) {
        this.attrDesc = attrDesc == null ? null : attrDesc.trim();
    }

    public Long getGoodId() {
        return goodId;
    }

    public void setGoodId(Long goodId) {
        this.goodId = goodId;
    }

    public String getAttrId() {
        return attrId;
    }

    public void setAttrId(String attrId) {
        this.attrId = attrId == null ? null : attrId.trim();
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", sellPrice=").append(sellPrice);
        sb.append(", attrDesc=").append(attrDesc);
        sb.append(", goodId=").append(goodId);
        sb.append(", attrId=").append(attrId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}