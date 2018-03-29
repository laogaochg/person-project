package com.csair.admin.core.po;

import lombok.Data;

import java.io.Serializable;

@Data
public class SkuPropertiesValue implements Serializable {
    private Long id;

    private String value;

    private Long skuPropertiesId;

    private static final long serialVersionUID = 1L;

    public SkuPropertiesValue() {
    }
}