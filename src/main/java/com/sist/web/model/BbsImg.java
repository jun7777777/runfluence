package com.sist.web.model;

import java.io.Serializable;

public class BbsImg implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private long bbsImageNum;
	private long bbsSeq;
	private String userEmail;
	private String bbsImgOrgName;
	private String bbsImgName;
	private long bbsImgSize;
	private String bbsImgExt;
	
	public BbsImg()
	{
		bbsImageNum = 0;
		bbsSeq = 0;
		userEmail = "";
		bbsImgOrgName = "";
		bbsImgName = "";
		bbsImgSize = 0;
		bbsImgExt = "";
	}

	public long getBbsImageNum() {
		return bbsImageNum;
	}

	public void setBbsImageNum(long bbsImageNum) {
		this.bbsImageNum = bbsImageNum;
	}

	public long getBbsSeq() {
		return bbsSeq;
	}

	public void setBbsSeq(long bbsSeq) {
		this.bbsSeq = bbsSeq;
	}

	public String getUserEmail() {
		return userEmail;
	}

	public void setUserEmail(String userEmail) {
		this.userEmail = userEmail;
	}

	public String getBbsImgOrgName() {
		return bbsImgOrgName;
	}

	public void setBbsImgOrgName(String bbsImgOrgName) {
		this.bbsImgOrgName = bbsImgOrgName;
	}

	public String getBbsImgName() {
		return bbsImgName;
	}

	public void setBbsImgName(String bbsImgName) {
		this.bbsImgName = bbsImgName;
	}

	public long getBbsImgSize() {
		return bbsImgSize;
	}

	public void setBbsImgSize(long bbsImgSize) {
		this.bbsImgSize = bbsImgSize;
	}

	public String getBbsImgExt() {
		return bbsImgExt;
	}

	public void setBbsImgExt(String bbsImgExt) {
		this.bbsImgExt = bbsImgExt;
	}
	
}