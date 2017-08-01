package com.test.util;

import java.io.File;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.List;

import org.dom4j.Document;
import org.dom4j.DocumentHelper;
import org.dom4j.Element;
import org.dom4j.QName;
import org.dom4j.io.SAXReader;
import org.dom4j.io.XMLWriter;

import com.ifp.core.util.StringUtil;
import com.test.model.BlDataDictXml;
import com.test.model.BlXmlModel;

public class BlParseUtil {

    /**
     * 检查数据字典里面有没有这个变量
     */
    public static boolean checkParamExist(String paramName,File file) throws Exception {
        BlDataDictXml dataField = getBlDataDictXmlByFile(file);
        return dataField.checkParamExist(paramName);
    }

    /**
     * 解释数据字典
     */
    public static BlDataDictXml getBlDataDictXmlByFile(File file) throws Exception {
        BlDataDictXml data = new BlDataDictXml();
        SAXReader saxReader = new SAXReader();
        Document document = saxReader.read(file);
        // 获取根元素 bl
        Element bl = document.getRootElement();
        // 获取输入参数所有子元素
        List<Element> catalog = bl.elements("catalog");
        for (Element e : catalog) {
            //处理字段
            data.getDataField().addAll(getFields(e));
            //处理数组
            List<Element> dataLists = e.elements("dataList");
            for (Element dataList : dataLists) {
                String name = dataList.attributeValue("name");
                String desc = dataList.attributeValue("desc");
                BlDataDictXml.Field field = new BlDataDictXml.Field(1,name,desc,null);
                //数组里面的字段
                field.getDataField().addAll(getFields(dataList));
                data.getDataField().add(field);
            }
        }
        return data;
    }

    /**
     * 解柝数据字典标签
     */
    private static List<BlDataDictXml.Field> getFields(Element e) {
        List<BlDataDictXml.Field> data = new ArrayList<>();
        List<Element> dataFields = e.elements("dataField");
        for (Element dataField : dataFields) {
            String name = dataField.attributeValue("name");
            String desc = dataField.attributeValue("desc");
            String defaultValue = dataField.attributeValue("defaultValue");
            if (StringUtil.hasText(name)) {
                BlDataDictXml.Field field = new BlDataDictXml.Field(0,name,desc,defaultValue);
                data.add(field);
            }
        }
        return data;
    }

    /**
     * 解释bl文件；得到对应的数据
     */
    public static BlXmlModel parseDataDictXml(File file) throws Exception {
        BlXmlModel model = new BlXmlModel();
        SAXReader saxReader = new SAXReader();
        Document document = saxReader.read(file);
        // 获取根元素 bl
        Element bl = document.getRootElement();
        // 获取输入参数所有子元素
        List<Element> inputs = bl.element("input").elements("field");
        for (Element input : inputs) {
            String id = input.attributeValue("id");
            if (id != null) {
                BlXmlModel.Field field = new BlXmlModel.Field(id,null,null);
                model.getInput().add(field);
            }
        }
        //输出参数元素集
        List<Element> outFields = bl.element("output").elements("field");
        for (Element input : outFields) {
            String id = input.attributeValue("id");
            if (id != null) {
                BlXmlModel.Field field = new BlXmlModel.Field(id,null,null);
                model.getOut().add(field);
            }
        }
        return model;
    }

    /**
     * 给根元素添加标签
     *
     * @param xml          操作的文件
     * @param appendingXml 添加的字符标签
     */
    public static void mergeXML(File xml,String appendingXml) throws Exception {
        SAXReader reader = new SAXReader();
        Document doc = reader.read(xml);
        Document flagment = DocumentHelper.parseText(appendingXml);
        Element flagEle = flagment.getRootElement();
        flagEle.setQName(new QName(flagEle.getName(),doc.getRootElement().getNamespace()));
        if (flagEle.elements().size() > 0) {
            for (Object c : flagEle.elements()) {
                Element cel = (Element)c;
                cel.setQName(new QName(cel.getName(),flagEle.getNamespace()));
            }
        }
        doc.getRootElement().add(flagEle);
        XMLWriter writer = new XMLWriter(new FileWriter(xml));
        writer.write(doc.getRootElement());
        writer.close();
    }

    public static void main(String[] args) throws Exception {
        mergeXML(new File("F:\\daima\\myTest\\resource\\applicationContext.xml"),"<bean class=\"org.mybatis.spring.mapper.MapperScannerConfigurer\"><property name=\"basePackage\" value=\"com.test.dao\"/><property name=\"sqlSessionFactoryBeanName\" value=\"sqlSession\" /></bean>");
    }

}
