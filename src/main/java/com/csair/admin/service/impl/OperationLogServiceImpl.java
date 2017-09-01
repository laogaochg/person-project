package com.csair.admin.service.impl;

import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.csair.admin.oldDao.OperationLogDao;
import com.csair.admin.po.OperationLog;
import com.csair.admin.po.OperationLogQueryObject;
import com.csair.admin.po.PageResult;
import com.csair.admin.service.OperationLogService;
import com.csair.admin.util.WorkExecutorService;

/**
 * laogaochg
 * 2017/7/11.
 */
@Service
public class OperationLogServiceImpl implements OperationLogService {
    @Autowired
    private OperationLogDao operationLogDao;

    @Override
    public PageResult<OperationLog> pageQuery(OperationLogQueryObject qo) {
        int totalCount = operationLogDao.pageQueryCount(qo);
        List<OperationLog> listData = operationLogDao.pageQueryList(qo);
        return new PageResult<>(listData,totalCount,qo.getCurrentPage(),qo.getPageSize());
    }

    @Override
    public void log(Long operaterId,String action,String content,String ip) {
        OperationLog log = new OperationLog();
        log.setAction(action);
        log.setAuthor(operaterId + "");
        log.setContent(content);
        log.setOpIp(ip);
        log.setOpTime(new Date());
        ThreadPoolExecutor lookup = WorkExecutorService.wr.lookup(WorkExecutorService.LOG_EXECUTOR_SERVICE);
        lookup.execute(new OerpationLogRunnable(log,operationLogDao));
    }

    /**
     * 操作日志异步任务类
     */
    private class OerpationLogRunnable implements Runnable {
        private OperationLog log;
        private OperationLogDao operationLogDao;

        @Override
        public void run() {
            operationLogDao.insertOperationLog(log);
        }

        private OerpationLogRunnable(OperationLog log,OperationLogDao operationLogDao) {
            this.log = log;
            this.operationLogDao = operationLogDao;
        }
    }
}
