package com.csair.admin.core.service.impl;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.concurrent.ThreadPoolExecutor;

import com.csair.admin.core.dao.OperationLogDao;
import com.csair.admin.core.dao.UserDao;
import com.csair.admin.core.po.core.User;
import org.springframework.stereotype.Service;

import com.csair.admin.core.po.core.OperationLog;
import com.csair.admin.core.po.core.query.OperationLogQueryObject;
import com.csair.admin.core.po.core.PageResult;
import com.csair.admin.core.service.OperationLogService;
import com.csair.admin.util.WorkExecutorService;

import javax.annotation.Resource;

/**
 * laogaochg
 * 2017/7/11.
 */
@Service
public class OperationLogServiceImpl implements OperationLogService {
    @Resource
    private OperationLogDao operationLogDao;
    @Resource
    private UserDao userDao;

    @Override
    public PageResult<OperationLog> pageQuery(OperationLogQueryObject qo) {
        int totalCount = operationLogDao.pageQueryCount(qo);
        List<OperationLog> listData = operationLogDao.pageQueryList(qo);

        return new PageResult<>(listData, totalCount, qo.getPage(), qo.getPageSize());
    }

    @Override
    public void log(Long operaterId, String action, String content, String ip) {
        OperationLog log = new OperationLog();
        log.setAction(action);
        log.setAuthor(operaterId + "");
        log.setContent(content);
        log.setOpIp(ip);
        log.setOpTime(new Date());
        ThreadPoolExecutor lookup = WorkExecutorService.wr.lookup(WorkExecutorService.LOG_EXECUTOR_SERVICE);
        lookup.execute(new OerpationLogRunnable(log, operationLogDao));
    }

    /**
     * 操作日志异步任务类
     */
    private class OerpationLogRunnable implements Runnable {
        private OperationLog log;
        private OperationLogDao operationLogDao;

        @Override
        public void run() {
            operationLogDao.insert(log);
        }

        private OerpationLogRunnable(OperationLog log, OperationLogDao operationLogDao) {
            this.log = log;
            this.operationLogDao = operationLogDao;
        }
    }
}
