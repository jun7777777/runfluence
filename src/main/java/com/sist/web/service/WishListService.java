package com.sist.web.service;

import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.sist.web.dao.WishListDao;
import com.sist.web.model.WishList;

@Service("wishListService")
public class WishListService {
	public static Logger logger = LoggerFactory.getLogger(WishListService.class);

	@Autowired
	private WishListDao wishListDao;

	public int wishListAdd(WishList wishList) {
		int count = 0;

		try {
			count = wishListDao.wishListAdd(wishList);
		}

		catch (Exception e) {
			logger.error("[WishListService] wishListAdd Exception", e);
		}

		return count;
	}

	public int wishListDel(WishList wishList) {
		int count = 0;

		try {
			count = wishListDao.wishListDel(wishList);
		}

		catch (Exception e) {
			logger.error("[WishListService] wishListDel Exception", e);
		}

		return count;
	}

	public int wishListCount(String userEmail) {
		int count = 0;

		try {
			count = wishListDao.wishListCount(userEmail);
		} catch (Exception e) {
			logger.error("[WishListService] wishListCount Exception", e);
		}
		return count;
	}

	public List<WishList> wishList(String userEmail) {
		List<WishList> wishList = null;

		try {
			wishList = wishListDao.wishList(userEmail);
		} catch (Exception e) {
			logger.error("[WishListService] wishListCount Exception", e);
		}

		return wishList;
	}
}
