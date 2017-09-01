package com.csair.admin.po;
/*
 * 消息管理-邮箱服务实体类
 * cky
 * 
 * */
public class EmailServiceEntity {
	private String senderName;//发件人姓名
	private String senderAddress;//发件人地址
	private String serverType;//服务器类型
	private String receivePort;//接收端口
	private String receiveServer;//接收服务器
	private String senderServer;//发送服务器
	private String senderPort;//发送端口
	private String userName;//用户名称
	private String password;//用户密码
	private String key;//密钥
	private String content;//内容
	private String id;
	private String name;
	private String modify_date;
	private String creation_date;
	
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getModify_date() {
		return modify_date;
	}
	public void setModify_date(String modify_date) {
		this.modify_date = modify_date;
	}
	public String getCreation_date() {
		return creation_date;
	}
	public void setCreation_date(String creation_date) {
		this.creation_date = creation_date;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	public String getSenderAddress() {
		return senderAddress;
	}
	public void setSenderAddress(String senderAddress) {
		this.senderAddress = senderAddress;
	}
	public String getServerType() {
		return serverType;
	}
	public void setServerType(String serverType) {
		this.serverType = serverType;
	}
	public String getReceivePort() {
		return receivePort;
	}
	public void setReceivePort(String receivePort) {
		this.receivePort = receivePort;
	}
	public String getReceiveServer() {
		return receiveServer;
	}
	public void setReceiveServer(String receiveServer) {
		this.receiveServer = receiveServer;
	}
	public String getSenderServer() {
		return senderServer;
	}
	public void setSenderServer(String senderServer) {
		this.senderServer = senderServer;
	}
	public String getSenderPort() {
		return senderPort;
	}
	public void setSenderPort(String senderPort) {
		this.senderPort = senderPort;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	@Override
	public String toString() {
		return "EmailServiceEntity [senderName=" + senderName + ", senderAddress=" + senderAddress + ", serverType="
				+ serverType + ", receivePort=" + receivePort + ", receiveServer=" + receiveServer + ", senderServer="
				+ senderServer + ", senderPort=" + senderPort + ", userName=" + userName + ", password=" + password
				+ ", key=" + key + ", content=" + content + ", id=" + id + "]";
	}

	
	

}
