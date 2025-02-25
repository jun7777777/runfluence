package com.sist.web.model;

import java.io.Serializable;

public class Cart implements Serializable {
	private static final long serialVersionUID = 1L;
	private String userEmail;
	private String prodId;
	private String variantsOptionValueCombId;
	private short cartQuantity;

	// 변형 옵션값 조합 테이블과의 조인으로 인해 발생하는 데이터
    private long variantsOptionValueCombStock;
    private String variantsOptionValueCombText;

	// 제품 테이블과의 조인으로 인해 발생하는 데이터
    private String prodName;
	private long prodPrice;
    private double prodDiscountPercent;
    private String prodStatus;
		
    // 프로그램 효율성을 위해 DB에서 계산되어 오는 데이터
    private long discountedProdPrice;
    
	public Cart() {
		userEmail = "";
		prodId = "";
		variantsOptionValueCombId = "";
		cartQuantity = 0;
	
		variantsOptionValueCombStock = 0L;
		variantsOptionValueCombText = "";
		
		prodName = "";
		prodPrice = 0L;
		prodDiscountPercent = 0.0;
		prodStatus = "I";
		
		discountedProdPrice = 0L;
	}

	public String getUserEmail() {return userEmail;}
	public void setUserEmail(String userEmail) {this.userEmail = userEmail;}
	public String getProdId() {return prodId;}
	public void setProdId(String prodId) {this.prodId = prodId;}
	public String getVariantsOptionValueCombId() {return variantsOptionValueCombId;}
	public void setVariantsOptionValueCombId(String variantsOptionValueCombId) {this.variantsOptionValueCombId = variantsOptionValueCombId;}
	public short getCartQuantity() {return cartQuantity;}
	public void setCartQuantity(short cartQuantity) {this.cartQuantity = cartQuantity;}
	public long getVariantsOptionValueCombStock() {return variantsOptionValueCombStock;}
	public void setVariantsOptionValueCombStock(long variantsOptionValueCombStock) {this.variantsOptionValueCombStock = variantsOptionValueCombStock;}
	public String getVariantsOptionValueCombText() {return variantsOptionValueCombText;}
	public void setVariantsOptionValueCombText(String variantsOptionValueCombText) {this.variantsOptionValueCombText = variantsOptionValueCombText;}
	public String getProdName() {return prodName;}
	public void setProdName(String prodName) {this.prodName = prodName;}
	public long getProdPrice() {return prodPrice;}
	public void setProdPrice(long prodPrice) {this.prodPrice = prodPrice;}
	public String getProdStatus() {return prodStatus;}
	public double getProdDiscountPercent() {return prodDiscountPercent;}
	public void setProdDiscountPercent(double prodDiscountPercent) {this.prodDiscountPercent = prodDiscountPercent;}
	public void setProdStatus(String prodStatus) {this.prodStatus = prodStatus;}
	public long getDiscountedProdPrice() {return discountedProdPrice;}
	public void setDiscountedProdPrice(long discountedProdPrice) {this.discountedProdPrice = discountedProdPrice;}
}
