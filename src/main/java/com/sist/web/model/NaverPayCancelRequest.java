package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class NaverPayCancelRequest implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private String paymentId;                 // 50바이트 (필수) 네이버페이 결제번호
	private long cancelAmount;                // (필수) 취소 요청 금액
	private String cancelReason;              // 256바이트(필수) 취소 사유 : (default -> 단순변심)
	private String cancelRequester;           // 1바이트(필수) 취소 요청자(1: 구매자, 2: 가맹점 관리자) 구분이 애매한 경우 가맹점 관리자로 입력
	private long taxScopeAmount;              // (필수) 과세 대상 금액. 과세 대상 금액 + 면세 대상 금액 = 취소 결제 금액
	private long taxExScopeAmount;            // (필수) 면세 대상 금액. 과세 대상 금액 + 면세 대상 금액 = 취소 결제 금액
	
	private long environmentDepositAmount;    // 컵 보증금 대상 금액. 과세 대상 금액 + 면세 대상 금액 + 컵 보증금 대상 금액 (옵션) = 취소 요청 금액
	
	private short doCompareRest;              // 가맹점의 남은 금액과 네이버페이의 남은 금액이 일치하는지 체크하는 기능을 수행할지 여부 	1: 수행 0: 미수행
	private long expectedRestAmount;          // 이번 취소가 수행되고 난 후에 남을 가맹점의 예상 금액 옵션, 파라미터인 doCompareRest값이 1일 때에만 동작
	                                          // Ex) 결제금액 1000원 중 200원을 취소하고 싶을 때 => expectedRestAmount =800원, cancelAmount=200원으로 요청
	
	private String merchantPayTransactionKey; // 128바이트(필수) 가맹점의 결제 트랜잭션 번호 또는 주문 트랜잭션 번호
	
	public NaverPayCancelRequest() {
		paymentId = "";
		cancelAmount = 0L;
		cancelReason = "";
		cancelRequester = "";
		taxScopeAmount = 0L;
		taxExScopeAmount = 0L;
		doCompareRest = 0;
		expectedRestAmount = 0L;
		merchantPayTransactionKey = "";
		environmentDepositAmount = 0L;
	}

	public String getPaymentId() {return paymentId;}
	public void setPaymentId(String paymentId) {this.paymentId = paymentId;}
	public long getCancelAmount() {return cancelAmount;}
	public void setCancelAmount(long cancelAmount) {this.cancelAmount = cancelAmount;}
	public String getCancelReason() {return cancelReason;}
	public void setCancelReason(String cancelReason) {this.cancelReason = cancelReason;}
	public String getCancelRequester() {return cancelRequester;}
	public void setCancelRequester(String cancelRequester) {this.cancelRequester = cancelRequester;}
	public long getTaxScopeAmount() {return taxScopeAmount;}
	public void setTaxScopeAmount(long taxScopeAmount) {this.taxScopeAmount = taxScopeAmount;}
	public long getTaxExScopeAmount() {return taxExScopeAmount;}
	public void setTaxExScopeAmount(long taxExScopeAmount) {this.taxExScopeAmount = taxExScopeAmount;}
	public long getExpectedRestAmount() {return expectedRestAmount;}
	public void setExpectedRestAmount(long expectedRestAmount) {this.expectedRestAmount = expectedRestAmount;}
	public String getMerchantPayTransactionKey() {return merchantPayTransactionKey;}
	public void setMerchantPayTransactionKey(String merchantPayTransactionKey) {this.merchantPayTransactionKey = merchantPayTransactionKey;}
	public short getDoCompareRest() {return doCompareRest;}
	public void setDoCompareRest(short doCompareRest) {this.doCompareRest = doCompareRest;}
	public long getEnvironmentDepositAmount() {return environmentDepositAmount;}
	public void setEnvironmentDepositAmount(long environmentDepositAmount) {this.environmentDepositAmount = environmentDepositAmount;}
	
	@Override
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}