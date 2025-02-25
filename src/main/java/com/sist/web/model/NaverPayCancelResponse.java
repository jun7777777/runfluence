package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class NaverPayCancelResponse implements Serializable {
    private static final long serialVersionUID = 1L;
    private String code;
    private Body body;

    public NaverPayCancelResponse() {
        this.code = "";
        this.body = null;  
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }
    public Body getBody() { return body; }
    public void setBody(Body body) { this.body = body; }

    public static class Body {
    	private String paymentId;                  // 50바이트(필수) 네이버페이 결제번호
        private String payHistId;                  // 50바이트(필수) 취소 결제 번호
                                                   
        private String primaryPayMeans;            // 10바이트(필수) 취소 처리된 주 결제 수단
                                                   // CARD:신용카드, BANK:계좌이체, 수단정보가 없고 npolongCancelAmount값이 있으면 포인트/머니 결제
                                                   
        private long primaryPayCancelAmount;       // (필수) 주 결제 수단 취소 금액
        private long primaryPayRestAmount;         // (필수) 추가로 취소 가능한 주 결제 수단 잔여 결제 금액
        private long npolongCancelAmount;          // (필수) 네이버페이 포인트/머니 취소 금액
        private long npolongRestAmount;            // (필수) 추가로 취소 가능한 네이버페이 포인트/머니 잔여 결제 금액
        private long giftCardCancelAmount;         // (필수) 기프트카드 취소 금액
        private long giftCardRestAmount;           // (필수) 추가로 취소 가능한 기프트카드 잔여 결제 금액
        private long discountCancelAmount;         // (필수) 즉시 할인 취소 금액
        private long discountRestAmount;           // (필수) 추가로 취소 가능한 즉시 할인 금액
        private long taxScopeAmount;               // (필수) 과세 취소 금액
        private long taxExScopeAmount;             // (필수) 면세 취소 금액
        private long taxScopeRestAmount;           // (필수) 추가로 취소 가능한 과세 잔여 결제 금액
        private long taxExScopeRestAmount;         // (필수) 추가로 취소 가능한 면세 잔여 결제 금액
        private long environmentDepositAmount;     // (필수) 컵 보증금 취소 금액
        private long environmentDepositRestAmount; // (필수) 컵 보증금 잔여 결제 금액

        private String cancelYmdt;                 // (필수) 취소 일시(YYYYMMDDHH24MMSS)
                                                   // 결과코드가 CancelNotComplete 인 경우, 취소실패 일시가 전달되며
                                                   // 정확한 취소 일시는 취소가 완료된 이후에 결제 내역 조회 API를 통해서 확인 가능

        private long totalRestAmount;              // (필수) 추가로 취소 가능한 전체 잔여 결제 금액(primaryPayRestAmount + npolongRestAmount + giftCardRestAmount + discountRestAmount)
        private long applyRestAmount;              // (필수) 구매자 결제 잔액 (primaryPayRestAmount + npolongRestAmount + giftCardRestAmount)

        public String getPaymentId() { return paymentId; }
        public void setPaymentId(String paymentId) { this.paymentId = paymentId; }
        public String getPayHistId() { return payHistId; }
        public void setPayHistId(String payHistId) { this.payHistId = payHistId; }
        public String getPrimaryPayMeans() { return primaryPayMeans; }
        public void setPrimaryPayMeans(String primaryPayMeans) { this.primaryPayMeans = primaryPayMeans; }
        public long getPrimaryPayCancelAmount() { return primaryPayCancelAmount; }
        public void setPrimaryPayCancelAmount(long primaryPayCancelAmount) { this.primaryPayCancelAmount = primaryPayCancelAmount; }
        public long getPrimaryPayRestAmount() { return primaryPayRestAmount; }
        public void setPrimaryPayRestAmount(long primaryPayRestAmount) { this.primaryPayRestAmount = primaryPayRestAmount; }
        public long getNpolongCancelAmount() { return npolongCancelAmount; }
        public void setNpolongCancelAmount(long npolongCancelAmount) { this.npolongCancelAmount = npolongCancelAmount; }
        public long getNpolongRestAmount() { return npolongRestAmount; }
        public void setNpolongRestAmount(long npolongRestAmount) { this.npolongRestAmount = npolongRestAmount; }
        public long getGiftCardCancelAmount() { return giftCardCancelAmount; }
        public void setGiftCardCancelAmount(long giftCardCancelAmount) { this.giftCardCancelAmount = giftCardCancelAmount; }
        public long getGiftCardRestAmount() { return giftCardRestAmount; }
        public void setGiftCardRestAmount(long giftCardRestAmount) { this.giftCardRestAmount = giftCardRestAmount; }
        public long getDiscountCancelAmount() { return discountCancelAmount; }
        public void setDiscountCancelAmount(long discountCancelAmount) { this.discountCancelAmount = discountCancelAmount; }
        public long getDiscountRestAmount() { return discountRestAmount; }
        public void setDiscountRestAmount(long discountRestAmount) { this.discountRestAmount = discountRestAmount; }
        public long getTaxScopeAmount() { return taxScopeAmount; }
        public void setTaxScopeAmount(long taxScopeAmount) { this.taxScopeAmount = taxScopeAmount; }
        public long getTaxExScopeAmount() { return taxExScopeAmount; }
        public void setTaxExScopeAmount(long taxExScopeAmount) { this.taxExScopeAmount = taxExScopeAmount; }
        public long getTaxScopeRestAmount() { return taxScopeRestAmount; }
        public void setTaxScopeRestAmount(long taxScopeRestAmount) { this.taxScopeRestAmount = taxScopeRestAmount; }
        public long getTaxExScopeRestAmount() { return taxExScopeRestAmount; }
        public void setTaxExScopeRestAmount(long taxExScopeRestAmount) { this.taxExScopeRestAmount = taxExScopeRestAmount; }
        public long getEnvironmentDepositAmount() { return environmentDepositAmount; }
        public void setEnvironmentDepositAmount(long environmentDepositAmount) { this.environmentDepositAmount = environmentDepositAmount; }
        public long getEnvironmentDepositRestAmount() { return environmentDepositRestAmount; }
        public void setEnvironmentDepositRestAmount(long environmentDepositRestAmount) { this.environmentDepositRestAmount = environmentDepositRestAmount; }
        public String getCancelYmdt() { return cancelYmdt; }
        public void setCancelYmdt(String cancelYmdt) { this.cancelYmdt = cancelYmdt; }
        public long getTotalRestAmount() { return totalRestAmount; }
        public void setTotalRestAmount(long totalRestAmount) { this.totalRestAmount = totalRestAmount; }
        public long getApplyRestAmount() { return applyRestAmount; }
        public void setApplyRestAmount(long applyRestAmount) { this.applyRestAmount = applyRestAmount; }
    }
    
	@Override
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}