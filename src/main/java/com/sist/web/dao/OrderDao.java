package com.sist.web.dao;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.sist.web.model.Cart;
import com.sist.web.model.Order;
import com.sist.web.model.OrderProd;
import com.sist.web.model.Payment;
import com.sist.web.model.Refund;
import com.sist.web.model.RefundProd;

@Repository
public interface OrderDao {
	// 제품 재고 감소
	public int variantsOptionValueCombStockMinus(Cart cart);
	
	// 주문 insert
	public int orderInsert(Order order);
	
	// 주문 제품 insert All 
	public boolean orderProdInsertAll(List<OrderProd> orderProdList);
	
	// 주문 상태 업데이트(결제 후)
	public int orderUpdateAfterPaymentInsert(Map<String, Object> hashMap);
	
	// 주문 상태 업데이트
	public int orderStatusUpdate(Map<String, Object> hashMap);
	
	// 주문 조회 (임시)
	public Order orderSelect(String orderId);
	
	// 주문 제품 리스트
	public List<OrderProd> orderProdList(String orderId);
	
	// 주문 금액 총합
	public long getTotalAmount(String orderId);
	
	// 결제 삽입 (정상적인 결제에만 insert가 일어남)
	public int paymentInsert(Payment payment);

	// 선택한 제품들만 환불하기 위해 금액 총합 계산
	public long getTotalProdPrice(Map<String, Object> hashMap);
	
	// 결제 조회
	public Payment paymentSelect(String orderId);
	
	// 단순 변심으로 인한 결제 취소시 검사
	public String canCancel(String orderId);
	
	// 환불 트랜잭션
	// 1. 환불 INSERT
	public int refundInsert(Refund refund);
	
	// 2. 구매 제품 IS_REFUNDED 업데이트
	public int orderProdIsRefundedUpdate(Map<String, Object> hashMap);
	
	// 3. 구매 제품 환불 개수 체크
	public int checkAllRefunded(String orderId);
	
	// 4. 구매 상태 업데이트 
	public int paymentStatusUpdate(Map<String, Object> hashMap);
	
	// 5. 환불 제품 INSERT
	public boolean refundProdInsertAll(List<RefundProd> refundProdList);
	
	// 6. 환불 제품 리스트
	public List<RefundProd> refundProdList(String orderId);
	
	// 제품 재고 복구(결제 취소시)
	public int variantsOptionValueCombStockPlus(RefundProd refundProd);
	// 제품 재고 복구(주문 취소시)
	public int variantsOptionValueCombStockRestore(String orderId);
	// 주문 제품 취소(주문 취소)
	public int orderProdCancel(String orderId);
	
	public List<Order> orderEndList(Order order);
	public long orderEndCount(String userEmail);
	
	public List<Order> orderProgressingList(Order order);
	public long orderProgressingCount(String userEmail);
	
	public List<Order> orderAllList(Order order);
	public List<Order> orderDetail(Order order);
	public long orderAllCount(String userEmail);
	
	public List<Order> myPageOrder(String userEmail);
}