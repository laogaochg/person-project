package com.test.freeMark;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.test.util.BlParseUtil;
import com.test.util.SqlUtil;
import freemarker.template.Configuration;
import freemarker.template.Template;

public class MyFreeMarkerTest {
    private static Configuration cfg = null;

    static {
        cfg = new Configuration();
        //设置模板文件所在的目录
        try {
            cfg.setDirectoryForTemplateLoading(new File("templates"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) throws Exception {
        SqlData data = queryMulti();
        processXml(data,"查询多个条件.ftl",new File("d:/test.xml"));

        //检查数据字典里面有没有这个变量
        File dictFile = new File("F:\\daima\\之前项目\\soa_productPackagingService\\designSource\\common\\dataDict\\dataDict.xml");//数据字典
        BlParseUtil.checkParamExist(data.getListName(),dictFile);
    }

    /**
     * 查询多条记录
     */
    private static SqlData queryMulti() {
        SqlData data = new SqlData();
        //输入查询字段
        String sql = "select a.companyId , a.userId as user , applyflowTime from ";
        data.setQueryOrder("");//排序
        data.setListName("sourceChannelInfo");//输出数组名
        data.setQueryCondition("");//查询条件
        data.setQueryTables("");//表名
        data.getData().addAll(SqlUtil.getQueryField(sql));//输出字段
        data.setQueryFields(SqlUtil.getQueryString(sql));//查询字段
        return data;
    }

    /**
     * @param f            数据封装类
     * @param templateFile 模板文件
     * @param tarFile      生成的目标文件
     */
    private static void processXml(Object f,String templateFile,File tarFile) throws Exception {
        Template template = cfg.getTemplate(templateFile);
        FileWriter writer = new FileWriter(tarFile);
        template.process(f,writer);
    }
}
