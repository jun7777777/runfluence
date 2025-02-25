package com.sist.web.model;

import java.io.Serializable;
import java.util.List;

public class Review implements Serializable 
{
	private static final long serialVersionUID = 1L;

	private long reviewSeq;        // 제품 리뷰 시퀀스
    private String prodId;         // 제품 아이디
    private String reviewContent;  // 제품 리뷰 내용
    private String reviewDate;       // 제품 리뷰 등록일
    private String reviewStatus;   // 제품 리뷰 상태
    private int reviewRating;   // 제품 평점
    private String reviewUpdateDate; // 제품 리뷰 수정일
    private String userEmail;      // 유저 이메일
    
    private String userName;
    
    private List<ReviewImg> reviewImg;
    
    private String userProfileImg;
    
    public Review()
    {
    	reviewSeq = 0;
    	prodId = "";
    	reviewContent = "";
    	reviewDate = "";
    	reviewStatus = "";
    	reviewRating = 0;
    	reviewUpdateDate = "";
    	userEmail = "";
    	userName = "";
    	
    	reviewImg = null;
    	
    	userProfileImg = "";
    }

    
    
	public String getUserProfileImg() {
		return userProfileImg;
	}



	public void setUserProfileImg(String userProfileImg) {
		this.userProfileImg = userProfileImg;
	}



	public List<ReviewImg> getReviewImg() {
		return reviewImg;
	}

	public void setReviewImg(List<ReviewImg> reviewImg) {
		this.reviewImg = reviewImg;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public long getReviewSeq() {
		return reviewSeq;
	}

	public void setReviewSeq(long reviewSeq) {
		this.reviewSeq = reviewSeq;
	}

	public String getProdId() {
		return prodId;
	}

	public void setProdId(String prodId) {
		this.prodId = prodId;
	}

	public String getReviewContent() {
		return reviewContent;
	}

	public void setReviewContent(String reviewContent) {
		this.reviewContent = reviewContent;
	}

	public String getReviewDate() {
		return reviewDate;
	}

	public void setReviewDate(String reviewDate) {
		this.reviewDate = reviewDate;
	}

	public String getReviewStatus() {
		return reviewStatus;
	}

	public void setReviewStatus(String reviewStatus) {
		this.reviewStatus = reviewStatus;
	}

	public int getReviewRating() {
		return reviewRating;
	}

	public void setReviewRating(int reviewRating) {
		this.reviewRating = reviewRating;
	}

	public String getReviewUpdateDate() {
		return reviewUpdateDate;
	}

	public void setReviewUpdateDate(String reviewUpdateDate) {
		this.reviewUpdateDate = reviewUpdateDate;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
    
}
