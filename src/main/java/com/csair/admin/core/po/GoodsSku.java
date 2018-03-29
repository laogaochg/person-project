package com.csair.admin.core.po;

import java.io.Serializable;

public class GoodsSku implements Serializable {
    private Long id;

    private Long sellPrice;

    private static final long serialVersionUID = 1L;

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getSellPrice() {
        return sellPrice;
    }

    public void setSellPrice(Long sellPrice) {
        this.sellPrice = sellPrice;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", id=").append(id);
        sb.append(", sellPrice=").append(sellPrice);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}