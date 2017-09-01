package com.csair.admin.po;

import java.math.BigDecimal;
import java.util.Date;

/**
 * 后台会员信息实体
 * 
 * @author huangbiao 20170726
 *
 */
public class MemberInfo {

	private Integer id;
	private String userId; // 用户id，根据user_type判断明珠会员是明珠卡号，e行会员是e行用户编号
	private String cnName; // 中文名
	private String enName; // 英文名
	private String userType; // 登录用户类型 EM E行用户 FFPM 常客明珠会员
	private String mobilePhone; // 手机号码
	private String bandPhone; // 绑定手机号码
	private Date birthday; // 生日
	private BigDecimal userfulMileage; // 可用里程
	private String email; // 邮箱
	private String niCertNum; // 身份证号码
	private String bindEmail; // 绑定邮箱
	private String phone; // 固话

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

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

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String getMobilePhone() {
		return mobilePhone;
	}

	public void setMobilePhone(String mobilePhone) {
		this.mobilePhone = mobilePhone;
	}

	public String getBandPhone() {
		return bandPhone;
	}

	public void setBandPhone(String bandPhone) {
		this.bandPhone = bandPhone;
	}

	public Date getBirthday() {
		return birthday;
	}

	public void setBirthday(Date birthday) {
		this.birthday = birthday;
	}

	public BigDecimal getUserfulMileage() {
		return userfulMileage;
	}

	public void setUserfulMileage(BigDecimal userfulMileage) {
		this.userfulMileage = userfulMileage;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getNiCertNum() {
		return niCertNum;
	}

	public void setNiCertNum(String niCertNum) {
		this.niCertNum = niCertNum;
	}

	public String getBindEmail() {
		return bindEmail;
	}

	public void setBindEmail(String bindEmail) {
		this.bindEmail = bindEmail;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	@Override
	public String toString() {
		return "MemberInfo [id=" + id + ", userId=" + userId + ", cnName=" + cnName + ", enName=" + enName
				+ ", userType=" + userType + ", mobilePhone=" + mobilePhone + ", bandPhone=" + bandPhone + ", birthday="
				+ birthday + ", userfulMileage=" + userfulMileage + ", email=" + email + ", niCertNum=" + niCertNum
				+ ", bindEmail=" + bindEmail + ", phone=" + phone + "]";
	}

}
