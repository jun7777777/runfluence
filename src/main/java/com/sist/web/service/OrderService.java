package com.sist.web.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sist.common.util.StringUtil;
import com.sist.web.dao.CartDao;
import com.sist.web.dao.OrderDao;
import com.sist.web.model.Cart;
import com.sist.web.model.Order;
import com.sist.web.model.OrderProd;
import com.sist.web.model.Payment;
import com.sist.web.model.Refund;
import com.sist.web.model.RefundProd;


@Service
public class OrderService 
{
	public Logger logger = LoggerFactory.getLogger(OrderService.class);
	
	@Autowired
	private OrderDao orderDao;

	@Autowired
	private CartDao cartDao;

	// 재고 업데이트, 주문, 주문 제품 삽입
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public boolean orderInsert(List<Cart> cartList, Order order) throws Exception {
		int cntA = 0;
		int cntB = 0;
		int cntC = 0;
		boolean flag = false;

		for (Cart cart : cartList) {
			if (cart.getCartQuantity() > cart.getVariantsOptionValueCombStock()) {
				throw new IllegalArgumentException("재고 부족");
			}

			cntA += orderDao.variantsOptionValueCombStockMinus(cart);
		}

		cntB = cartDao.cartDelete(cartList);
		cntC = orderDao.orderInsert(order);

		String orderId = order.getOrderId();

		List<OrderProd> orderProdList = new ArrayList<>();
		for (Cart cart : cartList) {
			OrderProd orderProd = new OrderProd();
			orderProd.setOrderId(orderId);
			orderProd.setOrderProdDiscountPercent(cart.getProdDiscountPercent());
			orderProd.setOrderProdPrice(cart.getProdPrice());
			orderProd.setOrderProdQuantity(cart.getCartQuantity());
			orderProd.setProdId(cart.getProdId());
			orderProd.setVariantsOptionValueCombId(cart.getVariantsOptionValueCombId());
			orderProd.setOrderProdName(cart.getProdName());
			orderProdList.add(orderProd);
		}

		flag = orderDao.orderProdInsertAll(orderProdList);

		return (cntA == cartList.size() && cntB > 0 && cntC == 1 && flag);
	}

	// 주문 제품 리스트 조회
	public List<OrderProd> orderProdList(String orderId) {
		List<OrderProd> orderProdList = null;

		try {
			orderProdList = orderDao.orderProdList(orderId);
		} catch (Exception e) {
			logger.error("[OrderService] orderProdList Exception", e);
		}

		return orderProdList;
	}

	// 주문 제품 전체 금액 (환불 제품 제외됨)
	public long getTotalAmount(String orderId) {
		long totalAmount = -1L;

		try {
			totalAmount = orderDao.getTotalAmount(orderId);

		} catch (Exception e) {
			logger.error("[OrderService] getTotalAmount Exception", e);
		}

		return totalAmount;
	}

	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public boolean paymentInsert(Payment payment) throws Exception {
		int cntA = 0;
		int cntB = 0;

		try {
			cntA = orderDao.paymentInsert(payment);
			Map<String, Object> hashMap = new HashMap<>();
			hashMap.put("orderId", payment.getOrderId());
			hashMap.put("orderStatus", payment.getPaymentStatus());
			
			String paymentMethod = payment.getPaymentMethod();
			
			if (paymentMethod.startsWith("네이버페이")) {
				hashMap.put("paymentType", "NAVER_PAY");
			
			} else if (paymentMethod.startsWith("카카오페이")) {
				hashMap.put("paymentType", "KAKAO_PAY");
				
			} else if (paymentMethod.startsWith("토스페이")) {
				hashMap.put("paymentType", "TOSS_PAY");
			} 
			
			cntB = orderDao.orderUpdateAfterPaymentInsert(hashMap);

		} catch (Exception e) {
			logger.error("[OrderService] paymentInsert Exception", e);
		}

		return (cntA == 1 && cntB == 1);
	}

	// 결제 상태 업데이트
	public boolean orderStatusUpdate(Map<String, Object> hashMap) {
		int cnt = 0;

		try {
			cnt = orderDao.orderStatusUpdate(hashMap);
			
		} catch (Exception e) {
			logger.error("[OrderService] orderStatusUpdate Exception", e);
		}

		return (cnt == 1);
	}

	// 단일 주문 조회
	public Order orderSelect(String orderId) {
		Order order = null;

		try {
			order = orderDao.orderSelect(orderId);
			order.setOrderProdList(orderDao.orderProdList(orderId));

		} catch (Exception e) {
			logger.error("[OrderService] orderSelect Exception", e);
		}

		return order;
	}

	// 선택한 제품들만 환불하기 위한 금액 총합 계산(이미 환불된 제품은 제외)
	public long getTotalProdPrice(Map<String, Object> hashMap) {
		long totalProdPrice = -1L;

		try {
			totalProdPrice = orderDao.getTotalProdPrice(hashMap);

		} catch (Exception e) {
			logger.error("[OrderService] getTotalProdPrice Exception", e);
		}

		return totalProdPrice;
	}

	// 결제 조회
	public Payment paymentSelect(String orderId) {
		Payment payment = null;

		try {
			payment = orderDao.paymentSelect(orderId);

		} catch (Exception e) {
			logger.error("[OrderService] paymentSelect Exception", e);
		}

		return payment;
	}

	// 단순 변심으로 인한 취소 가능 여부 조회
	public boolean canCancel(String orderId) {
		String canCancel = "NOT_ALLOWED";

		try {
			canCancel = orderDao.canCancel(orderId);

		} catch (Exception e) {
			logger.error("[OrderService] canCancel Exception", e);
		}

		return StringUtil.equals(canCancel, "ALLOWED") ? true : false;
	}

	// (결제 취소 트랜잭션, 단순 변심)
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public boolean refundInsert(Refund refund, Map<String, Object> hashMap) throws Exception {
		int cntA = 0;
		int cntB = 0;
		int cntC = 0;
		boolean flagD = false;
		int cntE = 0;

		// 1. 환불 삽입
		cntA = orderDao.refundInsert(refund);

		// 2. 주문 제품의 IS_REFUNDED 컬럼 업데이트
		cntB = orderDao.orderProdIsRefundedUpdate(hashMap);

		// 3. 모두 환불되었는지 검사
		boolean isAllRefunded = orderDao.checkAllRefunded(refund.getOrderId()) == 0;

		Map<String, Object> paramsMap = new HashMap<>();

		paramsMap.put("orderId", refund.getOrderId());

		if (isAllRefunded) {
			paramsMap.put("paymentStatus", "결제 취소");

		} else {
			paramsMap.put("paymentStatus", "결제 완료(부분 취소)");
		}

		// 4. 결제 상태 업데이트 (트리거로 주문도 처리됨)
		cntC = orderDao.paymentStatusUpdate(paramsMap);

		// 5. 환불 제품 INSERT ALL
		List<RefundProd> refundProdList = new ArrayList<>();
		@SuppressWarnings("unchecked")
		List<Map<String, Object>> prodCombList = (List<Map<String, Object>>) hashMap.get("prodCombList");
		for (Map<String, Object> prodCombMap : prodCombList) {
			RefundProd refundProd = new RefundProd();
			refundProd.setOrderId(refund.getOrderId());
			refundProd.setProdId((String) prodCombMap.get("prodId"));
			refundProd.setRefundNum(refund.getRefundNum());
			refundProd.setVariantsOptionValueCombId((String) prodCombMap.get("variantsOptionValueCombId"));
			refundProdList.add(refundProd);
		}
		flagD = orderDao.refundProdInsertAll(refundProdList);

		// 6. INSERT 된 환불 제품을 토대로 재고 증가
		refundProdList = orderDao.refundProdList(refund.getOrderId());

		for (RefundProd refundProd : refundProdList) {
			cntE += orderDao.variantsOptionValueCombStockPlus(refundProd);
		}

		return (cntA == 1 && cntB > 0 && cntC == 1 && flagD && cntE > 0);
	}
	
	public List<Order> orderEndList(Order order)
	{
		List<Order> list = null;
		
		try 
		{
			list = orderDao.orderEndList(order);
		}
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderEndList Exception", e);
		}
		
		return list;
	}
	
	public long orderEndCount(String userEmail)
	{
		long count = 0;
		
		try 
		{
			count = orderDao.orderEndCount(userEmail);
		}
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderEndCount Exception", e);
		}
		
		return count;
	}
	
	public List<Order> orderProgressingList(Order order)
	{
		List<Order> list = null;
		
		try 
		{
			list = orderDao.orderProgressingList(order);
		} 
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderProgressingList Exception", e);
		}
		
		return list;
	}
	
	public long orderProgressingCount(String userEmail)
	{
		long count = 0;
		
		try 
		{
			count = orderDao.orderProgressingCount(userEmail);
		}
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderProgressingCount Exception", e);
		}
		
		return count;
	}
	
	public List<Order> orderAllList(Order order)
	{
		List<Order> list = null;
		
		try 
		{
			list = orderDao.orderAllList(order);
		} 
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderAllList Exception", e);
		}
		
		return list;
	}
	
	public List<Order> orderDetail(Order order)
	{
		List<Order> list = null;
		
		try 
		{
			list = orderDao.orderDetail(order);
		} 
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderDetail Exception", e);
		}
		
		return list;
	}
	
	public long orderAllCount(String userEmail)
	{
		long count = 0;
		
		try 
		{
			count = orderDao.orderAllCount(userEmail);
		}
		
		catch (Exception e) 
		{
			logger.error("[OrderService] orderAllCount Exception", e);
		}
		
		return count;
	}
	
	@Transactional(propagation = Propagation.REQUIRED, rollbackFor = Exception.class)
	public boolean orderCancel(String orderId) throws Exception {
		Map<String, Object> hashMap = new HashMap<>();
		hashMap.put("orderStatus", "주문 취소");
		hashMap.put("orderId", orderId);
		
		int cntA = orderDao.orderStatusUpdate(hashMap);
		int cntB = orderDao.variantsOptionValueCombStockRestore(orderId);
		int cntC = orderDao.orderProdCancel(orderId);
		
		return (cntA == 1 && cntB > 0 && cntC > 0);
	}
	
	public List<Order> myPageOrder(String userEmail)
	{
		List<Order> list = null;
		
		try 
		{
			list = orderDao.myPageOrder(userEmail);
		} 
		
		catch (Exception e) 
		{
			logger.error("[OrderService] myPageOrder Exception", e);
		}
		
		return list;
	}
}