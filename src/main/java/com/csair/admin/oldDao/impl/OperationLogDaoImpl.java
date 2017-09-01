package com.csair.admin.oldDao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.oldDao.OperationLogDao;
import com.csair.admin.oldDao.QueryData;
import com.csair.admin.po.OperationLog;
import com.csair.admin.po.OperationLogQueryObject;
import com.csair.admin.util.DataSourceUtils;

@Repository
public class OperationLogDaoImpl implements OperationLogDao {

    public static final String baseSelect = "select id as id , author as author ," +//
            " action as action , content as content , op_time as opTime , " +//
            "op_ip as opIp from csair_log_operation ";
    @Autowired
    private DataSourceUtils dataSourceUtils;

    @Override
    public List<OperationLog> pageQueryList(OperationLogQueryObject qo) {
        QueryData qd = getOperationLogQueryData(qo);
        String sql = qo.getSqlString() +  qd.getConditionString() + " ORDER BY l.op_time DESC  LIMIT ? , ?  ";
        List<Object> params = qd.getParamsList();
        params.add(qo.getStartRow());
        params.add(qo.getPageSize());
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(OperationLog.class),params.toArray());
    }

    @Override
    public int pageQueryCount(OperationLogQueryObject qo) {
        QueryData qd = getOperationLogQueryData(qo);
        String sql = qo.getCountSql();
        return dataSourceUtils.getTotalCount(sql + qd.getConditionString(),qd.getParamsList().toArray());
    }

    private QueryData getOperationLogQueryData(OperationLogQueryObject qo) {
        StringBuilder sb = new StringBuilder(" where 1=1 ");
        QueryData qd = new QueryData();
        List<Object> paramList = qd.getParamsList();
        if (StringUtils.hasText(qo.getKeyword())) {
            sb.append(" AND ( l.author like concat('%' , ? , '%' )   ");
            sb.append(" or  l.action like concat('%' , ? , '%' ) ) ");
            paramList.add(qo.getKeyword());
            paramList.add(qo.getKeyword());
        }
        if (qo.getBeginTime() != null) {
            sb.append(" AND l.op_time > ? ");
            paramList.add(qo.getBeginTime());
        }
        if (qo.getEndTime() != null) {
            sb.append(" AND l.op_time < ? ");
            paramList.add(qo.getEndTime());
        }
        if (StringUtils.hasText(qo.getAuthorId())) {
            sb.append(" AND l.author = ? ");
            paramList.add(qo.getAuthorId());
        }
        if (StringUtils.hasText(qo.getAction())) {
            sb.append(" AND l.action = ? ");
            paramList.add(qo.getAction());
        }
        qd.setConditionString(sb.toString());
        return qd;
    }

    @Override
    public Long insertOperationLog(OperationLog p) {
        String sql = "insert into csair_log_operation ( author,action,content,op_time,op_ip ) values ( ?,?,?,?,? ) ";
        List<Object> params = new ArrayList<Object>();
        params.add(p.getAuthor());
        params.add(p.getAction());
        params.add(p.getContent());
        params.add(p.getOpTime());
        params.add(p.getOpIp());
        return dataSourceUtils.insertGetId(sql,params.toArray());
    }

    public List<OperationLog> queryAllOperationLog() {
        return dataSourceUtils.doSelectForList(baseSelect,new BeanPropertyRowMapper<>(OperationLog.class));
    }
    public int updateByKey(OperationLog p) {
        String sql = "update  csair_log_operation set id = ? ,author = ? ,action = ? ,content = ? ,op_time = ? ,op_ip = ?  where id =  ? ";
        List<Object> params = new ArrayList<Object>();
        params.add(p.getId());
        params.add(p.getAuthor());
        params.add(p.getAction());
        params.add(p.getContent());
        params.add(p.getOpTime());
        params.add(p.getOpIp());
        params.add(p.getId());
        return dataSourceUtils.update(sql,params.toArray());
    }

    public OperationLog queryById(Long id) {
        String sql = baseSelect + " where id = ? ";
        return dataSourceUtils.doSelectForList(sql,new BeanPropertyRowMapper<>(OperationLog.class),id).get(0);
    }

    public int deleteById(Long id) {
        String sql = "delete from csair_log_operation where id = ? ";
        return dataSourceUtils.update(sql,id);
    }
}
