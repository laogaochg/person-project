package com.csair.eshop.microservice.admin.dao.controller;

import com.csair.eshop.microservice.admin.user.domain.ResponseEntity;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;
import com.csair.admin.util.DataSourceUtils;
import com.csair.admin.util.ResultHandle;
import com.csair.admin.util.StringUtil;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;


@RestController
@RequestMapping("/${className}Dao")
public class ${className}Controller {

    @Autowired
    private ${className}Service ${classObj}Service;

    @PostMapping("/insert${className}")
    public ResponseEntity<Long> insert${className}(@RequestBody Map<String, ${className}> paramMap) {
        Long effectCount = ${classObj}Service.insert${className}(paramMap.get("obj"));
    return new ResponseEntity<>(effectCount);
    }

    @PostMapping("/queryAll${className}")
    public ResponseEntity<List<${className}>> queryAll${className}() {
        List<${className}> list = ${classObj}Service.queryAll${className}();
    return new ResponseEntity<>(list);
    }

    @PostMapping("/updateByKey")
    public ResponseEntity<Integer> updateByKey(@RequestBody Map<String, ${className}> paramMap) {
        ${className} ${classObj} = (${className})paramMap.get("obj");
        Integer affectCount = ${classObj}Service.updateByKey(${classObj});
        return new ResponseEntity<>(affectCount);
    }
    @PostMapping("/updateSelectByKey")
    public ResponseEntity<Integer> updateSelectByKey(@RequestBody Map<String, ${className}> paramMap) {
        ${className} ${classObj} = (${className})paramMap.get("obj");
        Integer affectCount = ${classObj}Service.updateSelectByKey(${classObj});
        return new ResponseEntity<>(affectCount);
    }

    @PostMapping("/queryById")
    public ResponseEntity<${className}> queryById(@RequestBody Map<String,Long> paramMap) {
        ${className} list = ${classObj}Service.queryById(paramMap.get("id"));
        return new ResponseEntity<>(list);
    }

    @PostMapping("/deleteById")
    public ResponseEntity<Integer> deleteById(@RequestBody Map<String, Long> paramMap) {
        Integer affectCount = ${classObj}Service.deleteById(paramMap.get("id"));
            return new ResponseEntity<>(affectCount);
    }

    @PostMapping("/pageQueryCount")
    public ResponseEntity<Integer> pageQueryCount(@RequestBody Map<String,${className}QueryObject> qo) {
        int list = ${classObj}Service.pageQueryCount(qo.get("qo"));
        return new ResponseEntity<Integer>(list);
    }

    @PostMapping("/pageQueryList")
    public ResponseEntity<List<${className}>> pageQueryList(@RequestBody Map<String,${className}QueryObject> qo) {
        List<${className}> list = ${classObj}Service.pageQueryList(qo.get("qo"));
        return new ResponseEntity<List<${className}>>(list);
    }       

}
