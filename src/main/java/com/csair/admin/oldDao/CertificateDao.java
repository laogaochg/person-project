package com.csair.admin.oldDao;

import java.util.List;

import com.csair.admin.po.setting.Certificate;
import com.csair.admin.po.setting.CertificateQueryObject;

public interface CertificateDao {

    /**
    *插入返回id
    **/
   Long insertCertificate(Certificate obj) ;
    /**
    *查询所有
    **/
   List<Certificate> queryAllCertificate() ;
    /**
    *根据主键修改
    *属性为null表里面的也会也为null
    *最好先查出旧的；在旧的上面改
    **/
   int updateByKey(Certificate obj) ;
    /**
    *根据主键查询
    *
    **/
   Certificate queryById(Long id) ;
    /**
    *根据主键删除
    *
    **/
   int deleteById(Long id) ;

    /**
    * 查询符合条件的个数
    */
    int pageQueryCount(CertificateQueryObject qo);

    /**
    * 分页查询数据
    *pageSize<0的时候不进行分页查询就是查询所有符合条件的
    */
    List<Certificate> pageQueryList(CertificateQueryObject qo);

}
