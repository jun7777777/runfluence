package com.sist.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.common.util.FileUtil;
import com.sist.web.dao.BbsDao;
import com.sist.web.model.Bbs;
import com.sist.web.model.BbsImg;

@Service
public class BbsService {
	public static Logger logger = LoggerFactory.getLogger(BbsService.class);
	
	@Autowired
	private BbsDao bbsDao;
	
	@Value("#{env['upload.img.dir']}")
	private String UPLOAD_IMG_DIR;
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int bbsInsert(Bbs bbs) throws Exception
	{
		int count = 0;
		
		count = bbsDao.bbsInsert(bbs);
		
		if(count > 0 && bbs.getBbsImg() != null)
		{
			List<BbsImg> bbsImageList = bbs.getBbsImg();
		
			for(int i = 0; i < bbs.getBbsImg().size(); i++)
			{
				BbsImg bbsImg = bbs.getBbsImg().get(i);
				bbsImg.setBbsSeq(bbs.getBbsSeq());
				
				bbsDao.bbsImgInsert(bbsImg);
			}

		}
		
		return count;
	}

	public List<Bbs> bbsListSelect(Bbs bbs)
	{
		List<Bbs> list = null;
		
		try 
		{
			list = bbsDao.bbsListSelect(bbs);
		} 
		
		catch (Exception e) 
		{
			logger.error("[BbsService] bbsListSelect Exception", e);
		}
		
		return list;
	}
	
	public long bbsListCount(Bbs bbs)
	{
		long count = 0;
		
		try 
		{
			count = bbsDao.bbsListCount(bbs);
		} 
		
		catch (Exception e) 
		{
			logger.error("[BbsService] bbsListCount Exception", e);
		}
		
		return count;
	}
	
	public Bbs bbsView(long bbsSeq)
	{
		Bbs bbs = null;
		
		try 
		{
			bbs = bbsDao.bbsSelect(bbsSeq);
			
			if(bbs != null)
			{
				bbsDao.bbsReadCntPlus(bbsSeq);
				
				List<BbsImg> bbsImg = bbsDao.bbsImgSelect(bbsSeq);
				
				if(bbsImg != null)
				{
					bbs.setBbsImg(bbsImg);
				}
			}
		} 
		
		catch (Exception e) 
		{
			logger.error("[BbsService] bbsView Exception", e);
		}
		
		return bbs;
	}
	
	public Bbs bbsSelect(long bbsSeq)
	{
		Bbs bbs = null;
		
		try 
		{
			bbs = bbsDao.bbsSelect(bbsSeq);
		} 
		
		catch (Exception e) 
		{
			logger.error("[BbsService] bbsSelect Exception", e);
		}
		
		return bbs;
	}
	
	public int bbsDelete(long bbsSeq)
	{
		int count = 0;
		
		try 
		{
			count = bbsDao.bbsDelete(bbsSeq);
		} 
		
		catch (Exception e) 
		{
			logger.error("[ReviewService] reviewDelete Exception", e);
		}
		
		return count;
	}
	
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int bbsUpdate(Bbs bbs)
	{
		int count = 0;
		
		count = bbsDao.bbsUpdate(bbs);
		
		List<BbsImg> delBbsImg = bbsDao.bbsImgSelect(bbs.getBbsSeq());
		
		logger.debug("bbsSeq: " + bbs.getBbsSeq());
		logger.debug("bbsImg: " + bbs.getBbsImg());
		logger.debug("delBbsImg: " + delBbsImg);
		
		if(count > 0 && delBbsImg != null)
		{
			for(int i = 0; i < delBbsImg.size(); i++)
			{
				FileUtil.deleteFile(UPLOAD_IMG_DIR + FileUtil.getFileSeparator() + delBbsImg.get(i).getBbsImgName());
				bbsDao.bbsImgDelete(delBbsImg.get(i));
			}
			
			if (bbs.getBbsImg() != null && !bbs.getBbsImg().isEmpty()) {
			    for (int i = 0; i < bbs.getBbsImg().size(); i++) {
			        BbsImg bbsImg = bbs.getBbsImg().get(i);
			        
			        // bbsSeq가 null이 아닌지 확인하고, null일 경우 예외를 처리하거나 기본값 설정
			        Long bbsSeq = bbs.getBbsSeq();
			        if (bbsSeq == null) {
			            throw new IllegalArgumentException("게시글 시퀀스(bbsSeq)가 null입니다.");
			        }
			        
			        bbsImg.setBbsSeq(bbsSeq);    
			        
			        // 이미지 삽입
			        bbsDao.bbsImgInsert(bbsImg);
			    }
			} else {
			    logger.debug("첨부된 이미지가 없습니다.");
			}
		}
		
		return count;
	}
	
	public List<Bbs> myBbsListSelect(Bbs bbs)
	{
		List<Bbs>list = null;
		
		try
		{
			list = bbsDao.myBbsListSelect(bbs);
		}
		catch(Exception e)
		{
			logger.error("[ReviewService] reviewDelete Exception", e);
		}
		
		return list;
	}
	
	public long myBbsListCount(Bbs bbs)
	{
		long count = 0;
		
		try
		{
			count = bbsDao.myBbsListCount(bbs);
		}
		catch(Exception e)
		{
			logger.error("[ReviewService] reviewDelete Exception", e);
		}
		
		return count ;
	}
	
	public List<Bbs> noticeListSelect(Bbs bbs) {
	    List<Bbs> list = null;

	    try {
	      list = bbsDao.noticeListSelect(bbs);
	    } catch (Exception e) {
	      logger.error("[noticeService] noticeListSelect Exception", e.getMessage(), e);
	    }

	    return list;
	  }

	  public long noticeTotalCnt(Bbs bbs) {
	    long cnt = 0;

	    try {
	      cnt = bbsDao.noticeTotalCnt(bbs);
	    } catch (Exception e) {
	      logger.error("[noticeService] noticeTotalCnt Exception", e.getMessage(), e);
	    }

	    return cnt;
	  }
}