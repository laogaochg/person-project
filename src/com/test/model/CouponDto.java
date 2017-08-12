package com.test.model;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * laogaochg
 * 2017/8/9.
 * 满减优惠卷
 */
public class CouponDto {

    private Long id;
    private String meetPrvice;//要求满足的金额
    private String couponAmount;//优惠的金额
    private String couponName;//名字
    private String couponId;//优惠券id
    private Long shopId;//店铺的id
    /**
     * 优惠券状态 0-未开始 1-已开始 2-已结束 3-已中止 4-待送审 5-待审核 6- 审核驳回
     */
    private Integer state;
    /**
     * 已领取数量
     */
    private Integer receivedNumber;
    /**
     * 可领取状态：1:可领取 2：已领完  3：已领过
     */
    private String receiveState;
    /**
     * 店铺名字
     */
    private String shopName;

    /**
     * 优惠券使用范围(1:平台通用类,2:店铺通用类,3:品类通用类,4:SKU使用类)
     * 2:店铺通用；4指定部分商品
     */
    private Integer couponUsingRange;

    /**
     * 优惠券使用范围id,根据优惠券类型不同，此字段含义不同，
     * 全平台优惠券：没有记录，店铺优惠券：存店铺ID，类目优惠券：类目id，sku优惠券：skuId
     * 优惠券使用范围(1:平台通用类,2:店铺通用类,3:品类通用类,4:SKU使用类)
     */
    private List<Long> itemIds = new ArrayList<>(0);

    /**
     * 优惠券使用开始时间
     */
    private Date couponStartTime;
    /**
     * 优惠券使用结束时间
     */
    private Date couponEndTime;

    public String getMeetPrvice() {
        return meetPrvice;
    }

    public void setMeetPrvice(String meetPrvice) {
        this.meetPrvice = meetPrvice;
    }

    public String getCouponAmount() {
        return couponAmount;
    }

    public void setCouponAmount(String couponAmount) {
        this.couponAmount = couponAmount;
    }

    public String getCouponName() {
        return couponName;
    }

    public void setCouponName(String couponName) {
        this.couponName = couponName;
    }

    public String getCouponId() {
        return couponId;
    }

    public void setCouponId(String couponId) {
        this.couponId = couponId;
    }

    public Integer getState() {
        return state;
    }

    public void setState(Integer state) {
        this.state = state;
    }

    public Integer getReceivedNumber() {
        return receivedNumber;
    }

    public void setReceivedNumber(Integer receivedNumber) {
        this.receivedNumber = receivedNumber;
    }

    public String getReceiveState() {
        return receiveState;
    }

    public void setReceiveState(String receiveState) {
        this.receiveState = receiveState;
    }

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    public Long getShopId() {
        return shopId;
    }

    public void setShopId(Long shopId) {
        this.shopId = shopId;
    }

    public String getShopName() {
        return shopName;
    }

    public void setShopName(String shopName) {
        this.shopName = shopName;
    }

    public Integer getCouponUsingRange() {
        return couponUsingRange;
    }

    public void setCouponUsingRange(Integer couponUsingRange) {
        this.couponUsingRange = couponUsingRange;
    }

    public List<Long> getItemIds() {
        return itemIds;
    }

    public void setItemIds(List<Long> itemIds) {
        this.itemIds = itemIds;
    }

    public Date getCouponStartTime() {
        return couponStartTime;
    }

    public void setCouponStartTime(Date couponStartTime) {
        this.couponStartTime = couponStartTime;
    }

    public Date getCouponEndTime() {
        return couponEndTime;
    }

    public void setCouponEndTime(Date couponEndTime) {
        this.couponEndTime = couponEndTime;
    }
}
