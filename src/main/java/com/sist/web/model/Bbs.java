package com.sist.web.model;

import java.io.Serializable;
import java.util.List;

public class Bbs implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private long bbsSeq;
	private String bbsSubCateCombinedId;
	private String bbsTitle;
	private String bbsContent;
	private String regDate;
	private String updateDate;
	private long bbsReadCnt;
	
	private String bbsStatus;
	private String userEmail;
	private String userName;
	private String searchType;
	private String searchValue;
		
	private String heart;
	private String bbsSubCateName;
	private String bbsMainCateId;
	private String bbsMainCateName;
	private String bbsImgName;
	private String wishlistChk;
	private String userProfileImg;
	
		
	private long start;
	private long end;
	
	private long startRow;
	private long endRow;
	
	private List<Bbs> bbs;
	private List<BbsImg> bbsImg;
	
	public Bbs()
	{
		
		userName="";
		bbsSeq = 0;
		bbsSubCateCombinedId = "";
		bbsTitle = "";
		bbsContent = "";
		regDate = "";
		updateDate = "";
		bbsReadCnt = 0;
		bbsStatus = "";
		userEmail = "";
		searchType = "";
		searchValue = "";
		wishlistChk ="N";
		userProfileImg = "";
		
		heart = "";
		
		bbsSubCateName= "";
		bbsMainCateId= "";
		bbsMainCateName= "";
		bbsImgName= "";
		
		start= 0;
		end = 0;
		
		startRow = 0;
		endRow = 0;
		
		bbs= null;
		bbsImg = null;
	}

	public String getUserProfileImg() {
		return userProfileImg;
	}

	public void setUserProfileImg(String userProfileImg) {
		this.userProfileImg = userProfileImg;
	}

	public List<Bbs> getBbs() {
		return bbs;
	}

	public void setBbs(List<Bbs> bbs) {
		this.bbs = bbs;
	}

	public String getWishlistChk() {
		return wishlistChk;
	}

	public void setWishlistChk(String wishlistChk) {
		this.wishlistChk = wishlistChk;
	}

	public long getStart() {
		return start;
	}

	public void setStart(long start) {
		this.start = start;
	}

	public long getEnd() {
		return end;
	}

	public void setEnd(long end) {
		this.end = end;
	}

	public String getHeart() {
		return heart;
	}

	public void setHeart(String heart) {
		this.heart = heart;
	}

	public String getBbsSubCateName() {
		return bbsSubCateName;
	}

	public void setBbsSubCateName(String bbsSubCateName) {
		this.bbsSubCateName = bbsSubCateName;
	}

	public String getBbsMainCateId() {
		return bbsMainCateId;
	}

	public void setBbsMainCateId(String bbsMainCateId) {
		this.bbsMainCateId = bbsMainCateId;
	}

	public String getBbsMainCateName() {
		return bbsMainCateName;
	}

	public void setBbsMainCateName(String bbsMainCateName) {
		this.bbsMainCateName = bbsMainCateName;
	}

	public String getBbsImgName() {
		return bbsImgName;
	}

	public void setBbsImgName(String bbsImgName) {
		this.bbsImgName = bbsImgName;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<BbsImg> getBbsImg() {
		return bbsImg;
	}

	public void setBbsImg(List<BbsImg> bbsImg) {
		this.bbsImg = bbsImg;
	}

	public String getSearchType() {
		return searchType;
	}

	public void setSearchType(String searchType) {
		this.searchType = searchType;
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

	public long getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(long bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public String getBbsSubCateCombinedId() {
		return bbsSubCateCombinedId;
	}

	public void setBbsSubCateCombinedId(String bbsSubCateCombinedId) {
		this.bbsSubCateCombinedId = bbsSubCateCombinedId;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
	}

	public String getBbsContent() {
		return bbsContent;
	}

	public void setBbsContent(String bbsContent) {
		this.bbsContent = bbsContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public String getUpdateDate() {
		return updateDate;
	}

	public void setUpdateDate(String updateDate) {
		this.updateDate = updateDate;
	}

	public long getBbsReadCnt() {
		return bbsReadCnt;
	}

	public void setBbsReadCnt(long bbsReadCnt) {
		this.bbsReadCnt = bbsReadCnt;
	}

	public String getBbsStatus() {
		return bbsStatus;
	}

	public void setBbsStatus(String bbsStatus) {
		this.bbsStatus = bbsStatus;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
}