package com.csair.admin.po;
/*
 * 消息管理-短信服务实体类
 * cky
 * */
public class SmsServiceEntity {
	private String host;//host地址
	private String url; //url地址
	private String sender;//发送账号
	private String password;//用户密码
	private String port;    //子端口号
	private String webAddress;//web接口地址
	private String key;//密钥
	private String userName;//用户名
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
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
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
	public String getHost() {
		return host;
	}
	public void setHost(String host) {
		this.host = host;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getPort() {
		return port;
	}
	public void setPort(String port) {
		this.port = port;
	}
	public String getWebAddress() {
		return webAddress;
	}
	public void setWebAddress(String webAddress) {
		this.webAddress = webAddress;
	}
	@Override
	public String toString() {
		return "SmsServiceEntity [host=" + host + ", url=" + url + ", sender=" + sender + ", password=" + password
				+ ", port=" + port + ", webAddress=" + webAddress + ", key=" + key + ", userName=" + userName
				+ ", content=" + content + ", id=" + id + "]";
	}

	
	

}
