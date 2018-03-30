package com.csair.admin.core.vo;

import lombok.Data;
import org.apache.commons.collections.ArrayStack;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/29 21:49
 */
@Data
public class GoodsVo {
    private Long id;
    private String goodsName;
    private List<Map<String, List<String>>> properties = new ArrayList<>();
    private List<GoodsSkuVo> skuList = new ArrayList<>();
}
