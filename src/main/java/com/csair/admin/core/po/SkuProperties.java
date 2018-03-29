package com.csair.admin.core.po;

import lombok.Data;

import java.io.Serializable;
@Data
public class SkuProperties implements Serializable {
    private Long id;

    private String name;

    private Long goodId;

    private static final long serialVersionUID = 1L;
}