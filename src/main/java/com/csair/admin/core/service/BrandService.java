package com.csair.admin.core.service;

import com.csair.admin.core.po.Brand;
import com.csair.admin.core.po.core.query.BrandQueryObject;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.ResponseMessage;
import com.csair.admin.core.po.core.User;

public interface BrandService {

    /**
    *插入
    **/
    int editBrand(Brand p) ;
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
    ResponseMessage<String> editBrand(Brand brand, User user);

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
    ResponseMessage batchDeleteBrand(Long[] ids, User user);

}
