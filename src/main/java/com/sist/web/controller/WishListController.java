package com.sist.web.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.common.util.StringUtil;
import com.sist.web.model.Response;
import com.sist.web.model.WishList;
import com.sist.web.service.WishListService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller("wishListController")
public class WishListController {
	public static Logger logger = LoggerFactory.getLogger(WishListController.class);

	@Autowired
	private WishListService wishListService;

	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;

	@RequestMapping(value = "/wishlist/add")
	@ResponseBody
	public Response<Object> addWishList(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> res = new Response<Object>();

		String prodId = HttpUtil.get(request, "prodId", "");
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

		WishList wishList = new WishList();

		if (!StringUtil.isEmpty(prodId) && !StringUtil.isEmpty(userEmail)) {
			wishList.setProdId(prodId);
			wishList.setUserEmail(userEmail);

			if (wishListService.wishListAdd(wishList) > 0) {
				res.setResponse(0, "success");
			}

			else {
				res.setResponse(500, "server error");
			}

		}

		else {
			res.setResponse(404, "error");
		}

		return res;
	}

	@RequestMapping(value = "/wishlist/del")
	@ResponseBody
	public Response<Object> delWishList(HttpServletRequest request, HttpServletResponse response) {
		Response<Object> res = new Response<Object>();

		String prodId = HttpUtil.get(request, "prodId", "");
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);

		WishList wishList = new WishList();

		if (!StringUtil.isEmpty(prodId) && !StringUtil.isEmpty(userEmail)) {
			wishList.setProdId(prodId);
			wishList.setUserEmail(userEmail);

			if (wishListService.wishListDel(wishList) > 0) {
				res.setResponse(0, "success");
			} else {
				res.setResponse(-1, "server error");
			}
		} else {
			res.setResponse(404, "notFound");
		}

		return res;
	}
}