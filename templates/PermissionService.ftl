package com.csair.admin.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.util.DataSourceUtils;
import com.csair.admin.util.ResultHandle;
import com.csair.admin.util.StringUtil;

public interface ${className}Service {

    /**
    *插入返回id
    **/
    Long insert${className}(${className} p) ;
    /**
    *查询所有
    **/
    List<${className}> queryAll${className}() ;
    /**
    *根据主键修改
    *属性为null表里面的也会也为null
    *最好先查出旧的；在旧的上面改
    **/
    int updateByKey(${className} p) ;
    /**
    *根据主键查询
    *
    **/
    ${className} queryById(Long id) ;
    /**
    *根据主键删除
    *
    **/
    int deleteById(Long id) ;
    /**
    *根据主键修改
    *对象里面没值的不会进行修改
    */
    int updateSelectByKey(${className} obj);

}
