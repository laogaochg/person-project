package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.Shop;
import com.csair.admin.po.ShopQueryObject;

public interface ShopDao {


    /**
    *插入返回id
    **/
    Integer insertShop(Shop p) ;
    /**
    *查询所有
    **/
    List<Shop> queryAllShop() ;
    /**
    *根据主键修改
    *属性为null表里面的也会也为null
    *最好先查出旧的；在旧的上面改
    **/
    Integer updateByKey(Shop p) ;
    /**
    *根据主键查询
    *
    **/
    Shop queryById(Long id) ;
    /**
    *根据主键删除
    *
    **/
    Integer deleteById(Long id) ;


    /**
     * 查询符合条件的个数
     */
    Integer pageQueryCount(ShopQueryObject qo);

    /**
     * 分页查询数据
     *pageSize<0的时候不进行分页查询就是查询所有符合条件的
     */
    List<Shop> pageQueryList(ShopQueryObject qo);

}
