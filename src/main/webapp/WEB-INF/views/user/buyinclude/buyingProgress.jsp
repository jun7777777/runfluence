<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<head>
<style type="text/css">
.order-link {
    text-decoration: none;
    color: inherit;
    display: block;
}

.order-info {
	font-size: 12px;
    text-align: left;
    color: #666;
    height: 38px;
    padding: 10px 16px;
    cursor: pointer;
}

.d-flex {
	gap: 12px; /* 요소들 사이의 간격 */
    align-items: center; /* 수직 중앙 정렬 */
}

.d-flex_product {
	padding: 16px 0;
}

.product-info {
	font-size: 12px;
    gap: 4px 0px;
}
.order_list {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.empty_list {
    display: flex;
    align-items: center;
    padding: 20px;
    border: 1px solid #ebebeb;
    border-radius: 8px;
    background-color: #fff;
    gap: 20px; /* 각 요소 사이의 간격 */
    max-width: 800px; /* 필요시 너비 조정 */
}

.product-image {
    width: 80px;
    height: 80px;
    border-radius: 8px;
    object-fit: cover;
    background-color: #ebebeb;
}

.product-info {
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 4px;
}

.product-title {
    font-size: 14px;
    color: #222;
    font-weight: 500;
}

.product-size {
    font-size: 12px;
    color: #666;
}

.order-status {
    text-align: center;
    margin-left: auto; /* 상태를 오른쪽 끝으로 정렬 */
}

.status-text {
    font-size: 14px;
    color: #222;
    font-weight: 500;
}

.status-subtext {
    font-size: 12px;
    color: #999;
}

.product-info p {
	margin-bottom: 0px; !important;
}

.order-end {
    width: 100%;
    height: 100%;
    padding-top: 20px;
}


.order-container {
    background: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    animation: fadeIn 0.3s ease-in-out;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.order-header {
    background: #f5f5f5;
    padding: 16px;
    border-bottom: 1px solid #ebebeb;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.order-header h2 {
    font-size: 16px;
    color: #333;
    margin: 0;
}

.order-header .closeBtn:hover {
    color: #333;
}

.order-date {
    font-weight: bold; /* 굵게 */
    font-size: 0.875rem; /* 날짜 텍스트 크기 */
    color: #333; /* 진한 회색 */
}

.order-detail {
    font-size: 0.875rem; /* 주문 번호 크기 */
    color: #555; /* 연한 회색 */
}

.order-status {
    text-align: center;
}
     
</style>

<style type="text/css">
.order-link {
    text-decoration: none;
    color: inherit;
    display: block;
}

.order-info {
	font-size: 12px;
    text-align: left;
    color: #666;
    height: 38px;
    padding: 10px 16px;
    cursor: pointer;
}

.d-flex {
	gap: 12px; /* 요소들 사이의 간격 */
    align-items: center; /* 수직 중앙 정렬 */
}

.d-flex_product {
	padding: 16px 0;
}

.product-info {
	font-size: 12px;
    gap: 4px 0px;
}
.order_list {
    display: flex;
    justify-content: center;
    margin: 20px 0;
}

.empty_list {
    display: flex;
    align-items: center;
    padding: 20px;
    border: 1px solid #ebebeb;
    border-radius: 8px;
    background-color: #fff;
    gap: 20px; /* 각 요소 사이의 간격 */
    max-width: 800px; /* 필요시 너비 조정 */
}

.product-image {
    width: 80px;
    height: 80px;
    border-radius: 8px;
    object-fit: cover;
    background-color: #ebebeb;
}

.product-info {
    display: flex;
    flex-direction: column;
    justify-content: center;
    gap: 4px;
}

.product-title {
    font-size: 14px;
    color: #222;
    font-weight: 500;
}

.product-size {
    font-size: 12px;
    color: #666;
}

.order-status {
    text-align: center;
    margin-left: auto; /* 상태를 오른쪽 끝으로 정렬 */
}

.status-text {
    font-size: 14px;
    color: #222;
    font-weight: 500;
}

.status-subtext {
    font-size: 12px;
    color: #999;
}

.product-info p {
	margin-bottom: 0px; !important;
}

.modal-overlay {
    display: none;
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: rgba(0, 0, 0, 0.5);
    z-index: 1000;
    justify-content: center;
    align-items: center;
}


.order-modal {
    background: #fff;
    border-radius: 8px;
    width: 600px;
    max-width: 90%;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
    overflow: hidden;
    animation: fadeIn 0.3s ease-in-out;
    overflow-y: auto;
    max-height: 90%;
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: scale(0.9);
    }
    to {
        opacity: 1;
        transform: scale(1);
    }
}

.modal-header {
    background: #f5f5f5;
    padding: 16px;
    border-bottom: 1px solid #ebebeb;
    display: flex;
    justify-content: space-between;
    align-items: center;
}

.modal-header h2 {
    font-size: 16px;
    color: #333;
    margin: 0;
}

.modal-header .closeBtn {
    font-size: 16px;
    color: #999;
    cursor: pointer;
    border: none;
    background: none;
}

.modal-header .closeBtn:hover {
    color: #333;
}

.modal-content {
    padding: 16px;
}



.modal-actions {
    margin-top: 16px;
    text-align: right;
}

.modal-actions button {
    padding: 8px 16px;
    background-color: #007bff;
    color: #fff;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

.modal-actions button:hover {
    background-color: #0056b3;
}

.modal-overlay.active {
    display: flex;
}
.order-info-container {
    font-size: 0.875rem; /* 텍스트 크기 */
    line-height: 1.5;
    color: #111; /* 기본 텍스트 색상 */
    display: flex; /* 플렉스 박스 사용 */
    flex-direction: row; /* 수직 정렬 */
    gap: 8px; /* 항목 간 간격 */
}

.order-date {
    font-weight: bold; /* 굵게 */
    font-size: 0.875rem; /* 날짜 텍스트 크기 */
    color: #333; /* 진한 회색 */
}

.order-number {
    font-size: 0.875rem; /* 주문 번호 크기 */
    color: #555; /* 연한 회색 */
}
.order-date-number {
	padding-left: 16px;
	padding-top: 16px;
}
.action-button {
    width: 100%; /* 버튼이 주문 상태 영역의 너비를 채우도록 설정 */
    padding: 8px;
    background-color: #f5f5f5;
    color: #6F6F6F;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    text-align: center;
    font-size: 12px;
}

.action-button:hover {
    background-color: #e0e0e0; /* hover 시 조금 더 진한 회색 */
    color: #333; /* 텍스트 색상을 hover 시 진한 색으로 변경 */
}

.order-status {
    text-align: center;
}
.modal-footer {
    padding: 20px;
    background-color: #f9f9f9;
    border-top: 1px solid #ddd;
    display: flex;
    justify-content: space-between;
    gap: 20px;
    flex-direction: column;
}

.recipient-info, .payment-info {
    flex: 1;
    background: #fff;
    padding: 16px;
    border: 1px solid #ddd;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    width: 100%;
}

.recipient-info h4, .payment-info h4 {
    margin-bottom: 12px;
    font-size: 16px;
    font-weight: bold;
    color: #333;
}

.recipient-info ul {
    list-style: none;
    padding: 0;
    margin: 0;
}

.recipient-info li {
    margin-bottom: 8px;
    font-size: 14px;
    line-height: 1.5;
}

.recipient-info li span {
    font-weight: bold;
    margin-right: 8px;
}

.payment-info table {
    width: 100%;
    border-collapse: collapse;
    font-size: 14px;
    color: #333;
}

.payment-info table td, .payment-info table th {
    padding: 8px;
    text-align: left;
}

.payment-info table tr th {
    font-weight: bold;
    color: #000;
    border-top: 2px solid #333;
}
.payment-info td
{
	white-space: nowrap;
}
.recipient-info li {
	white-space: nowrap;
}
     
</style>
</head>

<c:if test='${!empty orderList }'>
    <c:set var="prevOrderId" value="" /> <!-- 이전 주문번호 저장 변수 -->
    
    <c:forEach var="list" items="${orderList}" varStatus="status">
        
        <!-- 새로운 주문번호의 시작 -->
        <c:if test="${prevOrderId != list.orderId}">
            <!-- 이전 그룹 닫기 (첫 번째 항목 제외) -->
            <c:if test="${!status.first}">
                </div> <!-- order-container 닫기 -->
                </div> <!-- order-end 닫기 -->
            </c:if>
            
            <!-- 새로운 order-end 및 order-container 시작 -->
            <div class="order-end">
                <div class="order-container">
                    <div class="order-header">
                        <span class="order-date">${list.regDate} 주문</span>
                        <a href="javascript:void(0)" onclick="fn_detailModal('${list.orderId}')" class="modal-trigger">
                            <span class="order-detail">주문 상세보기 ></span>
                        </a>
                    </div>
        </c:if>

        <!-- 주문 리스트 추가 -->
        <div class="order_list">
            <div class="empty_list" style="flex-direction: row; min-height: 0px; padding:20px; width: 95%; max-width: 1200px;">
                <img src="/resources/prod-img/${list.prodMainCateId }/mainImg/${list.prodId}.png" alt="Product Image" class="product-image">
                <div class="product-info">
                    <a href="#" class="product-title">${list.orderProdName}</a>
                    <p>제품 코드 : ${list.prodId}</p>
                    <p class="product-size">옵션 : ${list.variantsOptionValueCombText}</p>
                    <p class="product-size">
                        <fmt:formatNumber value="${list.orderProdPrice - (list.orderProdPrice * (list.orderProdDiscountPercent / 100))}" type="number" groupingUsed="true"/>￦ ${list.orderProdQuantity}개
                    </p>
                </div>
                <div class="order-status">
                    <p class="status-text">${list.orderStatus}</p>
                    <c:if test='${list.orderStatus == "결제 완료" }'>
                    <p class="status-subtext">발송대기</p>
                    </c:if>
                </div>
            </div>
        </div>

        <!-- 마지막 항목일 경우 그룹 닫기 -->
        <c:if test="${status.last}">
                </div> <!-- order-container 닫기 -->
            </div> <!-- order-end 닫기 -->
        </c:if>

        <!-- 현재 주문번호를 이전 주문번호로 업데이트 -->
        <c:set var="prevOrderId" value="${list.orderId}" />
    </c:forEach>
</c:if>

<c:if test='${empty orderList }'>
<div class="order_list">
    <div class="empty_list">
        <div class="text_body">
            <p class="text_body_title">구매 내역이 없습니다.</p>
            <a href="/shop/shopIndex" class="button">
                <p class="text-lookup">SHOP 바로가기</p>
            </a>
        </div>
    </div>
</div>
</c:if>

<div id="modalContainer"></div>

<script>

function fn_detailModal(orderId) {
    $.ajax({
        url: "/buy/detail",
        type: "POST",
        data: { orderId: orderId },
        datatype: "JSON",
        beforeSend: function (xhr) {
            xhr.setRequestHeader("AJAX", "true");
        },
        success: function (res) {
            if (res.code == 0) {
                updateModalContent(res.data);
                
                // 모달 오버레이 활성화
                const modalOverlay = document.getElementById('modalOverlay');
                if (modalOverlay) {
                    modalOverlay.classList.add('active');
                }
            } else if(res.code == 500) {
            	alert(res.msg);
            } else if(res.code == 404) {
            	alert(res.msg);
            } else {
                alert("fail");
            }
        }
    });
}


function updateModalContent(data) {

    if (data && data.length > 0) {
        let modalContent = '';

        data.forEach((order) => {
            modalContent += 
                '<div class="modal-overlay" id="modalOverlay">' +
                '<div class="order-modal" data-paytype="' + order.paymentType + '">' +
                        '<div class="modal-header">' +
                            '<h2>주문 상세</h2>' +
                            '<button class="closeBtn" id="closeModal">×</button>' +
                        '</div>' +
                        '<div class="order-date-number">' +
                            '<div class="order-info-container">' +
                                '<span class="order-date">' + order.regDate + ' 주문</span>' +
                                '<span class="order-number">주문번호 ' + order.orderId + '</span>' +
                            '</div>' +
                        '</div>';

                        data.forEach((order) => {
                            modalContent +=
                                '<div class="order_list">' +
                                    '<div class="empty_list" style="flex-direction: row; min-height: 0px; padding: 20px;">' +
                                        '<img src="/resources/prod-img/' + order.prodMainCateId + '/mainImg/' + order.prodId + '.png" alt="Product Image" class="product-image">' +
                                        '<div class="product-info" data-prodid="' + order.prodId + '" data-combid="' + order.variantsOptionValueCombId + '" >' +
                                            '<a href="#" class="product-title modal-trigger">' + order.orderProdName + '</a>' +
                                            '<p>제품 코드 : ' + order.prodId + '</p>' +
                                            '<p class="product-size">옵션 : ' + order.variantsOptionValueCombText + '</p>' +
                                            '<p class="product-size">' + new Intl.NumberFormat().format(order.orderProdPrice - Math.round(order.orderProdPrice * (order.orderProdDiscountPercent / 100))) + '￦ 수량' + order.orderProdQuantity + '개</p>' +
                                        '</div>' +
                                        '<div class="order-status" style="display: flex; flex-direction: column; gap: 8px;">';
                            modalContent +=
                                        '</div>' +
                                    '</div>' +
                                '</div>';
                        });


            modalContent +=
                '<div class="modal-footer">' +
                    '<div class="recipient-info">' +
                        '<h4>받는사람 정보</h4>' +
                        '<ul>' +
                            '<li><span>받는사람:</span> ' + order.recipientName + '</li>' +
                            '<li><span>연락처:</span> ' + order.recipientTel + '</li>' +
                            '<li><span>받는주소:</span> (' + order.shippingAddrZipcode + ') ' + order.shippingAddrLine1 + '<br>(' + order.shippingAddrLine2 + ')</li>' +
                            '<li><span>배송요청사항:</span> ' + order.shippingMemo + '</li>' +
                        '</ul>' +
                    '</div>' +
                    '<div class="payment-info">' +
                        '<h4>결제 정보</h4>' +
                        '<table>' +
                        '<tr>' +
                        (order.paymentMethod && order.paymentMethod.trim() !== "" ? 
                                '<tr>' +
                                    '<td>결제수단</td>' +
                                    '<td>' + order.paymentMethod + '</td>' +
                                '</tr>' : '') +
                            '<tr>' +
                                '<td>총 상품가격</td>' +
                                '<td>' + new Intl.NumberFormat().format(order.orderSumPrice) + '원</td>' +
                            '</tr>' +
                            '<tr>' +
                                '<td>할인금액</td>' +
                                '<td>' + new Intl.NumberFormat().format(Math.round(order.orderSumPrice * (order.orderDiscountRate / 100))) + '원</td>' +
                            '</tr>' +
                            '<tr>' +
                                '<td>배송비</td>' +
                                '<td>' + new Intl.NumberFormat().format(order.orderShippingCost) + '원</td>' +
                            '</tr>' +
                            '<tr>' +
                                '<th>총 결제금액</th>' +
                                '<th>' + new Intl.NumberFormat().format(order.orderTotalPrice) + ' 원</th>' +
                            '</tr>' +
                        '</table>' +
                        '</div>';
            
		            if (order.orderStatus && order.orderStatus.trim() === "결제 완료") {
		            	
		            	modalContent += '<div class="recipient-info" style="display: flex; gap:8px;">' +
		            	'<button class="action-button" id="refund-btn">전체 취소</button>' +
		            	'</div>';
		            }
		            
		            else if (order.orderStatus && order.orderStatus.trim() === "주문 취소") {
		            	modalContent += '';
		            }
		            
		            else if (order.orderStatus && order.orderStatus.trim() === "결제 대기") {
		            	modalContent += '<div class="recipient-info" style="display: flex; gap:8px;">' +
		            	'<button class="action-button" id="payButton-' + order.orderId + '" onclick="showPaymentOptions(\'' + order.orderId + '\')">전체 결제</button>' +
		                '<button class="action-button" id="cancel-btn">전체 취소</button>' +
		                '</div>';
		            }
		            
		    modalContent += '</div>' +
		    '</div>' +
		'</div>';
		});

        const modalContainer = document.getElementById('modalContainer');
        modalContainer.innerHTML = modalContent;

        // 동적으로 생성된 모달 닫기 버튼에 이벤트 바인딩
        const closeButtons = modalContainer.querySelectorAll('.closeBtn');
        closeButtons.forEach(button => {
            button.addEventListener('click', function () {
                const modalOverlay = document.getElementById('modalOverlay');
                if (modalOverlay) {
                    modalOverlay.classList.remove('active');
                }
            });
        });
    }
}
function showPaymentOptions(orderId) {
    // 기존 결제 모달이 있는지 확인하고, 있으면 제거
    const existingModal = document.getElementById('paymentModal-' + orderId);
    if (existingModal) {
        existingModal.remove();
    }

    // 새 모달 생성
    const modalOverlay = document.createElement('div');
    modalOverlay.classList.add('modal-overlay');
    modalOverlay.id = 'paymentModal-' + orderId;

    const modalContent = `
        <div class="order-modal">
            <div class="modal-header">
                <h2>결제 수단 선택</h2>
                <button class="closeBtn" onclick="closeModal('\${orderId}')">×</button>
            </div>
            <div class="modal-body">
                <p>아래에서 결제 방법을 선택하세요.</p>
                <div class="payment-options" style="display: flex; gap:8px;">
                    <button class="action-button" onclick="payWithKakao('\${orderId}')">카카오페이로 결제</button>
                    <button class="action-button" onclick="payWithNaver('\${orderId}')">네이버페이로 결제</button>
                    <button class="action-button" onclick="payWithToss('\${orderId}')">토스페이로 결제</button>
                </div>
            </div>
        </div>
    `;
    modalOverlay.innerHTML = modalContent;

    // 모달을 화면에 추가
    document.body.appendChild(modalOverlay);

    // 모달 오버레이 활성화
    modalOverlay.classList.add('active');
}
</script>