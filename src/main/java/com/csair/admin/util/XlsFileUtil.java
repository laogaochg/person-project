package com.csair.admin.util;

import java.io.ByteArrayOutputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.RowSet;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StringUtils;

import com.csair.admin.config.PlatformException;
import jxl.Cell;
import jxl.Sheet;
import jxl.Workbook;
import jxl.WorkbookSettings;
import jxl.write.Label;
import jxl.write.WritableCellFormat;
import jxl.write.WritableFont;
import jxl.write.WritableSheet;
import jxl.write.WritableWorkbook;
import jxl.write.biff.WritableWorkbookImpl;

/**
 * Created by lenovo on 2017/6/27.
 */
public class XlsFileUtil {
    private static Logger logger = LoggerFactory.getLogger(XlsFileUtil.class);

    /**
     * 解析xls文件 得到数据
     */
    public static List<Map<Integer,String>> parseWorkbook(InputStream inputStream) {
        List<Map<Integer,String>> result = new ArrayList<>();
        try {
            Workbook book = Workbook.getWorkbook(inputStream);       //0代表第一个工作表对象}
            Sheet sheet = book.getSheet(0);
            int cols = sheet.getColumns();
            int rows = sheet.getRows();
            for (int z = 0;z < rows;z++) {
                //0代表列数，z代表行数
                Map<Integer,String> row = new HashMap<>();
                for (int c = 0;c < cols;c++) {
                    Cell cell = sheet.getCell(c,z);
                    String contents = cell.getContents();
                    if (StringUtils.hasText(contents)) {
                        row.put(c,contents);
                    }
                }
                //如果一列都是空值的；那么代表结果
                if (row.size() == 0) return result;
                result.add(row);
            }
            inputStream.close();
            return result;
        } catch (Exception e) {
            logger.warn("解析文件出错" + e.getMessage());
            throw new PlatformException(ParamConstants.ERROR_PARAM,"解析文件出错。");
        }
    }

    /**
     * 生成表格文件提供下载
     *
     * @param bos    输出流
     * @param titles 第一行的标题
     * @param data   数据
     */

    public static WritableWorkbook getWorkbook(ByteArrayOutputStream bos,List<String> titles,List<Map<String,Object>> data) throws Exception {
        WritableWorkbook book = new WritableWorkbookImpl(bos,true,new WorkbookSettings());
        WritableSheet sheet = book.createSheet("sheet1",0);
        //在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
        WritableFont font1 = new WritableFont(WritableFont.TIMES,14,WritableFont.BOLD);
        WritableCellFormat format1 = new WritableCellFormat(font1);
        format1.setAlignment(jxl.format.Alignment.CENTRE);//设置为居中
        Label label;
        WritableFont font2 = new WritableFont(WritableFont.createFont("楷体_GB2312"),10,WritableFont.NO_BOLD);
        WritableCellFormat format2 = new WritableCellFormat(font2);
        format2.setAlignment(jxl.format.Alignment.CENTRE);//设置为居中
        //设置边框
        format2.setBorder(jxl.format.Border.ALL,jxl.format.BorderLineStyle.NONE);
        for (int i = 0;i < titles.size();i++) {
            label = new Label(i,0,titles.get(i),format2);
            sheet.addCell(label);

        }
         /*生成一个保存数字的单元格
        必须使用Number的完整包路径，否则有语法歧义
        单元格位置是第二列，第一行，值为789.123
        jxl.write.Number number = new jxl.write.Number(2,0,789.123);
        sheet.addCell(number); */
        RowSet rs_info = null;
        DecimalFormat df_price = new DecimalFormat("#0.0");
        int count_zs = 0;//信息提交总数
        int count_yx = 0;//信息有效数
        String format = "";
        jxl.write.Number number = null;
        for (int i = 0;i < data.size();i++) {
            Map<String,Object> rowContent = data.get(i);
            for (int j = 0;j < titles.size();j++) {
                Object o = rowContent.get(titles.get(j));
                String s = o == null ? "" : o.toString();
                label = new Label(j,i + 1,s,format2);
                sheet.addCell(label);
            }
        }
        book.write();
        book.close();
        return book;
    }
}
