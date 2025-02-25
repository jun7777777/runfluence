package com.sist.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Cart;

@Repository
public interface CartDao {
	// 특정 사용자의 장바구니 제품 리스트
	public List<Cart> cartList(Map<String, Object> hashMap);
	
	// 장바구니에서 제품 추가 가능한지 여부
	public String cartInsertCheck(Cart cart);
	
	// 장바구니에서 제품 추가
	public int cartInsert(Cart cart);	
	
	// 장바구니에서 제품 리스트 삭제
	public int cartDelete(List<Cart> cartList);
	
	// 장바구니에 등록된 제품 수량 수정
	public int cartUpdate(Cart cart);
	
	// 재고 조회
	public long getStock(Cart cart);	
	
	// 장바구니 제품 수량 * 제품 테이블 가격 합계 조회
	public long getTotalProdPrice(Map<String, Object> hashMap);
}