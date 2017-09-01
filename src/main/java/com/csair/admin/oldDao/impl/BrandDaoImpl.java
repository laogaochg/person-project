package com.csair.admin.oldDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.BrandDao;
import com.csair.admin.oldDao.QueryData;
import com.csair.admin.po.Brand;
import com.csair.admin.po.BrandQueryObject;
import com.csair.admin.util.DataSourceUtils;
import com.csair.admin.util.ObjectUtil;

@Repository
public class BrandDaoImpl implements BrandDao {

    public static final String baseSelect = "select b.brand_id as brandId , b.brand_name as brandName , b.brand_logo as brandLogo , b.brand_logo_thumb as brandLogoThumb , b.brand_website as brandWebsite , b.brand_desc as brandDesc , b.brand_order as brandOrder , b.status as status , b.add_time as addTime , b.add_by as addBy from csair_brand b ";
    @Autowired
    private DataSourceUtils dataSourceUtils;

    @Override
    public int editBrandOrder(Long[] ids,Long[] newOrder) {
        return 0;
    }

    @Override
    public Long insertBrand(Brand obj) {
        String sql = "insert into csair_brand ( brand_name,brand_logo,brand_logo_thumb,brand_website,brand_desc,brand_order,status,add_time,add_by ) values ( ?,?,?,?,?,?,?,?,? ) ";
        List<Object> params = new ArrayList<Object>();
        params.add(obj.getBrandName());
        params.add(obj.getBrandLogo());
        params.add(obj.getBrandLogoThumb());
        params.add(obj.getBrandWebsite());
        params.add(obj.getBrandDesc());
        params.add(obj.getBrandOrder());
        params.add(obj.getStatus());
        params.add(obj.getAddTime());
        params.add(obj.getAddBy());
        return dataSourceUtils.insertGetId(sql,params.toArray());
    }

    @Override
    public List<Brand> queryAllBrand() {
        return dataSourceUtils.query(baseSelect,Brand.class);
    }

    @Override
    public int updateByKey(Brand obj) {
        String sql = "update  csair_brand set brand_id = ? ,brand_name = ? ,brand_logo = ? ,brand_logo_thumb = ? ,brand_website = ? ,brand_desc = ? ,brand_order = ? ,status = ? ,add_time = ? ,add_by = ?  where brand_id =  ? ";
        List<Object> params = new ArrayList<Object>();
        params.add(obj.getBrandId());
        params.add(obj.getBrandName());
        params.add(obj.getBrandLogo());
        params.add(obj.getBrandLogoThumb());
        params.add(obj.getBrandWebsite());
        params.add(obj.getBrandDesc());
        params.add(obj.getBrandOrder());
        params.add(obj.getStatus());
        params.add(obj.getAddTime());
        params.add(obj.getAddBy());
        params.add(obj.getBrandId());
        return dataSourceUtils.update(sql,params.toArray());
    }

    public int updateSelectByKey(Brand obj) {
        StringBuilder sql = new StringBuilder("UPDATE csair_brand SET ");
        List<Object> params = new ArrayList<Object>();
        if (ObjectUtil.hasContent(obj.getBrandId())) {
            params.add(obj.getBrandId());
            sql.append(" brand_id = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getBrandName())) {
            params.add(obj.getBrandName());
            sql.append(" brand_name = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getBrandLogo())) {
            params.add(obj.getBrandLogo());
            sql.append(" brand_logo = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getBrandLogoThumb())) {
            params.add(obj.getBrandLogoThumb());
            sql.append(" brand_logo_thumb = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getBrandWebsite())) {
            params.add(obj.getBrandWebsite());
            sql.append(" brand_website = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getBrandDesc())) {
            params.add(obj.getBrandDesc());
            sql.append(" brand_desc = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getBrandOrder())) {
            params.add(obj.getBrandOrder());
            sql.append(" brand_order = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getStatus())) {
            params.add(obj.getStatus());
            sql.append(" status = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getAddTime())) {
            params.add(obj.getAddTime());
            sql.append(" add_time = ? , ");
        }
        if (ObjectUtil.hasContent(obj.getAddBy())) {
            params.add(obj.getAddBy());
            sql.append(" add_by = ? , ");
        }
        sql.append(" brand_id = ? ");
        params.add(obj.getBrandId());
        sql.append(" WHERE brand_id = ? ");
        params.add(obj.getBrandId());
        return dataSourceUtils.update(sql.toString(),params.toArray());
    }

    @Override
    public Brand queryById(Long id) {
        String sql = baseSelect + " where brand_id = ? ";
        return dataSourceUtils.queryOne(new BeanPropertyRowMapper<>(Brand.class),sql,id);
    }

    @Override
    public int deleteById(Long id) {
        String sql = "delete from csair_brand where brand_id = ? ";
        return dataSourceUtils.update(sql,id);
    }

    @Override
    public List<Brand> pageQueryList(BrandQueryObject qo) {
        QueryData qd = getQueryData(qo);
        List<Object> paramList = qd.getParamsList();
        if (qo.getPageSize() > 0) {//pageSize大于0才进行分页操作，不大于0 就不分页
            List<Object> params = new ArrayList<>(paramList);
            params.add(qo.getStartRow());
            params.add(qo.getPageSize());
            return dataSourceUtils.query(baseSelect + qd.getConditionString() + " LIMIT ? , ? ",Brand.class,params.toArray());
        } else {
            return dataSourceUtils.query(baseSelect + qd.getConditionString(),Brand.class,paramList.toArray());
        }
    }

    private QueryData getQueryData(BrandQueryObject qo) {
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        if (StringUtils.hasText(qo.getKeyword())) {
            sb.append(" AND b.brand_name LIKE CONCAT('%',?,'%')");
            paramList.add(qo.getKeyword());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

    @Override
    public int pageQueryCount(BrandQueryObject qo) {
        String sql = "select count(1) from csair_brand b ";
        QueryData qd = getQueryData(qo);
        return dataSourceUtils.getTotalCount(sql + qd.getConditionString(),qd.getParamsList().toArray());
    }

}
