package com.sist.web.controller;

import java.util.ArrayList;
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
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.sist.common.model.FileData;
import com.sist.common.util.StringUtil;
import com.sist.web.model.Bbs;
import com.sist.web.model.BbsImg;
import com.sist.web.model.Paging;
import com.sist.web.model.Response;
import com.sist.web.model.User;
import com.sist.web.service.StyleService;
import com.sist.web.service.StyleWishService;
import com.sist.web.service.UserService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller("styleController")
public class StyleController 
{
	public static Logger logger = LoggerFactory.getLogger(StyleController.class);
	
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	@Value("#{env['upload.img.style.dir']}")
	private String UPLOAD_IMG_STYLE_DIR;
	
	@Autowired
	private StyleWishService styleWishService;
	
	@Autowired
    private StyleService styleService;
	
	@Autowired
	private UserService userService;
	
	
	//한페이지의 게시물 수
	private static final int LIST_COUNT = 20;
	//페이징 수
	private static final int PAGE_COUNT = 5;
		
	
	@RequestMapping(value = "/style/styleIndex")
    public String styleIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) 
	{
		String searchType = HttpUtil.get(request, "searchType","");
		String searchValue =  HttpUtil.get(request, "searchValue","");
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		String bbsSubCateCombinedId = HttpUtil.get(request, "bbsSubCateCombinedId", "CMSY");
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		
		long totalCount = 0;
		
		
		// 서브 카테고리가 style인 게시글 리스트를 조회
        List<Bbs> list = null;
        List<BbsImg> bbsImg = null;
        
        Bbs style = new Bbs();
    	Paging paging = null;
    	
    	//검색 조건 설정
		if(!StringUtil.isEmpty(searchType) && !StringUtil.isEmpty(searchValue))
		{
			style.setSearchType(searchType);
			style.setSearchValue(searchValue);		    
		}
    	
		if(!StringUtil.isEmpty(bbsImg))
		{
			style.setBbsImg(bbsImg);
		}
    	
    	if(!StringUtil.isEmpty(userEmail))
		{
    		style.setUserEmail(userEmail);
		}
		
//		if ("CMSY".equals(bbsSubCateCombinedId)) 
//		{
			style.setBbsSubCateCombinedId(bbsSubCateCombinedId);
//		}

		totalCount = styleService.styleListCount(style);
    	
		logger.debug("totalCount : " + totalCount);
		
    	if(totalCount > 0)
    	{	
    		paging = new Paging("/style/styleIndex", totalCount,LIST_COUNT, PAGE_COUNT, curPage, "curPage");
    	
    		style.setStartRow(paging.getStartRow());
    		style.setEndRow(paging.getEndRow());
    		
    		list = styleService.stylePostList(style);
    	}
    	
    	
    	model.addAttribute("bbsSubCateCombinedId", bbsSubCateCombinedId);
    	model.addAttribute("list" ,list);
    	model.addAttribute("paging", paging);
    	
		return "/style/styleIndex";
	}
	
	//게시물 상세조회
	@RequestMapping(value = "/style/detail")
	public String detail(ModelMap model,HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);		
		String bbsSubCateCombinedId = HttpUtil.get(request, "bbsSubCateCombinedId", "CMSY");
		String boardMe = "N";
		
		Bbs style = null;
		List<BbsImg> bbsImg = null;
		BbsImg bbsImage = null;
		List<Bbs> otherList = null; // 00님의 다른이미지 리스틑
		
		Bbs bbs = new Bbs();
		
		if( bbsSeq > 0)
		{
			bbs.setBbsSeq(bbsSeq);
			bbs.setUserEmail(cookieUserId);
			
			style = styleService.bbsSelect(bbs);//1개 가져옴(데이터)						
			
			if(style != null && StringUtil.equals(style.getUserEmail(), cookieUserId))
			{
				boardMe = "Y";				
				
			}
			bbsImage = new BbsImg();
			
			bbsImage.setBbsSeq(bbsSeq);
			bbsImage.setUserEmail(cookieUserId);
			
			bbsImg = styleService.styleImgSelect(bbsImage);
			
			if(bbsImg != null)
			{
				style.setBbsImg(bbsImg);
				logger.debug("테스트");
			}
			 // 00님의 다른 게시물 조회 (현재 게시물을 제외하고 동일 작성자의 다른 게시물만 조회)
			style.setBbsSeq(bbsSeq);
	        otherList = styleService.otherStyles(style);
		}
		
		model.addAttribute("bbsSubCateCombinedId", bbsSubCateCombinedId);
		model.addAttribute("boardMe",boardMe);
		model.addAttribute("bbsSeq",bbsSeq);
		model.addAttribute("style",style);
		model.addAttribute("curPage",curPage);		
		model.addAttribute("bbsImg",bbsImg);
		model.addAttribute("userEmail",cookieUserId);
		model.addAttribute("otherList", otherList); // 다른 게시물 리스트
//		model.addAttribute("userName",userName);
		 
		return "/style/detail";
	}
	
	//게시물 등록폼
	@RequestMapping(value = "/style/styleWrite")
	public String styleWrite(ModelMap model,HttpServletRequest request, HttpServletResponse response)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long curPage = HttpUtil.get(request, "curPage", 1);
		String searchType = HttpUtil.get(request, "searchType","");
		String searchValue =  HttpUtil.get(request, "searchValue","");
		String bbsSubCateCombinedId =  HttpUtil.get(request, "bbsSubCateCombinedId","CMSY");
		
		
		User user = userService.userSelect(cookieUserId);

		// 디버깅용 로그
	    logger.debug("bbsSubCateCombinedId: " + bbsSubCateCombinedId);
		
		model.addAttribute("user",user);
		model.addAttribute("curPage" , curPage);
		model.addAttribute("searchType" , searchType);
		model.addAttribute("searchValue" , searchValue);
		model.addAttribute("bbsSubCateCombinedId" , bbsSubCateCombinedId);
		
		return "/style/styleWrite";
	}
	

	//게시물 등록 ajax
	@RequestMapping(value="/style/writeProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> writeProc(MultipartHttpServletRequest request,HttpServletResponse response )
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String bbsTitle = HttpUtil.get(request, "title","");
		String bbsContent = HttpUtil.get(request, "content","");
		String bbsSubCateCombinedId = HttpUtil.get(request, "bbsSubCateCombinedId","CMSY");
		
		List<BbsImg> list = null;
		List<FileData> filedata = HttpUtil.getFiles(request, "file_upload",UPLOAD_IMG_STYLE_DIR);
		
		logger.debug("============================");
		logger.debug("cookieUserId : " + cookieUserId);
		logger.debug("bbsTitle : " + bbsTitle);
		logger.debug("bbsContent : " + bbsContent);
		logger.debug("size : " + filedata.size());
		logger.debug("============================");
		
		if(!StringUtil.isEmpty(bbsTitle) && !StringUtil.isEmpty(bbsContent))
		{
			Bbs bbs = new Bbs();
			
			bbs.setUserEmail(cookieUserId);
			bbs.setBbsTitle(bbsTitle);
			bbs.setBbsContent(bbsContent);
			bbs.setBbsSubCateCombinedId(bbsSubCateCombinedId);
			bbs.setBbsStatus("Y");
			
			
			if(filedata != null && filedata.size()>0)
			{
				
				list = new ArrayList<>();
				
				for(int i=0; i<filedata.size() ; i++ )
				{
					FileData fileData2 = filedata.get(i);
					
					BbsImg bbsImg = new BbsImg();
					
					bbsImg.setBbsImgName(fileData2.getFileName());
					bbsImg.setBbsImgOrgName(fileData2.getFileOrgName());
					bbsImg.setBbsImgExt(fileData2.getFileExt());
					bbsImg.setBbsImgSize(fileData2.getFileSize());
					bbsImg.setUserEmail(bbs.getUserEmail());
					
					//bbsCate.setBbsImg(bbsImg);
					list.add(bbsImg);
				}
				
				bbs.setBbsImg(list);
				
				
				try
				{
					if(styleService.styleInsert(bbs)>0)
					{
						
						ajaxResponse.setResponse(0, "success");
					}
					else
					{						
						ajaxResponse.setResponse(500, "server error");
					}
				}
				catch(Exception e)
				{
					logger.error("[StyleController]writeProc Exception",e);
					ajaxResponse.setResponse(500, "internal server error2");
				}
			}

		}
		else
		{
			ajaxResponse.setResponse(400, "bad request");
		}
		return ajaxResponse;
	}
	
	//게시물 삭제
	@RequestMapping(value="/style/delete", method=RequestMethod.POST)
	@ResponseBody
	public Response<Object> delete(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object> ();
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		try
		{
			Bbs bbs = new Bbs();
			
			if( bbsSeq>0)
			{		
				bbs.setUserEmail(cookieUserId);
				bbs.setBbsSeq(bbsSeq);
				//쿼리 샏성
				Bbs style = styleService.bbsSelectMy(bbs);
				
				if( style != null)
				{
					if(StringUtil.equals(cookieUserId, bbs.getUserEmail()))
					{
						if(styleService.styleDelete(style)> 0)
						{
							ajaxResponse.setResponse(0, "success");
						}
						else
						{
							ajaxResponse.setResponse(500, "서버 오류로 삭제에 실패했습니다.");
						}

					}
					else {
		                ajaxResponse.setResponse(404, "해당 게시물을 찾을 수 없습니다.");
		            }
				}
				else {
		            ajaxResponse.setResponse(400, "잘못된 요청입니다.");
		        }
				
			}
		}
		catch (Exception e) {
	        logger.error("[StyleController] delete Exception", e);
	        ajaxResponse.setResponse(500, "서버 내부 오류가 발생했습니다.");
	    }
	
		return ajaxResponse;
	}
	
	//게시글 수정화면
	@RequestMapping(value="/style/updateForm")
	public String updateForm(ModelMap model,HttpServletRequest request, HttpServletResponse response)
	{	
		//쿠키값 가져오기
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String bbsSubCateCombinedId = HttpUtil.get(request, "bbsSubCateCombinedId", "CMSY");
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);//게시물 번호
		String searchType = HttpUtil.get(request, "searchType","");
		String searchValue = HttpUtil.get(request, "searchValue","");
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		logger.debug("111111111111111111111111111111111");
		logger.debug("bbsSubCateCombinedId : " + bbsSubCateCombinedId);
		logger.debug("111111111111111111111111111111111");
		
//		List<Bbs> list = null;
//		Bbs style = null;
		Bbs bbs = new Bbs();
		
		if(bbsSeq > 0 )
		{
			Bbs chk = new Bbs();
			chk.setBbsSeq(bbsSeq);
			chk.setUserEmail(cookieUserId);
			
			bbs = styleService.styleViewUpdate(chk);
			
//			bbs.setBbsSeq(bbsSeq);
//			bbs.setUserEmail(cookieUserId);
//			
//			list = styleService.styleSelect(bbs);
//			Bbs imp = list.get(0);
//			
//			if(!StringUtil.equals(imp.getUserEmail(),cookieUserId ))
//			{
//				list = null;
//			}
//			
			model.addAttribute("searchType",searchType);
			model.addAttribute("searchValue",searchValue);
			model.addAttribute("curPage",curPage);
			model.addAttribute("bbs",bbs);
			model.addAttribute("bbsSubCateCombinedId",bbsSubCateCombinedId);
			
		}
		
		return "/style/updateForm";
	}
	
	//게시글 수정 ajax
	@RequestMapping(value="/style/updateProc", method=RequestMethod.POST)
	@ResponseBody
	public Response<List<Bbs>> updateProc(MultipartHttpServletRequest request,HttpServletResponse response )
	{
		Response<List<Bbs>> ajaxResponse = new Response<List<Bbs>>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		String bbsTitle = HttpUtil.get(request, "title","");
		String bbsContent = HttpUtil.get(request, "content","");
		String bbsSubCateCombinedId = HttpUtil.get(request, "bbsSubCateCombinedId","CMSY");
		
		List<FileData> filedata = HttpUtil.getFiles(request, "file_upload",UPLOAD_IMG_STYLE_DIR);
		List<BbsImg> list = null;
		
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@");
		logger.debug("cookieUserId : " + cookieUserId);
		logger.debug("bbsTitle : " + bbsTitle);
		logger.debug("bbsContent : " + bbsContent);
		//logger.debug("size : " + filedata.size());
		logger.debug("@@@@@@@@@@@@@@@@@@@@@@@");
		
		
		if(bbsSeq >0 && !StringUtil.isEmpty(bbsTitle) && !StringUtil.isEmpty(bbsContent))
		{
			Bbs bbs = new Bbs();
			
			bbs.setBbsSeq(bbsSeq);
			bbs.setUserEmail(cookieUserId);
			
			List<Bbs> style = styleService.styleSelect(bbs);
			
			if(bbs != null)
			{
				if(StringUtil.equals(bbs.getUserEmail(),cookieUserId ))
				{
					bbs.setUserEmail(cookieUserId);
					bbs.setBbsTitle(bbsTitle);
					bbs.setBbsContent(bbsContent);
					bbs.setBbsSubCateCombinedId(bbsSubCateCombinedId);
					bbs.setBbsStatus("Y");
					
					if(filedata != null &&  filedata.size()>0)
					{
						list = new ArrayList<>();
						
						for(int i=0; i<filedata.size() ; i++ )
						{
							FileData fileData2 = filedata.get(i);
							
							BbsImg bbsImg = new BbsImg();
							
							bbsImg.setBbsImgName(fileData2.getFileName());
							bbsImg.setBbsImgOrgName(fileData2.getFileOrgName());
							bbsImg.setBbsImgExt(fileData2.getFileExt());
							bbsImg.setBbsImgSize(fileData2.getFileSize());
							bbsImg.setUserEmail(bbs.getUserEmail());
							
							//bbsCate.setBbsImg(bbsImg);
							list.add(bbsImg);
						}
						
						bbs.setBbsImg(list);


					try
					{
						if(styleService.styleUpdate(bbs)>0)
						{
		                    ajaxResponse.setResponse(0, "success");
						}
						else
						{
							ajaxResponse.setResponse(500, "internal server error1");
						}
					}
					catch(Exception e)
					{
						logger.error("[StyleController]updateProc Exception",e);
						ajaxResponse.setResponse(500, "internal server error");
					}	
				}
				else
				{
					ajaxResponse.setResponse(403, "server error");
				}
				
			}
			else
			{
				ajaxResponse.setResponse(404, "not found");
			}
		} else
				ajaxResponse.setResponse(400, "bad request");
		
	}
		return ajaxResponse;
	
	}
	
	//무한 스크롤 기능
	@RequestMapping(value = "/style/scroll", method = RequestMethod.POST)
	@ResponseBody
	public Response<List<Bbs>> styleScroll(HttpServletRequest request, HttpServletResponse response) 
	{
	    Response<List<Bbs>> ajaxResponse = new Response<>();

    	long start = HttpUtil.get(request, "start", 0);
        long limit = HttpUtil.get(request, "limit", 10); // 기본값 10개
        String bbsSubCateCombinedId = HttpUtil.get(request, "bbsSubCateCombinedId", "CMSY");
	    

        Bbs style = new Bbs();
        
        style.setStartRow(start);
        style.setEndRow(start + limit);
        style.setBbsSubCateCombinedId(bbsSubCateCombinedId);

       // List<Bbs> list = styleService.stylePostList(style);
        List<Bbs> list = styleService.styleScrollSelect(style);
        
        if (list != null && !list.isEmpty()) 
        {
            ajaxResponse.setResponse(0, "success", list);
        } 
        else 
        {
            ajaxResponse.setResponse(404, "No more data");
        }


	    return ajaxResponse;
	}

}
	
	

