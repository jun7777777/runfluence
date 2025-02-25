package com.sist.web.model;

import java.io.Serializable;

import com.sist.web.util.JsonUtil;

public class KakaoPayApproveResponse implements Serializable {
	private static final long serialVersionUID = 1L;

	private String aid;                 // 요청 고유 번호 - 승인/취소가 구분된 결제번호
	private String tid;                 // 결제 고유 번호 - 승인/취소가 동일한 결제번호
	private String cid;                 // 가맹점 코드
	private String sid;                 // 정기 결제용 ID, 정기 결제 CID로 단건 결제 요청 시 발급
	private String partner_order_id;    // 가맹점 주문번호, 최대 100자
	private String partner_user_id;     // 가맹점 회원 id, 최대 100자
	private String payment_method_type; // 결제 수단, CARD 또는 MONEY 중 하나
	private Amount amount;      // 결제 금액 정보
	private CardInfo card_info; // 결제 상세 정보, 결제 수단이 카드일 경우만 포함
	private String item_name;           // 상품 이름, 최대 100자
	private String item_code;           // 상품 코드, 최대 100자
	private int quantity;               // 상품 수량
	private String created_at;          // 결제 준비 요청 시각
	private String approved_at;         // 결제 승인 시각
	private String payload;             // 결제 승인 요청에 대해 저장한 값, 요청 시 전달된 내용

	// 실패시
	private int error_code;             // 결제 수단 승인 실패 에러 코드
	private String error_message;       // 결제 수단 승인 실패 에러 메시지
	private Extras extras;  // 부가 정보
	
	public KakaoPayApproveResponse() {
		aid = "";
		tid = "";
		cid = "";
		sid = "";
		partner_order_id = "";
		partner_user_id = "";
		payment_method_type = "";
		amount = null;
		card_info = null; 
		item_name = "";
		item_code = "";
		quantity = 0; 
		created_at = ""; 
		approved_at = ""; 
		payload = "";
		
		error_code = 0;
		error_message = "";
		extras = null;
	}
	
	public static class Amount {
		private int total;	        // 전체 결제 금액
		private int tax_free;	    // 비과세 금액
		private int vat;	        // 부가세 금액
		private int point;	        // 사용한 포인트 금액
		private int discount;       // 할인 금액
		private int green_deposit;  // 컵 보증금
		
		public Amount() {
			total = 0;
			tax_free = 0;
			vat = 0;
			point = 0;
			discount = 0;
			green_deposit = 0;
		}

		public int getTotal() {return total;}
		public void setTotal(int total) {this.total = total;}
		public int getTax_free() {return tax_free;}
		public void setTax_free(int tax_free) {this.tax_free = tax_free;}
		public int getVat() {return vat;}
		public void setVat(int vat) {this.vat = vat;}
		public int getPoint() {return point;}
		public void setPoint(int point) {this.point = point;}
		public int getDiscount() {return discount;}
		public void setDiscount(int discount) {this.discount = discount;}
		public int getGreen_deposit() {return green_deposit;}
		public void setGreen_deposit(int green_deposit) {this.green_deposit = green_deposit;}
	}
	
	public static class CardInfo {
		private String kakaopay_purchase_corp;        // 카카오페이 매입사명
	    private String kakaopay_purchase_corp_code;   // 카카오페이 매입사 코드
	    private String kakaopay_issuer_corp;          // 카카오페이 발급사명
	    private String kakaopay_issuer_corp_code;     // 카카오페이 발급사 코드
	    private String bin;                           // 카드 BIN
	    private String card_type;                     // 카드 타입
	    private String install_month;                 // 할부 개월 수
	    private String approved_id;                   // 카드사 승인번호
	    private String card_mid;                      // 카드사 가맹점 번호
	    private String interest_free_install;         // 무이자할부 여부(Y/N)
	    
	    private String installment_type;              // 할부 유형(24.02.01일부터 제공)
	                                                  // - CARD_INSTALLMENT: 업종 무이자
	    private String card_item_code;                // 카드 상품 코드

	    public CardInfo() {
	        kakaopay_purchase_corp = "";
	        kakaopay_purchase_corp_code = "";
	        kakaopay_issuer_corp = "";
	        kakaopay_issuer_corp_code = "";
	        bin = "";
	        card_type = "";
	        install_month = "";
	        approved_id = "";
	        card_mid = "";
	        interest_free_install = "";
	        installment_type = "";
	        card_item_code = "";
	    }

	    public String getKakaopay_purchase_corp() {return kakaopay_purchase_corp;}
	    public void setKakaopay_purchase_corp(String kakaopay_purchase_corp) {this.kakaopay_purchase_corp = kakaopay_purchase_corp;}
	    public String getKakaopay_purchase_corp_code() {return kakaopay_purchase_corp_code;}
	    public void setKakaopay_purchase_corp_code(String kakaopay_purchase_corp_code) {this.kakaopay_purchase_corp_code = kakaopay_purchase_corp_code;}
	    public String getKakaopay_issuer_corp() {return kakaopay_issuer_corp;}
	    public void setKakaopay_issuer_corp(String kakaopay_issuer_corp) {this.kakaopay_issuer_corp = kakaopay_issuer_corp;}
	    public String getKakaopay_issuer_corp_code() {return kakaopay_issuer_corp_code;}
	    public void setKakaopay_issuer_corp_code(String kakaopay_issuer_corp_code) {this.kakaopay_issuer_corp_code = kakaopay_issuer_corp_code;}
	    public String getBin() {return bin;}
	    public void setBin(String bin) {this.bin = bin;}
	    public String getCard_type() {return card_type;}
	    public void setCard_type(String card_type) {this.card_type = card_type;}
	    public String getInstall_month() {return install_month;}
	    public void setInstall_month(String install_month) {this.install_month = install_month;}
	    public String getApproved_id() {return approved_id;}
	    public void setApproved_id(String approved_id) {this.approved_id = approved_id;}
	    public String getCard_mid() {return card_mid;}
	    public void setCard_mid(String card_mid) {this.card_mid = card_mid;}
	    public String getInterest_free_install() {return interest_free_install;}
	    public void setInterest_free_install(String interest_free_install) {this.interest_free_install = interest_free_install;}
	    public String getInstallment_type() {return installment_type;}
	    public void setInstallment_type(String installment_type) {this.installment_type = installment_type;}
	    public String getCard_item_code() {return card_item_code;}
	    public void setCard_item_code(String card_item_code) {this.card_item_code = card_item_code;}
	}
	
	public static class Extras {
		private String method_result_code;
		private String method_result_message;
		
		public Extras() {
			method_result_code = "";
			method_result_message = "";
		}

		public String getMethod_result_code() {return method_result_code;}
		public void setMethod_result_code(String method_result_code) {this.method_result_code = method_result_code;}
		public String getMethod_result_message() {return method_result_message;}
		public void setMethod_result_message(String method_result_message) {this.method_result_message = method_result_message;}
	}
	
	public String getAid() { return aid; }
	public void setAid(String aid) { this.aid = aid; }
	public String getTid() { return tid; }
	public void setTid(String tid) { this.tid = tid; }
	public String getCid() { return cid; }
	public void setCid(String cid) { this.cid = cid; }
	public String getSid() { return sid; }
	public void setSid(String sid) { this.sid = sid; }
	public String getPartner_order_id() { return partner_order_id; }
	public void setPartner_order_id(String partner_order_id) { this.partner_order_id = partner_order_id; }
	public String getPartner_user_id() { return partner_user_id; }
	public void setPartner_user_id(String partner_user_id) { this.partner_user_id = partner_user_id; }
	public String getPayment_method_type() { return payment_method_type; }
	public void setPayment_method_type(String payment_method_type) { this.payment_method_type = payment_method_type; }
	public String getItem_name() { return item_name; }
	public void setItem_name(String item_name) { this.item_name = item_name; }
	public String getItem_code() { return item_code; }
	public void setItem_code(String item_code) { this.item_code = item_code; }
	public int getQuantity() { return quantity; }
	public void setQuantity(int quantity) { this.quantity = quantity; }
	public String getCreated_at() { return created_at; }
	public void setCreated_at(String created_at) { this.created_at = created_at; }
	public String getApproved_at() { return approved_at; }
	public void setApproved_at(String approved_at) { this.approved_at = approved_at; }
	public String getPayload() { return payload; }
	public void setPayload(String payload) { this.payload = payload; }
	public int getError_code() { return error_code; }
	public void setError_code(int error_code) { this.error_code = error_code; }
	public String getError_message() { return error_message; }
	public void setError_message(String error_message) { this.error_message = error_message; }
	public Amount getAmount() {return amount;}
	public void setAmount(Amount amount) {this.amount = amount;}
	public CardInfo getCard_info() {return card_info;}
	public void setCard_info(CardInfo card_info) {this.card_info = card_info;}
	public Extras getExtras() {return extras;}
	public void setExtras(Extras extras) {this.extras = extras;}

	@Override
	public String toString() {
		return JsonUtil.toJsonPretty(this);
	}
}