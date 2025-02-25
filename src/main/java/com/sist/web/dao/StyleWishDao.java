package com.sist.web.dao;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.sist.web.model.StyleWishList;

@Repository("styleWishDao")
public interface StyleWishDao 
{
	//스타일 위시리스트 추가
	public int styleWishListAdd(StyleWishList styleWishList);
	//스타일 위시리스트 삭제
	public int styleWishListDel(StyleWishList styleWishList);
	
	//스타일 위시리스트 개수
	public long styleWishListCount(String userEmail);
	//스타일 위시리스트 리스트
	public List<StyleWishList>styleWishList(String userEmail);
	
	public long styleWishSelect(StyleWishList styleWishList);
	
}
