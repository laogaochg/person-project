package com.csair.admin.core.dto;

import com.csair.admin.core.po.SkuProperties;
import com.csair.admin.core.po.SkuPropertiesValue;
import lombok.Data;

import java.util.ArrayList;
import java.util.List;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/29 21:32
 * sku属性
 */
@Data
public class GoodsSkuPropertyDto {
    private Long id;
    private String name;
    private Long skuId;
    private List<SkuPropertiesValue> values = new ArrayList<>();//属性的值
    private Long goodId;

    public GoodsSkuPropertyDto(SkuProperties skuProperty) {
        this.id = skuProperty.getId();
        this.name = skuProperty.getName();
        this.goodId = skuProperty.getGoodId();
    }
}
