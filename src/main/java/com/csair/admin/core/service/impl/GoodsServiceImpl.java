package com.csair.admin.core.service.impl;

import com.csair.admin.core.dao.GoodsDao;
import com.csair.admin.core.dao.GoodsSkuDao;
import com.csair.admin.core.dao.SkuPropertiesDao;
import com.csair.admin.core.dao.SkuPropertiesValueDao;
import com.csair.admin.core.dao.SkuPropertyConnectDao;
import com.csair.admin.core.dto.GoodsDto;
import com.csair.admin.core.dto.GoodsSkuPropertyDto;
import com.csair.admin.core.po.Goods;
import com.csair.admin.core.po.SkuProperties;
import com.csair.admin.core.po.SkuPropertiesValue;
import com.csair.admin.core.service.GoodsService;
import com.csair.admin.core.vo.GoodsVo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/29 21:39
 */
@Service
public class GoodsServiceImpl implements GoodsService {
    @Autowired
    private GoodsDao goodsDao;
    @Autowired
    private GoodsSkuDao goodsSkuDao;
    @Autowired
    private SkuPropertiesDao skuPropertiesDao;
    @Autowired
    private SkuPropertiesValueDao skuPropertiesValueDao;
    @Autowired
    private SkuPropertyConnectDao skuPropertyConnectDao;

    @Override
    public int insertGoods(GoodsVo goods) {
        Goods good = new Goods();
        good.setCreateDate(new Date());
        good.setName(goods.getGoodsName());
        int insert = goodsDao.insert(good);//新增并得到id
        GoodsDto goodsDto = new GoodsDto(good);
        for (Map<String, List<String>> stringListMap : goods.getProperties()) {
            for (Map.Entry<String, List<String>> entry : stringListMap.entrySet()) {
                String propertyName = entry.getKey();
                List<String> propertyValues = entry.getValue();
                SkuProperties skuProperty = new SkuProperties();
                skuProperty.setGoodId(good.getId());
                skuProperty.setName(propertyName);
                skuPropertiesDao.insert(skuProperty);
                GoodsSkuPropertyDto goodsSkaPropertyDto = new GoodsSkuPropertyDto(skuProperty);
                goodsDto.getGoodsSkaPropertiesDto().add(goodsSkaPropertyDto);
                for (String propertyValue : propertyValues) {
                    SkuPropertiesValue skuPropertiesValue = new SkuPropertiesValue();
                    skuPropertiesValue.setValue(propertyValue);
                    skuPropertiesValue.setSkuPropertiesId(skuProperty.getId());
                    skuPropertiesValueDao.insert(skuPropertiesValue);
                    goodsSkaPropertyDto.getValues().add(skuPropertiesValue);
                }
            }
        }
        List<List<Long>> table = new ArrayList<>();
        for (GoodsSkuPropertyDto skuPropertyDto : goodsDto.getGoodsSkaPropertiesDto()) {
            List<Long> ls = new ArrayList<>();
            for (SkuPropertiesValue propertiesValue : skuPropertyDto.getValues()) {
                ls.add(propertiesValue.getId());
            }
            table.add(ls);
        }




        return 0;
    }
}
