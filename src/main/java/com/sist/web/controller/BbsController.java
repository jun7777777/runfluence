package com.sist.web.controller;

import java.io.File;
import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

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

import com.google.gson.JsonObject;
import com.sist.common.model.FileData;
import com.sist.common.util.FileUtil;
import com.sist.common.util.StringUtil;
import com.sist.web.model.Bbs;
import com.sist.web.model.BbsImg;
import com.sist.web.model.Comm;
import com.sist.web.model.Paging;
import com.sist.web.model.Response;
import com.sist.web.service.BbsService;
import com.sist.web.service.CommService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller
public class BbsController {
	public static Logger logger = LoggerFactory.getLogger(BbsController.class);
	
	private static final int COM_PAGE_COUNT = 5;
	private static final int COM_LIST_COUNT = 10;
	
	private static final int LIST_COUNT = 10;
	private static final int PAGE_COUNT = 5;
	
	@Value("#{env['upload.save.dir']}")
	private String UPLOAD_SAVE_DIR;
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	@Value("#{env['upload.img.temp.dir']}")
	private String UPLOAD_IMG_TEMP_DIR;
	
	@Value("#{env['upload.img.dir']}")
	private String UPLOAD_IMG_DIR;
	
	@Autowired
	private BbsService bbsService;
	
	@Autowired
	private CommService commService;
	
	public static List<FileData> moveTempImage(String bbsContent, String tempDirectory, String actualDirectory) {
	    String imgTagPattern = "<img[^>]+src=\"/resources/bbs/temp/([^\"]+)\"[^>]*alt=\"([^\"]+)\"";
	    Pattern pattern = Pattern.compile(imgTagPattern);
	    Matcher matcher = pattern.matcher(bbsContent);

	    List<FileData> imageDataList = null;

	    if (matcher.find()) {
	        imageDataList = new ArrayList<>(); 

	        do {
	            String tempImageName = matcher.group(1);  
	            String originalImageName = matcher.group(2); 

	            File tempFile = new File(tempDirectory + FileUtil.getFileSeparator() + tempImageName);
	            File actualFile = new File(actualDirectory + FileUtil.getFileSeparator() + tempImageName);

	            if (tempFile.exists() && tempFile.renameTo(actualFile)) {
	                FileData imageData = new FileData();

	                imageData.setFileOrgName(originalImageName);  
	                imageData.setFileName(actualFile.getName()); 
	                imageData.setFileSize(actualFile.length());  
	                imageData.setFilePath(actualFile.getAbsolutePath());  

	                String strFileExt = FileUtil.getFileExtension(imageData.getFileOrgName());
	                if (!StringUtil.isEmpty(strFileExt)) {
	                    imageData.setFileExt(strFileExt);  // 파일 확장자
	                }

	                imageDataList.add(imageData);
	            }

	        } while (matcher.find());
	    }

	    return (imageDataList != null && !imageDataList.isEmpty()) ? imageDataList : null;
	}
	
	@RequestMapping(value ="/community/freeBoard")
	public String freeBoard(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		long totalCount = 0;
		
		List<Bbs>list = null;
		
		Bbs bbs = new Bbs();
		
		Paging paging = null;
		
		String subCate = HttpUtil.get(request, "subCate", "");
		
		String searchType = HttpUtil.get(request, "searchType", "");
		
		String searchValue = HttpUtil.get(request, "searchValue", "");
		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		if(!StringUtil.isEmpty(searchValue) && !StringUtil.isEmpty(searchType))
		{
			bbs.setSearchType(searchType);
			bbs.setSearchValue(searchValue);
		}
		bbs.setBbsSubCateCombinedId("CMFO");
		
		logger.debug("bbsSearchType: " + bbs.getSearchType());
		logger.debug("bbsSearchValue: " + bbs.getSearchValue());
		logger.debug("bbsSubCateCombinedId: " + bbs.getBbsSubCateCombinedId());
		
		totalCount = bbsService.bbsListCount(bbs);
	
		logger.debug("============================");
		logger.debug("totalCount : " + totalCount);
		logger.debug("============================");
		
		if(totalCount > 0 )
		{
			paging = new Paging("/community/freeBoard", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage" );
			
			bbs.setStartRow(paging.getStartRow());
			bbs.setEndRow(paging.getEndRow());
			
			list = bbsService.bbsListSelect(bbs);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchType", searchType);
		model.addAttribute("paging", paging );
		model.addAttribute("curPage", curPage);
		model.addAttribute("subCate", subCate);
		
		return "/community/freeBoard";
	}
	
	@RequestMapping(value = "/community/myFreeBoard")
	public String myFreeBoard(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		long totalCount = 0;
		
		List<Bbs>list = null;
		
		Bbs bbs = new Bbs();
		
		Paging paging = null;
		
		String subCate = HttpUtil.get(request, "subCate", "");
		
		String searchType = HttpUtil.get(request, "searchType", "");
		
		String searchValue = HttpUtil.get(request, "searchValue", "");
		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME );
		
		if(!StringUtil.isEmpty(cookieUserId) && !StringUtil.isEmpty(searchValue) && !StringUtil.isEmpty(searchType))
		{
			bbs.setSearchType(searchType);
			bbs.setSearchValue(searchValue);
			
		}
		bbs.setUserEmail(cookieUserId);
		bbs.setBbsSubCateCombinedId("CMFO");
		
		logger.debug("cookieUserId: "+ cookieUserId);
		logger.debug("UserEmail : " + bbs.getUserEmail());
		logger.debug("bbsSearchType: " + bbs.getSearchType());
		logger.debug("bbsSearchValue: " + bbs.getSearchValue());
		logger.debug("bbsSubCateCombinedId: " + bbs.getBbsSubCateCombinedId());
		
		totalCount = bbsService.myBbsListCount(bbs);
	
		logger.debug("============================");
		logger.debug("totalCount : " + totalCount);
		logger.debug("============================");
		
		if(totalCount > 0 )
		{
			paging = new Paging("/community/myFreeBoard", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage" );
			
			bbs.setStartRow(paging.getStartRow());
			bbs.setEndRow(paging.getEndRow());
			
			list = bbsService.myBbsListSelect(bbs);
		}
		
		model.addAttribute("list", list);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("searchType", searchType);
		model.addAttribute("paging", paging );
		model.addAttribute("curPage", curPage);
		model.addAttribute("subCate", subCate);
		
		return "/community/myFreeBoard";
	}
	
	@RequestMapping(value ="/community/board_writeForm")
	public String board_writeForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		return "/community/board_writeForm";
	}
	
	@RequestMapping(value ="/community/freeBoard_Detail")
	public String freeBoard_detail(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		long totalCount = 0;
		
		String searchType = HttpUtil.get(request, "searchType");
		
		String searchValue = HttpUtil.get(request, "searchValue");
		
		String boardMe = "N";
		
		Paging paging = null;
		
		List<Comm>commList = null;
		
		Comm comm = new Comm();
		
		logger.debug("===========================");
		logger.debug("bbsSeq :" + bbsSeq);
		logger.debug("===========================");
		
		Bbs bbs = null;
		
		totalCount = commService.countCommList(bbsSeq);
		logger.debug("totalCount : " + totalCount);
		
		if(bbsSeq > 0)
		{
			bbs = bbsService.bbsView(bbsSeq);
			
			paging = new Paging("/community/freeBoard_Detail", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");
			
			comm.setStartRow(paging.getStartRow());
			comm.setEndRow(paging.getEndRow());
			comm.setBbsSeq(bbsSeq);
			
			commList = commService.comList(comm);
			
			if(bbs != null && StringUtil.equals(bbs.getUserEmail(), cookieUserId))
			{
				boardMe = "Y";
			}
			
			logger.debug("comList : " + commList.size());
		}
		
		model.addAttribute("boardMe", boardMe);
		model.addAttribute("bbsSeq", bbsSeq);
		model.addAttribute("bbs", bbs);
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		
		model.addAttribute("paging", paging);
		model.addAttribute("commList", commList);
		
		return "/community/freeBoard_Detail";
	}
	
	@RequestMapping(value ="/community/board_updateForm")
	public String board_updateForm(HttpServletRequest request, HttpServletResponse response, ModelMap model)
	{
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		String searchType = HttpUtil.get(request, "searchTyoe");
		
		String searchValue = HttpUtil.get(request, searchType);
		
		Bbs bbs = null;
		
		if(bbsSeq > 0)
		{
			bbs = bbsService.bbsView(bbsSeq);
			
			if(bbs != null)
			{
				if(!StringUtil.equals(bbs.getUserEmail(), cookieUserId))
				{
					bbs = null;
				}
			}
		}
		
		model.addAttribute("searchType", searchType);
		model.addAttribute("searchValue", searchValue);
		model.addAttribute("curPage", curPage);
		model.addAttribute("bbs", bbs);
		
		return "/community/board_updateForm";
	}
	
	@RequestMapping(value ="/bbs/writeProc", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object>writeProc(MultipartHttpServletRequest request, HttpServletResponse response)
	{
		Response<Object>ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		String title = HttpUtil.get(request, "title","");
		
		String contents = HttpUtil.get(request, "content", "");
		
		String category = HttpUtil.get(request, "category", "");
		
		FileData fileData = HttpUtil.getFile(request, "file_name", UPLOAD_SAVE_DIR);
		 
		logger.debug("content : " + contents);
		logger.debug("title : " + title);
		
		if(!StringUtil.isEmpty(title) && !StringUtil.isEmpty(contents) && !StringUtil.isEmpty(category))
		{
			Bbs bbs = new Bbs();
			
			bbs.setUserEmail(cookieUserId);
			bbs.setBbsContent(contents);
			bbs.setBbsTitle(title);
			bbs.setBbsSubCateCombinedId(category);
			bbs.setBbsStatus("Y");
			
			List<FileData> ImageDataList = moveTempImage(contents, UPLOAD_IMG_TEMP_DIR, UPLOAD_IMG_DIR);
			
			if (ImageDataList != null) {
				bbs.setBbsContent(contents.replace("/resources/bbs/temp/", "/resources/bbs/images/"));
				List<BbsImg> bbsImageList = new ArrayList<>();
				
				for (FileData ImageData : ImageDataList) {
					if (ImageData.getFileSize() > 0) {
						BbsImg bbsImage = new BbsImg();
						bbsImage.setBbsImgExt(ImageData.getFileExt());
						bbsImage.setBbsImgName(ImageData.getFileName());
						bbsImage.setBbsImgOrgName(ImageData.getFileOrgName());
						bbsImage.setBbsImgSize(ImageData.getFileSize());
						bbsImageList.add(bbsImage);
					}
					
				}
				
				if (ImageDataList.size() > 0) {
					bbs.setBbsImg(bbsImageList);
				}
			}
			
			if(fileData != null && fileData.getFileSize() > 0 )
			{
				BbsImg bbsImg = new BbsImg();
				
				bbsImg.setBbsImgName(fileData.getFileName());
				bbsImg.setBbsImgOrgName(fileData.getFileOrgName());
				bbsImg.setBbsImgExt(fileData.getFileExt());
				bbsImg.setBbsImgSize(bbsImg.getBbsImgSize());
				
				
				List<BbsImg> bbsImgList = new ArrayList<>();
		        bbsImgList.add(bbsImg);
		        
		        bbs.setBbsImg(bbsImgList);
			}
			
			try
			{
				if(bbsService.bbsInsert(bbs) > 0)
				{
					ajaxResponse.setResponse(0, "success");
				}
				else
				{
					ajaxResponse.setResponse(500, "internal server error");
				}
			}
			catch(Exception e)
			{
				logger.error("[HiBoardController]writerProc Exception",e);
				ajaxResponse.setResponse(403, "internal server eroor");
			}
		}
		else
		{
			ajaxResponse.setResponse(400,"bad request");
		}
		
		return ajaxResponse;
	}
		
	@RequestMapping(value = "/bbs/uploadImage", method = RequestMethod.POST)
	@ResponseBody
	public JsonObject uploadImage(MultipartHttpServletRequest request) {
		JsonObject jsonObject = new JsonObject();
		
		FileData fileData = HttpUtil.getFile(request, "file", UPLOAD_IMG_TEMP_DIR);
		StringBuilder srcFile = new StringBuilder();
		
		srcFile.append("/resources/bbs/temp/").append(fileData.getFileName());
		jsonObject.addProperty("url", srcFile.toString());
		jsonObject.addProperty("orgName", fileData.getFileOrgName());
	
		return jsonObject;
	}
	
	@RequestMapping(value ="/community/board_updateProc", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object>updateProc(MultipartHttpServletRequest request, HttpServletResponse response)
	{
		Response<Object>ajaxResponse = new Response<Object>();
		
		long curPage = HttpUtil.get(request, "curPage", (long)1);
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		String searchType = HttpUtil.get(request, "searchType");
		String searchValue = HttpUtil.get(request, "searchValue");
		String bbsTitle = HttpUtil.get(request, "title", "");
		String bbsContent = HttpUtil.get(request, "content", "");
		String category = HttpUtil.get(request, "category", "");
		FileData fileData = HttpUtil.getFile(request,"file_name", UPLOAD_SAVE_DIR);
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		logger.debug("bbsTitle :" + bbsTitle);
		logger.debug("bbsContent :" + bbsContent);
		logger.debug("bbsSeq : " + bbsSeq);
		
		if(bbsSeq > 0 && !StringUtil.isEmpty(bbsTitle) && !StringUtil.isEmpty(category) && !StringUtil.isEmpty(bbsContent))
		{
			Bbs bbs = bbsService.bbsSelect(bbsSeq);
			
			if(bbs != null)
			{
				if(StringUtil.equals(bbs.getUserEmail(), cookieUserId))
				{
					bbs.setBbsTitle(bbsTitle);
					bbs.setBbsContent(bbsContent);
					bbs.setBbsSubCateCombinedId(category);
					bbs.setBbsSeq(bbsSeq);
					
					if(fileData != null && fileData.getFileSize() >0)
					{
						BbsImg bbsImg = new BbsImg();
						
						bbsImg.setBbsImgName(fileData.getFileName());
						bbsImg.setBbsImgOrgName(fileData.getFileOrgName());
						bbsImg.setBbsImgExt(fileData.getFileExt());
						bbsImg.setBbsImgSize(fileData.getFileSize());
						
						List<BbsImg> bbsImgList = new ArrayList<>();
				        bbsImgList.add(bbsImg);
				        
				        bbs.setBbsImg(bbsImgList);
					}
					
					try
					{
						if(bbsService.bbsUpdate(bbs) > 0)
						{
							ajaxResponse.setResponse(0, "success");
						}
						else
						{
							ajaxResponse.setResponse(500, "internal server error");
						}
					}
					catch(Exception e)
					{
						logger.error("[BbsController]update Exception", e);
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
				ajaxResponse.setResponse(404,"not found");
			}	
		}
		else
		{
			ajaxResponse.setResponse(404, "not found");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value ="/bbs/bbsDelete", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> deleteProc(HttpServletRequest request, HttpServletResponse response)
	{
		Response<Object> ajaxResponse = new Response<Object>();
		
		String cookieUserId = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		
		logger.debug("cookieUserId : "+cookieUserId );
		
		long bbsSeq = HttpUtil.get(request, "bbsSeq", (long)0);
		
		if(bbsSeq > 0 )
		{
			Bbs bbs = bbsService.bbsView(bbsSeq);
			
			if(bbs != null)
			{
				if(StringUtil.equals(cookieUserId, bbs.getUserEmail()))
				{
					try
					{
						if(bbsService.bbsDelete(bbsSeq)> 0)
						{
							ajaxResponse.setResponse(0, "success");
						}
						else
						{
							ajaxResponse.setResponse(500, "server error1");
						}
					}
					catch(Exception e)
					{
						logger.error("[BoardController]delete Exception", e);
						ajaxResponse.setResponse(500, "server error2");
					}
				}
				else
				{
					ajaxResponse.setResponse(404, "not found");
				}
			}
			else
			{
				ajaxResponse.setResponse(400, "bad Reques;t");
			}
		}
				
		return ajaxResponse;
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
}