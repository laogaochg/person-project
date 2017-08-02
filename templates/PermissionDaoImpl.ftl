package com.csair.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.eshop.microservice.admin.common.util.DataSourceUtils;
import com.csair.admin.util.StringUtil;

@Repository
public class ${className}DaoImpl implements ${className}Dao {

    public static final String baseSelect = "${queryAll}";
    @Autowired
    private DataSourceUtils dataSourceUtils;

    @Override
    public Long insert${className}(${className} obj) {
        String sql = "${insert}";
        List<Object> params = new ArrayList<Object>();
        <#list noKeyFields as field>
            params.add(obj.get${field}());
        </#list>
        return dataSourceUtils.insertGetId(sql,params.toArray());
    }

    @Override
    public List<${className}> queryAll${className}() {
        return dataSourceUtils.query(baseSelect,${className}.class);
    }

    @Override
    public int updateByKey(${className} obj) {
        String sql = "${upDateByKey}";
        List<Object> params = new ArrayList<Object>();
        <#list fieldsUp as field>
        params.add(obj.get${field}());
        </#list>
        params.add(obj.get${upKey}());
        return dataSourceUtils.update(sql,params.toArray());
    }
    @Override
    public int updateSelectByKey(${className} obj) {
        StringBuilder sql = new StringBuilder("UPDATE ${tableName} SET ");
        List<Object> params = new ArrayList<Object>();
        <#list fieldsUp as field>
        if(ObjectUtil.hasContent(obj.get${field}())){
            params.add(obj.get${field}());
            sql.append(" ${sqlParams[field_index]} = ? , ");
        }
        </#list>
        params.add(obj.get${upKey}());
        sql.append(" ${key} = ? ");
        sql.append(" WHERE ${key} = ? ");
        params.add(obj.get${upKey}());
        return dataSourceUtils.update(sql.toString(),params.toArray());
    }

    @Override
    public ${className} queryById(Long id) {
        String sql = baseSelect + " where ${key} = ? ";
        return dataSourceUtils.queryOne(new BeanPropertyRowMapper<>(${className}.class),sql,id);
    }

    @Override
    public int deleteById(Long id) {
        String sql = "${deleteByKey}";
        return dataSourceUtils.update(sql,id);
    }


    @Override
    public List<${className}> pageQueryList(${className}QueryObject qo) {
        QueryData qd = getQueryData(qo);
        List<Object> paramList = qd.getParamsList();
        if (qo.getPageSize() > 0) {//pageSize大于0才进行分页操作，不大于0 就不分页
            List<Object> params = new ArrayList<>(paramList);
            params.add(qo.getStartRow());
            params.add(qo.getPageSize());
            return dataSourceUtils.query(baseSelect + qd.getConditionString() + " LIMIT ? , ? ",${className}.class,params.toArray());
        } else {
            return dataSourceUtils.query(baseSelect + qd.getConditionString(),${className}.class,paramList.toArray());
        }
    }

    private QueryData getQueryData(${className}QueryObject qo) {
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        StringBuilder sb = new StringBuilder(" where 1=1 ");
            //todo 完成sql条件拼装
            qd.setConditionString(sb.toString());
            return qd;
    }

    @Override
    public int pageQueryCount(${className}QueryObject qo) {
        String sql = "select count(1) from ${tableName} ${alias} ";
        QueryData qd = getQueryData(qo);
        return dataSourceUtils.getTotalCount(sql + qd.getConditionString(),qd.getParamsList().toArray());
    }

}
