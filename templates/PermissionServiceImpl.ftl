package com.csair.admin.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.util.StringUtils;

import com.csair.admin.util.DataSourceUtils;
import com.csair.admin.util.ResultHandle;
import com.csair.admin.util.StringUtil;

@Service
@Transactional
public class ${className}ServiceImpl implements ${className}Service {

    private static Logger logger = LoggerFactory.getLogger(${className}ServiceImpl.class);
    @Autowired
    private ${className}Dao ${classNameLower}Dao;

    @Override
    public Long insert${className}(${className} p) {
        return ${classNameLower}Dao.insert${className}(p);
    }

    @Override
    public List<${className}> queryAll${className}() {
        return ${classNameLower}Dao.queryAll${className}();
    }

    @Override
    public int updateByKey(${className} p) {
        return ${classNameLower}Dao.updateByKey(p);
    }
    @Override
    public int updateSelectByKey(${className} p) {
        return ${classNameLower}Dao.updateSelectByKey(p);
    }

    @Override
    public ${className} queryById(Long id) {
        return ${classNameLower}Dao.queryById(id);
    }

    @Override
    public int deleteById(Long id) {
        return ${classNameLower}Dao.deleteById(id);
    }

}
