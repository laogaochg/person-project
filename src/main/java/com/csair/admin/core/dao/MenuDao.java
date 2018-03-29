package com.csair.admin.core.dao;

import com.csair.admin.core.po.Goods;
import com.csair.admin.core.po.GoodsQuery;
import com.csair.admin.core.po.GoodsSku;
import com.csair.admin.core.po.GoodsSkuQuery;
import com.csair.admin.core.po.SkuProperties;
import com.csair.admin.core.po.SkuPropertiesQuery;
import com.csair.admin.core.po.SkuPropertiesValue;
import com.csair.admin.core.po.SkuPropertiesValueQuery;
import com.csair.admin.core.po.core.Menu;
import com.csair.admin.core.po.core.query.MenuQuery;
import java.util.List;
import org.apache.ibatis.annotations.Param;

public interface MenuDao {
    int countByExample(MenuQuery example);

    int deleteByExample(MenuQuery example);

    int deleteByPrimaryKey(Long mid);

    int insert(Menu record);

    int insertSelective(Menu record);

    List<Menu> selectByExample(MenuQuery example);

    Menu selectByPrimaryKey(Long mid);

    int updateByExampleSelective(@Param("record") Menu record, @Param("example") MenuQuery example);

    int updateByExample(@Param("record") Menu record, @Param("example") MenuQuery example);

    int updateByPrimaryKeySelective(Menu record);

    int updateByPrimaryKey(Menu record);

    interface GoodsDao {
        int countByExample(GoodsQuery example);

        int deleteByExample(GoodsQuery example);

        int deleteByPrimaryKey(Long id);

        int insert(Goods record);

        int insertSelective(Goods record);

        List<Goods> selectByExample(GoodsQuery example);

        Goods selectByPrimaryKey(Long id);

        int updateByExampleSelective(@Param("record") Goods record, @Param("example") GoodsQuery example);

        int updateByExample(@Param("record") Goods record, @Param("example") GoodsQuery example);

        int updateByPrimaryKeySelective(Goods record);

        int updateByPrimaryKey(Goods record);
    }

    interface GoodsSkuDao {
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

    interface SkuPropertiesDao {
        int countByExample(SkuPropertiesQuery example);

        int deleteByExample(SkuPropertiesQuery example);

        int deleteByPrimaryKey(Long id);

        int insert(SkuProperties record);

        int insertSelective(SkuProperties record);

        List<SkuProperties> selectByExample(SkuPropertiesQuery example);

        SkuProperties selectByPrimaryKey(Long id);

        int updateByExampleSelective(@Param("record") SkuProperties record, @Param("example") SkuPropertiesQuery example);

        int updateByExample(@Param("record") SkuProperties record, @Param("example") SkuPropertiesQuery example);

        int updateByPrimaryKeySelective(SkuProperties record);

        int updateByPrimaryKey(SkuProperties record);
    }

    interface SkuPropertiesValueDao {
        int countByExample(SkuPropertiesValueQuery example);

        int deleteByExample(SkuPropertiesValueQuery example);

        int deleteByPrimaryKey(Long id);

        int insert(SkuPropertiesValue record);

        int insertSelective(SkuPropertiesValue record);

        List<SkuPropertiesValue> selectByExample(SkuPropertiesValueQuery example);

        SkuPropertiesValue selectByPrimaryKey(Long id);

        int updateByExampleSelective(@Param("record") SkuPropertiesValue record, @Param("example") SkuPropertiesValueQuery example);

        int updateByExample(@Param("record") SkuPropertiesValue record, @Param("example") SkuPropertiesValueQuery example);

        int updateByPrimaryKeySelective(SkuPropertiesValue record);

        int updateByPrimaryKey(SkuPropertiesValue record);
    }
}