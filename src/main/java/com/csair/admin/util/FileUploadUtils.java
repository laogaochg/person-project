package com.csair.admin.util;

import java.awt.*;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStream;
import java.nio.charset.Charset;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Iterator;
import java.util.UUID;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import com.csair.admin.config.core.PlatformException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.util.StreamUtils;
import org.springframework.util.StringUtils;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

/**
 * laogaochg
 * 2017/7/6.
 */
public class FileUploadUtils {
    private static Logger logger = LoggerFactory.getLogger(FileUploadUtils.class);

    public static String saveFileByMultipartFile(MultipartFile myfile) {
        InputStream inputStream = null;
        try {
            inputStream = myfile.getInputStream();
        } catch (IOException e) {
            logger.info(e.getMessage());
            throw new PlatformException(ParamConstants.PANDLE_FILE_ERROR, "处理文件出现异常");
        }
        String fileName = myfile.getOriginalFilename();
        String substring = fileName.substring(fileName.lastIndexOf("."));
        fileName = FileUploadUtils.saveFile(inputStream, substring);
        return fileName;
    }

    public static String handlerFile(HttpServletRequest request) {
        // 将当前上下文初始化给 CommonsMutipartResolver （多部分解析器）
        // 将request变成多部分request
        String realPath = request.getSession().getServletContext().getRealPath("");
        try {
            MultipartHttpServletRequest multiRequest = (MultipartHttpServletRequest) request;
            // 获取multiRequest 中所有的文件名
            Iterator<?> iter = multiRequest.getFileNames();
            while (iter.hasNext()) {
                // 一次遍历所有文件
                MultipartFile file = multiRequest.getFile(iter.next().toString());
                String fileName = file.getOriginalFilename();
                if (StringUtils.hasText(fileName)) {
                    String substring = fileName.substring(fileName.lastIndexOf("."));
                    if (file != null) {
                        InputStream inputStream = file.getInputStream();
                        fileName = FileUploadUtils.saveFile(inputStream, substring);
                        return fileName;
                    }
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
            throw new PlatformException(000011, "文件上传异常");

        }
        return "";
    }

    /**
     * 保存图片到服务器指定的目录里面
     *
     * @param inputStream 文件得到的输入流
     * @param extName     文件后缀名
     * @return 重新命名的文件名
     */
    public static String saveFile(InputStream inputStream, String extName) {
        //对图片进行按天分类
        String format = new SimpleDateFormat("yyyy-MM-dd").format(new Date());
        String fileDate = EnvironmentParams.uploadPath + "/" + format;
        File file = new File(fileDate);
        if (!file.exists()) {
            file.mkdirs();
        }
        String fileName = UUID.randomUUID().toString().replace("-", "") + extName;
        file = new File(fileDate + "/" + fileName);
        OutputStream out = null;
        try {
            out = new FileOutputStream(file);
            StreamUtils.copy(inputStream, out);
            out.close();
            inputStream.close();
        } catch (Exception e) {
            e.printStackTrace();
            throw new PlatformException(000011, "文件上传异常");
        }
        return "/" + format + "/" + fileName;
    }

    public static String reduceImg(String imgName) {
        return reduceImg(EnvironmentParams.uploadPath + imgName, 100, 100);
    }

    /**
     * 采用指定宽度、高度或压缩比例 的方式对图片进行压缩
     *
     * @param imgsrc       源图片地址
     * @param outputWidth  压缩后图片宽度（当rate==null时，必传）
     * @param outputHeight 压缩后图片高度（当rate==null时，必传）
     * @return imgdist      目标图片地址
     */
    public static String reduceImg(String imgsrc, int outputWidth, int outputHeight) {
        try {
            File srcFile = new File(imgsrc);
//            srcFile.getPath()
            if (!srcFile.exists()) return "";
            BufferedImage bi2 = ImageIO.read(srcFile); // 以上两行解决此处"Unsupported Image Type"
            int newWidth;
            int newHeight;
            // 判断是否是等比缩放
            newWidth = outputWidth; // 输出的图片宽度
            newHeight = outputHeight; // 输出的图片高度
            BufferedImage to = new BufferedImage(newWidth, newHeight, BufferedImage.TYPE_INT_RGB);
            Graphics2D g2d = to.createGraphics();
            to = g2d.getDeviceConfiguration().createCompatibleImage(newWidth, newHeight, Transparency.OPAQUE);
            g2d.dispose();
            g2d = to.createGraphics();
            Image from = bi2.getScaledInstance(newWidth, newHeight, bi2.SCALE_AREA_AVERAGING);
            g2d.drawImage(from, 0, 0, null);
            g2d.dispose();
            //目标文件名
            String fileName = ParamConstants.IMG_THUMBNAIL_PERFIX + srcFile.getName();
            //目标全路径
            String imgdist = srcFile.getParent() + "/" + fileName;
            ImageIO.write(to, "jpg", new File(imgdist));
            //返回文件的url地址
            String url = srcFile.getParent().replace(new File(EnvironmentParams.uploadPath).getPath(), "");
            return url + "/" + fileName;
        } catch (IOException e) {
            e.printStackTrace();
            logger.warn("压缩图片文件出错。" + e.getMessage());
            return "";
        }

    }

    /**
     * 获取图片宽度
     *
     * @param file 图片文件
     * @return 宽度
     */
    public static int[] getImgWidth(File file) {
        InputStream is = null;
        BufferedImage src = null;
        int result[] = {0, 0};
        try {
            is = new FileInputStream(file);
            src = javax.imageio.ImageIO.read(is);
            result[0] = src.getWidth(null); // 得到源图宽
            result[1] = src.getHeight(null); // 得到源图高
            is.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }

    public static void main(String[] args) {
        /**
         * d://3.jpg 源图片
         * d://31.jpg 目标图片
         * 压缩宽度和高度都是1000
         *
         */
        System.out.println("压缩图片开始...");
        File srcfile = new File("D:\\test/a.jpg");
        System.out.println("压缩前srcfile size:" + srcfile.length());
//        reduceImg("D:\\test/a.jpg","D:\\test/a1.jpg",150,150);
        File distfile = new File("D:\\test/a1.jpg");
        System.out.println("压缩后distfile size:" + distfile.length());

    }
}
