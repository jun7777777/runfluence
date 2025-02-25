package com.sist.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Bbs;
import com.sist.web.model.BbsImg;

@Repository("bbsCateDao")
public interface BbsCateDao {

	//게시물 리스트
	public List<Bbs> stylePostList(Bbs bbs);//스타일리스트
	
	//게시물 등록
	public int styleInsert (Bbs bbs);
	//게시물 첨부파일 등록
	public int styleImgInsert(BbsImg bbsImg);
	//총 게시물 수
	public long styleListCount(Bbs bbs);
	//게시물 조회
	public List<Bbs> styleSelect(Bbs bbs);
	//첨부파일 조회
	public List<BbsImg> styleImgSelect(BbsImg bbsImage);
	//게시물 삭제
	public long styleDelete(long bbsSeq);
	//게시글 첨부파일 삭제
	public int styleImgDelete(long bbsSeq);
	//게시글 수정
    public int styleUpdate(Bbs bbs);
    //style detail 상세보기
    public List<Bbs> styleView(Bbs bbs);//
    //무한 스크롤
    public List<Bbs> styleScrollSelect(Bbs style);
    //사용자의 다른게시글 
    public List<Bbs> otherStyles(Bbs bbs);
    // 작성자 이메일 조회
    public String getUserEmail(long bbsSeq);
    //게시글 조회
    public Bbs bbsSelect(Bbs bbs);
    //내게시글 조회
    public Bbs bbsSelectMy(Bbs bbs);    
}
