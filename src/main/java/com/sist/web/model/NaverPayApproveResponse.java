package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class NaverPayApproveResponse implements Serializable {
    private static final long serialVersionUID = 1L;

    private String code;
    private String message;
    private Body body;

    public NaverPayApproveResponse() {
        this.code = "";
        this.message = "";
        this.body = null;  // Body 객체를 초기화
    }

    public String getCode() { return code; }
    public void setCode(String code) { this.code = code; }

    public String getMessage() { return message; }
    public void setMessage(String message) { this.message = message; }

    public Body getBody() { return body; }
    public void setBody(Body body) { this.body = body; }

    public static class Body {
        private String paymentId;
        private Detail detail;

        public Body() {
            this.paymentId = "";
            this.detail = null;  // Detail 객체를 초기화
        }

        public String getPaymentId() { return paymentId; }
        public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

        public Detail getDetail() { return detail; }
        public void setDetail(Detail detail) { this.detail = detail; }
    }

    public static class Detail {
        private String paymentId;
        private String payHistId;
        private String merchantName;
        private String merchantId;
        private String merchantPayKey;
        private String merchantUserKey;
        private String admissionTypeCode;
        private String admissionYmdt;
        private String tradeConfirmYmdt;
        private String admissionState;
        private int totalPayAmount;
        private int applyPayAmount;
        private int primaryPayAmount;
        private int npointPayAmount;
        private int giftCardAmount;
        private int discountPayAmount;
        private int taxScopeAmount;
        private int taxExScopeAmount;
        private int environmentDepositAmount;
        private String primaryPayMeans;
        private String cardCorpCode;
        private String cardNo;
        private String cardAuthNo;
        private int cardInstCount;
        private boolean usedCardPoint;
        private String bankCorpCode;
        private String bankAccountNo;
        private String productName;
        private boolean settleExpected;
        private int settleExpectAmount;
        private int payCommissionAmount;
        private String merchantExtraParameter;
        private String userIdentifier;
        private boolean extraDeduction;
        private String useCfmYmdt;

        public Detail() {
            this.paymentId = "";
            this.payHistId = "";
            this.merchantName = "";
            this.merchantId = "";
            this.merchantPayKey = "";
            this.merchantUserKey = "";
            this.admissionTypeCode = "";
            this.admissionYmdt = "";
            this.tradeConfirmYmdt = "";
            this.admissionState = "";
            this.totalPayAmount = 0;
            this.applyPayAmount = 0;
            this.primaryPayAmount = 0;
            this.npointPayAmount = 0;
            this.giftCardAmount = 0;
            this.discountPayAmount = 0;
            this.taxScopeAmount = 0;
            this.taxExScopeAmount = 0;
            this.environmentDepositAmount = 0;
            this.primaryPayMeans = "";
            this.cardCorpCode = "";
            this.cardNo = "";
            this.cardAuthNo = "";
            this.cardInstCount = 0;
            this.usedCardPoint = false;
            this.bankCorpCode = "";
            this.bankAccountNo = "";
            this.productName = "";
            this.settleExpected = false;
            this.settleExpectAmount = 0;
            this.payCommissionAmount = 0;
            this.merchantExtraParameter = "";
            this.userIdentifier = "";
            this.extraDeduction = false;
            this.useCfmYmdt = "";
        }

        public String getPaymentId() { return paymentId; }
        public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

        public String getPayHistId() { return payHistId; }
        public void setPayHistId(String payHistId) { this.payHistId = payHistId; }

        public String getMerchantName() { return merchantName; }
        public void setMerchantName(String merchantName) { this.merchantName = merchantName; }

        public String getMerchantId() { return merchantId; }
        public void setMerchantId(String merchantId) { this.merchantId = merchantId; }

        public String getMerchantPayKey() { return merchantPayKey; }
        public void setMerchantPayKey(String merchantPayKey) { this.merchantPayKey = merchantPayKey; }

        public String getMerchantUserKey() { return merchantUserKey; }
        public void setMerchantUserKey(String merchantUserKey) { this.merchantUserKey = merchantUserKey; }

        public String getAdmissionTypeCode() { return admissionTypeCode; }
        public void setAdmissionTypeCode(String admissionTypeCode) { this.admissionTypeCode = admissionTypeCode; }

        public String getAdmissionYmdt() { return admissionYmdt; }
        public void setAdmissionYmdt(String admissionYmdt) { this.admissionYmdt = admissionYmdt; }

        public String getTradeConfirmYmdt() { return tradeConfirmYmdt; }
        public void setTradeConfirmYmdt(String tradeConfirmYmdt) { this.tradeConfirmYmdt = tradeConfirmYmdt; }

        public String getAdmissionState() { return admissionState; }
        public void setAdmissionState(String admissionState) { this.admissionState = admissionState; }

        public int getTotalPayAmount() { return totalPayAmount; }
        public void setTotalPayAmount(int totalPayAmount) { this.totalPayAmount = totalPayAmount; }

        public int getApplyPayAmount() { return applyPayAmount; }
        public void setApplyPayAmount(int applyPayAmount) { this.applyPayAmount = applyPayAmount; }

        public int getPrimaryPayAmount() { return primaryPayAmount; }
        public void setPrimaryPayAmount(int primaryPayAmount) { this.primaryPayAmount = primaryPayAmount; }

        public int getNpointPayAmount() { return npointPayAmount; }
        public void setNpointPayAmount(int npointPayAmount) { this.npointPayAmount = npointPayAmount; }

        public int getGiftCardAmount() { return giftCardAmount; }
        public void setGiftCardAmount(int giftCardAmount) { this.giftCardAmount = giftCardAmount; }

        public int getDiscountPayAmount() { return discountPayAmount; }
        public void setDiscountPayAmount(int discountPayAmount) { this.discountPayAmount = discountPayAmount; }

        public int getTaxScopeAmount() { return taxScopeAmount; }
        public void setTaxScopeAmount(int taxScopeAmount) { this.taxScopeAmount = taxScopeAmount; }

        public int getTaxExScopeAmount() { return taxExScopeAmount; }
        public void setTaxExScopeAmount(int taxExScopeAmount) { this.taxExScopeAmount = taxExScopeAmount; }

        public int getEnvironmentDepositAmount() { return environmentDepositAmount; }
        public void setEnvironmentDepositAmount(int environmentDepositAmount) { this.environmentDepositAmount = environmentDepositAmount; }

        public String getPrimaryPayMeans() { return primaryPayMeans; }
        public void setPrimaryPayMeans(String primaryPayMeans) { this.primaryPayMeans = primaryPayMeans; }

        public String getCardCorpCode() { return cardCorpCode; }
        public void setCardCorpCode(String cardCorpCode) { this.cardCorpCode = cardCorpCode; }

        public String getCardNo() { return cardNo; }
        public void setCardNo(String cardNo) { this.cardNo = cardNo; }

        public String getCardAuthNo() { return cardAuthNo; }
        public void setCardAuthNo(String cardAuthNo) { this.cardAuthNo = cardAuthNo; }

        public int getCardInstCount() { return cardInstCount; }
        public void setCardInstCount(int cardInstCount) { this.cardInstCount = cardInstCount; }

        public boolean isUsedCardPoint() { return usedCardPoint; }
        public void setUsedCardPoint(boolean usedCardPoint) { this.usedCardPoint = usedCardPoint; }

        public String getBankCorpCode() { return bankCorpCode; }
        public void setBankCorpCode(String bankCorpCode) { this.bankCorpCode = bankCorpCode; }

        public String getBankAccountNo() { return bankAccountNo; }
        public void setBankAccountNo(String bankAccountNo) { this.bankAccountNo = bankAccountNo; }

        public String getProductName() { return productName; }
        public void setProductName(String productName) { this.productName = productName; }

        public boolean isSettleExpected() { return settleExpected; }
        public void setSettleExpected(boolean settleExpected) { this.settleExpected = settleExpected; }

        public int getSettleExpectAmount() { return settleExpectAmount; }
        public void setSettleExpectAmount(int settleExpectAmount) { this.settleExpectAmount = settleExpectAmount; }

        public int getPayCommissionAmount() { return payCommissionAmount; }
        public void setPayCommissionAmount(int payCommissionAmount) { this.payCommissionAmount = payCommissionAmount; }

        public String getMerchantExtraParameter() { return merchantExtraParameter; }
        public void setMerchantExtraParameter(String merchantExtraParameter) { this.merchantExtraParameter = merchantExtraParameter; }

        public String getUserIdentifier() { return userIdentifier; }
        public void setUserIdentifier(String userIdentifier) { this.userIdentifier = userIdentifier; }

        public boolean isExtraDeduction() { return extraDeduction; }
        public void setExtraDeduction(boolean extraDeduction) { this.extraDeduction = extraDeduction; }

        public String getUseCfmYmdt() { return useCfmYmdt; }
        public void setUseCfmYmdt(String useCfmYmdt) { this.useCfmYmdt = useCfmYmdt; }
    }

    @Override
    public String toString() {
        return JsonUtil.toJsonPretty(this);
    }
}