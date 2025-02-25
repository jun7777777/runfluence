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
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sist.common.util.StringUtil;
import com.sist.web.model.Order;
import com.sist.web.model.Payment;
import com.sist.web.model.Refund;
import com.sist.web.model.Response;
import com.sist.web.model.TossPayApproveRequest;
import com.sist.web.model.TossPayCancelRequest;
import com.sist.web.model.TossPayResponse;
import com.sist.web.service.OrderService;
import com.sist.web.service.TossPayService;
import com.sist.web.util.HttpUtil;

@Controller
public class OrderTossPayController {
	public Logger logger = LoggerFactory.getLogger(OrderTossPayController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private TossPayService tossPayService;
	
	@RequestMapping(value = "/shop/order/tossPay/success")
	@ResponseBody
	public Response<Object> success(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String orderId = HttpUtil.get(request, "orderId", "");
		String paymentKey = HttpUtil.get(request, "paymentKey", "");
		long amount = HttpUtil.get(request, "amount", -1L);
		
		Order order = orderService.orderSelect(orderId);
		
		if (order != null && order.getOrderTotalPrice() == amount) {
			
			TossPayApproveRequest tossPayApproveRequest = new TossPayApproveRequest();
			
			tossPayApproveRequest.setPaymentKey(paymentKey);
			tossPayApproveRequest.setOrderId(orderId);
			tossPayApproveRequest.setAmount(amount);
			
			TossPayResponse tossPayResponse = tossPayService.approve(tossPayApproveRequest);
			
			if (tossPayResponse != null) {
				logger.info("[OrderTossPayController] approve TossPayResponse :  \n" + tossPayResponse);
				
				if (StringUtil.equals(tossPayResponse.getStatus(), "DONE")) {
					Payment payment = new Payment();
					payment.setOrderId(orderId);
					payment.setPaymentAmount((tossPayResponse.getTotalAmount().longValue()));
					payment.setPaymentMethod("토스페이(" + tossPayResponse.getMethod() + ")");
					payment.setPaymentCode(tossPayResponse.getPaymentKey());
					payment.setPaymentStatus("결제 완료");
					
					try {
						if (orderService.paymentInsert(payment)) {
							ajaxResponse.setResponse(200, "토스 페이 결제가 완료됨");
							
						} else {
							ajaxResponse.setResponse(601, "DB 정합성 오류");
						}
						
					} catch (Exception e) {
						logger.error("[OrderTossPayController] success Exception", e);
						ajaxResponse.setResponse(601, "DB 정합성 오류");
					}
				} else {
					ajaxResponse.setResponse(400, !StringUtil.isEmpty(tossPayResponse.getFailure().getMessage()) ? tossPayResponse.getFailure().getMessage() : "토스페이 결제 중 오류가 발생하였습니다.");
				}
				
			} else {
				ajaxResponse.setResponse(500, "토스페이 결제 처리중 오류가 발생하였습니다.");
			}
			
		} else {
			ajaxResponse.setResponse(404, "파라미터가 올바르지 않음");
		}
		
		return ajaxResponse;
	}
	
	@RequestMapping(value = "/shop/order/tossPay/refund")
	@ResponseBody
	public Response<Object> cancel(HttpServletRequest request) {
		Response<Object> ajaxResponse = new Response<>();
		
		String orderId = HttpUtil.get(request, "orderId", "");

		if (!StringUtil.isEmpty(orderId)) {
			Order order = orderService.orderSelect(orderId);
			
			if (order != null) {
				
				if (orderService.canCancel(orderId)) {
					
					List<String> prodIdList = new ArrayList<>(Arrays.asList(HttpUtil.get(request, "prodIds", "").split(",", -1)));
					List<String> variantsOptionValueCombIdList = new ArrayList<>(Arrays.asList(HttpUtil.get(request, "combIds", "").split(",", -1)));
					
				    List<Map<String, Object>> prodCombList = new ArrayList<>();
				    for (int i = 0; i < prodIdList.size(); i++) {
				        Map<String, Object> item = new HashMap<>();
				        item.put("prodId", prodIdList.get(i));
				        item.put("variantsOptionValueCombId", variantsOptionValueCombIdList.get(i));
				        prodCombList.add(item);
				    }
					
				    Map<String, Object> hashMap = new HashMap<>();
				    hashMap.put("orderId", orderId);
				    hashMap.put("prodCombList", prodCombList);
					
				    double discountRate = order.getOrderDiscountRate() / 100.0;

				    long totalAmount = orderService.getTotalAmount(orderId); 
				    long totalCancelPrice = orderService.getTotalProdPrice(hashMap); 
				    BigDecimal discountRateBD = BigDecimal.valueOf(discountRate);

				    // 할인율을 적용한 전체 금액 (반올림)
				    BigDecimal totalAmountBD = BigDecimal.valueOf(totalAmount);
				    long discountedTotalAmount = totalAmountBD.multiply(BigDecimal.ONE.subtract(discountRateBD)).setScale(0, RoundingMode.FLOOR).longValue();

				    // 할인율을 적용한 선택 금액 (반올림)
				    BigDecimal totalCancelPriceBD = BigDecimal.valueOf(totalCancelPrice);
				    long discountedTotalCancelPrice = totalCancelPriceBD.multiply(BigDecimal.ONE.subtract(discountRateBD)).setScale(0, RoundingMode.FLOOR).longValue();
				    long restAmount = discountedTotalAmount - discountedTotalCancelPrice;
				    
				    if (discountedTotalAmount >= 100000) {
				    	if (restAmount < 100000 && restAmount != 0) {
				    		discountedTotalCancelPrice -= 5000;
				    	} 
				    	
				    } else {
				    	if(restAmount == 0) {
				    		discountedTotalCancelPrice += 5000;
				    	}
				    }
				    
				    if (totalAmount > 0 && totalCancelPrice > 0) {
				    	
					    Payment payment = orderService.paymentSelect(orderId);
					    
					    if (payment != null) {
							TossPayCancelRequest tossPayCancelRequest = new TossPayCancelRequest();
							tossPayCancelRequest.setPaymentKey(payment.getPaymentCode());
							tossPayCancelRequest.setCancelReason("단순 변심");
							tossPayCancelRequest.setCancelAmount(discountedTotalCancelPrice);
	
							TossPayResponse tossPayResponse = tossPayService.cancel(tossPayCancelRequest);
							
							if (tossPayResponse != null) {
								logger.info("[OrderTossPayController] cancel TossPayCancelResponse :  \n" + tossPayResponse);
								
							
								if (StringUtil.equals(tossPayResponse.getCancels().get(tossPayResponse.getCancels().size() - 1).getCancelStatus(), "DONE")) {
									Refund refund = new Refund();
									refund.setOrderId(orderId);
									refund.setRefundAmount(discountedTotalCancelPrice);
									refund.setRefundReason("단순 변심");
									refund.setRefundStatus("환불 완료");
									
									try {
										/**
										 * 1. 환불 INSERT
										 * 2. 주문 제품 테이블의 상태 'Y'로 업데이트 (취소된 상품으로 표시) 
										 * 3. 결제 테이블의 결제 상태를 결제 완료(부분 취소)로 함 만약 모든 주문 제품 테이블의 상태가 'Y'라면 결제 취소로 설정
										 * 4. 주문 테이블의 주문 상태는 결제 테이블의 결제 상태가 업데이트 될 때 트리거처리로 동기화됨
										 * 5. 환불 제품 테이블에 환불된 제품들 INSERT 
										 * 6. INSERT된 환불 제품을 토대로 재고 증가
										 */
										
										if (orderService.refundInsert(refund, hashMap)) {
											ajaxResponse.setResponse(200, "선택한 제품들의 결제 취소가 완료됨");
											
										} else {
											ajaxResponse.setResponse(500, "DB 정합성 오류 발생");
										}
										
									} catch (Exception e) {
										logger.error("[OrderTossPayController] cancel Exception", e);
										ajaxResponse.setResponse(500, "DB 정합성 오류 발생(RollBack)");
									}

								} else {
									ajaxResponse.setResponse(402, !StringUtil.isEmpty(tossPayResponse.getFailure().getMessage()) ? tossPayResponse.getFailure().getMessage() : "토스페이 결제 취소중 오류가 발생하였습니다.");
								}
								
							} else {
								ajaxResponse.setResponse(502, "토스 페이 응답 없음");
							}
					    
					    } else {
					    	ajaxResponse.setResponse(404, "결제 데이터 존재하지 않음");
					    }
					    
				    } else {
				    	ajaxResponse.setResponse(400, "금액이 올바르지 않음");
				    }
				    
				} else {
					ajaxResponse.setResponse(409, "취소 불가능한 주문");
				}
			    
			} else {
				ajaxResponse.setResponse(404, "주문 데이터 존재하지 않음");
			}
			
		} else {
			ajaxResponse.setResponse(400, "파라미터 올바르지 않음");
		}
		
		return ajaxResponse;
	}
}