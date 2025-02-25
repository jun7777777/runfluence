package com.sist.web.controller;

//import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.common.util.StringUtil;
//import com.sist.web.model.BbsImg;
import com.sist.web.model.Response;
import com.sist.web.model.StyleWishList;
import com.sist.web.service.StyleWishService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller("styleWishController")
public class StyleWishController 
{
	public static Logger logger = LoggerFactory.getLogger(StyleWishController.class);

	@Autowired
	private StyleWishService styleWishService;
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	@RequestMapping(value="/styleWishlist/add", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> styleWishListAdd(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> res = new Response<Object>();
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

//		List<BbsImg> bbsImg = null;
		
		if( bbsSeq > 0  && !StringUtil.isEmpty(userEmail))
		{
			StyleWishList styleWishList = new StyleWishList();
			
//			if(!StringUtil.isEmpty(bbsImg))
//			{
//				styleWishList.setBbsImg(bbsImg);
//			}
			
//			if(bbsSeq > 0)
//			{
				styleWishList.setBbsSeq(bbsSeq);
				
//			}
			styleWishList.setUserEmail(userEmail);
			
			if(styleWishService.styleWishSelect(styleWishList)<=0)
			{
				if(styleWishService.styleWishListAdd(styleWishList)>0)
				{
					res.setResponse(0, "success");
				}
				else
				{
					res.setResponse(500, "server error");
				}
			}
			else
			{
				res.setResponse(400, "duplicate");
			}
		}
		else
		{
			res.setResponse(404, "error");
		}
		
		return res;
	}
	
	
	@RequestMapping(value="/styleWishlist/del", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> styleWishListDel(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> res = new Response<Object>();
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

//		List<BbsImg> bbsImg = null;
		
		if(bbsSeq > 0  && !StringUtil.isEmpty(userEmail))
		{
			StyleWishList styleWishList = new StyleWishList();
			
//			if(!StringUtil.isEmpty(bbsImg))
//			{
//				styleWishList.setBbsImg(bbsImg);
//			}
//			
//			if(bbsSeq > 0)
//			{
				styleWishList.setBbsSeq(bbsSeq);
				
//			}
			styleWishList.setUserEmail(userEmail);
			
			if(styleWishService.styleWishListDel(styleWishList) > 0)
			{
				res.setResponse(0, "success");
			}
			else 
			{
				res.setResponse(-1, "server error");
			}
		}
		else 
		{
			res.setResponse(404, "notFound");
		}
		return res;
	}
	

}
