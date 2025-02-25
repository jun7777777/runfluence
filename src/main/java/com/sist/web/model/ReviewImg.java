package com.sist.web.model;

import java.io.Serializable;

public class ReviewImg implements Serializable 
{
	private static final long serialVersionUID = 1L;

	private long reviewImgNum;
	private long reviewSeq;
	private String userEmail;
	private String reviewImgOrgName;
	private String reviewImgName;
	private long reviewImgSize;
	private String reviewImgExt;
	private String regDate;
	
	public ReviewImg()
	{
		reviewImgNum = 0;
		reviewSeq = 0;
		userEmail = "";
		reviewImgOrgName = "";
		reviewImgName = "";
		reviewImgSize = 0;
		reviewImgExt = "";
		regDate = "";
	}

	public long getReviewImgNum() {
		return reviewImgNum;
	}

	public void setReviewImgNum(long reviewImgNum) {
		this.reviewImgNum = reviewImgNum;
	}

	public long getReviewSeq() {
		return reviewSeq;
	}

	public void setReviewSeq(long reviewSeq) {
		this.reviewSeq = reviewSeq;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getReviewImgOrgName() {
		return reviewImgOrgName;
	}

	public void setReviewImgOrgName(String reviewImgOrgName) {
		this.reviewImgOrgName = reviewImgOrgName;
	}

	public String getReviewImgName() {
		return reviewImgName;
	}

	public void setReviewImgName(String reviewImgName) {
		this.reviewImgName = reviewImgName;
	}

	public long getReviewImgSize() {
		return reviewImgSize;
	}

	public void setReviewImgSize(long reviewImgSize) {
		this.reviewImgSize = reviewImgSize;
	}

	public String getReviewImgExt() {
		return reviewImgExt;
	}

	public void setReviewImgExt(String reviewImgExt) {
		this.reviewImgExt = reviewImgExt;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}
	
}
