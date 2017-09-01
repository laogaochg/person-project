package com.csair.admin.po.order;

import java.io.Serializable;
import java.math.BigDecimal;
import java.util.Date;

import com.csair.admin.po.QueryObject;



public class OrderEntity extends QueryObject implements Serializable {
    /**
     * 订单id
     */
    private Integer orderId;

    /**
     * 订单编号
     */
    private String orderNo;

    /**
     * 用户id
     */
    private Integer userId;

    /**
     * 店铺id
     */
    private Integer shopId;

    /**
     * 用户支付方式ID,当为0时表示货到付款
     */
    private Integer payType;

    /**
     * 配送方式
     */
    private Integer distribution;

    /**
     * 订单状态 1生成订单,2支付订单,3取消订单(客户触发),4作废订单(管理员触发),5完成订单,6退款(订单完成后),7部分退款(订单完成后)
     */
    private Integer status;

    /**
     * 支付状态 0：未支付; 1：已支付;
     */
    private Integer payStatus;

    /**
     * 配送状态 0：未发送,1：已发送,2：部分发送
     */
    private Integer distributionStatus;

    /**
     * 收货人
     */
    private String receiver;

    /**
     * 邮政编码
     */
    private String receivePostcode;

    /**
     * 收货人固定电话
     */
    private String receiveTelephone;

    /**
     * 收货人手机号码
     */
    private String receiveMobile;

    /**
     * 国家id
     */
    private Integer countryId;

    /**
     * 省id
     */
    private Integer provinceId;

    /**
     * 城市id
     */
    private Integer cityId;

    /**
     * 区县id
     */
    private Integer districtId;

    /**
     * 收货详细地址
     */
    private String receiveAddr;

    /**
     * 应付商品订单总额
     */
    private BigDecimal payableAmount;

    /**
     * 实付商品订单总额
     */
    private BigDecimal realAmount;

    /**
     * 应付总运费
     */
    private BigDecimal payableFreight;

    /**
     * 实际支付总运费
     */
    private BigDecimal realFreight;

    /**
     * 支付时间
     */
    private Date payTime;

    /**
     * 发货时间
     */
    private Date sendTime;

    /**
     * 下单时间
     */
    private Date addTime;

    /**
     * 订单完成时间
     */
    private Date completeTime;

    /**
     * 发票：0不索要1索要
     */
    private Integer invoice;

    /**
     * 是否删除1为删除
     */
    private Integer isDel;

    /**
     * 保价
     */
    private BigDecimal insured;

    /**
     * 发票抬头
     */
    private String invoiceTitle;

    /**
     * 发票税费
     */
    private BigDecimal tex;

    /**
     * 促销优惠金额
     */
    private BigDecimal promotions;

    /**
     * 折扣
     */
    private Long discount;

    /**
     * 订单总额
     */
    private BigDecimal orderAmount;

    /**
     * 支付平台交易号
     */
    private String tradeNo;

    /**
     * 自提点id
     */
    private Integer takeself;

    /**
     * 自提方式的验证码
     */
    private String checkcode;

    /**
     * 促销活动id
     */
    private Integer activeId;

    /**
     * 是否给商家结算货款 0:未结算 1:已结算
     */
    private Boolean isCheckout;

    //扩展属性
    private String userName;// 用户名*
    private String shopName;// 店铺名*
    private Integer orderType;//订单类型*1.普通商品、2.跨境购、3.机上免税品、4.线下自提、5里程兑换',
    private Date beginTime;//搜索起始时间
    private Date endTime;//搜索结束时间
    private Integer orderStatus;//用于替换关键字status*，1新订单，2取消订单，3作废订单，4完成订单，5退款订单，6部分退款订单
    
    
    public Date getBeginTime() {
		return beginTime;
	}

	public void setBeginTime(Date beginTime) {
		this.beginTime = beginTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}

	public Integer getOrderStatus() {
		return orderStatus;
	}

	public void setOrderStatus(Integer orderStatus) {
		this.orderStatus = orderStatus;
	}

	public Date getSearchBeginTime() {
		return beginTime;
	}

	public void setSearchBeginTime(Date searchBeginTime) {
		this.beginTime = searchBeginTime;
	}

	public Date getSearchEmdTime() {
		return endTime;
	}

	public void setSearchEmdTime(Date searchEmdTime) {
		this.endTime = searchEmdTime;
	}

	public Integer getOrderType() {
		return orderType;
	}

	public void setOrderType(Integer orderType) {
		this.orderType = orderType;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getShopName() {
		return shopName;
	}

	public void setShopName(String shopName) {
		this.shopName = shopName;
	}

	private static final long serialVersionUID = 1L;

    public Integer getOrderId() {
        return orderId;
    }

    public void setOrderId(Integer orderId) {
        this.orderId = orderId;
    }

    public String getOrderNo() {
        return orderNo;
    }

    public void setOrderNo(String orderNo) {
        this.orderNo = orderNo == null ? null : orderNo.trim();
    }



    public Integer getShopId() {
        return shopId;
    }

    public void setShopId(Integer shopId) {
        this.shopId = shopId;
    }

    public Integer getPayType() {
        return payType;
    }

    public void setPayType(Integer payType) {
        this.payType = payType;
    }

    public Integer getDistribution() {
        return distribution;
    }

    public void setDistribution(Integer distribution) {
        this.distribution = distribution;
    }

    public Integer getStatus() {
        return status;
    }

    public void setStatus(Integer status) {
        this.status = status;
    }

    public Integer getPayStatus() {
        return payStatus;
    }

    public void setPayStatus(Integer payStatus) {
        this.payStatus = payStatus;
    }

    public Integer getDistributionStatus() {
        return distributionStatus;
    }

    public void setDistributionStatus(Integer distributionStatus) {
        this.distributionStatus = distributionStatus;
    }

    public String getReceiver() {
        return receiver;
    }

    public void setReceiver(String receiver) {
        this.receiver = receiver == null ? null : receiver.trim();
    }

    public String getReceivePostcode() {
        return receivePostcode;
    }

    public void setReceivePostcode(String receivePostcode) {
        this.receivePostcode = receivePostcode == null ? null : receivePostcode.trim();
    }

    public String getReceiveTelephone() {
        return receiveTelephone;
    }

    public void setReceiveTelephone(String receiveTelephone) {
        this.receiveTelephone = receiveTelephone == null ? null : receiveTelephone.trim();
    }

    public String getReceiveMobile() {
        return receiveMobile;
    }

    public void setReceiveMobile(String receiveMobile) {
        this.receiveMobile = receiveMobile == null ? null : receiveMobile.trim();
    }

    public Integer getCountryId() {
        return countryId;
    }

    public void setCountryId(Integer countryId) {
        this.countryId = countryId;
    }

    public Integer getProvinceId() {
        return provinceId;
    }

    public void setProvinceId(Integer provinceId) {
        this.provinceId = provinceId;
    }

    public Integer getCityId() {
        return cityId;
    }

    public void setCityId(Integer cityId) {
        this.cityId = cityId;
    }

    public Integer getDistrictId() {
        return districtId;
    }

    public void setDistrictId(Integer districtId) {
        this.districtId = districtId;
    }

    public String getReceiveAddr() {
        return receiveAddr;
    }

    public void setReceiveAddr(String receiveAddr) {
        this.receiveAddr = receiveAddr == null ? null : receiveAddr.trim();
    }

    public BigDecimal getPayableAmount() {
        return payableAmount;
    }

    public void setPayableAmount(BigDecimal payableAmount) {
        this.payableAmount = payableAmount;
    }

    public BigDecimal getRealAmount() {
        return realAmount;
    }

    public void setRealAmount(BigDecimal realAmount) {
        this.realAmount = realAmount;
    }

    public BigDecimal getPayableFreight() {
        return payableFreight;
    }

    public void setPayableFreight(BigDecimal payableFreight) {
        this.payableFreight = payableFreight;
    }

    public BigDecimal getRealFreight() {
        return realFreight;
    }

    public void setRealFreight(BigDecimal realFreight) {
        this.realFreight = realFreight;
    }

    public Date getPayTime() {
        return payTime;
    }

    public void setPayTime(Date payTime) {
        this.payTime = payTime;
    }

    public Date getSendTime() {
        return sendTime;
    }

    public void setSendTime(Date sendTime) {
        this.sendTime = sendTime;
    }

    public Date getAddTime() {
        return addTime;
    }

    public void setAddTime(Date addTime) {
        this.addTime = addTime;
    }

    public Date getCompleteTime() {
        return completeTime;
    }

    public void setCompleteTime(Date completeTime) {
        this.completeTime = completeTime;
    }

    public Integer getInvoice() {
        return invoice;
    }

    public void setInvoice(Integer invoice) {
        this.invoice = invoice;
    }

    public Integer getIsDel() {
        return isDel;
    }

    public void setIsDel(Integer isDel) {
        this.isDel = isDel;
    }

    public BigDecimal getInsured() {
        return insured;
    }

    public void setInsured(BigDecimal insured) {
        this.insured = insured;
    }

    public String getInvoiceTitle() {
        return invoiceTitle;
    }

    public void setInvoiceTitle(String invoiceTitle) {
        this.invoiceTitle = invoiceTitle == null ? null : invoiceTitle.trim();
    }

    public BigDecimal getTex() {
        return tex;
    }

    public void setTex(BigDecimal tex) {
        this.tex = tex;
    }

    public BigDecimal getPromotions() {
        return promotions;
    }

    public void setPromotions(BigDecimal promotions) {
        this.promotions = promotions;
    }

    public Long getDiscount() {
        return discount;
    }

    public void setDiscount(Long discount) {
        this.discount = discount;
    }

    public BigDecimal getOrderAmount() {
        return orderAmount;
    }

    public void setOrderAmount(BigDecimal orderAmount) {
        this.orderAmount = orderAmount;
    }

    public String getTradeNo() {
        return tradeNo;
    }

    public void setTradeNo(String tradeNo) {
        this.tradeNo = tradeNo == null ? null : tradeNo.trim();
    }

    public Integer getTakeself() {
        return takeself;
    }

    public void setTakeself(Integer takeself) {
        this.takeself = takeself;
    }

    public String getCheckcode() {
        return checkcode;
    }

    public void setCheckcode(String checkcode) {
        this.checkcode = checkcode == null ? null : checkcode.trim();
    }

    public Integer getActiveId() {
        return activeId;
    }

    public void setActiveId(Integer activeId) {
        this.activeId = activeId;
    }

    public Boolean getIsCheckout() {
        return isCheckout;
    }

    public void setIsCheckout(Boolean isCheckout) {
        this.isCheckout = isCheckout;
    }

    @Override
    public String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(getClass().getSimpleName());
        sb.append(" [");
        sb.append("Hash = ").append(hashCode());
        sb.append(", orderId=").append(orderId);
        sb.append(", orderNo=").append(orderNo);
        sb.append(", userId=").append(userId);
        sb.append(", shopId=").append(shopId);
        sb.append(", payType=").append(payType);
        sb.append(", distribution=").append(distribution);
        sb.append(", status=").append(status);
        sb.append(", payStatus=").append(payStatus);
        sb.append(", distributionStatus=").append(distributionStatus);
        sb.append(", receiver=").append(receiver);
        sb.append(", receivePostcode=").append(receivePostcode);
        sb.append(", receiveTelephone=").append(receiveTelephone);
        sb.append(", receiveMobile=").append(receiveMobile);
        sb.append(", countryId=").append(countryId);
        sb.append(", provinceId=").append(provinceId);
        sb.append(", cityId=").append(cityId);
        sb.append(", districtId=").append(districtId);
        sb.append(", receiveAddr=").append(receiveAddr);
        sb.append(", payableAmount=").append(payableAmount);
        sb.append(", realAmount=").append(realAmount);
        sb.append(", payableFreight=").append(payableFreight);
        sb.append(", realFreight=").append(realFreight);
        sb.append(", payTime=").append(payTime);
        sb.append(", sendTime=").append(sendTime);
        sb.append(", addTime=").append(addTime);
        sb.append(", completeTime=").append(completeTime);
        sb.append(", invoice=").append(invoice);
        sb.append(", isDel=").append(isDel);
        sb.append(", insured=").append(insured);
        sb.append(", invoiceTitle=").append(invoiceTitle);
        sb.append(", tex=").append(tex);
        sb.append(", promotions=").append(promotions);
        sb.append(", discount=").append(discount);
        sb.append(", orderAmount=").append(orderAmount);
        sb.append(", tradeNo=").append(tradeNo);
        sb.append(", takeself=").append(takeself);
        sb.append(", checkcode=").append(checkcode);
        sb.append(", activeId=").append(activeId);
        sb.append(", isCheckout=").append(isCheckout);
        sb.append(", serialVersionUID=").append(serialVersionUID);
        sb.append("]");
        return sb.toString();
    }
}