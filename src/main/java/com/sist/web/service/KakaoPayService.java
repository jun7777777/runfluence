package com.sist.web.service;

import java.util.HashMap;
import java.util.Map;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.sist.common.util.StringUtil;
import com.sist.web.model.KakaoPayApproveRequest;
import com.sist.web.model.KakaoPayApproveResponse;
import com.sist.web.model.KakaoPayCancelRequest;
import com.sist.web.model.KakaoPayCancelResponse;
import com.sist.web.model.KakaoPayReadyRequest;
import com.sist.web.model.KakaoPayReadyResponse;

@Service("kakaoPayService")
public class KakaoPayService {
	public static Logger logger = LoggerFactory.getLogger(KakaoPayService.class);

	// 카카오 페이 Request 헤더
	private HttpHeaders kakaoPayHeaders;

	// Client ID
	@Value("#{env['kakaopay.client.id']}")
	private String KAKAOPAY_CLIENT_ID;

	// Client Secret
	@Value("#{env['kakaopay.client.secret']}")
	private String KAKAOPAY_CLIENT_SECRET;

	// Secret key
	@Value("#{env['kakaopay.secret.key']}")
	private String KAKAOPAY_SECRET_KEY;

	// 카카오페이 Ready URL
	@Value("#{env['kakaopay.ready.url']}")
	private String KAKAOPAY_READY_URL;

	// 카카오페이 Approve URL
	@Value("#{env['kakaopay.approval.url']}")
	private String KAKAOPAY_APPROVAL_URL;

	// 결제 성공 시 URL
	@Value("#{env['kakaopay.client.success.url']}")
	private String KAKAOPAY_CLIENT_SUCCESS_URL;

	// 결제 취소 시 URL
	@Value("#{env['kakaopay.client.cancel.url']}")
	private String KAKAOPAY_CLIENT_CANCEL_URL;

	// 결제 실패 시 URL
	@Value("#{env['kakaopay.client.fail.url']}")
	private String KAKAOPAY_CLIENT_FAIL_URL;
	
	// 결제 취소 시 URL
	@Value("#{env['kakaopay.cancel.url']}")
	private String KAKAOPAY_CANCEL_URL;

	@PostConstruct
	private void postConstruct() {
		kakaoPayHeaders = new HttpHeaders();
		kakaoPayHeaders.set("Authorization", "SECRET_KEY " + KAKAOPAY_SECRET_KEY);
		kakaoPayHeaders.set("Content-Type", "application/json");
	}

	// 카카오페이 결제 준비
	public KakaoPayReadyResponse ready(KakaoPayReadyRequest kakaoPayReadyRequest) {
		KakaoPayReadyResponse kakaoPayReadyResponse = null;

		StringBuilder sb = new StringBuilder();
		sb.append("\n########################")
		  .append("\n#[KakaoPayService] ready")
		  .append("\n########################");

		if (kakaoPayReadyRequest != null) {
			sb.append(kakaoPayReadyRequest.toString());

			Map<String, Object> paramsMap = new HashMap<>();

			paramsMap.put("cid", KAKAOPAY_CLIENT_ID);

			if (!StringUtil.isEmpty(kakaoPayReadyRequest.getCid_secret())) {
				paramsMap.put("cid_secret", kakaoPayReadyRequest.getCid_secret());
			}

			paramsMap.put("partner_order_id", kakaoPayReadyRequest.getPartner_order_id());
			paramsMap.put("partner_user_id", kakaoPayReadyRequest.getPartner_user_id());
			paramsMap.put("item_name", kakaoPayReadyRequest.getItem_name());

			if (!StringUtil.isEmpty(kakaoPayReadyRequest.getItem_code())) {
				paramsMap.put("item_code", kakaoPayReadyRequest.getItem_code());
			}

			paramsMap.put("quantity", kakaoPayReadyRequest.getQuantity());
			paramsMap.put("total_amount", kakaoPayReadyRequest.getTotal_amount());
			paramsMap.put("tax_free_amount", kakaoPayReadyRequest.getTax_free_amount());
			
			if (kakaoPayReadyRequest.getVat_amount() > 0) {
				paramsMap.put("vat_amount", kakaoPayReadyRequest.getVat_amount());
			}

			if (kakaoPayReadyRequest.getGreen_deposit() > 0) {
				paramsMap.put("green_deposit", kakaoPayReadyRequest.getGreen_deposit());
			}

			paramsMap.put("approval_url", KAKAOPAY_CLIENT_SUCCESS_URL);
			paramsMap.put("cancel_url", KAKAOPAY_CLIENT_CANCEL_URL);
			paramsMap.put("fail_url", KAKAOPAY_CLIENT_FAIL_URL);
			
			if (kakaoPayReadyRequest.getAvailable_cards() != null) {
				paramsMap.put("available_cards", kakaoPayReadyRequest.getAvailable_cards());
			}
			
			if (!StringUtil.isEmpty(kakaoPayReadyRequest.getPayment_method_type())) {
				paramsMap.put("payment_method_type", kakaoPayReadyRequest.getPayment_method_type());
			}
			
			if (kakaoPayReadyRequest.getInstall_month() > 0) {
				paramsMap.put("install_month", kakaoPayReadyRequest.getInstall_month());
			}
			
			if (!StringUtil.isEmpty(kakaoPayReadyRequest.getUse_share_installment())) {
				paramsMap.put("use_share_installment", kakaoPayReadyRequest.getUse_share_installment());
				
			}
			
			if (kakaoPayReadyRequest.getCustom_json() != null) {
				paramsMap.put("custom_json", kakaoPayReadyRequest.getCustom_json());
			}
			
			HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(paramsMap, kakaoPayHeaders);
			
			RestTemplate restTemplate = new RestTemplate();
			
			ResponseEntity<KakaoPayReadyResponse> responseEntity = restTemplate.postForEntity(KAKAOPAY_READY_URL, requestEntity, KakaoPayReadyResponse.class);
		
			if (responseEntity != null) {
				sb.append("\nready : statusCode : " + responseEntity.getStatusCode());
				kakaoPayReadyResponse = responseEntity.getBody();
				
				if (kakaoPayReadyResponse != null) {
					sb.append("\nready body : \n" + kakaoPayReadyResponse);				
					
				} else {
					sb.append("\nready : body is null");
				}
				
			} else {
				sb.append("\nready : ResponseEntity is null");
			}
		}

		sb.append("\n########################");
		logger.info(sb.toString());

		return kakaoPayReadyResponse;
	}
	
	// 카카오페이 결제 승인 요청
	public KakaoPayApproveResponse approve(KakaoPayApproveRequest kakaoPayApproveRequest) {
		KakaoPayApproveResponse kakaoPayApproveResponse = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n##########################")
		  .append("\n#[KakaoPayService] approve")
		  .append("\n##########################");
		
		if (kakaoPayApproveRequest != null) {
			sb.append(kakaoPayApproveRequest.toString());
			
			Map<String, Object> paramsMap = new HashMap<>();
			paramsMap.put("cid", KAKAOPAY_CLIENT_ID);
			
			if (!StringUtil.isEmpty(kakaoPayApproveRequest.getCid_secret())) {
				paramsMap.put("cid_secret", kakaoPayApproveRequest.getCid_secret()); 
			}
			
			paramsMap.put("tid", kakaoPayApproveRequest.getTid());
			paramsMap.put("partner_order_id", kakaoPayApproveRequest.getPartner_order_id());
			paramsMap.put("partner_user_id", kakaoPayApproveRequest.getPartner_user_id());
			paramsMap.put("pg_token", kakaoPayApproveRequest.getPg_token());
			
			if (!StringUtil.isEmpty(kakaoPayApproveRequest.getPayload())) {
				paramsMap.put("payload", kakaoPayApproveRequest.getPayload());
			}
			
			if (kakaoPayApproveRequest.getTotal_amount() > 0) {
				paramsMap.put("total_amount", kakaoPayApproveRequest.getTotal_amount());
			}

			HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(paramsMap, kakaoPayHeaders);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<KakaoPayApproveResponse> responseEntity = restTemplate.postForEntity(KAKAOPAY_APPROVAL_URL, requestEntity, KakaoPayApproveResponse.class);
			
			if (responseEntity != null) {
				sb.append("\napprove : statusCode : " + responseEntity.getStatusCode());
				kakaoPayApproveResponse = responseEntity.getBody();
				
				if (kakaoPayApproveResponse != null) {
					sb.append("\napprove body : \n" + kakaoPayApproveResponse);				
					
				} else {
					sb.append("\napprove : body is null");
				}
				
			} else {
				sb.append("\napprove : ResponseEntity is null");
			}
		}
		
		sb.append("\n##########################");
		logger.info(sb.toString());
		
		return kakaoPayApproveResponse;
	}
	
	public KakaoPayCancelResponse cancel(KakaoPayCancelRequest kakaoPayCancelRequest) {
		KakaoPayCancelResponse kakaoPayCancelResponse = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n##########################")
		  .append("\n#[KakaoPayService] cancel")
		  .append("\n##########################");
		
		if (kakaoPayCancelRequest != null) {
			sb.append(kakaoPayCancelRequest.toString());
			
			Map<String, Object> paramsMap = new HashMap<>();
			paramsMap.put("cid", KAKAOPAY_CLIENT_ID);
			paramsMap.put("cid_secret", KAKAOPAY_CLIENT_SECRET); 			
			paramsMap.put("tid", kakaoPayCancelRequest.getTid());
			paramsMap.put("cancel_amount", kakaoPayCancelRequest.getCancel_amount());
			paramsMap.put("cancel_tax_free_amount", kakaoPayCancelRequest.getCancel_tax_free_amount());
			
			if (kakaoPayCancelRequest.getCancel_vat_amount() > 0) {
				paramsMap.put("cancel_vat_amount", kakaoPayCancelRequest.getCancel_vat_amount());
			}
			
			if (kakaoPayCancelRequest.getCancel_available_amount() > 0) {
				paramsMap.put("cancel_available_amount", kakaoPayCancelRequest.getCancel_available_amount());
			}

			if (!StringUtil.isEmpty(kakaoPayCancelRequest.getPayload())) {
				paramsMap.put("payload", kakaoPayCancelRequest.getPayload());
			}

			HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(paramsMap, kakaoPayHeaders);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<KakaoPayCancelResponse> responseEntity = restTemplate.postForEntity(KAKAOPAY_CANCEL_URL, requestEntity, KakaoPayCancelResponse.class);
			
			if (responseEntity != null) {
				sb.append("\napprove : statusCode : " + responseEntity.getStatusCode());
				kakaoPayCancelResponse = responseEntity.getBody();
				
				if (kakaoPayCancelResponse != null) {
					sb.append("\napprove body : \n" + kakaoPayCancelResponse);				
					
				} else {
					sb.append("\napprove : body is null");
				}
				
			} else {
				sb.append("\napprove : ResponseEntity is null");
			}
		}
		
		sb.append("\n##########################");
		logger.info(sb.toString());
		
		return kakaoPayCancelResponse;
	}
}