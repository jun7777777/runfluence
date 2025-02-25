package com.sist.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller("forumController")
public class ForumController {
	public static Logger logger = LoggerFactory.getLogger(ForumController.class);
	
	@RequestMapping(value = "/forum/forumIndex")
	public String forumIndex(HttpServletRequest request, HttpServletResponse response, ModelMap model) {
		return "/forum/forumIndex";
	}
}
