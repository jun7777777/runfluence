package com.sist.web.controller;

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
import com.sist.common.util.StringUtil;
import com.sist.web.model.Bbs;
import com.sist.web.model.Paging;
import com.sist.web.service.BbsService;
import com.sist.web.util.HttpUtil;

@Controller
public class NoticeController {
  public static Logger logger = LoggerFactory.getLogger(UserController.class);

  private static final int LIST_COUNT = 5;
  private static final int PAGE_COUNT = 5;

  @Value("#{env['auth.cookie.name']}")
  private String AUTH_COOKIE_NAME;

  @Autowired
  private BbsService bbsService;

  @RequestMapping(value = "/notice/notice")
  public String notice(HttpServletRequest request, HttpServletResponse response, ModelMap model) {

    long totalCount = 0;
    List<Bbs> list = null;
    Bbs bbs = new Bbs();
    Paging paging = null;
    String searchValue = HttpUtil.get(request, "searchValue");
    long curPage = HttpUtil.get(request, "curPage", (long) 1);



    if (!StringUtil.isEmpty(searchValue)) {
      bbs.setSearchValue(searchValue);
    }
    totalCount = bbsService.noticeTotalCnt(bbs);

    if (totalCount > 0) {

      paging = new Paging("/notice/notice", totalCount, LIST_COUNT, PAGE_COUNT, curPage, "curPage");

      bbs.setStartRow(paging.getStartRow());
      bbs.setEndRow(paging.getEndRow());
      list = bbsService.noticeListSelect(bbs);

    }

    model.addAttribute("list", list);
    model.addAttribute("paging", paging);
    model.addAttribute("curPage", curPage);
    model.addAttribute("totalCount", totalCount);
    model.addAttribute("listCount", LIST_COUNT);
    model.addAttribute("searchValue", searchValue);


    return "/notice/notice";
  }

  @RequestMapping(value = "/notice/qna")
  public String qna(HttpServletRequest request, HttpServletResponse response) {
    return "/notice/qna";
  }

  @RequestMapping(value = "/notice/noticeview")
  public String noticeview(HttpServletRequest request, HttpServletResponse response,
      ModelMap model) {

    long curPage = HttpUtil.get(request, "curPage", (long) 1);
    long bbsSeq = HttpUtil.get(request, "bbsSeq", (long) 0);
    String searchValue = HttpUtil.get(request, "searchValue", "");

    Bbs bbs = null;

    if (bbsSeq > 0) {

      bbs = bbsService.bbsView(bbsSeq);
    }

    model.addAttribute("bbs", bbs);
    model.addAttribute("curPage", curPage);
    model.addAttribute("bbsSeq", bbsSeq);
    model.addAttribute("searchValue", searchValue);


    return "/notice/noticeview";
  }
}
