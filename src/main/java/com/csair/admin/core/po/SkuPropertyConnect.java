package com.csair.admin.core.po;

import java.io.Serializable;

public class SkuPropertyConnect implements Serializable {
    private Long skuId;

    private Long skuPropertyNameId;

    private Long skuPropertyValueId;

    private Long goodId;

    private static final long serialVersionUID = 1L;

    public Long getSkuId() {
        return skuId;
    }

    public void setSkuId(Long skuId) {
        this.skuId = skuId;
    }

    public Long getSkuPropertyNameId() {
        return skuPropertyNameId;
    }

    public void setSkuPropertyNameId(Long skuPropertyNameId) {
        this.skuPropertyNameId = skuPropertyNameId;
    }

    public Long getSkuPropertyValueId() {
        return skuPropertyValueId;
    }

    public void setSkuPropertyValueId(Long skuPropertyValueId) {
        this.skuPropertyValueId = skuPropertyValueId;
    }

    public Long getGoodId() {
        return goodId;
    }

    public void setGoodId(Long goodId) {
        this.goodId = goodId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", skuId=").append(skuId);
        sb.append(", skuPropertyNameId=").append(skuPropertyNameId);
        sb.append(", skuPropertyValueId=").append(skuPropertyValueId);
        sb.append(", goodId=").append(goodId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}