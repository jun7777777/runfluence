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
import com.sist.web.dao.BbsCateDao;
import com.sist.web.model.Bbs;
import com.sist.web.model.BbsImg;

@Service("styleService")
public class StyleService 
{
	public static Logger logger = LoggerFactory.getLogger(StyleService.class);

	@Autowired
	private BbsCateDao bbsCateDao;
	
	//업로드된 파일을 저장할 경로를 설정하는 값
	@Value("#{env['upload.img.dir']}")
	private String UPLOAD_IMG_DIR;

	// 스타일 게시물 리스트 조회
	 public List<Bbs> stylePostList(Bbs bbs) 
	 {
        List<Bbs> list = null;
        
        try {
           
            list = bbsCateDao.stylePostList(bbs);
        } 
        catch (Exception e) 
        {
            logger.error("[StyleService] stylePostList Exception", e);
        }
        return list;
	}

	// 총 게시물 수 조회
	public long styleListCount(Bbs bbs)
	{
		long count = 0;
		
		try
		{
			count = bbsCateDao.styleListCount(bbs);
			
			logger.debug("@@@@@@@@@@@@@@@@");
			logger.debug("service count : " + count);
			logger.debug("@@@@@@@@@@@@@@@@");
			
		}
		catch(Exception e)
		{
			logger.error("[StyleService]styleListCount Exception",e);
		}
		
		return count ; 
	}
	
	// 스타일 게시물 등록
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class) 
	public int styleInsert (Bbs bbs)throws Exception 
	{
		int count =0;
		
		count = bbsCateDao.styleInsert(bbs);
		
		if( count >0 && bbs.getBbsImg() != null)
		{
			for( int i=0 ; i< bbs.getBbsImg().size() ; i++) 
			{
				BbsImg bbsImg = bbs.getBbsImg().get(i);
				
				bbsImg.setBbsSeq(bbs.getBbsSeq());
				//bbsImg.setBbsImageNum((short)1);
				bbsImg.setBbsImageNum(i+1);
		
				
				bbsCateDao.styleImgInsert(bbsImg);
			}
		}
		
		return count;	
	}
	
	
	
	//게시물 조회
	public List<Bbs> styleSelect(Bbs bbs)
	{
		List<Bbs> list  = null;
		
		try 
		{	
			list = bbsCateDao.styleSelect(bbs);		
		}

		catch(Exception e)
		{
			logger.error("[StyleService]styleSelect Exception",e);
		}
		return list;
	}
	
	//게시글 수정
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public int styleUpdate(Bbs bbs) throws Exception
	{
		int count = 0;
		
		count = bbsCateDao.styleUpdate(bbs);
		
		if( count>0 && bbs.getBbsImg() != null)
		{
//			List<BbsImg> delBbsImg = bbsCateDao.styleImgSelect(bbs.getBbsSeq());
			List<Bbs> delBbs = bbsCateDao.styleSelect(bbs);
			
			//기존파일 존재하면 삭제 //for
			if(delBbs != null)
			{
				for(int i=0; i< delBbs.size(); i++)
				{
					FileUtil.deleteFile(
							UPLOAD_IMG_DIR 
							+ FileUtil.getFileSeparator()
							+ delBbs.get(i).getBbsImgName());
					
					bbsCateDao.styleImgDelete(bbs.getBbsSeq());	
				}
				for( int i=0 ; i< bbs.getBbsImg().size() ; i++) 
				{
					BbsImg bbsImg = bbs.getBbsImg().get(i);

					bbsImg.setBbsSeq(bbs.getBbsSeq());
					bbsImg.setBbsImageNum(i+1);
					
					bbsCateDao.styleImgInsert(bbsImg);
				}
			}
		}
		
		return count;
	 }
	//수정 폼 조회
	public Bbs styleViewUpdate(Bbs bbs)
	{
		Bbs list = null; 
		List<BbsImg> listImg = null;
		BbsImg bbsImg = new BbsImg();
		
		try
		{			
//			list = bbsCateDao.styleSelect(bbs);
			list = bbsCateDao.bbsSelect(bbs);
			
			bbsImg.setBbsSeq(bbs.getBbsSeq());
			bbsImg.setUserEmail(bbs.getUserEmail());
			
			listImg = bbsCateDao.styleImgSelect(bbsImg);
			
			if( listImg != null )
			{
				logger.debug("====================================");
				logger.debug("size : " + listImg.size());
				logger.debug("====================================");
				list.setBbsImg(listImg);
			}

		}
		catch(Exception e)
		{
			logger.error("[StyleService]styleViewUpdate Exception",e);
		}
		
		return list;
	}
	
	//게시물 삭제
	@Transactional(propagation=Propagation.REQUIRED, rollbackFor=Exception.class)
	public long styleDelete(Bbs bbs) throws Exception
	{
		long count = 0;
//		
//		Bbs bbs = new Bbs();
//		
//		bbs.setBbsSeq(bbsSeq);
		
//		List<BbsImg> style = bbsCateDao.styleImgSelect(bbsSeq);
		List<Bbs> style = bbsCateDao.styleSelect(bbs);
		
		//게시글 삭제 
		for(int i =0; i < style.size(); i++)
		{
			Bbs chk = style.get(i);
            
			if(bbsCateDao.styleImgDelete(chk.getBbsSeq())>0)
			{
				FileUtil.deleteFile(UPLOAD_IMG_DIR + FileUtil.getFileSeparator()+ chk.getBbsImgName());
									
			}
       
		}
		 count = bbsCateDao.styleDelete(bbs.getBbsSeq());
		
		return count;
	}
	
	// 첨부파일 조회
	public List<BbsImg> styleImgSelect(BbsImg bbsImage)
	{
		List<BbsImg> bbsImg = null;
		
		try
		{
			bbsImg = bbsCateDao.styleImgSelect(bbsImage);
		}
		catch(Exception e)
		{
			logger.error("[StyleService]styleImgSelect Exception",e);
		}
		return bbsImg ;
	}
	
	
	/*style detail 상세보기
	public Bbs styleView(long bbsSeq)
	{
		Bbs bbs = new Bbs();
		Bbs bbs2 = null;
		
		bbs.setBbsSeq(bbsSeq);
		
		try
		{
			bbs2 = bbsCateDao.bbsSelect(bbs);
			
			if(bbs2 != null)
			{
				
				List<BbsImg> bbsImg = bbsCateDao.styleImgSelect(bbsImage);
				
				if(bbsImg != null)
				{
					bbs2.setBbsImg(bbsImg);
				}
			}
		}
		catch(Exception e)
		{
			logger.error("[StyleService]styleView Exception",e);
		}
		return bbs2;
	}*/
	
	//무한 스크롤
	public List<Bbs> styleScrollSelect(Bbs style) 
	{
		List<Bbs> list = null;
		
		try 
		{
			list = bbsCateDao.styleScrollSelect(style);

		    if (list != null && !list.isEmpty()) 
		    {
		    	BbsImg bbsImage = null;
		    	
		        for (int i = 0; i < list.size(); i++) 
		        {
		            Bbs bbs = list.get(i);
		            bbsImage = new BbsImg();
		            bbsImage.setUserEmail(bbs.getUserEmail());
		            bbsImage.setBbsSeq(bbs.getBbsSeq());
		            
		            List<BbsImg> bbsImg = bbsCateDao.styleImgSelect(bbsImage);
	
		            if (bbsImg != null) 
		            {
		                bbs.setBbsImg(bbsImg);
		            }
		        }
		    }
		}
		catch(Exception e)
		{
			logger.error("[StyleService]styleScrollSelect Exception",e);
		}

	    return list;
	}
	
	//00님의 다른 스타일 출력
	public List<Bbs> otherStyles(Bbs bbs) 
	{
		List<Bbs> list = null;

//	    if(list != null && !list.isEmpty()) 
//	    {
//	    	for (int i = 0; i < list.size(); i++) 
//	        {
//	            Bbs bbs = list.get(i);
//	            
//	            List<BbsImg> bbsImg = bbsCateDao.styleImgSelect(bbs.getBbsSeq());
//
//	            if (bbsImg != null) 
//	            {
//	                bbs.setBbsImg(bbsImg);
//	            }
	            
//	        }
//	    }
		try 
		{			
			list = bbsCateDao.otherStyles(bbs);			
		}
		catch(Exception e)
		{
			logger.error("[StyleService]otherStyles Exception",e);
		}
	    return list;
	}
	
	
		public Bbs bbsSelect(Bbs bbs)
		{
			Bbs style = null;

			try 
			{			
				style = bbsCateDao.bbsSelect(bbs);			
			}
			catch(Exception e)
			{
				logger.error("[StyleService]bbsSelect Exception",e);
			}
		    return style;
		}
	
		public Bbs bbsSelectMy(Bbs bbs)
		{
			Bbs style = null;

			try 
			{			
				style = bbsCateDao.bbsSelectMy(bbs);			
			}
			catch(Exception e)
			{
				logger.error("[StyleService]bbsSelectMy Exception",e);
			}
		    return style;
		}		
	
}
