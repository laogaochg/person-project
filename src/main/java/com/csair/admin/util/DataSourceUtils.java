package com.csair.admin.util;

import java.sql.PreparedStatement;
import java.sql.Statement;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.core.ResultSetExtractor;
import org.springframework.jdbc.core.SingleColumnRowMapper;
import org.springframework.jdbc.support.GeneratedKeyHolder;
import org.springframework.jdbc.support.KeyHolder;
import org.springframework.stereotype.Component;
import org.springframework.util.ClassUtils;
import org.springframework.util.CollectionUtils;

/**
 * Created by lenovo on 2017/6/26.
 * 数据库工具类；
 */
@Component
public class DataSourceUtils {
    @Autowired
    private JdbcTemplate jdbcTemplate;

    private static Logger logger = LoggerFactory.getLogger(DataSourceUtils.class);

    /**
     * 查询多行，用对象封装结果
     *
     * @param sql          查询语句，
     * @param requiredType 返回参数的类型，如果是基本类型要只能查一列；数据封装的字段名必须和查出来的列名一样！
     * @param params       占位符
     * @param <T>          返回类型 字段名必须和查出来的列名一样！基本类型不作要求
     */
    public <T> List<T> query(String sql,Class<T> requiredType,Object... params) {
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        //如果是基本类型或装箱类型
        if (ClassUtils.isPrimitiveOrWrapper(requiredType)) {
            return jdbcTemplate.query(sql,new SingleColumnRowMapper<>(requiredType),params);
        }
        return jdbcTemplate.query(sql,new BeanPropertyRowMapper<>(requiredType),params);
    }

    /**
     * 返回单个结果，多个结果会返回null
     *
     * @param sql
     * @param requiredType
     * @param params
     * @param <T>
     * @return
     */
    public <T> T queryForObject(String sql,Class<T> requiredType,Object... params) {
        T t;
        try {
            logger.info("执行sql语句：\n" + sql);
            logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
            t = jdbcTemplate.queryForObject(sql,requiredType,params);
        } catch (Exception e) {
            t = null;
            e.printStackTrace();
        }
        return t;
    }

    /**
     * 查询多条纪录，返回List<Map<String,Object>>
     *
     * @param sql
     * @param params
     * @return
     */
    public List<Map<String,Object>> queryForListMap(String sql,Object... params) {
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        return jdbcTemplate.queryForList(sql,params);
    }

    /**
     * @param sql
     * @param rse    自己定义结果集处理器
     * @param params
     * @param <T>
     * @return
     * @throws DataAccessException
     */
    public <T> T query(String sql,ResultSetExtractor<T> rse,Object... params) throws DataAccessException {
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        return jdbcTemplate.query(sql,rse,params);
    }

    public Integer update(String sql,Object... params) {
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        return jdbcTemplate.update(sql,params);
    }

    /**
     * 执行新增返回新增id
     *
     * @param sql
     * @param params
     * @return
     */
    public Long insertGetId(String sql,Object... params) {
        KeyHolder keyHolder = new GeneratedKeyHolder();
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        jdbcTemplate.update(con -> {
            PreparedStatement ps = con.prepareStatement(sql,Statement.RETURN_GENERATED_KEYS);
            for (int i = 0;params.length != 0 && i < params.length;i++) {
                ps.setObject(i + 1,params[i]);
            }
            return ps;
        },keyHolder);
        return keyHolder.getKey().longValue();
    }

    public <T> List<T> doSelectForList(String sql,BeanPropertyRowMapper<T> resuleHandle,Object... params) {
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        return jdbcTemplate.query(sql,resuleHandle,params);
    }

    /**
     * 只查一行，结果多个返回第一个
     *
     * @param resuleHandle
     * @param sql
     * @param params
     * @param <T>
     * @return
     */
    public <T> T queryOne(BeanPropertyRowMapper<T> resuleHandle,String sql,Object... params) {
        T t = null;
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        List<T> query = jdbcTemplate.query(sql,resuleHandle,params);
        if (query.size() > 0) t = query.get(0);
        return t;
    }

    public Integer getTotalCount(String sql,Object... params) {
        logger.info("执行sql语句：\n" + sql);
        logger.info("sql参数：\n" + StringUtil.join(CollectionUtils.arrayToList(params),","));
        List<Integer> query = jdbcTemplate.query(sql,new SingleColumnRowMapper<>(Integer.class),params);
        return query.get(0);
    }

}
