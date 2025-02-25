package com.sist.web.model;

import com.sist.web.util.JsonUtil;

public class TossPayCancelRequest {
	private String paymentKey;
	private String cancelReason;
	private Number cancelAmount;
	
	
	public TossPayCancelRequest() {
		paymentKey = "";
		cancelReason = "";
		cancelAmount = 0;
	}

	public String getCancelReason() {return cancelReason;}
	public void setCancelReason(String cancelReason) {this.cancelReason = cancelReason;}
	public Number getCancelAmount() {return cancelAmount;}
	public void setCancelAmount(Number cancelAmount) {this.cancelAmount = cancelAmount;}
	public String getPaymentKey() {return paymentKey;}
	public void setPaymentKey(String paymentKey) {this.paymentKey = paymentKey;}
	
	@Override 
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}