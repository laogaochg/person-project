package com.csair.admin.po;
/*
 * 配置信息类
 * */
public class MessageConfig {
	private String password;//内容
	private String userName;
	private String key;

	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getKey() {
		return key;
	}
	public void setKey(String key) {
		this.key = key;
	}
	@Override
	public String toString() {
		return "MessageConfig [passwrod=" + password + ", userName=" + userName + ", key=" + key + "]";
	}


}
