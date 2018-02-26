package com.csair.admin.util;

import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.sql.RowSet;

import jxl.write.Colour;
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
     *
     * @param inputStream
     * @return
     */
    public static List<List<String>> parseXlsFile(InputStream inputStream) {
        List<List<String>> result = new ArrayList<>();
        try {
            Workbook book = Workbook.getWorkbook(inputStream);       //0代表第一个工作表对象}
            Sheet sheet = book.getSheet(0);
            int cols = sheet.getColumns();
            int rows = sheet.getRows();
            for (int z = 0; z < rows; z++) {
                List<String> row = new ArrayList<>(rows);
                for (int c = 0; c < cols; c++) {
                    Cell cell = sheet.getCell(c, z);
                    String contents = cell.getContents();
                    if (StringUtils.hasText(contents)) {
//                        row.put(c,contents);
                        row.add(contents);
                    } else {
                        row.add("");
                    }
                }
                //如果一列都是空值的；那么代表结果
                if (row.size() == 0) return result;
                result.add(row);
            }
            return result;
        } catch (Exception e) {
            logger.warn("解析文件出错" + e.getMessage());
            throw new PlatformException(1, "解析文件出错。");
        }
    }

    /**
     * 解析xls文件 得到数据
     */
    public static List<Map<Integer, String>> parseWorkbook(InputStream inputStream) {
        List<Map<Integer, String>> result = new ArrayList<>();
        try {
            Workbook book = Workbook.getWorkbook(inputStream);       //0代表第一个工作表对象}
            Sheet sheet = book.getSheet(0);
            int cols = sheet.getColumns();
            int rows = sheet.getRows();
            for (int z = 0; z < rows; z++) {
                //0代表列数，z代表行数
                Map<Integer, String> row = new HashMap<>();
                for (int c = 0; c < cols; c++) {
                    Cell cell = sheet.getCell(c, z);
                    String contents = cell.getContents();
                    if (StringUtils.hasText(contents)) {
                        row.put(c, contents);
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
            throw new PlatformException(ParamConstants.ERROR_PARAM, "解析文件出错。");
        }
    }

    /**
     * 生成表格文件提供下载
     *
     * @param bos    输出流
     * @param titles 第一行的标题 为null不做输出
     * @param data   数据
     */

    public static WritableWorkbook getWorkbook(ByteArrayOutputStream bos, List<String> titles, List<Map<String, Object>> data) throws Exception {
        WritableWorkbook book = new WritableWorkbookImpl(bos, true, new WorkbookSettings());
        WritableSheet sheet = book.createSheet("sheet1", 0);
        //在Label对象的构造子中指名单元格位置是第一列第一行(0,0)
        WritableFont font1 = new WritableFont(WritableFont.TIMES, 14, WritableFont.BOLD);
        WritableCellFormat format1 = new WritableCellFormat(font1);
        format1.setAlignment(jxl.format.Alignment.CENTRE);//设置为居中
        Label label;
        WritableFont font2 = new WritableFont(WritableFont.createFont("楷体_GB2312"), 10, WritableFont.NO_BOLD);
        WritableCellFormat format2 = new WritableCellFormat(font2);
        format2.setAlignment(jxl.format.Alignment.CENTRE);//设置为居中
        //设置边框
        format2.setBorder(jxl.format.Border.ALL, jxl.format.BorderLineStyle.NONE);
        for (int i = 0; i < titles.size(); i++) {
            label = new Label(i, 0, titles.get(i), format2);
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
        for (int i = 0; i < data.size(); i++) {
            Map<String, Object> rowContent = data.get(i);
            for (int j = 0; j < titles.size(); j++) {
                Object o = rowContent.get(titles.get(j));
                String s = o == null ? "" : o.toString();
                label = new Label(j, i + 1, s, format2);
                sheet.addCell(label);
            }
        }
        book.write();
        book.close();
        return book;
    }

    public static void main(String[] args) throws Exception {
        List<List<String>> data = new ArrayList<>();
        List<String> row = new ArrayList<>();
        row.add("1");
        row.add("2");
        row.add("3");
        row.add("4");
        data.add(row);
        data.add(row);
        data.add(row);
        createExcel(new File("d:/a12.xls"),data);
    }
    public static void createExcel(File file,List<List<String>> data) throws Exception {
        WritableWorkbook book = Workbook.createWorkbook(file);
        // 生成名为"第一页"的工作表，参数0表示这是第一页
        WritableSheet sheet = book.createSheet("第一页", 0);
        // 设置字体为宋体,11号字,不加粗,颜色为红色
        WritableFont normalFont = new WritableFont(WritableFont.createFont("宋体"), 11, WritableFont.NO_BOLD);
        // 设置字体为宋体,11号字,不加粗,颜色为红色
        WritableFont diffFont = new WritableFont(WritableFont.createFont("宋体"), 11, WritableFont.NO_BOLD);
        diffFont.setColour(Colour.RED);

        WritableCellFormat normalFormat = new WritableCellFormat(normalFont);
        normalFormat.setAlignment(jxl.format.Alignment.CENTRE);
        normalFormat.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        WritableCellFormat diffFormat = new WritableCellFormat(diffFont);
        diffFormat.setAlignment(jxl.format.Alignment.CENTRE);
        diffFormat.setVerticalAlignment(jxl.format.VerticalAlignment.CENTRE);

        for (int i = 0; i < data.size(); i++) {
            List<String> row = data.get(i);
            for (int j = 0; j < row.size(); j++) {
                String s = row.get(j);
                Label lab1 = new Label(j, i, s);
                sheet.addCell(lab1);
            }
        }
//        Label labelA = new Label(0, 0, "第一列标题", normalFormat);
//        Label labelB = new Label(1, 0, "第二列标题", normalFormat);
//        Label labelC = new Label(2, 0, "第三列标题", normalFormat);
//        Label labelD = new Label(3, 0, "第四列标题", normalFormat);
//        for (int i = 1; i <= 10; i++) {
//            Label lab1 = new Label(0, i, "第" + i + "行第1列");
//            Label lab2 = new Label(2, i, "第" + i + "行第2列");
//            Label lab3 = new Label(3, i, "第" + i + "行第3列", diffFormat);
//            Label lab4 = new Label(4, i, "第" + i + "行第4列");
//            sheet.addCell(lab1);
//            sheet.addCell(lab2);
//            sheet.addCell(lab3);
//            sheet.addCell(lab4);
//        }
        // 将定义好的单元格添加到工作表中
//        sheet.addCell(labelA);
//        sheet.addCell(labelB);
//        sheet.addCell(labelC);
//        sheet.addCell(labelD);

        book.write();
        book.close();
        System.out.println("创建文件成功!");
    }
}
