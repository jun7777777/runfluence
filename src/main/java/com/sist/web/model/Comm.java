package com.sist.web.model;

import java.io.Serializable;

public class Comm implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private long commSeq;
	private long bbsSeq;
	private String commContent;
	private String regDate;
	private long commGroup;
	private long commParent;
	private int commOrder;
	private String commIndent;
	private String commStatus;
	private String userEmail;
	private String userName;
	
	private long startRow;
	private long endRow;
	
	private String searchType;
	private String searchValue;
	
	private String bbsTitle;
	private String bbsUserEmail;
	
	public Comm()
	{
		commSeq = 0;
		bbsSeq = 0;
		commContent = "";
		regDate = "";
		commGroup = 0;
		commParent = 0;
		commOrder = 0;
		commIndent = "";
		commStatus = "";
		userEmail = "";
		userName = "";
		
		startRow = 0;
		endRow = 0;
		
		searchType ="";
		searchValue = "";
		
		bbsTitle ="";
		bbsUserEmail = "";
	}
	
	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getBbsUserEmail() {
		return bbsUserEmail;
	}

	public void setBbsUserEmail(String bbsUserEmail) {
		this.bbsUserEmail = bbsUserEmail;
	}

	public String getBbsTitle() {
		return bbsTitle;
	}

	public void setBbsTitle(String bbsTitle) {
		this.bbsTitle = bbsTitle;
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

	public long getCommSeq() {
		return commSeq;
	}

	public void setCommSeq(long commSeq) {
		this.commSeq = commSeq;
	}

	public long getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(long bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public String getCommContent() {
		return commContent;
	}

	public void setCommContent(String commContent) {
		this.commContent = commContent;
	}

	public String getRegDate() {
		return regDate;
	}

	public void setRegDate(String regDate) {
		this.regDate = regDate;
	}

	public long getCommGroup() {
		return commGroup;
	}

	public void setCommGroup(long commGroup) {
		this.commGroup = commGroup;
	}

	public long getCommParent() {
		return commParent;
	}

	public void setCommParent(long commParent) {
		this.commParent = commParent;
	}

	public int getCommOrder() {
		return commOrder;
	}

	public void setCommOrder(int commOrder) {
		this.commOrder = commOrder;
	}

	public String getCommIndent() {
		return commIndent;
	}

	public void setCommIndent(String commIndent) {
		this.commIndent = commIndent;
	}

	public String getCommStatus() {
		return commStatus;
	}

	public void setCommStatus(String commStatus) {
		this.commStatus = commStatus;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}
	
}