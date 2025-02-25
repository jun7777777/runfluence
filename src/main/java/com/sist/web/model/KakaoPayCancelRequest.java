package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class KakaoPayCancelRequest implements Serializable {
	private static final long serialVersionUID = 1L;
	private String cid;	                    // (필수) 가맹점 코드, 10자
	private String cid_secret;	            // (선택) 가맹점 코드 인증키, 24자, 숫자+영문 소문자 조합
	private String tid;	                    // (필수) 결제 고유번호, 20자
	private int cancel_amount;              // (필수) 취소 금액
	private int cancel_tax_free_amount;     // (필수) 취소 비과세 금액
	private int cancel_vat_amount;          // (선택) 취소 부가세 금액
											// 승인시 vat_amount를 보냈다면 취소시에도 동일하게 요청
											// 승인과 동일하게 요청 시 값을 전달하지 않을 경우 자동계산
											// (취소 금액 - 취소 비과세 금액)/11, 소숫점이하 반올림
	private int cancel_available_amount;    // (선택) 취소 가능 금액(결제 취소 요청 금액 포함)
	private String payload;	                // (선택) 해당 요청에 대해 저장하고 싶은 값, 최대 200자
	
	
	public KakaoPayCancelRequest() {
		cid = "";
		cid_secret = "";
		tid = "";
		cancel_amount = 0;
		cancel_tax_free_amount = 0;
		cancel_vat_amount = 0;
	}
	
	public String getCid() {return cid;}
	public void setCid(String cid) {this.cid = cid;}
	public String getCid_secret() {return cid_secret;}
	public void setCid_secret(String cid_secret) {this.cid_secret = cid_secret;}
	public String getTid() {return tid;}
	public void setTid(String tid) {this.tid = tid;}
	public int getCancel_amount() {return cancel_amount;}
	public void setCancel_amount(int cancel_amount) {this.cancel_amount = cancel_amount;}
	public int getCancel_tax_free_amount() {return cancel_tax_free_amount;}
	public void setCancel_tax_free_amount(int cancel_tax_free_amount) {this.cancel_tax_free_amount = cancel_tax_free_amount;}
	public int getCancel_vat_amount() {return cancel_vat_amount;}
	public void setCancel_vat_amount(int cancel_vat_amount) {this.cancel_vat_amount = cancel_vat_amount;}
	public int getCancel_available_amount() {return cancel_available_amount;}
	public void setCancel_available_amount(int cancel_available_amount) {this.cancel_available_amount = cancel_available_amount;}
	public String getPayload() {return payload;}
	public void setPayload(String payload) {this.payload = payload;}
	
	@Override
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}