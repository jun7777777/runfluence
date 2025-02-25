package com.sist.web.model;

import java.io.Serializable;

public class OrderProd implements Serializable {
	private static final long serialVersionUID = 1L;
	
	// DB 자체 데이터
	private String orderId;
	private String variantsOptionValueCombId;
	private String prodId;
	private short orderProdQuantity;
	private long orderProdPrice;
	private double orderProdDiscountPercent;
	private String orderProdName;
	private String isCanceled;
	private String isRefunded;
	private String isExchanged;

	// 다른 테이블과의 조인으로 생성되는 데이터
	private String variantsOptionValueCombText;
	
	// 프로그램 효율성을 위해 DB에서 계산되어 오는 데이터
	private long discountedOrderProdPrice;
	
	public OrderProd() {
		orderId = "";
		variantsOptionValueCombId = "";
		prodId = "";
		orderProdQuantity = 0;
		orderProdPrice = 0L;
		orderProdDiscountPercent = 0.0;
		orderProdName = "";
		isRefunded = "";
		isExchanged = "";

		variantsOptionValueCombText = "";
		
		discountedOrderProdPrice = 0L;
	}

	public String getOrderId() {return orderId;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public String getVariantsOptionValueCombId() {return variantsOptionValueCombId;}
	public void setVariantsOptionValueCombId(String variantsOptionValueCombId) {this.variantsOptionValueCombId = variantsOptionValueCombId;}
	public String getProdId() {return prodId;}
	public void setProdId(String prodId) {this.prodId = prodId;}
	public short getOrderProdQuantity() {return orderProdQuantity;}
	public void setOrderProdQuantity(short orderProdQuantity) {this.orderProdQuantity = orderProdQuantity;}
	public long getOrderProdPrice() {return orderProdPrice;}
	public void setOrderProdPrice(long orderProdPrice) {this.orderProdPrice = orderProdPrice;}
	public double getOrderProdDiscountPercent() {return orderProdDiscountPercent;}
	public void setOrderProdDiscountPercent(double orderProdDiscountPercent) {this.orderProdDiscountPercent = orderProdDiscountPercent;}
	public String getOrderProdName() {return orderProdName;}
	public void setOrderProdName(String orderProdName) {this.orderProdName = orderProdName;}
	public String getVariantsOptionValueCombText() {return variantsOptionValueCombText;}
	public void setVariantsOptionValueCombText(String variantsOptionValueCombText) {this.variantsOptionValueCombText = variantsOptionValueCombText;}
	public long getDiscountedOrderProdPrice() {return discountedOrderProdPrice;}
	public void setDiscountedOrderProdPrice(long discountedOrderProdPrice) {this.discountedOrderProdPrice = discountedOrderProdPrice;}
	public String getIsRefunded() {return isRefunded;}
	public void setIsRefunded(String isRefunded) {this.isRefunded = isRefunded;}
	public String getIsExchanged() {return isExchanged;}
	public void setIsExchanged(String isExchanged) {this.isExchanged = isExchanged;}
	public String getIsCanceled() {return isCanceled;}
	public void setIsCanceled(String isCanceled) {this.isCanceled = isCanceled;}
}