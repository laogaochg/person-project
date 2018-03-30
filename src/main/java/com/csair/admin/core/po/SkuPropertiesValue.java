package com.csair.admin.core.po;

import java.io.Serializable;

public class SkuPropertiesValue implements Serializable {
    private Long id;

    /**
     * sku属性名字
     */
    private String skuPropertyName;

    private String value;

    private Long skuPropertiesId;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public String getSkuPropertyName() {
        return skuPropertyName;
    }

    public void setSkuPropertyName(String skuPropertyName) {
        this.skuPropertyName = skuPropertyName == null ? null : skuPropertyName.trim();
    }

    public String getValue() {
        return value;
    }

    public void setValue(String value) {
        this.value = value == null ? null : value.trim();
    }

    public Long getSkuPropertiesId() {
        return skuPropertiesId;
    }

    public void setSkuPropertiesId(Long skuPropertiesId) {
        this.skuPropertiesId = skuPropertiesId;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", skuPropertyName=").append(skuPropertyName);
        sb.append(", value=").append(value);
        sb.append(", skuPropertiesId=").append(skuPropertiesId);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}