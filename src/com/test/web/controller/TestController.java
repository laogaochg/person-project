package com.test.web.controller;

import java.beans.BeanInfo;
import java.beans.IntrospectionException;
import java.beans.Introspector;
import java.beans.PropertyDescriptor;
import java.io.File;
import java.io.IOException;
import java.io.ObjectOutputStream;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.itmuch.cloud.entiey.Menu;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;

import com.test.service.LoginService;

@Controller
public class TestController {

    @Autowired
    private LoginService loginService;

    public static void main(String[] args) throws Exception {
        // File file = new File("F:\\daima\\之前项目\\mobilebank\\designSource\\bl\\account\\queryAAInvitationDetail.bl");
        File file = new File("F:\\daima\\之前项目\\mobilebank\\designSource\\common\\dataDict\\dataDict.xml");
        // BlXmlModel data = BlParseUtil.parseDataDictXml(file);
    }


    @RequestMapping("/aaa")
    public void aaa(HttpServletRequest request, HttpServletResponse response, String aa) throws IOException {
        Menu m = new Menu();
        System.out.println(aa);
        m.setMname("父菜单");
        Menu m1 = new Menu();
        m1.setMname("子菜单");
        m.getMenuList().add(m1);
        ObjectOutputStream out = new ObjectOutputStream(response.getOutputStream());
        out.writeObject(m);
    }

    @RequestMapping("/ObjectOutputStream")
    public void getUser(HttpServletRequest request, HttpServletResponse response) throws IOException {
        Menu m = new Menu();
        m.setMname("父菜单");
        Menu m1 = new Menu();
        m1.setMname("子菜单");
        m.getMenuList().add(m1);
        ObjectOutputStream out = new ObjectOutputStream(response.getOutputStream());
        out.writeObject(m);
    }

    /**
     * 打印主体类的所有set方法
     *
     * @param objName
     * @param clzz
     * @throws IntrospectionException
     */
    public static void soutSetMethod(String objName, Class<?> clzz) throws IntrospectionException {
        BeanInfo beanInfo = Introspector.getBeanInfo(clzz, Object.class);
        for (PropertyDescriptor propertyDescriptor : beanInfo.getPropertyDescriptors()) {
            String name = propertyDescriptor.getName();
            String s = name.substring(0, 1).toUpperCase() + name.substring(1);
            System.out.println(objName + ".set" + s + "(" + name + ");");
        }
    }


    @RequestMapping("test")
    @ResponseBody
    public Map<Object, Object> getLoginUser(HttpServletRequest request, String id) {
        System.out.println(88);
        loginService.test(88 + "");
        Map<Object, Object> map = new HashMap<>();
        return map;
    }

    /*
     * 采用spring提供的上传文件的方法
	 */
    @RequestMapping("/springUpload")
    @ResponseBody
    public Map<Object, Object> springUpload(HttpServletRequest request) {
        // 获取标签列表
        CommonsMultipartResolver multipartResolver = new CommonsMultipartResolver(request.getSession().getServletContext());
        // 检查form中是否有enctype="multipart/form-data"
        if (multipartResolver.isMultipart(request)) {
            // 将request变成多部分request
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 获取multiRequest 中所有的文件名
            Iterator<?> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                if (file != null) {
                    // 获取文件名
                    String filename = file.getOriginalFilename();
                    System.out.println("filename = " + filename);
                    try {
                        file.transferTo(new File("d:/test.xlsx"));
                    } catch (Exception e) {
                        e.printStackTrace();
                    }
                }
            }
        }
        Map<Object, Object> m = new HashMap<>();
        m.put("fileId", 1);
        return m;
    }

}
