package com.sist.web.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.WishList;

@Repository("wishListDao")
public interface WishListDao {
	public int wishListAdd(WishList wishList);

	public int wishListDel(WishList wishList);

	// 위시리스트
	public List<WishList> wishList(String userEmail);

	// 위시리스트 갯수
	public int wishListCount(String userEmail);
}
