package com.sist.web.service;

import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.web.dao.CartDao;
import com.sist.web.model.Cart;

@Service
public class CartService {
	public static Logger logger = LoggerFactory.getLogger(CartService.class);

	@Autowired
	private CartDao cartDao;

	public List<Cart> cartList(Map<String, Object> hashMap) {
		List<Cart> cartList = null;

		try {
			cartList = cartDao.cartList(hashMap);

		} catch (Exception e) {
			logger.error("[CartService] cartList Exception", e);
		}

		return cartList;
	}

	public String cartInsertCheck(Cart cart) {
		String canInsert = "";

		try {
			canInsert = cartDao.cartInsertCheck(cart);

		} catch (Exception e) {
			logger.error("[CartService] cartInsertCheck Exception", e);
		}

		return canInsert;
	}

	public boolean cartInsert(Cart cart) {
		int cnt = 0;

		try {
			cnt = cartDao.cartInsert(cart);

		} catch (Exception e) {
			logger.error("[CartService] cartList Exception", e);
		}

		return (cnt == 1);
	}

	public boolean cartUpdate(Cart cart) {
		int cnt = 0;

		try {
			cnt = cartDao.cartUpdate(cart);
		} catch (Exception e) {
			logger.error("[CartService] cartUpdate Exception", e);
		}

		return (cnt == 1);
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public boolean cartDelete(List<Cart> cartList) throws Exception {
		int cnt = 0;

		cnt = cartDao.cartDelete(cartList);

		return (cnt > 0);
	}

	public long getStock(Cart cart) {
		long variantsOptionValueCombStock = -1L;

		try {
			variantsOptionValueCombStock = cartDao.getStock(cart);

		} catch (Exception e) {
			logger.error("[CartService] getStock Exception", e);
		}

		return variantsOptionValueCombStock;
	}

	public long getTotalProdPrice(Map<String, Object> hashMap) {
		long totalProdPrice = -1L;

		try {
			totalProdPrice = cartDao.getTotalProdPrice(hashMap);
		} catch (Exception e) {
			logger.error("[CartService] getTotalProdPrice Exception", e);
		}

		return totalProdPrice;
	}
}