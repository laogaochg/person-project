package com.csair.admin.core.service.impl;

import java.io.File;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import com.csair.admin.core.dao.BrandDao;
import com.csair.admin.core.po.Brand;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.util.HtmlUtils;

import com.csair.admin.core.po.core.BrandQueryObject;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.ResponseEntity;
import com.csair.admin.core.po.core.User;
import com.csair.admin.core.service.BrandService;
import com.csair.admin.core.service.OperationLogService;
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
    public int editBrand(Brand p) {
        return brandDao.insert(p);
    }


    @Override
    public int updateByKey(Brand p) {
        return brandDao.updateByPrimaryKey(p);
    }

    @Override
    public Brand queryById(Long id) {
        return brandDao.selectByPrimaryKey(id);
    }

    @Override
    public int deleteById(Long id) {
        return brandDao.deleteByPrimaryKey(id);
    }

    @Override
    public ResponseEntity<String> editBrand(Brand brand, User user) {
        ResponseEntity<String> result = new ResponseEntity<String>();
        //过滤特殊字符
        brand.setBrandDesc(HtmlUtils.htmlEscape(brand.getBrandDesc()));
        if (brand.getBrandId() == null) {
            brand.setAddTime(new Date());
            brand.setAddBy(user.getId());
            String content = java.lang.String.format("品牌名字：%s", brand.getBrandName());
            brandDao.insert(brand);
            operationLogService.log(user.getId(), "添加品牌", content, user.getLastIp());
            return result;
        } else {
            Brand oldBrand = brandDao.selectByPrimaryKey(brand.getBrandId());
            oldBrand.setBrandDesc(brand.getBrandDesc());
            oldBrand.setBrandLogo(brand.getBrandLogo());
            oldBrand.setBrandLogoThumb(brand.getBrandLogoThumb());
            oldBrand.setBrandName(brand.getBrandName());
            oldBrand.setBrandOrder(brand.getBrandOrder());
            oldBrand.setBrandWebsite(brand.getBrandWebsite());
            oldBrand.setStatus(brand.getStatus());
            String content = java.lang.String.format("品牌ID:%s；品牌名字：%s", brand.getBrandId(), brand.getBrandName());
            brandDao.updateByPrimaryKey(brand);
            operationLogService.log(user.getId(), "修改品牌", content, user.getLastIp());
            return null;
        }

    }

    @Override
    public PageResult<Brand> pageQuery(BrandQueryObject qo) {
        List<Brand> brands = brandDao.pageQueryList(qo);
        int count = brandDao.pageQueryCount(qo);
        return new PageResult<>(brands, count, qo.getCurrentPage(), qo.getPageSize());
    }

    @Override
    public ResponseEntity batchDeleteBrand(Long[] ids, User user) {
        for (Long id : ids) {
            Brand brand = brandDao.selectByPrimaryKey(id);
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
            brandDao.deleteByPrimaryKey(id);
        }
        String content = String.format("品牌ID：（%s）。", StringUtil.join(Arrays.asList(ids), ","));
        operationLogService.log(user.getId(), "批量删除品牌", content, user.getLastIp());
        ResponseEntity re = new ResponseEntity();
        re.setMes("删除成功。");
        return re;
    }
}
