package com.sist.web.model;

import java.io.Serializable;

public class Payment implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String orderId;
	private long paymentAmount;
	private String paymentMethod;
	private String paymentStatus;
	private String regDate;
	private String paymentCode;
	
	public Payment() {
		orderId = "";
		paymentAmount = 0L;
		paymentMethod = "";
		paymentStatus = "";
		regDate = "";
		paymentCode = "";
	}
	
	public String getOrderId() {return orderId;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public String getPaymentMethod() {return paymentMethod;}
	public void setPaymentMethod(String paymentMethod) {this.paymentMethod = paymentMethod;}
	public String getPaymentStatus() {return paymentStatus;}
	public void setPaymentStatus(String paymentStatus) {this.paymentStatus = paymentStatus;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public long getPaymentAmount() {return paymentAmount;}
	public void setPaymentAmount(long paymentAmount) {this.paymentAmount = paymentAmount;}
	public String getPaymentCode() {return paymentCode;}
	public void setPaymentCode(String paymentCode) {this.paymentCode = paymentCode;}
}