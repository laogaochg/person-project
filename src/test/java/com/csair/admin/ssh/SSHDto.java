package com.csair.admin.ssh;

import com.jcraft.jsch.ChannelExec;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;

import java.io.BufferedReader;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Properties;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/12 14:58
 */
public class SSHDto {
    private Session session;

    public SSHDto(String host, int port, String username, String password) throws JSchException {
        JSch jsch = new JSch();
        jsch.getSession(username, host, port);
        session = jsch.getSession(username, host, port);
        session.setPassword(password);
        Properties sshConfig = new Properties();
        sshConfig.put("StrictHostKeyChecking", "no");
        session.setConfig(sshConfig);
        session.connect();
    }

    public Session getSession() {
        return session;
    }

    public void setSession(Session session) {
        this.session = session;
    }

    public ChannelExec getOpenChannel() throws JSchException {
        ChannelExec result =((ChannelExec) session.openChannel("exec"));
        result.setErrStream(System.err);
        return result;
    }

    public String executeCommand(String command) throws Exception {
        ChannelExec openChannel = getOpenChannel();
        openChannel.setCommand(command);
        StringBuilder sb = new StringBuilder("");
        try {
            openChannel.connect();
            InputStream in = openChannel.getInputStream();
            BufferedReader reader = new BufferedReader(new InputStreamReader(in));
            String buf;
            while ((buf = reader.readLine()) != null) {
                String str = new String(buf.getBytes("gbk"), "UTF-8");
                sb.append(str);
            }
        } catch (JSchException e) {
            System.out.println("执行失败");
            e.printStackTrace();
            closeExec(openChannel);
            closeSession();
        }
        closeExec(openChannel);
        return sb.toString();
    }

    private void closeSession() {
        if ((session != null) && (session.isConnected()))
            session.disconnect();
    }

    private void closeExec(ChannelExec openChannel) {
        if ((openChannel != null) && (openChannel.isConnected()))
            openChannel.disconnect();
    }
}
