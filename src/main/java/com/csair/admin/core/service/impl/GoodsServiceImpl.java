package com.csair.admin.core.service.impl;

import com.alibaba.fastjson.JSON;
import com.csair.admin.core.dao.GoodsDao;
import com.csair.admin.core.dao.GoodsSkuDao;
import com.csair.admin.core.dao.SkuPropertiesDao;
import com.csair.admin.core.dao.SkuPropertiesValueDao;
import com.csair.admin.core.dao.SkuPropertyConnectDao;
import com.csair.admin.core.dto.GoodsDto;
import com.csair.admin.core.dto.GoodsSkuPropertyDto;
import com.csair.admin.core.po.Goods;
import com.csair.admin.core.po.GoodsSku;
import com.csair.admin.core.po.SkuProperties;
import com.csair.admin.core.po.SkuPropertiesValue;
import com.csair.admin.core.po.SkuPropertyConnect;
import com.csair.admin.core.service.GoodsService;
import com.csair.admin.core.vo.GoodsSkuVo;
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
        goodsDao.insert(good);//新增并得到id
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
                    skuPropertiesValue.setSkuPropertyName(propertyName);
                    skuPropertiesValueDao.insert(skuPropertiesValue);
                    goodsSkaPropertyDto.getValues().add(skuPropertiesValue);
                }
            }
        }
        List<List<SkuPropertiesValue>> table = new ArrayList<>();
        for (GoodsSkuPropertyDto skuPropertyDto : goodsDto.getGoodsSkaPropertiesDto()) {
            List<SkuPropertiesValue> ls = new ArrayList<>();
            for (SkuPropertiesValue propertiesValue : skuPropertyDto.getValues()) {
                ls.add(propertiesValue);
            }
            table.add(ls);
        }
        //得到所有商品的组合
        List<List<SkuPropertiesValue>> decareList = getDecareList(table);
        List<String> attrList = new ArrayList<>();
        List<String> attrIdsList = new ArrayList<>();
        for (List<SkuPropertiesValue> values : decareList) {
            StringBuilder sb = new StringBuilder();
            StringBuilder sbs = new StringBuilder();
            for (SkuPropertiesValue value : values) {
                sb.append(value.getValue());
                sb.append(",");
                sbs.append(value.getSkuPropertiesId());
                sbs.append(":");
                sbs.append(value.getId());
                sbs.append(",");
            }
            String ids = sbs.toString();
            attrIdsList.add(ids.substring(0, ids.length() - 1));
            String attr = sb.toString();
            attrList.add(attr.substring(0, attr.length() - 1));
        }
        //处理上传的sku信息
        for (int i = 0; i < attrList.size(); i++) {
            GoodsSku sku = new GoodsSku();
            sku.setGoodId(good.getId());
            sku.setAttrDesc(attrList.get(i));
            sku.setAttrId(attrIdsList.get(i));
            GoodsSkuVo skuVo = getGoodsSkuVo(goods, attrList.get(i));
            if (skuVo != null) {
                sku.setSellPrice(skuVo.getPrice());
            }
            goodsSkuDao.insert(sku);
        }
        return 0;
    }

    private GoodsSkuVo getGoodsSkuVo(GoodsVo goods, String s) {
        for (GoodsSkuVo skuVo : goods.getSkuList()) {
            if (s.equals(skuVo.getAttr())) {
                return skuVo;
            }
        }
        return null;
    }

    /**
     * 得到笛卡尔组合
     */
    public List<List<SkuPropertiesValue>> getDecareList(List<List<SkuPropertiesValue>> table) {
        int count = 1;
        for (List<SkuPropertiesValue> longs : table) {
            count = count * longs.size();
        }
        List<List<SkuPropertiesValue>> result = new ArrayList<>(count);
        for (int i = 0; i < count; i++) {
            result.add(new ArrayList<>(table.size()));
        }
        List<Integer> rowCounts = new ArrayList<>();//每行数据要填多少行
        for (List<SkuPropertiesValue> tableRow : table) {
            rowCounts.add(count = count / tableRow.size());
        }
        for (int j = 0; j < table.size(); j++) {
            List<SkuPropertiesValue> longs = table.get(j);//当前数组1,2,3
            int k = 0;
            int hasInsertRow = 0;
            for (int i = 0; i < result.size(); i++) {
                result.get(i).add(j, longs.get(k));
                if (++hasInsertRow == rowCounts.get(j)) {//当前数组每个可以填多少行
                    hasInsertRow = 0;
                    if (++k == longs.size()) k = 0;
                }
            }
        }
        return result;
    }
}
