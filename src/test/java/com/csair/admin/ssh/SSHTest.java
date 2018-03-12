package com.csair.admin.ssh;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import org.apache.commons.lang3.StringUtils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/12 14:44
 */
public class SSHTest {

    public static void main(String[] args) throws Exception {
        SSHDto sshDto = new SSHDto("10.101.173.149", 22, "tomcat", "tomcat+123");
        String s = sshDto.executeCommand("cd /usr/local/tomcat/apache-tomcat-8.0.50/conf");
        System.out.println(s);
        String s1 = sshDto.executeCommand("cat web.xml");
        System.out.println(s1);
//        queryLog(channelExec,"tail -50f /usr/local/tomcat/apache-tomcat-8.0.50/logs/catalina.out");
    }





    public static void queryLog(SSHDto sshDto,String command) throws JSchException {
        ChannelExec openChannel = sshDto.getOpenChannel();
        Session sshSession = sshDto.getSession();
        openChannel.setCommand(command);
        openChannel.setErrStream(System.err);
        try {
            openChannel.connect();
            InputStream in = openChannel.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            String buf;
            while (((buf = reader.readLine()) != null)) {
                String temp = new String(buf.getBytes("gbk"), "UTF-8");
                //添加内容
                if (StringUtils.isNotBlank(temp)) {
                    System.out.println(temp);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        closeExec(openChannel);
        closeSession(sshSession);
    }

    private static void closeSession(Session session) {
        if ((session != null) && (session.isConnected()))
            session.disconnect();
    }

    private static void closeExec(ChannelExec openChannel) {
        if ((openChannel != null) && (openChannel.isConnected()))
            openChannel.disconnect();
    }
}
