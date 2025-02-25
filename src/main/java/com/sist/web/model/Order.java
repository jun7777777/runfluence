package com.sist.web.model;

import java.io.Serializable;
import java.util.List;

public class Order implements Serializable {
	private static final long serialVersionUID = 1L;
	private String orderId;
	private short shippingAddrNum;
	private String userEmail;
	private String orderStatus;
	private long orderSumPrice;
	private long orderTotalPrice;
	private double orderDiscountRate;
	private int orderShippingCost;
	private String regDate;
	private String paymentType;
	private String shippingMemo;
	private String variantsOptionValueCombText;
	private String paymentAmount;
	private String paymentMethod;
	private String shippingAddrLine1;
	private String shippingAddrLine2;
	private String shippingAddrZipcode;
	private String recipientTel;
	private String recipientName;
	private String variantsOptionValueCombId;
	private String prodId;
	private short orderProdQuantity;
	private long orderProdPrice;
	private double orderProdDiscountPercent;
	private String orderProdName;
	private String isCanceled;
	private String isRefunded;
	private String isExchanged;
	private String prodMainCateId;
	
	private String searchValue;
	
	private long startRow;
	private long endRow;
	
	// 구조상 가지고 있는 객체
	private List<OrderProd> orderProdList;
	
	public Order() {
		orderId = "";
		shippingAddrNum = 0;
		userEmail = "";
		orderStatus = "";
		orderSumPrice = 0L;
		orderTotalPrice = 0L;
		orderDiscountRate = 0L;
		orderShippingCost = 0;
		regDate = "";
		paymentType = "";
		shippingMemo = "";
		variantsOptionValueCombText = "";
		paymentAmount = "";
		paymentMethod = "";
		shippingAddrLine1 = "";
		shippingAddrLine2 = "";
		shippingAddrZipcode = "";
		recipientTel = "";
		recipientName = "";
		variantsOptionValueCombId = "";
		prodId = "";
		orderProdQuantity = 0;
		orderProdPrice = 0L;
		orderProdDiscountPercent = 0.0;
		orderProdName = "";
		isCanceled = "";
		isRefunded = "";
		isExchanged = "";
		prodMainCateId = "";
		searchValue = "";
		
		startRow = 0;
		endRow = 0;
		
		orderProdList = null;
	}

	public long getStartRow() {
		return startRow;
	}

	public void setStartRow(long startRow) {
		this.startRow = startRow;
	}

	public long getEndRow() {
		return endRow;
	}

	public void setEndRow(long endRow) {
		this.endRow = endRow;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
	}

	public String getProdMainCateId() {
		return prodMainCateId;
	}

	public void setProdMainCateId(String prodMainCateId) {
		this.prodMainCateId = prodMainCateId;
	}

	public String getVariantsOptionValueCombId() {
		return variantsOptionValueCombId;
	}

	public void setVariantsOptionValueCombId(String variantsOptionValueCombId) {
		this.variantsOptionValueCombId = variantsOptionValueCombId;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public short getOrderProdQuantity() {
		return orderProdQuantity;
	}

	public void setOrderProdQuantity(short orderProdQuantity) {
		this.orderProdQuantity = orderProdQuantity;
	}

	public long getOrderProdPrice() {
		return orderProdPrice;
	}

	public void setOrderProdPrice(long orderProdPrice) {
		this.orderProdPrice = orderProdPrice;
	}

	public double getOrderProdDiscountPercent() {
		return orderProdDiscountPercent;
	}

	public void setOrderProdDiscountPercent(double orderProdDiscountPercent) {
		this.orderProdDiscountPercent = orderProdDiscountPercent;
	}

	public String getOrderProdName() {
		return orderProdName;
	}

	public void setOrderProdName(String orderProdName) {
		this.orderProdName = orderProdName;
	}

	public String getIsRefunded() {
		return isRefunded;
	}

	public void setIsRefunded(String isRefunded) {
		this.isRefunded = isRefunded;
	}

	public String getIsExchanged() {
		return isExchanged;
	}

	public void setIsExchanged(String isExchanged) {
		this.isExchanged = isExchanged;
	}

	public String getShippingAddrLine1() {
		return shippingAddrLine1;
	}

	public void setShippingAddrLine1(String shippingAddrLine1) {
		this.shippingAddrLine1 = shippingAddrLine1;
	}

	public String getShippingAddrLine2() {
		return shippingAddrLine2;
	}

	public void setShippingAddrLine2(String shippingAddrLine2) {
		this.shippingAddrLine2 = shippingAddrLine2;
	}

	public String getShippingAddrZipcode() {
		return shippingAddrZipcode;
	}

	public void setShippingAddrZipcode(String shippingAddrZipcode) {
		this.shippingAddrZipcode = shippingAddrZipcode;
	}

	public String getRecipientTel() {
		return recipientTel;
	}

	public void setRecipientTel(String recipientTel) {
		this.recipientTel = recipientTel;
	}

	public String getRecipientName() {
		return recipientName;
	}

	public void setRecipientName(String recipientName) {
		this.recipientName = recipientName;
	}

	public String getPaymentAmount() {
		return paymentAmount;
	}

	public void setPaymentAmount(String paymentAmount) {
		this.paymentAmount = paymentAmount;
	}

	public String getPaymentMethod() {
		return paymentMethod;
	}

	public void setPaymentMethod(String paymentMethod) {
		this.paymentMethod = paymentMethod;
	}

	public String getVariantsOptionValueCombText() {
		return variantsOptionValueCombText;
	}

	public void setVariantsOptionValueCombText(String variantsOptionValueCombText) {
		this.variantsOptionValueCombText = variantsOptionValueCombText;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getShippingMemo() {
		return shippingMemo;
	}

	public void setShippingMemo(String shippingMemo) {
		this.shippingMemo = shippingMemo;
	}

	public String getOrderId() {return orderId;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public short getShippingAddrNum() {return shippingAddrNum;}
	public void setShippingAddrNum(short shippingAddrNum) {this.shippingAddrNum = shippingAddrNum;}
	public String getUserEmail() {return userEmail;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	public String getOrderStatus() {return orderStatus;}
	public void setOrderStatus(String orderStatus) {this.orderStatus = orderStatus;}
	public long getOrderSumPrice() {return orderSumPrice;}
	public void setOrderSumPrice(long orderSumPrice) {this.orderSumPrice = orderSumPrice;}
	public long getOrderTotalPrice() {return orderTotalPrice;}
	public void setOrderTotalPrice(long orderTotalPrice) {this.orderTotalPrice = orderTotalPrice;}
	public double getOrderDiscountRate() {return orderDiscountRate;}
	public void setOrderDiscountRate(double orderDiscountRate) {this.orderDiscountRate = orderDiscountRate;}
	public int getOrderShippingCost() {return orderShippingCost;}
	public void setOrderShippingCost(int orderShippingCost) {this.orderShippingCost = orderShippingCost;}
	public String getRegDate() {return regDate;}
	public void setRegDate(String regDate) {this.regDate = regDate;}
	public List<OrderProd> getOrderProdList() {return orderProdList;}
	public void setOrderProdList(List<OrderProd> orderProdList) {this.orderProdList = orderProdList;}
	public String getIsCanceled() {return isCanceled;}
	public void setIsCanceled(String isCanceled) {this.isCanceled = isCanceled;}	
}