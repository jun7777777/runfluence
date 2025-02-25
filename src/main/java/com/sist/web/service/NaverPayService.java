package com.sist.web.service;

import java.util.UUID;

import javax.annotation.PostConstruct;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.sist.web.model.NaverPayApproveRequest;
import com.sist.web.model.NaverPayApproveResponse;
import com.sist.web.model.NaverPayCancelRequest;
import com.sist.web.model.NaverPayCancelResponse;

@Service
public class NaverPayService {
	public static Logger logger = LoggerFactory.getLogger(NaverPayService.class);
	
	private HttpHeaders naverPayHeaders;

	@Value("#{env['x.naver.client.id']}")
	private String X_NAVER_CLIENT_ID;
	
	@Value("#{env['x.naver.client.secret']}")
	private String X_NAVER_CLIENT_SECRET;
	
	@Value("#{env['x.naverpay.chain.id']}")
	private String X_NAVERPAY_CHAIN_ID;
	
	@Value("#{env['naverpay.approval.url']}")
	private String NAVERPAY_APPROVAL_URL;
	
	@Value("#{env['naverpay.cancel.url']}")
	private String NAVERPAY_CANCEL_URL;
	
	@PostConstruct
	private void PostConstruct() {
		naverPayHeaders = new HttpHeaders();
		naverPayHeaders.set("X-Naver-Client-Id", X_NAVER_CLIENT_ID);
		naverPayHeaders.set("X-Naver-Client-Secret", X_NAVER_CLIENT_SECRET);
		naverPayHeaders.set("X-NaverPay-Chain-Id", X_NAVERPAY_CHAIN_ID);
		naverPayHeaders.setContentType(MediaType.APPLICATION_FORM_URLENCODED); 
	}
	
	public NaverPayApproveResponse approve(NaverPayApproveRequest naverPayApproveRequest) {
		NaverPayApproveResponse naverPayApproveResponse = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n##########################")
		  .append("\n#[NaverPayService] approve")
		  .append("\n##########################");
		
		if (naverPayApproveRequest != null) {
			sb.append(naverPayApproveRequest.toString());
			
			MultiValueMap<String, Object> paramsMap = new LinkedMultiValueMap<>();
			paramsMap.add("paymentId", naverPayApproveRequest.getPaymentId());
			naverPayHeaders.set("X-NaverPay-Idempotency-Key", UUID.randomUUID().toString());
			HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(paramsMap, naverPayHeaders);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<NaverPayApproveResponse> responseEntity = restTemplate.postForEntity(NAVERPAY_APPROVAL_URL, requestEntity, NaverPayApproveResponse.class);
			
			if (responseEntity != null) {
				sb.append("\napprove : statusCode : " + responseEntity.getStatusCode());
				naverPayApproveResponse = responseEntity.getBody();
				
				if (naverPayApproveResponse != null) {
					sb.append("\napprove body : \n" + naverPayApproveResponse);				
					
				} else {
					sb.append("\napprove : body is null");
				}
				
			} else {
				sb.append("\napprove : ResponseEntity is null");
			}
		}
		
		return naverPayApproveResponse; 
	}
	
	
	public NaverPayCancelResponse cancel(NaverPayCancelRequest naverPayCancelRequest) {
		NaverPayCancelResponse naverPayCancelResponse = null;
		
		StringBuilder sb = new StringBuilder();
		sb.append("\n##########################")
		  .append("\n#[NaverPayService] cancel")
		  .append("\n##########################");
		
		if (naverPayCancelRequest != null) {
			sb.append(naverPayCancelRequest.toString());
			
			MultiValueMap<String, Object> paramsMap = new LinkedMultiValueMap<>();
			paramsMap.add("paymentId", naverPayCancelRequest.getPaymentId());
			paramsMap.add("cancelAmount", naverPayCancelRequest.getCancelAmount());
			paramsMap.add("cancelReason", naverPayCancelRequest.getCancelReason());
			paramsMap.add("cancelRequester", naverPayCancelRequest.getCancelRequester());
			paramsMap.add("taxScopeAmount", naverPayCancelRequest.getTaxScopeAmount());
			paramsMap.add("taxExScopeAmount", naverPayCancelRequest.getTaxExScopeAmount());
			paramsMap.add("environmentDepositAmount", naverPayCancelRequest.getEnvironmentDepositAmount());
			paramsMap.add("doCompareRest", naverPayCancelRequest.getDoCompareRest());
			paramsMap.add("expectedRestAmount", naverPayCancelRequest.getExpectedRestAmount());
			paramsMap.add("merchantPayTransactionKey", naverPayCancelRequest.getMerchantPayTransactionKey());
			
			naverPayHeaders.set("X-NaverPay-Idempotency-Key", UUID.randomUUID().toString());
			
			HttpEntity<MultiValueMap<String, Object>> requestEntity = new HttpEntity<>(paramsMap, naverPayHeaders);
			RestTemplate restTemplate = new RestTemplate();
			ResponseEntity<NaverPayCancelResponse> responseEntity = restTemplate.postForEntity(NAVERPAY_CANCEL_URL, requestEntity, NaverPayCancelResponse.class);
			
			if (responseEntity != null) {
				sb.append("\napprove : statusCode : " + responseEntity.getStatusCode());
				naverPayCancelResponse = responseEntity.getBody();
				
				if (naverPayCancelResponse != null) {
					sb.append("\napprove body : \n" + naverPayCancelResponse);				
					
				} else {
					sb.append("\napprove : body is null");
				}
				
			} else {
				sb.append("\napprove : ResponseEntity is null");
			}
		}
		
		return naverPayCancelResponse; 
	}
}