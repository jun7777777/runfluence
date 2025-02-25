package com.sist.web.model;

import java.io.Serializable;

public class ShippingAddr implements Serializable {
	private static final long serialVersionUID = 1L;
	private String userEmail;
	private short shippingAddrNum;
	private String shippingAddrLine1;
	private String shippingAddrLine2;
	private String shippingAddrZipcode;
	private String recipientTel;
	private String recipientName;
	private String isDefault;
	private String shippingAddrStatus;
	
	public ShippingAddr() {
		userEmail = "";
		shippingAddrNum = 0;
		shippingAddrLine1 = "";
		shippingAddrLine2 = "";
		shippingAddrZipcode = "";
		recipientTel = "";
		recipientName = "";
		isDefault = "N";
		shippingAddrStatus = "";
	}
	
	public String getUserEmail() {return userEmail;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	public short getShippingAddrNum() {return shippingAddrNum;}
	public void setShippingAddrNum(short shippingAddrNum) {this.shippingAddrNum = shippingAddrNum;}
	public String getShippingAddrLine1() {return shippingAddrLine1;}
	public void setShippingAddrLine1(String shippingAddrLine1) {this.shippingAddrLine1 = shippingAddrLine1;}
	public String getShippingAddrLine2() {return shippingAddrLine2;}
	public void setShippingAddrLine2(String shippingAddrLine2) {this.shippingAddrLine2 = shippingAddrLine2;}
	
	public String getRecipientTel() {return recipientTel;}
	public void setRecipientTel(String recipientTel) {this.recipientTel = recipientTel;}
	public String getRecipientName() {return recipientName;}
	public void setRecipientName(String recipientName) {this.recipientName = recipientName;}
	public String getIsDefault() {return isDefault;}
	public void setIsDefault(String isDefault) {this.isDefault = isDefault;}
	public String getShippingAddrZipcode() {return shippingAddrZipcode;}
	public void setShippingAddrZipcode(String shippingAddrZipcode) {this.shippingAddrZipcode = shippingAddrZipcode;}
	public String getShippingAddrStatus() {return shippingAddrStatus;}
	public void setShippingAddrStatus(String shippingAddrStatus) {this.shippingAddrStatus = shippingAddrStatus;}
}