package com.csair.admin.core.po.core.query;

/**
 * 会员信息查询参数封装
 * @author huangbiao 20170726
 *
 */
public class MemberInfoQueryObject extends QueryObject {
	
	private String cnName; // 中文名
	private String enName; // 英文名
	private String mobilePhone; // 手机号码
	private String email; // 邮箱

	public String getCnName() {
		return cnName;
	}

	public void setCnName(String cnName) {
		this.cnName = cnName;
	}

	public String getEnName() {
		return enName;
	}

	public void setEnName(String enName) {
		this.enName = enName;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

}
