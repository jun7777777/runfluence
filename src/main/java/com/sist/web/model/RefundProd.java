package com.sist.web.model;

import java.io.Serializable;

public class RefundProd implements Serializable {
	private static final long serialVersionUID = 1L;
	
	// DB 값
	private String orderId;
	private String variantsOptionValueCombId;
	private String prodId;
	private short refundNum;

	// 다른 테이블과의 조인으로 생성되는 값
	private short refundProdQuantity;
	private long refundProdPrice;
	private double refundProdDiscountPercent;
	private String refundProdName;
	private String variantsOptionValueCombText;

	// DB에서 계산되어져 오는 값
	private long discountedRefundProdPrice;
	
	public RefundProd () {
		variantsOptionValueCombId = "";
		prodId = "";
		refundNum = 0;
		orderId = "";
		
		refundProdQuantity = 0;
		refundProdPrice = 0L;
		refundProdDiscountPercent = 0.0;
		refundProdName = "";
		variantsOptionValueCombText = "";
		
		discountedRefundProdPrice = 0L;
	}
	
	public String getVariantsOptionValueCombId() {return variantsOptionValueCombId;}
	public void setVariantsOptionValueCombId(String variantsOptionValueCombId) {this.variantsOptionValueCombId = variantsOptionValueCombId;}
	public String getProdId() {return prodId;}
	public void setProdId(String prodId) {this.prodId = prodId;}
	public String getOrderId() {return orderId;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public short getRefundNum() {return refundNum;}
	public void setRefundNum(short refundNum) {this.refundNum = refundNum;}
	public short getRefundProdQuantity() {return refundProdQuantity;}
	public void setRefundProdQuantity(short refundProdQuantity) {this.refundProdQuantity = refundProdQuantity;}
	public long getRefundProdPrice() {return refundProdPrice;}
	public void setRefundProdPrice(long refundProdPrice) {this.refundProdPrice = refundProdPrice;}
	public double getRefundProdDiscountPercent() {return refundProdDiscountPercent;}
	public void setRefundProdDiscountPercent(double refundProdDiscountPercent) {this.refundProdDiscountPercent = refundProdDiscountPercent;}
	public String getRefundProdName() {return refundProdName;}
	public void setRefundProdName(String refundProdName) {this.refundProdName = refundProdName;}
	public long getDiscountedRefundProdPrice() {return discountedRefundProdPrice;}
	public void setDiscountedRefundProdPrice(long discountedRefundProdPrice) {this.discountedRefundProdPrice = discountedRefundProdPrice;}
	public String getVariantsOptionValueCombText() {return variantsOptionValueCombText;}
	public void setVariantsOptionValueCombText(String variantsOptionValueCombText) {this.variantsOptionValueCombText = variantsOptionValueCombText;}
}