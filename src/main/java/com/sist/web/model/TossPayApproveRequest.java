package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class TossPayApproveRequest implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String paymentKey;
	private long amount;
	private String orderId;

	public long getAmount() {return amount;}
	public String getOrderId() {return orderId;}
	public String getPaymentKey() {return paymentKey;}
	public void setPaymentKey(String paymentKey) {this.paymentKey = paymentKey;}
	public void setAmount(long amount) {this.amount = amount;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	
	public TossPayApproveRequest() {
		paymentKey = "";
		orderId = "";
		amount = 0L;
	}
	
	@Override
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}