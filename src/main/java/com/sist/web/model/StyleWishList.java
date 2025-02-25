package com.sist.web.model;

import java.io.Serializable;

public class StyleWishList implements Serializable 
{
	private static final long serialVersionUID = 1L;
	
	private long bbsSeq;
	private String regDate;
	private String userEmail;
	private String userName;
	private String bbsImgName;
	private String bbsTitle;
	
	public StyleWishList()
	{
		bbsSeq = 0;
		userEmail = "";
		regDate = "";
		userName = "";
		bbsImgName = "";
		bbsTitle = "";
	}

	public String getBbsImgName() {
		return bbsImgName;
	}

	public void setBbsImgName(String bbsImgName) {
		this.bbsImgName = bbsImgName;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(long bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
	
}
