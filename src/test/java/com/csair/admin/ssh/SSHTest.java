package com.csair.admin.ssh;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.ChannelShell;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import org.apache.commons.lang3.StringUtils;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.util.ArrayList;
import java.util.List;
import java.util.Properties;
import java.util.concurrent.ConcurrentLinkedQueue;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/12 14:44
 */
public class SSHTest {

    public static void main(String[] args) throws Exception {
        //8f,是为了避免判断tomcat启动完成代码的日志出现重复
        List<String> commands = new ArrayList<>();
        //等服务器时间可以用命令sleep 5 睡5秒
        commands.add("/home/mysql/apache-tomcat-7.0.79/bin/shutdown.sh");
        commands.add("sleep 3");
        commands.add("/home/mysql/apache-tomcat-7.0.79/bin/startup.sh");
        commands.add("tail -8f /home/mysql/apache-tomcat-7.0.79/logs/catalina.out");
        SSHDto sshDto = new SSHDto("192.168.204.128", 22, "mysql", "mysql");
        startTomcat(commands,sshDto);
    }

    public static void startTomcat(List<String> commands,SSHDto sshDto) throws Exception {
        ChannelShell channel = sshDto.getOpenChannel("");
        channel.connect();
        InputStream inputStream = channel.getInputStream();
        OutputStream outputStream = channel.getOutputStream();
        for (String command : commands) {
            outputStream.write((command + " \n\r").getBytes());
        }
        outputStream.flush();
        BufferedReader in = new BufferedReader(new InputStreamReader(inputStream));
        String msg;
        while ((msg = in.readLine()) != null) {
            System.out.println(msg);
            checkEnd(msg);
        }
        in.close();
    }

    private static int canExit = 0;

    private static void checkEnd(String msg) {
        String s0 = "Starting ProtocolHandler [\"http-bio";
        String s1 = "Starting ProtocolHandler [\"ajp-bio";
        String s2 = "Server startup in ";
        if (msg.contains(s0)) canExit++;
        if (msg.contains(s1)) canExit++;
        if (msg.contains(s2)) canExit++;
        if (canExit == 3) {
            System.out.println("程序判断tomcat成功启动，退出系统");
            System.exit(1);
        }
    }


}
