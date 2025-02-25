package com.sist.web.model;

import java.io.Serializable;

public class WishList implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private String prodId;
	private String userEmail;
	private String regDate;
	private String prodName;
	private String prodSubCateName;
	private String filterOptionValueName;
	private int prodPrice;
	private String prodMainCateId;
    
	
	public WishList()
	{
		prodId = "";
		userEmail = "";
		regDate = "";
		prodName = "";
		prodSubCateName = "";
		filterOptionValueName = "";
		prodPrice = 0;
		prodMainCateId = "";
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdSubCateName() {
		return prodSubCateName;
	}

	public void setProdSubCateName(String prodSubCateName) {
		this.prodSubCateName = prodSubCateName;
	}

	public String getFilterOptionValueName() {
		return filterOptionValueName;
	}

	public void setFilterOptionValueName(String filterOptionValueName) {
		this.filterOptionValueName = filterOptionValueName;
	}

	public int getProdPrice() {
		return prodPrice;
	}

	public void setProdPrice(int prodPrice) {
		this.prodPrice = prodPrice;
	}

	public String getProdMainCateId() {
		return prodMainCateId;
	}

	public void setProdMainCateId(String prodMainCateId) {
		this.prodMainCateId = prodMainCateId;
	}
	
}
