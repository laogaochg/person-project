package com.csair.admin.core.dao;

import com.csair.admin.core.po.GoodsSku;
import com.csair.admin.core.po.GoodsSkuQuery;
import org.apache.ibatis.annotations.Param;

import java.util.List;

public interface GoodsSkuDao {
    int countByExample(GoodsSkuQuery example);

    int deleteByExample(GoodsSkuQuery example);

    int deleteByPrimaryKey(Long id);

    int insert(GoodsSku record);

    int insertSelective(GoodsSku record);

    List<GoodsSku> selectByExample(GoodsSkuQuery example);

    GoodsSku selectByPrimaryKey(Long id);

    int updateByExampleSelective(@Param("record") GoodsSku record, @Param("example") GoodsSkuQuery example);

    int updateByExample(@Param("record") GoodsSku record, @Param("example") GoodsSkuQuery example);

    int updateByPrimaryKeySelective(GoodsSku record);

    int updateByPrimaryKey(GoodsSku record);
}