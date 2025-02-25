package com.sist.web.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.web.model.Cart;
import com.sist.web.model.Order;
import com.sist.web.model.Response;
import com.sist.web.service.CartService;
import com.sist.web.service.OrderService;
import com.sist.web.service.UserService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;

@Controller
public class OrderController {
	public Logger logger = LoggerFactory.getLogger(OrderController.class);

	@Autowired
	private OrderService orderService;

	@Autowired
	private CartService cartService;

	@Autowired
	private UserService userService;

	@Value("#{env['kakaopay.tid.session.name']}")
	private String KAKAOPAY_TID_SESSION_NAME;

	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;

	@RequestMapping(value = "/shop/orderInsert", method = RequestMethod.POST)
	@ResponseBody

	// 주문 공통 : 결제 시 주문 입력
	public Response<Object> orderInsert(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();

		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		short shippingAddrNum = (short) HttpUtil.get(request, "shippingAddrNum", 0);
		String paymentType = HttpUtil.get(request, "paymentType", "");
		String shippingMemo = HttpUtil.get(request, "shippingMemo", "");

		List<String> prodIdList = new ArrayList<>(Arrays.asList(HttpUtil.get(request, "prodIds", "").split(",", -1)));
		List<String> variantsOptionValueCombIdList = new ArrayList<>(
				Arrays.asList(HttpUtil.get(request, "combIds", "").split(",", -1)));

		List<Map<String, Object>> prodCombList = new ArrayList<>();
		for (int i = 0; i < prodIdList.size(); i++) {
			Map<String, Object> item = new HashMap<>();
			item.put("prodId", prodIdList.get(i));
			item.put("variantsOptionValueCombId", variantsOptionValueCombIdList.get(i));
			prodCombList.add(item);
		}

		Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("userEmail", userEmail);
		hashMap.put("prodCombList", prodCombList);

		List<Cart> cartList = cartService.cartList(hashMap);
		long totalProdPrice = cartService.getTotalProdPrice(hashMap);

		String userGrade = userService.userSelect(userEmail).getUserGrade();
		double orderDiscountRate = 0.0;

		switch (userGrade) {
		case "BRONZE":
			orderDiscountRate = 1.0;
			break;

		case "SILBER":
			orderDiscountRate = 1.5;
			break;

		case "GOLD":
			orderDiscountRate = 2.0;
			break;

		case "PLATINUM":
			orderDiscountRate = 3.0;
			break;
		}

        BigDecimal totalProdPriceBD = new BigDecimal(totalProdPrice);  // 제품 총 가격
        BigDecimal orderDiscountRateBD = new BigDecimal(orderDiscountRate).divide(new BigDecimal(100));  // 할인율
        BigDecimal totalDiscountPriceBD = totalProdPriceBD.multiply(orderDiscountRateBD) .setScale(0, RoundingMode.HALF_UP);  
        long totalDiscountPrice = totalDiscountPriceBD.longValue();
		
		int orderShippingCost = 5000;

		if (totalProdPrice - totalDiscountPrice > 100000) {
			orderShippingCost = 0;
		}

		long orderTotalPrice = totalProdPrice - totalDiscountPrice + orderShippingCost;

		Order order = new Order();
		order.setUserEmail(userEmail);
		order.setOrderDiscountRate(orderDiscountRate);
		order.setOrderSumPrice(totalProdPrice);
		order.setOrderTotalPrice(orderTotalPrice);
		order.setShippingAddrNum(shippingAddrNum);
		order.setOrderShippingCost(orderShippingCost);
		order.setPaymentType(paymentType);
		order.setShippingMemo(shippingMemo);

		try {
			if (orderService.orderInsert(cartList, order)) {
				ajaxResponse.setResponse(200, "주문 데이터 생성됨", order);
			} else {
				ajaxResponse.setResponse(502, "데이터 정합성 오류");
			}

		} catch (IllegalArgumentException iae) {
			logger.warn("[OrderController] orderInsert IllegalArgumentException", iae);
			ajaxResponse.setResponse(406, "요청 수량이 재고보다 많음");

		} catch (DataAccessException dae) {
			logger.error("[OrderController] orderInsert DataAccessException", dae);
			ajaxResponse.setResponse(503, "서버 오류: 재고 정보 처리 실패");

		} catch (Exception e) {
			logger.error("[OrderController] orderInsert Exception", e);
			ajaxResponse.setResponse(520, "DB 정합성 오류");
		}

		return ajaxResponse;
	}
	
	@RequestMapping(value = "/shop/orderProdList", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> orderProdList(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String orderId = HttpUtil.get(request, "orderId", "");
		
		if (orderId != null) {
			Order order = orderService.orderSelect(orderId);
			ajaxResponse.setResponse(200, "List Success", order);

		} else {
			ajaxResponse.setResponse(500, "Bad Request");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/shop/order/cancel", method = RequestMethod.POST) 
	@ResponseBody
	public Response<Object> orderCancel(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String orderId = HttpUtil.get(request, "orderId", "");
		
		
		if (orderId != null) {
			Order order = orderService.orderSelect(orderId);
			
			if (order != null) {
				try {
					if (orderService.orderCancel(orderId)) {
						ajaxResponse.setResponse(200, "주문 취소됨");
						
					} else {
						ajaxResponse.setResponse(500, "DB 정합성 오류 발생");
					}
					
				} catch (Exception e) {
					logger.error("[OrderController] cancel Exception", e);
					ajaxResponse.setResponse(500, "DB 정합성 오류 발생");
				}
				
			} else {
				ajaxResponse.setResponse(404, "주문 데이터 존재하지 않음");
			}
		}
		
		return ajaxResponse;
	}
}