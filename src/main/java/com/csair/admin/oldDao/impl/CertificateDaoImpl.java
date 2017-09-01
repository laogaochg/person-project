package com.csair.admin.oldDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.CertificateDao;
import com.csair.admin.oldDao.QueryData;
import com.csair.admin.po.setting.Certificate;
import com.csair.admin.po.setting.CertificateQueryObject;
import com.csair.admin.util.DataSourceUtils;

@Repository
public class CertificateDaoImpl implements CertificateDao {
    public static final String baseSelect = "select Certificate.id as id , Certificate.name as name , Certificate.remark as remark , Certificate.create_id as createId , Certificate.create_date as createDate , Certificate.update_date as updateDate from csair_certificate Certificate ";
    @Autowired
    private DataSourceUtils dataSourceUtils;

    @Override
    public Long insertCertificate(Certificate obj) {
        String sql = "insert into csair_certificate ( name,remark,create_id,create_date,update_date ) values ( ?,?,?,?,? ) ";
        List<Object> params = new ArrayList<Object>();
        params.add(obj.getName());
        params.add(obj.getRemark());
        params.add(obj.getCreateId());
        params.add(obj.getCreateDate());
        params.add(obj.getUpdateDate());
        return dataSourceUtils.insertGetId(sql,params.toArray());
    }

    @Override
    public List<Certificate> queryAllCertificate() {
        return dataSourceUtils.query(baseSelect,Certificate.class);
    }

    @Override
    public int updateByKey(Certificate obj) {
        String sql = "update  csair_certificate set id = ? ,name = ? ,remark = ? ,create_id = ? ,create_date = ? ,update_date = ?  where id =  ? ";
        List<Object> params = new ArrayList<Object>();
        params.add(obj.getId());
        params.add(obj.getName());
        params.add(obj.getRemark());
        params.add(obj.getCreateId());
        params.add(obj.getCreateDate());
        params.add(obj.getUpdateDate());
        params.add(obj.getId());
        return dataSourceUtils.update(sql,params.toArray());
    }

    @Override
    public Certificate queryById(Long id) {
        String sql = baseSelect + " where id = ? ";
        return dataSourceUtils.queryOne(new BeanPropertyRowMapper<>(Certificate.class),sql,id);
    }

    @Override
    public int deleteById(Long id) {
        String sql = "delete from csair_certificate where id = ? ";
        return dataSourceUtils.update(sql,id);
    }

    @Override
    public List<Certificate> pageQueryList(CertificateQueryObject qo) {
        QueryData qd = getQueryData(qo);
        List<Object> paramList = qd.getParamsList();
        if (qo.getPageSize() > 0) {//pageSize大于0才进行分页操作，不大于0 就不分页
            List<Object> params = new ArrayList<>(paramList);
            params.add(qo.getStartRow());
            params.add(qo.getPageSize());
            return dataSourceUtils.query(baseSelect + qd.getConditionString() + " LIMIT ? , ? ",Certificate.class,params.toArray());
        } else {
            return dataSourceUtils.query(baseSelect + qd.getConditionString(),Certificate.class,paramList.toArray());
        }

    }

    private QueryData getQueryData(CertificateQueryObject qo) {
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        if(StringUtils.hasText(qo.getKeyword())){
            sb.append(" AND Certificate.name LIKE CONCAT('%',?,'%') ");
            paramList.add(qo.getKeyword());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

    @Override
    public int pageQueryCount(CertificateQueryObject qo) {
        String sql = "select count(1) from csair_certificate Certificate ";
        QueryData qd = getQueryData(qo);
        return dataSourceUtils.getTotalCount(sql + qd.getConditionString(),qd.getParamsList().toArray());
    }
}
