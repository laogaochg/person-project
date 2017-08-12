package com.test.util;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.util.StringUtils;

import jxl.Workbook;
import jxl.write.Label;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.WriteException;
import jxl.write.biff.RowsExceededException;

/**
 * 个人表结构文档编写代码工具类
 *
 * @author 劳高
 */
public class ExcelUtils {
    static private Logger logger = Logger.getLogger(ExcelUtils.class);
    static public int SUCCESS = 0;
    static public int ERROR = -1;

    public static void main(String[] args) throws Exception {
//		createTableInfo("");
    }

    /**
     * 创建单个sheet的excel文件,自己指定路径,用二维数组来映射相应的单元格
     *
     * @param sheetName 工作表名
     **/
    public static int createExcel(String file,String sheetName,List<List<String>> dataArr) {
        int result = ERROR;
        if (!StringUtils.hasText(sheetName)) sheetName = "2";
        try {
            File f = new File(file);
            WritableWorkbook book = Workbook.createWorkbook(new File(f.getPath()));
            if (sheetName == null || "".equals(sheetName)) {
                sheetName = "第一页";
            }
            // 生成名为sheetName的工作表，参数0表示这是第一页
            WritableSheet sheet = book.createSheet(sheetName,0);
            // 在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
            // 以及单元格内容为test
            for (int i = 0;i < dataArr.size();i++) {
                for (int j = 0;j < dataArr.get(i).size();j++) {
                    Label label = new Label(j,i,dataArr.get(i).get(j));
                    sheet.addCell(label);// 将定义好的单元格添加到工作表中
                }
            }
            book.write();
            book.close();
            result = SUCCESS;
        } catch (IOException e) {
            logger.error("excel文件路径错误!");
            logger.error(e.toString());
            return result;

        } catch (RowsExceededException e) {
            logger.error("创建excel时,行超过!");
            logger.error(e.toString());
            return result;

        } catch (WriteException e) {
            logger.error("创建excel时,写入错误!");
            logger.error(e.toString());
            return result;

        } catch (Exception e) {
            logger.error(e.toString());
            return result;
        }
        return result;
    }

}
