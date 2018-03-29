package com.csair.admin.core.dto;

import com.csair.admin.core.po.Goods;
import com.csair.admin.core.po.GoodsSku;
import lombok.Data;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/29 21:29
 */
@Data
public class GoodsDto {
    private Long id;

    /**
     * 名字
     */
    private String name;

    /**
     * 创建时间
     */
    private Date createDate;
    private List<GoodsSkuDto> skus = new ArrayList<>();
    //sku属性
    private List<GoodsSkuPropertyDto> goodsSkaPropertiesDto = new ArrayList<>();

    public GoodsDto(Goods good) {
        this.id =good.getId();
        this.name = good.getName();
        this.createDate =good.getCreateDate();
    }
}
