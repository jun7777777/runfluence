<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>        
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>구매 내역</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Optional Bootstrap JS and dependencies (jQuery and Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <style>
        .buying_container {
            margin-left: auto;
            margin-right: auto;
            max-width: 1280px;
            padding: 40px 40px 160px;
        }

        .buying_container .nav-tabs {
            border-bottom: 1px solid #dee2e6;
        }
        
        .buying_container .nav-tabs .nav-link {
            color: #6c757d;
            border: none;
            border-bottom: 2px solid transparent;
            padding: 1rem 0.5rem;
        }
        
        .buying_container .nav-tabs .nav-link:hover {
            border-color: transparent;
            color: #212529;
        }
        
        .buying_container .nav-tabs .nav-link.active {
            color: #212529;
            border: none;
            border-bottom: 2px solid #212529;
            font-weight: 500;
        }
        
        .buying_container .nav-link .count {
            font-size: 18px;
            font-weight: bold;
            margin-bottom: 4px;
        }

        .buying_container .nav-link.active .count {
            color: #f15746;
            font-size: 20px;
        }
        
        .buying_container .nav-link .title {
            font-size: 13px;
        }

        /* 버튼 너비를 100%로 설정하여 내용 중앙 정렬 */
        .buying_container .nav-item button {
            width: 100%;
            justify-content: center;
        }
    
        /* 컨테이너 스타일 추가 */
        .buying_container .container.py-4 {
            display: flex;
            flex-direction: column; /* 내부 요소들을 세로로 배치 */
            margin-left: auto;
            margin-right: auto;
            max-width: 1280px;
            padding: 40px 40px 160px;
        }
        .buying_container main h2.mb-4 {
            font-size: 24px;
            letter-spacing: -.36px;
        }
        
        .buying_container .head_btn {
            background-color: #fff;
            border: 1px solid #ebebeb;
            border-radius: 12px;
            display: inline-block;
            font-size: 13px;
            letter-spacing: -.07px;
            line-height: 24px;
            min-width: 120px;
            padding: 5px 30px 5px 10px;
            position: relative;
            cursor: pointer;
            text-align: left;
            padding-left: 10px;
        }

        .buying_container .head_btn .bi-chevron-down {
            font-size: 16px;
            color: #222;;
        }

        .buying_container .text_body {
            text-align: center;  /* 내부 요소들 중앙 정렬 */
            width: 100%;
        }

        /* 타이틀 스타일 */
        .buying_container .text_body_title {
            color: rgba(0, 0, 0, 0.804);
            font-size: 14px;
            font-weight: 500;
            margin-bottom: 12px;  /* 타이틀과 버튼 사이 간격 */
        }

        .buying_container .empty_list {
            align-items: center;
            display: flex;
            flex-direction: column;
            justify-content: center;
            min-height: 192px;
            padding: 56px 28px;
            width: 100%;
        }

        .buying_container .text-lookup {
            color: rgb(34, 34, 34);
            font-size: 13px;
            font-weight: bold;
            margin: 0;
        }

        /* SHOP 바로가기 버튼 스타일 */
        .buying_container .text_body .button {
            background-color: #fff;
            border: 1px solid #131212;
            border-radius: 12px;
            display: inline-block;
            padding: 5px 10px;
            margin-top: 10px;
            text-decoration: none;
        }

        .buying_container .text_body .button:hover {
            background-color: #f8f8f8;
        }

        
        
        /* row 클래스 수정 */
        .buying_container .row {
            display: flex;
            flex-direction: row;  /* 가로 방향 배치 */
            gap: 20px;  /* 사이드바와 메인 컨텐츠 사이 간격 */
        }

        /* 메인 컨텐츠 스타일 */
        .buying_container .main-content {
            flex: 1;  /* 남은 공간 모두 차지 */
            min-width: 0;  /* 오버플로우 방지 */ 
            
            .sidebar {
                width: 100%;
                margin-bottom: 20px;
            }
        }

        
    </style>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script src="https://js.tosspayments.com/v2/standard"></script>
<script>
$(document).ready(function() {
    $(document).on("click", ".refund-btn", function() {
        if (confirm('선택하신 상품의 결제를 취소하시겠습니까?')) {
            const paymentType = $(this).closest('.order-modal').data('paytype');        
            const orderId = $(this).closest('.order-modal').find('.order-number').text().split(' ').pop();
            
            let refundURL;
            
            if (paymentType === "KAKAO_PAY") {
                refundURL = "/shop/order/kakaoPay/refund";  
            
            } else if (paymentType === "NAVER_PAY") {
                refundURL = "/shop/order/naverPay/refund";
            
            } else if (paymentType === "TOSS_PAY") {
                refundURL = "/shop/order/tossPay/refund";
            }
            
            var prodIds = [];
            var combIds = [];
            
            const $product = $(this).closest('.order_list').find('.product-info');
            const prodId = $product.data('prodid');
            const combId = $product.data('combid');
            
            prodIds.push(prodId);
            combIds.push(combId);

            $.ajax({
                type: "POST",
                url: refundURL,
                data: {
                    orderId: orderId,
                    prodIds: prodIds.join(','),
                    combIds: combIds.join(',')
                },
                dataType: "JSON",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function(response) {
                    if(response.code === 200) {
                        alert("결제가 성공적으로 취소되었습니다.");
                        location.href = "/user/buy?tab=inProgressing";  
                        
                    } else if (response.code === 400) {
                        alert("파라미터가 올바르지 않습니다.(Bad Request)");
                        
                    } else if (response.code === 404) {
                        alert("데이터가 존재하지 않습니다.");
                    
                    } else if (response.code === 409) {
                        alert("배송이 시작되어 결제 취소에 실패하였습니다.");
                    
                    } else if (response.code === 502) {
                        alert("결제 API 서버 응답 오류로 결제 취소에 실패하였습니다.");
                    
                    } else if (response.code === 402) {
                        alert("결제 API 서버에서 요청한 값과 다릅니다.");
                    
                    } else if (respons.code === 500) {
                        alert("DB 정합성 오류가 발생하였습니다.");
                    
                    } else {
                        alert("서버 오류로 결제 취소에 실패하였습니다.");
                    }
                },
                error: function(error) {
                    alert("서버 오류로 결제 취소에 실패하였습니다.");
                }
            });
        }
    });
    
    $(document).on("click", "#refund-btn", function () {
        if (confirm('모든 상품의 결제를 취소하시겠습니까?')) {
            const paymentType = $(this).closest('.order-modal').data('paytype');        
            const orderId = $(this).closest('.order-modal').find('.order-number').text().split(' ').pop();
            
            let refundURL;
            
            if (paymentType === "KAKAO_PAY") {
                refundURL = "/shop/order/kakaoPay/refund";  
            
            } else if (paymentType === "NAVER_PAY") {
                refundURL = "/shop/order/naverPay/refund";
            
            } else if (paymentType === "TOSS_PAY") {
                refundURL = "/shop/order/tossPay/refund";
            }
            
            var prodIds = [];
            var combIds = [];
            
            const $productList = $(this).closest('.order-modal').find('.order_list');
            
            $productList.each(function(){
                $product = $(this).find('.product-info');
                const prodId = $product.data('prodid');
                const combId = $product.data('combid');
                prodIds.push(prodId);
                combIds.push(combId);
            });
            
            $.ajax({
                type: "POST",
                url: refundURL,
                data: {
                    orderId: orderId,
                    prodIds: prodIds.join(','),
                    combIds: combIds.join(',')
                },
                dataType: "JSON",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function(response) {
                    if(response.code === 200) {
                        alert("결제가 성공적으로 취소되었습니다.");
                        location.href = "/user/buy?tab=complete";  
                        
                    } else if (response.code === 400) {
                        alert("파라미터가 올바르지 않습니다.(Bad Request)");
                        
                    } else if (response.code === 404) {
                        alert("데이터가 존재하지 않습니다.");
                    
                    } else if (response.code === 409) {
                        alert("배송이 시작되어 결제 취소에 실패하였습니다.");
                    
                    } else if (response.code === 502) {
                        alert("결제 API 서버 응답 오류로 결제 취소에 실패하였습니다.");
                    
                    } else if (response.code === 402) {
                        alert("결제 API 서버에서 요청한 값과 다릅니다.");
                    
                    } else if (response.code === 500) {
                        alert("DB 정합성 오류가 발생하였습니다.");
                    
                    } else {
                        alert("서버 오류로 결제 취소에 실패하였습니다.");
                    }
                },
                error: function(error) {
                    alert("서버 오류로 결제 취소에 실패하였습니다.");
                }
            });
        }
    });
    
    $(document).on("click", "#cancel-btn", function(){
        if (confirm("정말로 주문을 취소하시겠습니까?")) {
            const orderId = $(this).closest('.order-modal').find('.order-number').text().split(' ').pop();
            
            $.ajax({
                type: "POST",
                url: "/shop/order/cancel",
                data: {
                    orderId: orderId,
                },
                dataType: "JSON",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function(response) {
                    if(response.code === 200) {
                        alert("주문이 성공적으로 취소되었습니다.");
                        location.href = "/user/buy?tab=complete";  
                        
                    } else if (response.code === 404) {
                        alert("데이터가 존재하지 않습니다.");
                        
                    } else if (response.code === 500) {
                        alert("DB 정합성 오류가 발생하였습니다.");
                    
                    } else {
                        alert("서버 오류로 주문 취소에 실패하였습니다.");
                    }
                },
                error: function(error) {
                    alert("서버 오류로 주문 취소에 실패하였습니다.");
                }
            });
        } 
    });
    
});

function payWithKakao(orderId) {
    $.ajax({
        type: "POST",
        url: "/shop/order/kakaoPay/ready",
        data: {
            orderId: orderId,
        },
        dataType: "JSON",
        beforeSend: function(xhr) {
            xhr.setRequestHeader("AJAX", "true");
        },
        success: function(kakaoResponse) {
            if (kakaoResponse.code === 200) {
                let _width = 500;
                let _height = 550;
                 
                let _left = Math.ceil((window.screen.width - _width) / 2);
                let _top = Math.ceil((window.screen.height - _height) / 2);
                 
                kakaoPayPopup = window.open(kakaoResponse.data.next_redirect_pc_url, "카카오페이 결제", "width="+_width+", height="+_height+", left="+_left+", top="+_top+", resizable=false, scrollbars=false, status=false, titlebar=false, toolbar=false, menubar=false");

            } else {
                alert(kakaoResponse.msg);
            }
             
            var checkPopupClosedInterval = setInterval(function() {
                if (kakaoPayPopup.closed) {
                    clearInterval(checkPopupClosedInterval);
                    alert("결제가 취소되었습니다.");
                }
            }, 1000);
             
        },
        error: function(error) {
            alert("카카오 페이 서버 오류로 결제에 실패하였습니다.");
            icia.common.error(error);
        }
    });
}

function fn_kakaoPayResult(code, msg, orderId) {
    if (kakaoPayPopup !== null) {
        if (icia.common.type(kakaoPayPopup) === "object" && !kakaoPayPopup.closed) {
            kakaoPayPopup.close();
        }
       
        kakaoPayPopup = null;
    }
    
    if (code === 200) {
        alert(msg);
        location.href = "/shop/payOk?orderId=" + encodeURIComponent(orderId);
    
    } else {
        alert(msg);
    }
}

function payWithNaver(orderId) {
    $.ajax({
         url: "/shop/orderProdList",
         type: "POST",
         data: {
             orderId: orderId
         },
         dataType: "JSON",
         beforeSend: function(xhr) {
             xhr.setRequestHeader("AJAX", "true");
         },
         success: function(response) {
            if (response.code === 200) {
                const order = response.data;
                const orderProdList = response.data.orderProdList;
                const productCount = orderProdList.reduce((total, orderProd) => total + orderProd.orderProdQuantity, 0);
                const productName = orderProdList[0].orderProdName;
    
                var productItems = orderProdList.map(orderProd => ({
                    "categoryType": "PRODUCT",
                    "categoryId": "GENERAL",
                    "uid": orderProd.prodId,
                    "name": orderProd.orderProdName,
                    "count": orderProd.orderProdQuantity
                }));
                 
                var oPay = Naver.Pay.create({
                    "clientId": "${X_NAVER_CLIENT_ID}",
                    "chainId": "${X_NAVERPAY_CHAIN_ID}",
                    "mode": "development",
                    "openType": "popup",
                    "onAuthorize": function (oData) {
                        if (oData.resultCode === "Success") {
                            $.ajax({
                                url: "/shop/order/naverPay/success",
                                type: "POST",
                                data: {
                                    orderId: orderId,
                                    paymentId: oData.paymentId
                                },
                                dataType: "JSON",
                                beforeSend: function(xhr) {
                                    xhr.setRequestHeader("AJAX", "true");
                                },
                                success: function(naverResponse) {
                                    if (naverResponse.code === 200) {
                                        alert("결제가 완료되었습니다.");
                                        const orderIdParam = encodeURIComponent(order.orderId);
                                        location.href = "/shop/payOk?orderId=" + orderIdParam;
                                        
                                    } else if (naverResponse.code === 400) {
                                        alert(naverResponse.msg);
                                        
                                    } else if (naverResponse.code === 500) {
                                        alert("네이버 페이 결제 처리중 오류가 발생하였습니다.");
                                        
                                    } else if (naverResponse.code === 601) {
                                        alert("DB 정합성 오류가 발생하였습니다.");
                                        
                                    } else {
                                        alert("DB 정합성 오류가 발생하였습니다.");
                                    }
                                },
                                error: function(error) {
                                   alert("네이버 페이 서버 오류로 결제에 실패하였습니다.");
                                   icia.common.error(error);
                                }
                            });
                        } else {
                            alert(oData.resultMessage);
                        }
                    }
                });
    
                oPay.open({
                    "merchantPayKey": "20241209vUhybA",
                    "productName": productName,
                    "productCount": productCount,
                    "totalPayAmount": order.orderTotalPrice,
                    "taxScopeAmount": order.orderTotalPrice,
                    "taxExScopeAmount": "0",
                    "returnUrl": "https://developers.pay.naver.com/user/sand-box/payment",
                    "productItems": productItems
                });
            } else {
                alert("서버 오류로 조회에 실패하였습니다.");
            }
        },
        error: function(error) {
            alert("서버 오류로 조회에 실패하였습니다.");
            icia.common.error(error);
        }
    });
}

function payWithToss(orderId) {
    
     $.ajax({
         url: "/shop/orderProdList",
         type: "POST",
         data: {
             orderId: orderId
         },
         dataType: "JSON",
         beforeSend: function(xhr) {
             xhr.setRequestHeader("AJAX", "true");
         },
         success: function(response) {
            if (response.code === 200) {
                const order = response.data;
                const orderProdList = response.data.orderProdList;
                const productCount = orderProdList.reduce((total, orderProd) => total + orderProd.orderProdQuantity, 0);
                const productName = orderProdList[0].orderProdName;
    
                let orderName;
                
                if (productCount > 1) {
                    orderName = productName + " 외 " + (productCount - 1) + "건";
                
                } else {
                    orderName = productName;
                }
                
                const clientKey = "${TOSSPAY_CLIENT_KEY}";
                const customerKey = "${customerKey}";
                const tossPayments = TossPayments(clientKey);
                const payment = tossPayments.payment({customerKey});
                
                payment.requestPayment({
                    method: "CARD", 
                    amount: {
                        currency: "KRW",
                        value: order.orderTotalPrice,
                    },
                    orderId: order.orderId, 
                    orderName: orderName,
                    customerEmail: "${user.userEmail}",
                    customerName: "${user.userName}",
                    windowTarget: "iframe",
                    card: {
                        useEscrow: false,
                        flowMode: "DEFAULT", 
                        useCardPoint: false,
                        useAppCardOnly: false,
                    },
                }).then(function (data) {
                    $.ajax({
                        type: "POST",
                        url: "/shop/order/tossPay/success",
                        data: {
                            paymentKey: data.paymentKey, 
                            orderId: data.orderId,     
                            amount: data.amount.value       
                        },
                        dataType: "JSON",
                        beforeSend: function(xhr) {
                            xhr.setRequestHeader("AJAX", "true");
                        },
                        success: function(tossResponse) {
                            if (tossResponse.code === 200) {
                                alert("결제가 완료되었습니다.");
                                const orderIdParam = encodeURIComponent(order.orderId);
                                location.href = "/shop/payOk?orderId=" + orderIdParam;
                                
                            } else if (tossResponse.code === 400) {
                                alert(tossResponse.msg);
                                
                            } else if (tossResponse.code === 500) {
                                alert("토스 페이 결제 처리중 오류가 발생하였습니다.");
                                
                            } else if (tossResponse.code === 601) {
                                alert("DB 정합성 오류가 발생하였습니다.");
                                
                            } else if (tossResponse.code === 404) {
                                alert("파라미터가 올바르지 않습니다.");
                                
                            } else {
                                alert("DB 정합성 오류가 발생하였습니다.");
                            }
                        },
                        error: function(error) {
                            alert("토스 페이 서버 오류로 결제에 실패하였습니다.");
                            icia.common.error(error);
                        }
                    });
                    
                }).catch(function (error) {
                    alert("토스 페이 결제 오류: " + error.message);
                });

            } else {
                alert("서버 오류로 조회에 실패하였습니다.");
            }
        },
        error: function(error) {
            alert("서버 오류로 조회에 실패하였습니다.");
            icia.common.error(error);
        }
    });
}

function closeModal(orderId) {
    const modalOverlay = document.getElementById('paymentModal-' + orderId);
    if (modalOverlay) {
        modalOverlay.classList.remove('active');
        modalOverlay.remove();
    }
}
</script>
</head>
<body>
  <%@include file="/WEB-INF/views/include/shopCate.jsp" %>
  <!-- 메인 컨텐츠 -->
  <div class="container-fluid py-4 buying_container">
    <div class="row">
      <!-- 사이드바 -->
      <%@include file="/WEB-INF/views/include/mypageSideBar.jsp" %>
      <!-- 메인 컨텐츠 -->
      <main class="main-content">
        <h2 class="mb-4">구매 내역</h2>
        <!-- 여기에 구매 내역 컨텐츠 추가 -->
        <div class="container mt-5">
          <!-- 탭 메뉴 -->
          <ul class="nav nav-tabs d-flex justify-content-center mb-4" id="purchaseTab" role="tablist">
            <li class="nav-item flex-fill text-center" role="presentation">
              <a class="nav-link d-flex flex-column align-items-center w-100 ${currentTab == 'all' ? 'active' : ''}"
                href="/user/buy?tab=all" id="bidding-tab" type="button" role="tab">
                <span class="count">${allCnt}</span>
                <span class="title">전체</span>
              </a>
            </li>
            <li class="nav-item flex-fill text-center" role="presentation">
              <a class="nav-link d-flex flex-column align-items-center w-100 ${currentTab == 'inProgressing' ? 'active' : ''}"
                href="/user/buy?tab=inProgressing" id="progress-tab" type="button" role="tab">
                <span class="count">${progressingCnt}</span>
                <span class="title">진행 중</span>
              </a>
            </li>
            <li class="nav-item flex-fill text-center" role="presentation">
              <a class="nav-link d-flex flex-column align-items-center w-100 ${currentTab == 'complete' ? 'active' : ''}"
                href="/user/buy?tab=complete" id="completed-tab" type="button" role="tab">
                <span class="count">${endCnt}</span>
                <span class="title">종료</span>
              </a>
            </li>
          </ul>
          <!-- 모달 버튼 -->
          <div class="purchase_head">
            <div class="head_product">
              <button class="head_btn" data-bs-toggle="modal" data-bs-target="#statusModal">
                전체<i class="bi bi-chevron-down position-absolute"
                  style="right: 8px; top: 50%; transform: translateY(-50%);"></i>
              </button>
            </div>
          </div>
          <!--탭 컨텐츠 출력-->
          <div class="tab-content">
            <c:choose>
              <c:when test="${currentTab == 'all'}">
                <%@include file="/WEB-INF/views/user/buyinclude/buyall.jsp" %>
              </c:when>
              <c:when test="${currentTab == 'inProgressing'}">
                <%@include file="/WEB-INF/views/user/buyinclude/buyingProgress.jsp" %>
              </c:when>
              <c:when test="${currentTab == 'complete'}">
                <%@include file="/WEB-INF/views/user/buyinclude/buyEnd.jsp" %>
              </c:when>
            </c:choose>
          </div>
        </div>

      </main>
    </div>
  </div>

  <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>

  <!-- 부트스트랩 JS -->
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

  <div class="modal-content">
    <c:choose>
      <c:when test="${currentTab == 'all'}">
        <%@include file="/WEB-INF/views/user/buyinclude/buyallModal.jsp" %>
      </c:when>
      <c:when test="${currentTab == 'inProgressing'}">
        <%@include file="/WEB-INF/views/user/buyinclude/buyingModal.jsp" %>
      </c:when>
      <c:when test="${currentTab == 'complete'}">
        <%@include file="/WEB-INF/views/user/buyinclude/buyEndModal.jsp" %>
      </c:when>
    </c:choose>
  </div>

  <!-- 자바스크립트 추가 -->
  <script>
      // 상태 선택 시 버튼 텍스트 변경
      document.querySelectorAll('.status-link').forEach(link => {
          link.addEventListener('click', function (e) {
              e.preventDefault();
              const selectedText = this.querySelector('span').textContent;
              document.querySelector('.head_btn').textContent = selectedText;

              // 모달 닫기
              const modal = bootstrap.Modal.getInstance(document.getElementById('statusModal'));
              modal.hide();
          });
      });
  </script>
</body>
</html>