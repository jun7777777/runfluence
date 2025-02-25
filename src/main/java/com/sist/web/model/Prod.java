package com.sist.web.model;

import java.io.Serializable;

public class Prod implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String prodId;					//제품 아이디
    private String prodSubCateCombinedId;	//제품 하위 카테고리 결합 아이디
    private String prodName;				//제품 이름
    private int prodPrice;					//제품 가격
    private int prodDiscountPercent;		//제품 할인율
    private String prodInfo;				//제품 상세설명
    private String prodStatus;				//제품 상태
    private String regDate;					//제품 등록일
    
    private String searchValue;
    private String cateId;					//메인 카테고리 아이디 OU, TP, BT, AC, SH
    
    private String gender;
    private String brand;
    private String material;
    
    private long priceStartRow;
    private long priceEndRow;
    
    private String array;
    
    private String heart;
    private String userEmail;
    private String prodMainCateId;
    
    private long startRow;
    private long endRow;
    
    public Prod() 
    {
    	prodId = "";
    	prodSubCateCombinedId = "";
    	prodName = "";
    	prodPrice = 0;
    	prodDiscountPercent = 0;
    	prodInfo = "";
    	prodStatus = "";
    	regDate = "";
    	
    	searchValue = "";
    	cateId = "";
    	
    	gender = "";
    	brand = "";
    	material = "";
    	
    	priceStartRow = 0;
    	priceEndRow = 0;
    	
    	array = "";
    	
    	heart = "";
    	userEmail = "";
    	prodMainCateId = "";
    	
    	startRow = 0;
    	endRow = 0;
    }

	public String getProdMainCateId() {
		return prodMainCateId;
	}

	public void setProdMainCateId(String prodMainCateId) {
		this.prodMainCateId = prodMainCateId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getArray() {
		return array;
	}

	public void setArray(String array) {
		this.array = array;
	}

	public long getPriceStartRow() {
		return priceStartRow;
	}

	public void setPriceStartRow(long priceStartRow) {
		this.priceStartRow = priceStartRow;
	}

	public long getPriceEndRow() {
		return priceEndRow;
	}

	public void setPriceEndRow(long priceEndRow) {
		this.priceEndRow = priceEndRow;
	}

	public String getMaterial() {
		return material;
	}

	public void setMaterial(String material) {
		this.material = material;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getBrand() {
		return brand;
	}

	public void setBrand(String brand) {
		this.brand = brand;
	}

	public String getCateId() {
		return cateId;
	}

	public void setCateId(String cateId) {
		this.cateId = cateId;
	}

	public String getSearchValue() {
		return searchValue;
	}

	public void setSearchValue(String searchValue) {
		this.searchValue = searchValue;
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
	
	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getProdSubCateCombinedId() {
		return prodSubCateCombinedId;
	}

	public void setProdSubCateCombinedId(String prodSubCateCombinedId) {
		this.prodSubCateCombinedId = prodSubCateCombinedId;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public int getProdDiscountPercent() {
		return prodDiscountPercent;
	}

	public void setProdDiscountPercent(int prodDiscountPercent) {
		this.prodDiscountPercent = prodDiscountPercent;
	}

	public String getProdInfo() {
		return prodInfo;
	}

	public void setProdInfo(String prodInfo) {
		this.prodInfo = prodInfo;
	}

	public String getProdStatus() {
		return prodStatus;
	}

	public void setProdStatus(String prodStatus) {
		this.prodStatus = prodStatus;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
}
