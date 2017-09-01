package com.csair.admin.service.impl;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import com.csair.admin.oldDao.BrandDao;
import com.csair.admin.po.Brand;
import com.csair.admin.po.BrandQueryObject;
import com.csair.admin.po.PageResult;
import com.csair.admin.po.ResponseEntity;
import com.csair.admin.po.User;
import com.csair.admin.service.BrandService;
import com.csair.admin.service.OperationLogService;
import com.csair.admin.util.EnvironmentParams;
import com.csair.admin.util.StringUtil;

@Service
public class BrandServiceImpl implements BrandService {

    private static Logger logger = LoggerFactory.getLogger(BrandServiceImpl.class);
    @Autowired
    private BrandDao brandDao;
    @Autowired
    private OperationLogService operationLogService;

    @Override
    public ResponseEntity editBrandOrder(Long[] ids,Long[] newOrder,User user) {
        String content = "类目id:"+StringUtil.join(Arrays.asList(ids),",");
        operationLogService.log(user.getId(),"修改类目序号",content,user.getLastIp());
        brandDao.editBrandOrder(ids,newOrder);
        ResponseEntity re = new ResponseEntity();
        re.setMes("修改类目成功。");
        return re;
    }

    @Override
    public Long editBrand(Brand p) {
        return brandDao.insertBrand(p);
    }

    @Override
    public List<Brand> queryAllBrand() {
        return brandDao.queryAllBrand();
    }

    @Override
    public int updateByKey(Brand p) {
        return brandDao.updateByKey(p);
    }

    @Override
    public Brand queryById(Long id) {
        return brandDao.queryById(id);
    }

    @Override
    public int deleteById(Long id) {
        return brandDao.deleteById(id);
    }

    @Override
    public ResponseEntity<String> editBrand(Brand brand,User user) {
        ResponseEntity<String> result = new ResponseEntity<String>();
        //过滤特殊字符
        brand.setBrandDesc(HtmlUtils.htmlEscape(brand.getBrandDesc()));
        if (brand.getBrandId() == null) {
            brand.setAddTime(new Date());
            brand.setAddBy(user.getId());
            String content = java.lang.String.format("品牌名字：%s",brand.getBrandName());
            brandDao.insertBrand(brand);
            operationLogService.log(user.getId(),"添加品牌",content,user.getLastIp());
            return result;
        } else {
            Brand oldBrand = brandDao.queryById(brand.getBrandId());
            oldBrand.setBrandDesc(brand.getBrandDesc());
            oldBrand.setBrandLogo(brand.getBrandLogo());
            oldBrand.setBrandLogoThumb(brand.getBrandLogoThumb());
            oldBrand.setBrandName(brand.getBrandName());
            oldBrand.setBrandOrder(brand.getBrandOrder());
            oldBrand.setBrandWebsite(brand.getBrandWebsite());
            oldBrand.setStatus(brand.getStatus());
            String content = java.lang.String.format("品牌ID:%s；品牌名字：%s",brand.getBrandId(),brand.getBrandName());
            brandDao.updateByKey(brand);
            operationLogService.log(user.getId(),"修改品牌",content,user.getLastIp());
            return null;
        }

    }

    @Override
    public PageResult<Brand> pageQuery(BrandQueryObject qo) {
        List<Brand> brands = brandDao.pageQueryList(qo);
        int count = brandDao.pageQueryCount(qo);
        return new PageResult<>(brands,count,qo.getCurrentPage(),qo.getPageSize());
    }

    @Override
    public ResponseEntity batchDeleteBrand(Long[] ids,User user) {
        for (Long id : ids) {
            Brand brand = brandDao.queryById(id);
            //删除LOGO图
            if (brand != null) {
                String logo = brand.getBrandLogo();
                File file = new File(EnvironmentParams.IMG_PATH + logo);
                if (file.exists() && file.isFile()) {
                    file.delete();
                }
                file = new File(EnvironmentParams.IMG_PATH + brand.getBrandLogoThumb());
                if (file.exists() && file.isFile()) {
                    file.delete();
                }
            }
            brandDao.deleteById(id);
        }
        String content = String.format("品牌ID：（%s）。",StringUtil.join(Arrays.asList(ids),","));
        operationLogService.log(user.getId(),"批量删除品牌",content,user.getLastIp());
        ResponseEntity re = new ResponseEntity();
        re.setMes("删除成功。");
        return re;
    }
}
