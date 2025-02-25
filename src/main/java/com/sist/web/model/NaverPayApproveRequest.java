package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class NaverPayApproveRequest implements Serializable {
    private static final long serialVersionUID = 1L;

    private String paymentId;

    public NaverPayApproveRequest() {
        paymentId = "";
    }

    public String getPaymentId() { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }
    
	@Override
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}