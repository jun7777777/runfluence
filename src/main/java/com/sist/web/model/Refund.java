package com.sist.web.model;

import java.io.Serializable;

public class Refund implements Serializable{
	private static final long serialVersionUID = 1L;
	
	private short refundNum;
	private String orderId;
	private String refundReason;
	private long refundAmount;
	private String regDate;
	private String refundStatus;
	
	public Refund () {
		refundNum = 0;
		orderId = "";
		refundReason = "";
		refundAmount = 0L;
		regDate = "";
		refundStatus = "";
	}
	
	public short getRefundNum() {return refundNum;}
	public void setRefundNum(short refundNum) {this.refundNum = refundNum;}
	public String getOrderId() {return orderId;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public String getRefundReason() {return refundReason;}
	public void setRefundReason(String refundReason) {this.refundReason = refundReason;}
	public long getRefundAmount() {return refundAmount;}
	public void setRefundAmount(long refundAmount) {this.refundAmount = refundAmount;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getRefundStatus() {return refundStatus;}
	public void setRefundStatus(String refundStatus) {this.refundStatus = refundStatus;}
}