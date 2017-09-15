package com.csair.admin;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileFilter;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.nio.charset.Charset;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.util.StreamUtils;

/**
 * laogaochg
 * 2017/7/1.34343434
 * 用于自动生成DAO实现类；
 */
public class CodeGenerator {

    public static void main(String[] args) throws Exception {
        String path = "D:\\F\\NH-idea\\admin1\\src\\main\\java\\com\\csair\\admin\\cms\\dao/";
        String name = "ArticleClassifyDao";
        File file = new File(path + name + ".java");
        Map<String,List<String>> ms = getMethods(file);
        //所有的方法
        List<String> d = ms.get("methods");
        //文件的字符串
        String s = todoFile(d,ms.get("imports"),file);
        File f = new File(path + "/impl/" + name + "Imple.java");
        //生成文件
        StreamUtils.copy(s,Charset.defaultCharset(),new FileOutputStream(f));
        System.out.println("完成！");
    }

    private static String todoFile(List<String> methods,List<String> imports,File file) {
        StringBuilder sb = new StringBuilder("");
        String interfaceName = file.getName().substring(0,file.getName().length() - 5);
        sb.append("package com.csair.admin.core.dao.impl;\n");
        for (String s : imports) {
            sb.append(s + "\n");
        }
        sb.append("@Repository\n");
        sb.append("public class " + interfaceName + "Imple implements " + interfaceName + " {\n");
        for (String method : methods) {
            sb.append("@Override\n");
            sb.append("public " + method + " {\n");
            //方法体
            sb.append(getMethodBody(method,file));
            sb.append("}\n");
        }
        sb.append("}\n");
        return sb.toString();
    }

    /**
     * 处理方法体
     * @param s
     * @param file
     * @return
     */
    public static String getMethodBody(String s,File file) {
        StringBuilder sb = new StringBuilder();
        //调用的url
        String interfaceName = file.getName().substring(0,file.getName().length() - 5);
        String methodName = s.split(" ")[1].substring(0,s.split(" ")[1].indexOf("("));
        sb.append(" String processUrl = EnvironmentParams.DAO_URL +\"" + interfaceName + "/\"+\"" + methodName + "\";\n");//todo
        //返回类型的写法
        String processResultType = s.split(" ")[0].trim();

        s = s.replace(")","");
        String[] split = s.split("\\(");
        if (split.length > 1) {
            String params = split[1].trim();
            String[] split1 = params.split(",");
            //如果有多个参数
//            if (split1.length > 1) {
                sb.append("Map<String,Object> dataMap = new HashMap<String,Object>(); \n");
                for (String s1 : split1) {
                    if (s1.trim().split(" ").length > 1) {
                        String paramName = s1.trim().split(" ")[1];
                        sb.append("dataMap.put(\"" + paramName + "\"," + paramName + ");\n");
                    } else {
                        System.out.println(params);
                        System.out.println("s1 = " + s1);
                    }
                }
                sb.append("String processResultString = daoUtils.process(processUrl,dataMap);\n");
//            } else {
//                String paramName = split1[0].trim().split(" ")[1];
//                sb.append("return daoUtils.process(processUrl," + paramName + "," + resultTypeS + ");\n");
//            }

        } else {
            sb.append("String processResultString =  daoUtils.process(processUrl,null);\n");
        }

        String resultTypeS;
        if (processResultType.startsWith("List")) {
            String type = processResultType.substring(processResultType.indexOf("<")+1,processResultType.indexOf(">"));
            sb.append("return JSON.parseArray(processResultString,"+type+".class);");
        }else{
            sb.append("return JSON.parseObject(processResultString,"+processResultType+".class); ");
        }


        return sb.toString();
    }

    /**
     * 得到dao文件夹的所有dao文件
     *
     * @param path
     * @return
     */
    private static File[] getFiles(String path) {
        File f = new File(path);
        return f.listFiles(new FileFilter() {
            @Override
            public boolean accept(File pathname) {
                return pathname.getName().endsWith(".java");
            }
        });
    }

    /**
     * m.put("methods",methods);
     * methods方法名集合
     * m.put("imports",imports);
     * imports所有的引用包
     */
    public static Map<String,List<String>> getMethods(File f) throws Exception {
        BufferedReader bf = new BufferedReader(new FileReader(f));
        List<String> methods = new ArrayList<String>();
        List<String> imports = new ArrayList<String>();
        while (bf.ready()) {
            String line = bf.readLine().trim();
            if (line.endsWith(";")) {
                if (!(line.startsWith("*") || line.startsWith("/"))) {
                    if (!(line.startsWith("import") || line.startsWith("package"))) {
                        methods.add(line.replace(";",""));
                    }
                }
                if (line.startsWith("import")) {
                    imports.add(line);
                }
            }
        }
        imports.add("import org.springframework.beans.factory.annotation.Autowired;\n" + "import org.springframework.stereotype.Repository;\n");
        Map<String,List<String>> m = new HashMap<String,List<String>>();
        m.put("methods",methods);
        m.put("imports",imports);
        return m;
    }

}
