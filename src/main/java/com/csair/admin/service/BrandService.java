package com.csair.admin.service;

import java.util.List;

import com.csair.admin.po.Brand;
import com.csair.admin.po.BrandQueryObject;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.User;
import com.csair.admin.po.PageResult;

public interface BrandService {

    /**
    *插入返回id
    **/
    Long editBrand(Brand p) ;
    /**
    *查询所有
    **/
    List<Brand> queryAllBrand() ;
    /**
    *根据主键修改
    *属性为null表里面的也会也为null
    *最好先查出旧的；在旧的上面改
    **/
    int updateByKey(Brand p) ;
    /**
    *根据主键查询
    *
    **/
    Brand queryById(Long id) ;
    /**
    *根据主键删除
    *
    **/
    int deleteById(Long id) ;

    /**
     * 插入品牌
     * @param brand
     * @param user
     * @return
     */
    ResponseEntity<String> editBrand(Brand brand,User user);

    /**
     * 分页查询
     * @param qo
     * @return
     */
    PageResult<Brand> pageQuery(BrandQueryObject qo);

    /**
     * 批量删除品牌
     * @param ids
     * @param user
     * @return
     */
    ResponseEntity batchDeleteBrand(Long[] ids,User user);

    /**
     * 修改类目的序号
     * @param ids
     * @param newOrder
     * @param user
     * @return
     */
    ResponseEntity editBrandOrder(Long[] ids,Long[] newOrder,User user);
}
