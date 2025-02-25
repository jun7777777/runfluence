package com.sist.web.service;

import java.util.Base64;
import java.util.HashMap;
import java.util.Map;
import java.util.UUID;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import com.sist.web.model.TossPayApproveRequest;
import com.sist.web.model.TossPayCancelRequest;
import com.sist.web.model.TossPayResponse;

@Service
public class TossPayService {
	public static Logger logger = LoggerFactory.getLogger(TossPayService.class);
	
	// 토스 페이 Request 헤더
	private HttpHeaders tossPayHeaders;
	
	// 토스 페이 Approve URL
	@Value("#{env['tosspay.approval.url']}")
	private String TOSSPAY_APPROVAL_URL;
	
	// 토스 페이 Secret Key
	@Value("#{env['tosspay.secret.key']}")
	private String TOSSPAY_SECRET_KEY;
	
	// 토스 페이 Cancel URL
	@Value("#{env['tosspay.cancel.url']}")
	private String TOSSPAY_CANCEL_URL;
	
	@PostConstruct
	private void postConstruct() {
		tossPayHeaders = new HttpHeaders();
		
		String TOSSPAY_SECRET_KEY_ADD_COLON = TOSSPAY_SECRET_KEY + ":";
		String BASE64_TOSSPAY_SECRET_KEY = Base64.getEncoder().encodeToString(TOSSPAY_SECRET_KEY_ADD_COLON.getBytes());
		
		tossPayHeaders.set("Authorization", "Basic " + BASE64_TOSSPAY_SECRET_KEY);
		tossPayHeaders.set("Content-Type", "application/json");
	}
	
	
	public TossPayResponse approve(TossPayApproveRequest tossPayApproveRequest) {
		TossPayResponse tossPayResponse = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n##########################")
		  .append("\n#[TossPayService] approve")
		  .append("\n##########################");
		
		if (tossPayApproveRequest != null) {
			sb.append(tossPayApproveRequest.toString());
			
			Map<String, Object> paramsMap = new HashMap<>();
			paramsMap.put("paymentKey", tossPayApproveRequest.getPaymentKey());
			paramsMap.put("amount", tossPayApproveRequest.getAmount());
			paramsMap.put("orderId", tossPayApproveRequest.getOrderId());

			HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(paramsMap, tossPayHeaders);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<TossPayResponse> responseEntity = restTemplate.postForEntity(TOSSPAY_APPROVAL_URL, requestEntity, TossPayResponse.class);
			
			if (responseEntity != null) {
				sb.append("\napprove : statusCode : " + responseEntity.getStatusCode());
				tossPayResponse = responseEntity.getBody();
				
				if (tossPayResponse != null) {
					sb.append("\napprove body : \n" + tossPayResponse);				
					
				} else {
					sb.append("\napprove : body is null");
				}
				
			} else {
				sb.append("\napprove : ResponseEntity is null");
			}
		}
		
		sb.append("\n##########################");
		logger.info(sb.toString());
		
		return tossPayResponse;
	}
	
	public TossPayResponse cancel(TossPayCancelRequest tossPayCancelRequest) {
		TossPayResponse tossPayResponse = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n##########################")
		  .append("\n#[TossPayService] cancel")
		  .append("\n##########################");
		
		if (tossPayCancelRequest != null) {
			sb.append(tossPayCancelRequest.toString());
			
			Map<String, Object> paramsMap = new HashMap<>();
			paramsMap.put("cancelReason", tossPayCancelRequest.getCancelReason());
			paramsMap.put("cancelAmount", tossPayCancelRequest.getCancelAmount());
			tossPayHeaders.set("Idempotency-Key", UUID.randomUUID().toString());
			
			HttpEntity<Map<String, Object>> requestEntity = new HttpEntity<>(paramsMap, tossPayHeaders);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<TossPayResponse> responseEntity = restTemplate.postForEntity(TOSSPAY_CANCEL_URL.replace("{paymentKey}", tossPayCancelRequest.getPaymentKey()), requestEntity, TossPayResponse.class);
			
			if (responseEntity != null) {
				sb.append("\napprove : statusCode : " + responseEntity.getStatusCode());
				tossPayResponse = responseEntity.getBody();
				
				if (tossPayResponse != null) {
					sb.append("\napprove body : \n" + tossPayResponse);				
					
				} else {
					sb.append("\napprove : body is null");
				}
				
			} else {
				sb.append("\napprove : ResponseEntity is null");
			}
		}
		
		return tossPayResponse; 
	}
}