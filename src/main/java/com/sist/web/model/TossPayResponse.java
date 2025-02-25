package com.sist.web.model;

import java.io.Serializable;
import java.util.List;

public class TossPayResponse implements Serializable {
	private static final long serialVersionUID = 1L;

    private String mId;
    private String version;
    private String paymentKey;
    private String status;
    private String lastTransactionKey;
    private String orderId;
    private String orderName;
    private String requestedAt;
    private String approvedAt;
    
    private boolean useEscrow;
    private boolean cultureExpense;
    
    private Card card;
    private VirtualAccount virtualAccount; 
    private Transfer transfer;
    private MobilePhone mobilePhone; 
    private GiftCertificate giftCertificate; 
    private CashReceipt cashReceipt; 
    private Discount discount; 
    private List<Cancels> cancels;
    
    private String secret;
    private String type;
    
    private EasyPay easyPay; 
    private String country;
    private Failure failure; 
    private boolean isPartialCancelable;
    private Receipt receipt;
    private Checkout checkout;
    
    private String currency;
    private Number totalAmount;
    private Number balanceAmount;
    private Number suppliedAmount;
    private Number vat;
    private Number taxFreeAmount;
    private Integer taxExemptionAmount;
    private String method;
    
    public TossPayResponse() {
    	mId = "";
    	version = "";
		paymentKey = "";
		status = "";
		lastTransactionKey = "";
		orderId = "";
		orderName = "";
		requestedAt = "";
		approvedAt = "";
		
		useEscrow = false;
		cultureExpense = false;
		
		card = null;
		virtualAccount = null; 
		transfer = null; 
		mobilePhone = null; 
		giftCertificate = null;
		cashReceipt = null;
		discount = null;
		cancels = null;
		
		   
	    secret = "";
	    type = "";
	    
	    easyPay = null;
	    country = "";
	    failure = null; 
	    isPartialCancelable = false;
	    receipt = null;
	    checkout = null;
	    
		currency = "";
		totalAmount = 0;
		balanceAmount = 0;
		suppliedAmount = 0;
		vat = 0;
		taxFreeAmount = 0;
		taxExemptionAmount = 0;
		method = "";
    }

    public String getmId() {return mId;}
	public String getVersion() {return version;}
	public String getPaymentKey() {return paymentKey;}
	public String getStatus() {return status;}
	public String getLastTransactionKey() {return lastTransactionKey;}
	public String getOrderId() {return orderId;}
	public String getOrderName() {return orderName;}
	public String getRequestedAt() {return requestedAt;}
	public String getApprovedAt() {return approvedAt;}
	public boolean isUseEscrow() {return useEscrow;}
	public boolean isCultureExpense() {return cultureExpense;}
	public Card getCard() {return card;}
	public VirtualAccount getVirtualAccount() {return virtualAccount;}
	public Transfer getTransfer() {return transfer;}
	public MobilePhone getMobilePhone() {return mobilePhone;}
	public GiftCertificate getGiftCertificate() {return giftCertificate;}
	public CashReceipt getCashReceipt() {return cashReceipt;}
	public Discount getDiscount() {return discount;}
	public List<Cancels> getCancels() {return cancels;}
	public String getSecret() {return secret;}
	public String getType() {return type;}
	public EasyPay getEasyPay() {return easyPay;}
	public String getCountry() {return country;}
	public Failure getFailure() {return failure;}
	public boolean isPartialCancelable() {return isPartialCancelable;}
	public Receipt getReceipt() {return receipt;}
	public Checkout getCheckout() {return checkout;}
	public String getCurrency() {return currency;}
	public Number getTotalAmount() {return totalAmount;}
	public Number getBalanceAmount() {return balanceAmount;}
	public Number getSuppliedAmount() {return suppliedAmount;}
	public Number getVat() {return vat;}
	public Number getTaxFreeAmount() {return taxFreeAmount;}
	public Integer getTaxExemptionAmount() {return taxExemptionAmount;}
	public String getMethod() {return method;}
	public void setmId(String mId) {this.mId = mId;}
	public void setVersion(String version) {this.version = version;}
	public void setPaymentKey(String paymentKey) {this.paymentKey = paymentKey;}
	public void setStatus(String status) {this.status = status;}
	public void setLastTransactionKey(String lastTransactionKey) {this.lastTransactionKey = lastTransactionKey;}
	public void setOrderId(String orderId) {this.orderId = orderId;}
	public void setOrderName(String orderName) {this.orderName = orderName;}
	public void setRequestedAt(String requestedAt) {this.requestedAt = requestedAt;}
	public void setApprovedAt(String approvedAt) {this.approvedAt = approvedAt;}
	public void setUseEscrow(boolean useEscrow) {this.useEscrow = useEscrow;}
	public void setCultureExpense(boolean cultureExpense) {this.cultureExpense = cultureExpense;}
	public void setCard(Card card) {this.card = card;}
	public void setVirtualAccount(VirtualAccount virtualAccount) {this.virtualAccount = virtualAccount;}
	public void setTransfer(Transfer transfer) {this.transfer = transfer;}
	public void setMobilePhone(MobilePhone mobilePhone) {this.mobilePhone = mobilePhone;}
	public void setGiftCertificate(GiftCertificate giftCertificate) {this.giftCertificate = giftCertificate;}
	public void setCashReceipt(CashReceipt cashReceipt) {this.cashReceipt = cashReceipt;}
	public void setDiscount(Discount discount) {this.discount = discount;}
	public void setCancels(List<Cancels> cancels) {this.cancels = cancels;}
	public void setSecret(String secret) {this.secret = secret;}
	public void setType(String type) {this.type = type;}
	public void setEasyPay(EasyPay easyPay) {this.easyPay = easyPay;}
	public void setCountry(String country) {this.country = country;}
	public void setFailure(Failure failure) {this.failure = failure;}
	public void setPartialCancelable(boolean isPartialCancelable) {this.isPartialCancelable = isPartialCancelable;}
	public void setReceipt(Receipt receipt) {this.receipt = receipt;}
	public void setCheckout(Checkout checkout) {this.checkout = checkout;}
	public void setCurrency(String currency) {this.currency = currency;}
	public void setTotalAmount(Number totalAmount) {this.totalAmount = totalAmount;}
	public void setBalanceAmount(Number balanceAmount) {this.balanceAmount = balanceAmount;}
	public void setSuppliedAmount(Number suppliedAmount) {this.suppliedAmount = suppliedAmount;}
	public void setVat(Number vat) {this.vat = vat;}
	public void setTaxFreeAmount(Number taxFreeAmount) {this.taxFreeAmount = taxFreeAmount;}
	public void setTaxExemptionAmount(Integer taxExemptionAmount) {this.taxExemptionAmount = taxExemptionAmount;}
	public void setMethod(String method) {this.method = method;}

	public static class Card {
        private String issuerCode;
        private String acquirerCode;
        private String number;
        private Integer installmentPlanMonths;
        private boolean isInterestFree;
        private String interestPayer;
        private String approveNo;
        private boolean useCardPoint;
        private String cardType;
        private String ownerType;
        private String acquireStatus;
        private Number amount;
        
        public Card() {
	        issuerCode = "";
	        acquirerCode = "";
	        number = "";
	        installmentPlanMonths = 0;
	        isInterestFree = false;
	        interestPayer = "";
	        approveNo = "";
	        useCardPoint = false;
	        cardType = "";
	        ownerType = "";
	        acquireStatus = "";
	        amount = 0;
        }

		public String getIssuerCode() {return issuerCode;}
		public String getAcquirerCode() {return acquirerCode;}
		public String getNumber() {return number;}
		public Integer getInstallmentPlanMonths() {return installmentPlanMonths;}
		public boolean isInterestFree() {return isInterestFree;}
		public String getInterestPayer() {return interestPayer;}
		public String getApproveNo() {return approveNo;}
		public boolean isUseCardPoint() {return useCardPoint;}
		public String getCardType() {return cardType;}
		public String getOwnerType() {return ownerType;}
		public String getAcquireStatus() {return acquireStatus;}
		public Number getAmount() {return amount;}
		public void setIssuerCode(String issuerCode) {this.issuerCode = issuerCode;}
		public void setAcquirerCode(String acquirerCode) {this.acquirerCode = acquirerCode;}
		public void setNumber(String number) {this.number = number;}
		public void setInstallmentPlanMonths(Integer installmentPlanMonths) {this.installmentPlanMonths = installmentPlanMonths;}
		public void setInterestFree(boolean isInterestFree) {this.isInterestFree = isInterestFree;}
		public void setInterestPayer(String interestPayer) {this.interestPayer = interestPayer;}
		public void setApproveNo(String approveNo) {this.approveNo = approveNo;}
		public void setUseCardPoint(boolean useCardPoint) {this.useCardPoint = useCardPoint;}
		public void setCardType(String cardType) {this.cardType = cardType;}
		public void setOwnerType(String ownerType) {this.ownerType = ownerType;}
		public void setAcquireStatus(String acquireStatus) {this.acquireStatus = acquireStatus;}
		public void setAmount(Number amount) {this.amount = amount;}
    }

    public static class Receipt {
        private String url;
        
        public Receipt() {
        	url = "";
        }

		public String getUrl() {return url;}
		public void setUrl(String url) {this.url = url;}
    }

    public static class Checkout {
        private String url;
        
        public Checkout() {
        	url = "";
        }

		public String getUrl() {return url;}
		public void setUrl(String url) {this.url = url;}
    }

    public static class VirtualAccount {
    	private String accountType;
    	private String accountNumber;
    	private String bankCode;
    	private String customerName;
    	private String dueDate;
    	private String refundStatus;
    	private boolean expired;
    	private String settlementStatus;
    	private RefundReceiveAccount refundReceiveAccount;
    	
    	public VirtualAccount() {
    		accountType = "";
    		accountNumber = "";
    		bankCode = "";
    		customerName = "";
    		dueDate = "";
    		refundStatus = "";
    		expired = false;
    		settlementStatus = "";
    		refundReceiveAccount = null;
    	}
    	
    	public String getAccountType() {return accountType;}
		public String getAccountNumber() {return accountNumber;}
		public String getBankCode() {return bankCode;}
		public String getCustomerName() {return customerName;}
		public String getDueDate() {return dueDate;}
		public String getRefundStatus() {return refundStatus;}
		public boolean isExpired() {return expired;}
		public String getSettlementStatus() {return settlementStatus;}
		public RefundReceiveAccount getRefundReceiveAccount() {return refundReceiveAccount;}
		public void setAccountType(String accountType) {this.accountType = accountType;	}
		public void setAccountNumber(String accountNumber) {this.accountNumber = accountNumber;}
		public void setBankCode(String bankCode) {this.bankCode = bankCode;}
		public void setCustomerName(String customerName) {this.customerName = customerName;}
		public void setDueDate(String dueDate) {this.dueDate = dueDate;}
		public void setRefundStatus(String refundStatus) {this.refundStatus = refundStatus;}
		public void setExpired(boolean expired) {this.expired = expired;}
		public void setSettlementStatus(String settlementStatus) {this.settlementStatus = settlementStatus;}
		public void setRefundReceiveAccount(RefundReceiveAccount refundReceiveAccount) {this.refundReceiveAccount = refundReceiveAccount;}
		
		public static class RefundReceiveAccount {
    		private String bankCode;
    		private String accountNumber;
    		private String holderName;
    		
    		public RefundReceiveAccount() {
    			bankCode = "";
    			accountNumber = "";
    			holderName = "";
    		}

			public String getBankCode() {return bankCode;}
			public String getAccountNumber() {return accountNumber;}
			public String getHolderName() {return holderName;}
			public void setBankCode(String bankCode) {this.bankCode = bankCode;}
			public void setAccountNumber(String accountNumber) {this.accountNumber = accountNumber;}
			public void setHolderName(String holderName) {this.holderName = holderName;}
    	}
    }
    
    public static class Transfer {
    	private String bankCode;
    	private String settlementStatus;
    	
    	public Transfer() {
    		bankCode = "";
    		settlementStatus = "";
    	}

		public String getBankCode() {return bankCode;}
		public String getSettlementStatus() {return settlementStatus;}
		public void setBankCode(String bankCode) {this.bankCode = bankCode;}
		public void setSettlementStatus(String settlementStatus) {this.settlementStatus = settlementStatus;}
    }
    
    public static class MobilePhone {
    	private String customerMobilePhone;
    	private String settlementStatus;
    	private String receiptUrl;
    	
    	public MobilePhone() {
    		customerMobilePhone = "";
    		settlementStatus = "";
    		receiptUrl = "";
    	}

		public String getCustomerMobilePhone() {return customerMobilePhone;}
		public String getSettlementStatus() {return settlementStatus;}
		public String getReceiptUrl() {return receiptUrl;}
		public void setCustomerMobilePhone(String customerMobilePhone) {this.customerMobilePhone = customerMobilePhone;}
		public void setSettlementStatus(String settlementStatus) {this.settlementStatus = settlementStatus;}
		public void setReceiptUrl(String receiptUrl) {this.receiptUrl = receiptUrl;}
    }
    
    public static class GiftCertificate {
    	private String approveNo;
    	private String settlementStatus;
    	
    	public GiftCertificate() {
    		approveNo = "";
    		settlementStatus = "";
    	}

		public String getApproveNo() {return approveNo;}
		public String getSettlementStatus() {return settlementStatus;}
		public void setApproveNo(String approveNo) {this.approveNo = approveNo;}
		public void setSettlementStatus(String settlementStatus) {this.settlementStatus = settlementStatus;}
    }
    
    public static class CashReceipt {
    	private String type;
    	private String receiptKey;
    	private String issueNumber;
    	private String receiptUrl;
    	private Number amount;
    	private Number taxFreeAmount;
    	
    	public CashReceipt() {
    		type = "";
    		receiptKey = "";
    		issueNumber = "";
    		receiptUrl = "";
    		amount = 0;
    		taxFreeAmount = 0;
    	}

		public String getType() {return type;}
		public String getReceiptKey() {return receiptKey;}
		public String getIssueNumber() {return issueNumber;}
		public String getReceiptUrl() {return receiptUrl;}
		public Number getAmount() {return amount;}
		public Number getTaxFreeAmount() {return taxFreeAmount;}
		public void setType(String type) {this.type = type;}
		public void setReceiptKey(String receiptKey) {this.receiptKey = receiptKey;}
		public void setIssueNumber(String issueNumber) {this.issueNumber = issueNumber;}
		public void setReceiptUrl(String receiptUrl) {this.receiptUrl = receiptUrl;}
		public void setAmount(Number amount) {this.amount = amount;}
		public void setTaxFreeAmount(Number taxFreeAmount) {this.taxFreeAmount = taxFreeAmount;}
   }
    
    public static class Discount {
    	private Integer amount;
    	
    	public Discount() {
    		amount = 0;
    	}

		public Integer getAmount() {return amount;}
		public void setAmount(Integer amount) {this.amount = amount;}
    }
    
    public static class Cancels {
    	private Number cancelAmount;
    	private String cancelReason;
    	private Number taxFreeAmount;
    	private Integer taxExemptionAmount;
    	private Number RefundableAmount;
    	private Number transferDiscountAmount;
    	private Number easyPayDiscountAmount;
    	private String canceledAt;
    	private String transactionKey; 
    	private String receiptKey;
    	private String cancelStatus; 
    	private String cancelRequestId;
    	
    	public Cancels() {
    		cancelAmount = 0;
    		cancelReason = "";
    		taxFreeAmount = 0;
    		taxExemptionAmount = 0;
    		RefundableAmount = 0;
    		transferDiscountAmount = 0;
    		easyPayDiscountAmount = 0;
    		canceledAt = "";
    		transactionKey = "";
    		receiptKey = "";
    		cancelStatus = "";
    		cancelRequestId = "";
    	}

		public Number getCancelAmount() {return cancelAmount;}
		public String getCancelReason() {return cancelReason;}
		public Number getTaxFreeAmount() {return taxFreeAmount;}
		public Integer getTaxExemptionAmount() {return taxExemptionAmount;}
		public Number getRefundableAmount() {return RefundableAmount;}
		public Number getTransferDiscountAmount() {return transferDiscountAmount;}
		public Number getEasyPayDiscountAmount() {return easyPayDiscountAmount;}
		public String getCanceledAt() {return canceledAt;}
		public String getTransactionKey() {return transactionKey;}
		public String getReceiptKey() {return receiptKey;}
		public String getCancelStatus() {return cancelStatus;}
		public String getCancelRequestId() {return cancelRequestId;}
		public void setCancelAmount(Number cancelAmount) {this.cancelAmount = cancelAmount;}
		public void setCancelReason(String cancelReason) {this.cancelReason = cancelReason;}
		public void setTaxFreeAmount(Number taxFreeAmount) {this.taxFreeAmount = taxFreeAmount;}
		public void setTaxExemptionAmount(Integer taxExemptionAmount) {this.taxExemptionAmount = taxExemptionAmount;}
		public void setRefundableAmount(Number refundableAmount) {RefundableAmount = refundableAmount;}
		public void setTransferDiscountAmount(Number transferDiscountAmount) {this.transferDiscountAmount = transferDiscountAmount;}
		public void setEasyPayDiscountAmount(Number easyPayDiscountAmount) {this.easyPayDiscountAmount = easyPayDiscountAmount;}
		public void setCanceledAt(String canceledAt) {this.canceledAt = canceledAt;}
		public void setTransactionKey(String transactionKey) {this.transactionKey = transactionKey;}
		public void setReceiptKey(String receiptKey) {this.receiptKey = receiptKey;}
		public void setCancelStatus(String cancelStatus) {this.cancelStatus = cancelStatus;}
		public void setCancelRequestId(String cancelRequestId) {this.cancelRequestId = cancelRequestId;}
    }
    
    public static class EasyPay {
    	private String provider;
    	private Number amount;
    	private Number discountAmount;
    	
    	public EasyPay() {
    		provider = "";
    		amount = 0;
    		discountAmount = 0;
    	}

		public String getProvider() {return provider;}
		public Number getAmount() {return amount;}
		public Number getDiscountAmount() {return discountAmount;}
		public void setProvider(String provider) {this.provider = provider;}
		public void setAmount(Number amount) {this.amount = amount;}
		public void setDiscountAmount(Number discountAmount) {this.discountAmount = discountAmount;}
    }
    
    public static class Failure {
    	private String code;
    	private String message;
    	
    	public Failure() {
    		code = "";
    		message = "";
    	}

		public String getCode() {return code;}
		public String getMessage() {return message;}
		public void setCode(String code) {this.code = code;}
		public void setMessage(String message) {this.message = message;}
    }
}




