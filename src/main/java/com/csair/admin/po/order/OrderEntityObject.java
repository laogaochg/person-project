package com.csair.admin.po.order;

import java.util.Date;

import com.csair.admin.po.QueryObject;
import com.csair.admin.util.DateUtil;

public class OrderEntityObject extends QueryObject{
	private String orderNo;
	private Integer payType;
	private Integer payStatus;
	private String receiver;
	private String shopName;// 店铺名
	private Integer orderType;//订单类型
	private Date beginTime;//搜索起始时间
	private Date endTime;//搜索结束时间
	private Integer orderStatus;//用于替换关键字status
	private String export;//判断是否导出
	
	public String getExport() {
		return export;
	}
	public void setExport(String export) {
		this.export = export;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public Integer getPayType() {
		return payType;
	}
	public void setPayType(Integer payType) {
		this.payType = payType;
	}
	public Integer getPayStatus() {
		return payStatus;
	}
	public void setPayStatus(Integer payStatus) {
		this.payStatus = payStatus;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public String getShopName() {
		return shopName;
	}
	public void setShopName(String shopName) {
		this.shopName = shopName;
	}
	public Integer getOrderType() {
		return orderType;
	}
	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}
	public Date getBeginTime() {
		return beginTime;
	}
	public void setBeginTime(String beginTime) {
		//this.beginTime=beginTime;
		this.beginTime =DateUtil.getBeginTime(DateUtil.getDate(beginTime));
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		//this.endTime=endTime;
		this.endTime = DateUtil.getTodayEndTime(DateUtil.getDate(endTime));
	}
	public Integer getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}
	
	
	
}
