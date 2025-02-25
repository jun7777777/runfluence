package com.sist.web.controller;

import java.math.BigDecimal;
import java.math.RoundingMode;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.JsonObject;
import com.sist.common.util.StringUtil;
import com.sist.web.model.KakaoPayApproveRequest;
import com.sist.web.model.KakaoPayApproveResponse;
import com.sist.web.model.KakaoPayCancelRequest;
import com.sist.web.model.KakaoPayCancelResponse;
import com.sist.web.model.KakaoPayReadyRequest;
import com.sist.web.model.KakaoPayReadyResponse;
import com.sist.web.model.Order;
import com.sist.web.model.OrderProd;
import com.sist.web.model.Payment;
import com.sist.web.model.Refund;
import com.sist.web.model.Response;
import com.sist.web.service.KakaoPayService;
import com.sist.web.service.OrderService;
import com.sist.web.util.CookieUtil;
import com.sist.web.util.HttpUtil;
import com.sist.web.util.SessionUtil;

@Controller
public class OrderKakaoPayController {
	public static Logger logger = LoggerFactory.getLogger(OrderKakaoPayController.class);
	
	@Autowired
	private OrderService orderService;
	
	@Autowired
	private KakaoPayService kakaoPayService;
	
	@Value("#{env['auth.cookie.name']}")
	private String AUTH_COOKIE_NAME;
	
	@Value("#{env['kakaopay.tid.session.name']}")
	private String KAKAOPAY_TID_SESSION_NAME;
	
	@Value("#{env['kakaopay.order.id.session.name']}")
	private String KAKAOPAY_ORDER_ID_SESSION_NAME;
	
	@RequestMapping(value = "/shop/order/kakaoPay/ready", method = RequestMethod.POST)
	@ResponseBody
	public Response<JsonObject> ready(HttpServletRequest request) {
		Response<JsonObject> ajaxResponse = new Response<>();
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String orderId = HttpUtil.get(request, "orderId", ""); // 주문 번호
		
		Order order = orderService.orderSelect(orderId);
		List<OrderProd> orderProdList = order.getOrderProdList();
		
		if (order != null && orderProdList != null && orderProdList.size() > 0) {
			
			KakaoPayReadyRequest kakaoPayReadyRequest = new KakaoPayReadyRequest();
			kakaoPayReadyRequest.setPartner_order_id(orderId);  // (필수) 주문번호, 최대 100 자리
			kakaoPayReadyRequest.setPartner_user_id(userEmail);  // (필수) 회원 Id, 최대 100 자리
			
			if (orderProdList.size() == 1) {
				kakaoPayReadyRequest.setItem_name(orderProdList.get(0).getOrderProdName());  // (필수) 상품명
				
			} else {
				kakaoPayReadyRequest.setItem_name(orderProdList.get(0).getOrderProdName() + "외 " + (orderProdList.size() - 1) + "건");
			}
			  
			kakaoPayReadyRequest.setItem_code(orderProdList.get(0).getProdId());  // (선택) 상품 코드
			kakaoPayReadyRequest.setQuantity(orderProdList.size());  // (필수) 상품 수량
			kakaoPayReadyRequest.setTotal_amount((int)order.getOrderTotalPrice()); // (필수) 상품 총액 
			kakaoPayReadyRequest.setTax_free_amount(0);  // (필수) 상품 비과세 금액
			
			// 카카오 페이 연동 시작
			KakaoPayReadyResponse kakaoPayReadyResponse = kakaoPayService.ready(kakaoPayReadyRequest);

			// response 세팅하고 리턴
			if (kakaoPayReadyResponse != null) {
				// 카카오 페이 트랜잭션, 아이디 세션 저장
				HttpSession session = request.getSession(true);
				SessionUtil.setSession(session, KAKAOPAY_TID_SESSION_NAME, kakaoPayReadyResponse.getTid());
				SessionUtil.setSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME, orderId);
				
				JsonObject json = new JsonObject();
				
		        json.addProperty("next_redirect_app_url", kakaoPayReadyResponse.getNext_redirect_app_url()); 
		        json.addProperty("next_redirect_mobile_url", kakaoPayReadyResponse.getNext_redirect_mobile_url());
				json.addProperty("next_redirect_pc_url", kakaoPayReadyResponse.getNext_redirect_pc_url()); 
				json.addProperty("android_app_scheme", kakaoPayReadyResponse.getAndroid_app_scheme());
				json.addProperty("ios_app_scheme", kakaoPayReadyResponse.getIos_app_scheme());
				json.addProperty("created_at", kakaoPayReadyResponse.getCreated_at());
		        
				ajaxResponse.setResponse(200, "결제 코드가 준비되었습니다.", json);
				
			} else {
				ajaxResponse.setResponse(500, "카카오 페이 결제 준비중 오류가 발생했습니다.");
			}
		
		} else {
			ajaxResponse.setResponse(400, "등록된 상품이 없습니다.");
		}
		
		return ajaxResponse;
	}
	
	// 카카오페이 결제 승인
	@RequestMapping(value = "/shop/order/kakaoPay/success", method = RequestMethod.GET)
	public String success(Model model, HttpServletRequest request) {
		String userEmail = CookieUtil.getHexValue(request, AUTH_COOKIE_NAME);
		String pg_token = HttpUtil.get(request, "pg_token", "");
		String tid = null;
		String orderId = null;
		
		// false : 세션이 존재하지 않을 경우, 새로운 세션을 생성하지 않고 null 반환
		// 기존 세션 존재한다면 그 세션을 반환
		HttpSession session = request.getSession(false);
		if (session != null) {
			tid = (String) SessionUtil.getSession(session, KAKAOPAY_TID_SESSION_NAME);
			orderId = (String) SessionUtil.getSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME);
		}
		
		logger.info("pg token : [" + pg_token + "]");
		logger.info("tid : [" + tid + "]");
		
		if (!StringUtil.isEmpty(pg_token) && !StringUtil.isEmpty(tid)) {
			KakaoPayApproveRequest kakaoPayApproveRequest = new KakaoPayApproveRequest();
			kakaoPayApproveRequest.setTid(tid);
			kakaoPayApproveRequest.setPartner_order_id(orderId);
			kakaoPayApproveRequest.setPartner_user_id(userEmail);
			kakaoPayApproveRequest.setPg_token(pg_token);
			
			// 결제 승인 요청
			KakaoPayApproveResponse kakaoPayApproveResponse = kakaoPayService.approve(kakaoPayApproveRequest);
			
			if (kakaoPayApproveResponse != null) {
				logger.info("[OrderKakaoPayController] approve KakaoPayApproveResponse :  \n" + kakaoPayApproveResponse);
				
				if (kakaoPayApproveResponse.getError_code() == 0) {
					
					Payment payment = new Payment();
					payment.setOrderId(kakaoPayApproveResponse.getPartner_order_id());
					payment.setPaymentAmount(kakaoPayApproveResponse.getAmount().getTotal());
					payment.setPaymentMethod("카카오페이(" + kakaoPayApproveResponse.getPayment_method_type() + ")");
					payment.setPaymentStatus("결제 완료");
					payment.setPaymentCode(tid);
					
					try {
						if (orderService.paymentInsert(payment)) {
							model.addAttribute("code", 200);
							model.addAttribute("msg", "카카오페이 결제가 완료됨");
							model.addAttribute("orderId", orderId);
							
						} else {
							model.addAttribute("code", 601);
							model.addAttribute("msg", "DB 정합성 오류");
						}
					} catch (Exception e) {
						logger.error("[OrderKakaoPayController] success Exception", e);
						model.addAttribute("code", 601);
						model.addAttribute("msg", "DB 정합성 오류");
					}
										
				} else {
					model.addAttribute("code", 400);
					model.addAttribute("msg", !StringUtil.isEmpty(kakaoPayApproveResponse.getError_message()) ? kakaoPayApproveResponse.getError_message() : "카카오페이 결제 중 오류가 발생하였습니다.");
				}
			
			} else {
				model.addAttribute("code", 500);
				model.addAttribute("msg", "카카오페이 결제 처리중 오류가 발생하였습니다.");
			}
			
			if (!StringUtil.isEmpty(tid) && !StringUtil.isEmpty(orderId)) {
				SessionUtil.removeSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME);
				SessionUtil.removeSession(session, KAKAOPAY_TID_SESSION_NAME);
			}
		}
		
		return "/shop/kakao/result";
	}
	
	// 카카오페이 결제 취소
	/**
	 * 사용자가 3단계 진행중, 변심하여 결제를 더이상 진행하고자 하지 않을 때, 브릿지 페이지
	 * (카카오페이 결제수단으로 이동하는 단계인 “다음” 화면이 뜨는곳) 에서 x 버튼으로 결제를
	 * 더 이상 진행하지 않을 수 있음
	 */
	
	@RequestMapping(value = "/shop/order/kakaoPay/cancel", method = RequestMethod.GET)
	public String cancel(Model model, HttpServletRequest request) {
		String tid = null;
		String orderId = null;
		HttpSession session = request.getSession(false);
		
		// 세션 만들기
		if (session != null) {
			tid = (String)SessionUtil.getSession(session, KAKAOPAY_TID_SESSION_NAME);
			orderId = (String)SessionUtil.getSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME);
		}
		
		// 세션 삭제
		if (!StringUtil.isEmpty(tid) && !StringUtil.isEmpty(orderId)) {
			SessionUtil.removeSession(session, KAKAOPAY_TID_SESSION_NAME);
			SessionUtil.removeSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME);
		}
		
		model.addAttribute("code", 400); // 취소 코드
		model.addAttribute("msg", "카카오페이 결제가 취소되었습니다."); // 취소 메시지
				
		return "/shop/kakao/result";
	}
	
	// 카카오페이 결제 실패
	/**
	 *  결제실패시 redirect url
	 *  비밀번호 틀림
	 *  비밀번호 2차인증 실패
	 *  결제 준비 성공 후 15분 경과 시 기타 등등...
	 */
	
	@RequestMapping(value = "/shop/order/kakaoPay/fail", method = RequestMethod.GET)
	public String fail(Model model, HttpServletRequest request) {
		String tid = null;
		String orderId = null;
		HttpSession session = request.getSession(false);
		
		// 세션 만들기
		if (session != null) {
			tid = (String)SessionUtil.getSession(session, KAKAOPAY_TID_SESSION_NAME);
			orderId = (String)SessionUtil.getSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME);
		}
		
		// 세션 삭제
		if (!StringUtil.isEmpty(tid) && !StringUtil.isEmpty(orderId)) {
			SessionUtil.removeSession(session, KAKAOPAY_TID_SESSION_NAME);
			SessionUtil.removeSession(session, KAKAOPAY_ORDER_ID_SESSION_NAME);
		}
		
		model.addAttribute("code", 400); // 취소 코드
		model.addAttribute("msg", "카카오페이 결제를 실패했습니다."); // 취소 메시지
		
		return "/shop/kakao/result";
	}
	
	/**
	 * 단순 변심으로 인해 결제 후 배송되기 전에 환불하고자 할 경우
	 */
	
	@RequestMapping(value = "/shop/order/kakaoPay/refund", method = RequestMethod.POST)
	@ResponseBody
	public Response<Object> refund(HttpServletRequest request) {
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
				    
				    // 취소 가능 금액
				    long restAmount = discountedTotalAmount - discountedTotalCancelPrice;
				    
				    logger.debug("Original Total Amount: { "+ totalAmount + " }");
				    logger.debug("Total Cancel Price: { " + totalCancelPrice + " }");
				    logger.debug("Discount Rate: { " + discountRate + " }");
				    logger.debug("Discounted Total Amount: { " + discountedTotalAmount + " }");
				    logger.debug("Discounted Total Cancel Price: { " + discountedTotalCancelPrice + " }");
				    logger.debug("restAmount: { " + restAmount + " } ");
				    
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
							KakaoPayCancelRequest kakaoPayCancelRequest = new KakaoPayCancelRequest();
							kakaoPayCancelRequest.setTid(payment.getPaymentCode());
							kakaoPayCancelRequest.setCancel_amount((int)discountedTotalCancelPrice);
							kakaoPayCancelRequest.setCancel_tax_free_amount(0);
							kakaoPayCancelRequest.setCancel_available_amount((int)restAmount);
							KakaoPayCancelResponse kakaoPayCancelResponse = kakaoPayService.cancel(kakaoPayCancelRequest);
							
							if (kakaoPayCancelResponse != null) {
								logger.info("[OrderKakaoPayController] cancel KakaoPayCancelResponse :  \n" + kakaoPayCancelResponse);
							
								if (StringUtil.equals(kakaoPayCancelResponse.getStatus(), "PART_CANCEL_PAYMENT") || StringUtil.equals(kakaoPayCancelResponse.getStatus(), "CANCEL_PAYMENT") ) {
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
										logger.error("[OrderKakaoPayController] cancel Exception", e);
										ajaxResponse.setResponse(500, "DB 정합성 오류 발생(RollBack)");
									}

								} else {
									ajaxResponse.setResponse(402, !StringUtil.isEmpty(kakaoPayCancelResponse.getError_message()) ? kakaoPayCancelResponse.getError_message() : "카카오페이 결제 중 오류가 발생하였습니다.");
								}
								
							} else {
								ajaxResponse.setResponse(502, "카카오 페이 응답 없음");
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