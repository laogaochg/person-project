package com.test.util;

/**
 * @Author: LaoGaoChuang
 * @Date : 2017/9/18 10:07
 * 处理FTP服务器文件上传
 */

import java.io.IOException;
import java.io.InputStream;
import java.util.Calendar;
import java.util.UUID;
import org.apache.commons.net.ftp.FTPClient;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class FTPUtils {
    private Logger LOG = LoggerFactory.getLogger(FTPUtils.class);
    private FTPClient ftpClient = null;
    private String url;
    private int port = 21;
    private String username;
    private String password;

    public FTPUtils(String url, String username, String password) {
        this.url = url;
        this.username = username;
        this.password = password;
    }

    public FTPUtils(String url, int port, String username, String password) {
        this.url = url;
        this.port = port;
        this.username = username;
        this.password = password;
    }

    public String upload(String path, InputStream is, String contentType) {
        this.LOG.info("FTP上传文件开始...");
        int year = Calendar.getInstance().get(1);
        int month = Calendar.getInstance().get(2) + 1;
        int day = Calendar.getInstance().get(5);
        String dir = "/" + year + "/" + month + "/" + day + "/";
        path = path + dir;
        String remoteName = UUID.randomUUID().toString() + contentType;
        boolean isFinish = false;

        Object var10;
        try {
            this.ftpClient = new FTPClient();
            this.LOG.info("开始连接FTP服务器：" + this.url + ":" + this.port);
            this.ftpClient.connect(this.url, this.port);
            this.LOG.info("FTP服务器连接成功，开始登录FTP服务器...");
            this.ftpClient.login(this.username, this.password);
            this.LOG.info("FTP服务器登录成功，开始更改操作的目录...");
            this.changeMakeWorkingDir(path);
            this.ftpClient.setBufferSize(1024);
            this.ftpClient.setControlEncoding("GBK");
            this.ftpClient.enterLocalPassiveMode();
            this.ftpClient.setFileType(2);
            this.LOG.info("开始往FTP服务器上传文件...");
            isFinish = this.ftpClient.storeFile(new String(remoteName.getBytes("GBK"), "iso-8859-1"), is);
            if (isFinish) {
                this.LOG.info("FTP服务器文件上传成功");
                return dir + remoteName;
            }

            this.LOG.info("FTP服务器文件上传失败");
            var10 = null;
        } catch (Exception var27) {
            this.LOG.info("往FTP服务器上传文件失败：" + var27);
            Object var11 = null;
            return (String)var11;
        } finally {
            try {
                if (isFinish) {
                    is.close();
                }
            } catch (IOException var26) {
                this.LOG.error("关闭文件流出错", var26);
            }

            if (this.ftpClient.isConnected()) {
                try {
                    this.ftpClient.disconnect();
                } catch (IOException var25) {
                    this.LOG.error("关闭FTP客户端出错");
                }
            }

        }

        return (String)var10;
    }

    private void changeMakeWorkingDir(String path) throws IOException {
        String[] dirs = path.split("/");
        String[] arr$ = dirs;
        int len$ = dirs.length;

        for(int i$ = 0; i$ < len$; ++i$) {
            String dir = arr$[i$];
            dir = new String(dir.getBytes("GBK"), "iso-8859-1");
            if (dir != null && !"".equals(dir)) {
                this.ftpClient.makeDirectory(dir);
            }

            this.ftpClient.changeWorkingDirectory(dir);
        }

    }

    public String getUrl() {
        return this.url;
    }

    public int getPort() {
        return this.port;
    }
}