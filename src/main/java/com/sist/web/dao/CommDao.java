package com.sist.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Comm;

@Repository
public interface CommDao {
	//댓글 등록
	 public int commInsert(Comm comm);
	 
	 //댓글 리스트
	 public List<Comm>commList(Comm comm);
	 
	 //댓글 상세 검색
	 public Comm commSelect(long commSeq);
	 
	 //댓글 삭제
	 public int commDelete(long commSeq);
	 
	 //댓글 수정
	 public int commUpdate(Comm comm);
	 
	 //댓글 총 갯수
	 public long countCommList(long bbsSeq);
	 
	 //답글 등록
	 public int comReplyInsert(Comm comm);
	 
	 //답글 order update
	 public int commGroupOrderUpdate(Comm comm);
	 
	 //답글 리스트
	 public List<Comm>replyList (long commSeq);
	 
	 //나의 댓글 리스트
	 public List<Comm>myCommList(Comm comm);
	 
	 //나의 댓글 리스트 갯수
	 public long myCountCommList(Comm comm);
	 
}