package com.csair.admin.core.controller;

import com.csair.admin.core.po.core.OperationLog;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.po.core.Role;
import com.csair.admin.core.po.core.resp.DatagridForLayUI;
import com.csair.admin.core.vo.OperationLogVo;
import com.csair.admin.util.ServletUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.csair.admin.core.po.core.query.OperationLogQueryObject;
import com.csair.admin.core.service.OperationLogService;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.util.ArrayList;
import java.util.List;

/**
 * laogaochg
 * 2017/7/11.
 */
@Controller
@RequestMapping("log")
public class OperationLogController {
    @Resource
    private OperationLogService operationLogService;

    @RequestMapping("list")
    @ResponseBody
    public DatagridForLayUI<OperationLogVo> list(OperationLogQueryObject qo) {
        DatagridForLayUI<OperationLogVo> result = new DatagridForLayUI<>();
        PageResult<OperationLog> pageResult = operationLogService.pageQuery(qo);
        result.setCount(pageResult.getTotalCount().longValue());
        List<OperationLogVo> listData = new ArrayList<>();
        for (OperationLog log : pageResult.getListData()) {
            listData.add(new OperationLogVo(log));
        }
        result.setData(listData);
        return result;
    }
}


