package com.sist.web.controller;

import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.common.util.StringUtil;
import com.sist.web.model.Bbs;
import com.sist.web.model.Comm;
import com.sist.web.model.CommRefresh;
import com.sist.web.model.Paging;
import com.sist.web.model.Response;
import com.sist.web.model.User;
import com.sist.web.service.BbsService;
import com.sist.web.service.CommService;
import com.sist.web.service.UserService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller
public class CommController {
	public static Logger logger = LoggerFactory.getLogger(CommController.class);
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	private static final int LIST_COUNT = 10;
	private static final int PAGE_COUNT = 5;
	
	@Autowired
	private CommService commService;
	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private UserService userService;
	
	@RequestMapping(value = "/comm/commInsert")
	@ResponseBody
	public Response<Object> comInsert(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		String commContet = HttpUtil.get(request, "comment");
		
		if(bbsSeq > 0 && !StringUtil.isEmpty(commContet))
		{
			User user = userService.userSelect(cookieUserId);
			Bbs bbs = bbsService.bbsSelect(bbsSeq);
			
			if(user!= null && bbs != null)
			{
				Comm comm = new Comm();
				
				comm.setBbsSeq(bbsSeq);
				comm.setCommContent(commContet);
				comm.setUserEmail(cookieUserId);
				
				if(commService.commInsert(comm)>0)
				{
					ajaxResponse.setResponse(0, "success");
				}
				else
				{
					ajaxResponse.setResponse(-1, "do not insert");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "not found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "bad Request");
		}
					
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/comm/commReplyInsert")
	@ResponseBody
	public Response<Object> comReplyInsert(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		String commContet = HttpUtil.get(request, "comment");
		
		long commSeq = HttpUtil.get(request, "commSeq", (long)0);
		
		if(!StringUtil.isEmpty(commContet) && commSeq > 0 && bbsSeq >0)
		{
			User user = userService.userSelect(cookieUserId);
			Bbs bbs = bbsService.bbsSelect(bbsSeq);
			Comm comm = commService.commSelect(commSeq);
			
			if(user != null && bbs != null && comm!= null)
			{
				comm.setBbsSeq(bbsSeq);
				comm.setCommContent(commContet);
				comm.setUserEmail(cookieUserId);
				comm.setCommSeq(commSeq);
				
				comm.setCommGroup(comm.getCommGroup());
				comm.setCommIndent(comm.getCommIndent());
				comm.setCommOrder(comm.getCommOrder()+1);
				comm.setCommParent(comm.getCommSeq());
				
				if(commService.comReplyInsert(comm) > 0)
				{
					ajaxResponse.setResponse(0, "success");
				}
				else
				{
					ajaxResponse.setResponse(-1, "do not insert");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "not Found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "bad Request");
		}
		
		return ajaxResponse;
	}
	
	
	@RequestMapping(value = "/comm/commDeleteProc")
	@ResponseBody
	public Response<Object> commDeleteProc(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		long comSeq = HttpUtil.get(request, "comSeq", (long)0 );
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0 );
		
		if(comSeq > 0)
		{
			User user = userService.userSelect(cookieUserId);
			Comm comm = commService.commSelect(comSeq);
			Bbs bbs = bbsService.bbsSelect(bbsSeq);
			
			if(user != null && bbs != null && comm!= null)
			{
				logger.debug("userEmail : " + user.getUserEmail());
				logger.debug("commEmail : " + comm.getUserEmail());
				
				if(StringUtil.equals(user.getUserEmail(), comm.getUserEmail()))
				{
					if(commService.commDelete(comSeq)>0)
					{
						ajaxResponse.setResponse(0, "success");
					}
					else
					{
						ajaxResponse.setResponse(-1, "do not delete");
					}
				}
				else
				{
					ajaxResponse.setResponse(403, "not matching");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "not Found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "bad Request");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/comm/commUpdateProc")
	@ResponseBody
	public Response<Object>commUpdateProc(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		long comSeq = HttpUtil.get(request, "comSeq", (long)0);
		
		String commContet = HttpUtil.get(request, "comment");
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		if(comSeq > 0 && !StringUtil.isEmpty(commContet))
		{
			User user = userService.userSelect(cookieUserId);
			Bbs bbs = bbsService.bbsSelect(bbsSeq);
			
			if(user!= null && bbs != null)
			{
				Comm comm = new Comm();
				
				comm.setBbsSeq(bbsSeq);
				comm.setCommSeq(comSeq);
				comm.setCommContent(commContet);
				comm.setUserEmail(cookieUserId);
				if(StringUtil.equals(user.getUserEmail(), comm.getUserEmail()))
				{
					if(commService.commUpdate(comm)>0)
					{
						ajaxResponse.setResponse(0, "success");
					}
					else
					{
						ajaxResponse.setResponse(-1, "do not insert");
					}
				}
				else
				{
					ajaxResponse.setResponse(403, "not matching");
				}
			}
			else
			{
				ajaxResponse.setResponse(404, "not found");
			}
		}
		else
		{
			ajaxResponse.setResponse(400, "bad Request");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/comm/replyList")
	@ResponseBody
	public Response<Object>replyList(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		long commSeq = HttpUtil.get(request, "commSeq", (long)0);
		
		List<Comm>list = null;
		
		if(commSeq > 0)
		{
			list = commService.replyList(commSeq);
		}
		
		if(list != null)
		{
			ajaxResponse.setResponse(0, "success", list);
		}
		else
		{
			ajaxResponse.setResponse(404, "not Found");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/community/myComments")
	public String myFreeBoard(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		long totalCount = 0;
		
		List<Comm>list = null;
		
		Comm comm = new Comm();
		
		Paging paging = null;
		
		String subCate = HttpUtil.get(request, "subCate", "");
		
		String searchType = HttpUtil.get(request, "searchType", "");
		
		String searchValue = HttpUtil.get(request, "searchValue", "");
		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME );
		
		if(!StringUtil.isEmpty(cookieUserId) && !StringUtil.isEmpty(searchValue) && !StringUtil.isEmpty(searchType))
		{
			comm.setSearchType(searchType);
			comm.setSearchValue(searchValue);
			
		}
		comm.setUserEmail(cookieUserId);
		
		logger.debug("UserEmail : " + comm.getUserEmail());
		logger.debug("bbsSearchType: " + comm.getSearchType());
		logger.debug("bbsSearchValue: " + comm.getSearchValue());
		
		totalCount = commService.myCountCommList(comm);
	
		logger.debug("============================");
		logger.debug("totalCount : " + totalCount);
		logger.debug("============================");
		
		if(totalCount > 0 )
		{
			paging = new Paging("/community/myComments", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage" );
			
			comm.setStartRow(paging.getStartRow());
			comm.setEndRow(paging.getEndRow());
			
			list = commService.myCommList(comm);
		
		}
		
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchType", searchType);
		model.addAttribute("paging", paging );
		model.addAttribute("curPage", curPage);
		model.addAttribute("subCate", subCate);
		
		return "/community/myComments";
	}
	
	
	
}