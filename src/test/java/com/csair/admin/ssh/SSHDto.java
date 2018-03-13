package com.csair.admin.ssh;

import com.jcraft.jsch.Channel;
import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.util.Properties;

/**
 * @Author: LaoGaoChuang
 * @Date : 2018/3/12 14:58
 */
public class SSHDto {
    private Session session;
    private Channel channel;

    public SSHDto(String host, String username, String password) throws JSchException {
        JSch jsch = new JSch();
        jsch.getSession(username, host, 22);
        session = jsch.getSession(username, host, 22);
        session.setPassword(password);
        Properties sshConfig = new Properties();
        sshConfig.put("StrictHostKeyChecking", "no");
        session.setConfig(sshConfig);
        session.connect();
    }

    public void uploadFile(String cd, String fileName, InputStream src) throws Exception {
        ChannelSftp sftp = (ChannelSftp) this.openChannel("sftp");
        sftp.connect();
        sftp.cd(cd);
        sftp.put(src, fileName);
        this.closeChannel();
    }

    public Channel openChannel(String type) throws JSchException {
        Channel channel = session.openChannel(type);
        this.channel = channel;
        return channel;
    }


    public void closeSession() {
        if ((session != null) && (session.isConnected()))
            session.disconnect();
    }

    public void closeChannel() {
        if ((channel != null) && (channel.isConnected()))
            channel.disconnect();
    }
}
