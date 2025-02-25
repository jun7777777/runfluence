package com.sist.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

//import com.sist.web.dao.WishListDao;
import com.sist.web.dao.StyleWishDao;
import com.sist.web.model.StyleWishList;


@Service("styleWishService")
public class StyleWishService 
{
	public static Logger logger = LoggerFactory.getLogger(StyleWishService.class);

	@Autowired
	private StyleWishDao styleWishDao;
	
//	@Autowired
//	private WishListDao wishListDao;
	
	public int styleWishListAdd(StyleWishList wishList)
	{
		int count = 0;
		
		try 
		{
			count = styleWishDao.styleWishListAdd(wishList);
		}
		catch (Exception e) 
		{
			logger.error("[StyleWishService] styleWishListAdd Exception", e);
		}
		return count;
	}
	
	public int styleWishListDel(StyleWishList wishList)
	{
		int count = 0;
		
		try 
		{
			count = styleWishDao.styleWishListDel(wishList);
		}
		catch (Exception e) 
		{
			logger.error("[StyleWishService] styleWishListDel Exception", e);
		}
		return count;
	}
	
	//위시리스트
	public List<StyleWishList>styleWishList(String userEmail)
	{
		List<StyleWishList> styleWishList = null;
		
		try
		{
			styleWishList = styleWishDao.styleWishList(userEmail);
		}
		catch(Exception e)
		{
			logger.error("[StyleWishService] styleWishList Exception", e);
		}
		
		return styleWishList;
	}
	
	//위시리스트 갯수
	public long stylewishListCount(String userEmail)
	{
		long count = 0;
		
		try
		{
			logger.debug("userEmail 1111111111111111"+userEmail);
			count = styleWishDao.styleWishListCount(userEmail);
			
			logger.debug("count : "+count);
		}
		catch (Exception e) 
		{
			logger.error("[StyleWishService]stylewishListCount Exception", e);
		}
		return count;
	}
	
	public long styleWishSelect(StyleWishList styleWishList)
	{
		long count = 0;
		
		try
		{
			count = styleWishDao.styleWishSelect(styleWishList);
		}
		catch(Exception e) 
		{
			logger.error("[StyleWishService]styleWishSelect Exception", e);
		}
		
		return count;
	}
}
