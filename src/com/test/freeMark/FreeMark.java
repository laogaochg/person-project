package com.test.freeMark;

import java.io.File;
import java.io.FileWriter;
import java.io.IOException;

import com.test.model.SqlModel;
import com.test.util.SqlParseUtils;
import freemarker.template.Configuration;
import freemarker.template.Template;

/**
 * laogaochg
 * 2017/7/6.
 */
public class FreeMark {
    private static Configuration cfg = null;

    static {
        cfg = new Configuration();
        try { //读取模板所在的目寻
            cfg.setDirectoryForTemplateLoading(new File("templates"));
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    /**
     * 生成模板代码
     * csair_goods_property_temple
     *
     * @param args
     * @throws Exception
     */
    public static void main(String[] args) throws Exception {
        File f = new File("d:/test/a.txt");
        String path = "D:\\laogao2\\PersionProject\\myFile/";
        SqlModel s = SqlParseUtils.getSqlModel(f);
        s.setName("品牌"); //主体名
        s.setAlias("gcpt");//sql里面这个表的别名；建议为类名第一个字母小写
        s.setClassName("GoodCategoryPropertyTemplet");//类名。
        //生成service类
        processFile("PermissionService.ftl",s.getClassName() + "Service.java",s,path);
        //生成service实现类
        processFile("PermissionServiceImpl.ftl",s.getClassName() + "ServiceImpl.java",s,path);
        //生成dao接口
        processFile("PermissionDao.ftl",s.getClassName() + "Dao.java",s,path);
        //生成dao实现类
        processFile("PermissionDaoImpl.ftl",s.getClassName() + "DaoImpl.java",s,path);
        //简单页面
        processFile("brandListFtl.ftl",s.getClassName() + "list.ftl",s,path);
        //高级查询封装象
        processFile("BrandQueryObject.ftl",s.getClassName() + "QueryObject.java",s,path);
        //生成controller类
        processFile("PermissionController.ftl",s.getClassName() + "Controller.java",s,path);
        //生成controller类2
        processFile("CerificateController.ftl",s.getClassName() + "Controller2.java",s,path);
        //dao实现类2
        CodeDaoImplGenerator.geneterDaoImpl(s.getClassName() + "Dao",path);
    }

    //处理普通文件的生成
    private static void processFile(String templaeFile,String targetFile,SqlModel classInfo,String path) throws Exception {
        //根据模板名称得到模板的对象
        Template template = cfg.getTemplate(templaeFile);
        String filePath = path + targetFile;
        File f = new File(filePath);
        if (!f.getParentFile().exists()) {
            f.getParentFile().mkdirs();
        }
        //合并模板和数据-->输出文件
        template.process(classInfo,new FileWriter(f));

    }
}
