package com.sist.web.controller;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.web.model.Cart;
import com.sist.web.model.Response;
import com.sist.web.service.CartService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller
public class CartController {
	public static Logger logger = LoggerFactory.getLogger(CartController.class);

	@Autowired
	private CartService cartService;
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	// 장바구니 추가 ajax 통신
	@RequestMapping(value = "/shop/cartInsert", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> insert(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String prodId = HttpUtil.get(request, "prodId", "");
		String variantsOptionValueCombId = HttpUtil.get(request, "variantsOptionValueCombId", "DEFAULT");
		short cartQuantity = (short)HttpUtil.get(request, "cartQuantity", 1);
		
		Cart cart = new Cart();
		cart.setUserEmail(userEmail);
		cart.setProdId(prodId);
		cart.setVariantsOptionValueCombId(variantsOptionValueCombId);
		cart.setCartQuantity(cartQuantity);
				

		String canInsert = cartService.cartInsertCheck(cart);
				
		switch (canInsert) {
		    case "DUPLICATE": {
		        ajaxResponse.setResponse(409, "데이터 중복");
		        break;
		    }
		    case "OUT_OF_STOCK": {
		        ajaxResponse.setResponse(400, "재고 부족 혹은 소진");
		        break;
		    }
		    case "INSERT": {
		    	if (cartService.cartInsert(cart)) {
		    		ajaxResponse.setResponse(200, "장바구니 추가 완료");
		    	
		    	} else {
					ajaxResponse.setResponse(500, "DB 정합성 오류");
		    	}
		    	
		    	break;
		    }
		} 
			
		return ajaxResponse;
	}
	
	// 장바구니 제품 수량 조절 ajax 통신
	@RequestMapping(value = "/shop/cartUpdate", method = RequestMethod.POST) 
	@ResponseBody
	public Response<Object> cartUpdate(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String prodId = HttpUtil.get(request, "prodId", "");
		String variantsOptionValueCombId = HttpUtil.get(request, "variantsOptionValueCombId", "");
		short cartQuantity = (short)HttpUtil.get(request, "cartQuantity", 1);
		
		Cart cart = new Cart();
		
		cart.setUserEmail(userEmail);
		cart.setProdId(prodId);
		cart.setVariantsOptionValueCombId(variantsOptionValueCombId);
		cart.setCartQuantity(cartQuantity);
		
		long variantsOptionValueCombStock = cartService.getStock(cart);
		
		if (variantsOptionValueCombStock < 0) {
		    ajaxResponse.setResponse(500, "DB 정합성 오류");

		}
		
		else if (variantsOptionValueCombStock == 0) {
			List<Cart> cartList = new ArrayList<>();
			cartList.add(cart);
			
			try {
				if (cartService.cartDelete(cartList)) {
			        ajaxResponse.setResponse(400, "재고 소진");
			    } 
				
			    else {
			        ajaxResponse.setResponse(500, "DB 정합성 오류");
			    }
				
			} catch (Exception e) {
				ajaxResponse.setResponse(500, "DB 정합성 오류(롤백)");
				logger.error("[CartController] cartUpdate Exception", e);
			}
		} 
		
		else {
			
			if (cartQuantity > variantsOptionValueCombStock) {
				ajaxResponse.setResponse(400, "재고 부족", variantsOptionValueCombStock);
		    } 
			
		    else {
		    	
		    	if (cartService.cartUpdate(cart)) {
		            ajaxResponse.setResponse(200, "장바구니 수량 수정 완료", variantsOptionValueCombStock);
		        } 
		    	
		    	else {
		            ajaxResponse.setResponse(500, "DB 정합성 오류");
		        }
		    }
		}

		return ajaxResponse;
	}
	
	// 장바구니 제품 제거 ajax통신
	@RequestMapping(value = "/shop/cartDelete", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> cartDelete(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		List<String> prodIdList = new ArrayList<>(Arrays.asList(HttpUtil.get(request, "prodIds", "").split(",", -1)));
		List<String> variantsOptionValueCombIdList = new ArrayList<>(Arrays.asList(HttpUtil.get(request, "combIds", "").split(",", -1)));
		List<Cart> cartList = new ArrayList<>();
		
		for (int i = 0; i < prodIdList.size(); i++) {
			Cart cart = new Cart();
			cart.setUserEmail(userEmail);
			cart.setProdId(prodIdList.get(i));
			cart.setVariantsOptionValueCombId(variantsOptionValueCombIdList.get(i));
			cartList.add(cart);
		}
		
		try {
			if (cartService.cartDelete(cartList)) {
				ajaxResponse.setResponse(200, "장바구니 제품 제거됨");
			
			} else {
				ajaxResponse.setResponse(500, "DB 정합성 오류");
			}
			
		} catch (Exception e) {
			ajaxResponse.setResponse(500, "DB 정합성 오류(롤백)");
			logger.error("[CartController] cartDelete Exception", e);
		}

		return ajaxResponse;
	}
}