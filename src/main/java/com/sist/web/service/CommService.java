package com.sist.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.web.dao.CommDao;
import com.sist.web.model.Comm;
import com.sist.web.model.CommRefresh;
import com.sist.web.model.Paging;

@Service
public class CommService {
	public static Logger logger = LoggerFactory.getLogger(CommService.class);

	@Autowired
	private CommDao commDao;
	
	//댓글 등록
	public int commInsert(Comm comm)
	{
		int count = 0;
		
		try
		{
			count = commDao.commInsert(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]commInsert", e);
		}
		
		return count;
	}
	
	//댓글 리스트
	public List<Comm>comList(Comm comm)
	{
		List<Comm>list = null;
		
		try
		{
			list = commDao.commList(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]comList", e);
		}
		
		return list;
	}
	
	//댓글 상세 검색
	public Comm commSelect(long commSeq)
	{
		Comm comm = null;
		
		try
		{
			comm = commDao.commSelect(commSeq);
		}
		catch(Exception e)
		{
			logger.error("[CommService]commSelect", e);
		}
		
		return comm;
	}
	
	//댓글 삭제
	public int commDelete(long commSeq)
	{
		int count = 0;
		
		try
		{
			count = commDao.commDelete(commSeq);
		}
		catch(Exception e)
		{
			logger.error("[CommService]commDelete", e);
		}
		return count;
	}
	//댓글 수정
	public int commUpdate(Comm comm)
	{
		int count = 0;
		
		try
		{
			count = commDao.commUpdate(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]commUpdate", e);
		}
		
		return count;
	}
	
	public long countCommList(long bbsSeq)
	{
		long count = 0;
	
		try
		{
			count = commDao.countCommList(bbsSeq);
		}
		catch(Exception e)
		{
			logger.error("[CommService]countCommList", e);
		}
		
		return count;
	}
	
	//답글 등록
	public int comReplyInsert(Comm comm)
	{
		int count = 0;
		
		commDao.commGroupOrderUpdate(comm);
		
		try
		{
			count = commDao.comReplyInsert(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]commInsert", e);
		}
		
		return count;
	}
	
	//commGroupOrderUpdate
	public int commGroupOrderUpdate(Comm comm)
	{
		int count = 0;
		
		try
		{
			count = commDao.commGroupOrderUpdate(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]commGroupOrderUpdate", e);
		}
		
		return count;
	}
	
	//답글 리스트
	public List<Comm>replyList(long commSeq)
	{
		List<Comm>list = null;
		
		try
		{
			list = commDao.replyList(commSeq);
		}
		catch(Exception e)
		{
			logger.error("[CommService]replyList", e);
		}
		
		return list;
	}
	
	public List<Comm>myCommList(Comm comm)
	{
		List<Comm>list = null;
		
		try
		{
			list = commDao.myCommList(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]replyList", e);
		}
		
		return list;
	}
	 
	public long myCountCommList(Comm comm)
	{
		long count = 0;
		
		try
		{
			count = commDao.myCountCommList(comm);
		}
		catch(Exception e)
		{
			logger.error("[CommService]replyList", e);
		}
		
		return count;
	}
	
	
// 댓글 새로고침 객체 얻기 예시	
//	public CommRefresh getCommRefresh(long bbsSeq, String CommOrderBy, long CommCurPage) {
//		CommSearch CommSearch = new CommSearch();
//		CommSearch.setBbsSeq(bbsSeq);
//		CommSearch.setCommOrderBy(CommOrderBy);
//
//		long totalCnt = CommListCnt(CommSearch); 
//		Paging CommPaging = null;
//		List<Comm> CommList = null;
//
//		if (totalCnt > 0) {
//			CommPaging = new Paging("/bbs/view", totalCnt, Comm_LIST_COUNT, Comm_PAGE_COUNT, CommCurPage, "CommCurPage");
//			CommSearch.setStartRow(CommPaging.getStartRow());
//			CommSearch.setEndRow(CommPaging.getEndRow());
//			CommList = CommList(CommSearch); 
//		}
//
//		CommRefresh CommRefresh = new CommRefresh();
//		CommRefresh.setCommCurPage(CommCurPage);
//		CommRefresh.setCommOrderBy(CommOrderBy);
//		CommRefresh.setCommPaging(CommPaging);
//		CommRefresh.setCommList(CommList);
//
//		return CommRefresh;
//	}
}