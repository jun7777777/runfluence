package com.sist.web.model;

import java.io.Serializable;

public class Shipping implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String orderId;
	private String regDate;
	private String compDate;
	private String shippingId;
	private String shippingStatus;
	private String shippingLine1;
	private String shippingLine2;
	private String shippingZipcode;
	private String shippingRecipientTel;
	private String shippingRecipientName;
	
	public Shipping () {
		orderId = "";
		regDate = "";
		compDate = "";
		shippingId = "";
		shippingStatus = "";
		shippingLine1 = "";
		shippingLine2 = "";
		shippingRecipientTel = "";
		shippingRecipientName = "";
		shippingZipcode = "";
	}

	public String getOrderId() {return orderId;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public String getCompDate() {return compDate;}
	public void setCompDate(String compDate) {this.compDate = compDate;}
	public String getShippingId() {return shippingId;}
	public void setShippingId(String shippingId) {this.shippingId = shippingId;}
	public String getShippingStatus() {return shippingStatus;}
	public void setShippingStatus(String shippingStatus) {this.shippingStatus = shippingStatus;}
	public String getShippingLine1() {return shippingLine1;}
	public void setShippingLine1(String shippingLine1) {this.shippingLine1 = shippingLine1;}
	public String getShippingLine2() {return shippingLine2;}
	public void setShippingLine2(String shippingLine2) {this.shippingLine2 = shippingLine2;}
	public String getShippingRecipientTel() {return shippingRecipientTel;}
	public void setShippingRecipientTel(String shippingRecipientTel) {this.shippingRecipientTel = shippingRecipientTel;}
	public String getShippingRecipientName() {return shippingRecipientName;}
	public void setShippingRecipientName(String shippingRecipientName) {this.shippingRecipientName = shippingRecipientName;}
	public String getShippingZipcode() {return shippingZipcode;}
	public void setShippingZipcode(String shippingZipcode) {this.shippingZipcode = shippingZipcode;}
}