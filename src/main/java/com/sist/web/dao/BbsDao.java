package com.sist.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Bbs;
import com.sist.web.model.BbsImg;

@Repository
public interface BbsDao 
{
	public int bbsInsert(Bbs bbs);
	
	public int bbsImgInsert(BbsImg bbsImg);
	
	public List<Bbs> bbsListSelect(Bbs bbs);
	
	public long bbsListCount(Bbs bbs);
	
	public Bbs bbsSelect(long bbsSeq);
	
	public List<BbsImg> bbsImgSelect(long bbsSeq);
	
	public int bbsReadCntPlus(long bbsSeq);
	
	public int bbsDelete(long bbsSeq);
	
	public int bbsImgDelete(BbsImg bbsImg);
	
	public int bbsUpdate(Bbs bbs);
	
	//나의 게시글 리스트
	public List<Bbs> myBbsListSelect(Bbs bbs);
	
	//나의 게시글 리스트 갯수
	public long myBbsListCount(Bbs bbs);
	
	public List<Bbs> noticeListSelect(Bbs bbs);
	
	public long noticeTotalCnt(Bbs bbs);
}