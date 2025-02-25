<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_자주묻는질문</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <style>
       
       /* 검색창 스타일 */
   .my-component > input[type=text] {
       width: 130px; /* 기본 너비 */
       padding: 10px; /* 내부 여백 */
       font-size: 14px; /* 글자 크기 */
       border: 1px solid #dee2e6; /* 테두리 */
       border-radius: 15px 0 0 15px; /* 왼쪽 끝만 둥글게 */
       outline: none; /* 포커스 시 기본 outline 제거 */
       -webkit-transition: width 0.4s ease-in-out; /* 너비 애니메이션 */
       transition: width 0.4s ease-in-out;
       background-color: #f4f4f4; /* 배경색 */
       margin-right: -1px; /* 버튼과 경계 맞춤 */
   }
   
   /* 포커스 시 검색창 너비 변경 */
   .my-component > input[type=text]:focus {
       width: 100%;
   }
   
   
   /* 검색 버튼 스타일 */
   .my-component > button.search-button {
       display: flex; /* 아이콘 중앙 정렬을 위해 flexbox 사용 */
       align-items: center; /* 세로 정렬 */
       justify-content: center; /* 가로 정렬 */
       padding: 10px 15px; /* 버튼 패딩 */
       font-size: 14px; /* 글자 크기 */
       border: 1px solid #dee2e6; /* 테두리 */
       background-color: #f4f4f4; /* 버튼 배경색 */
       color: #6c757d; /* 버튼 글자 색상 */
       border-radius: 0 15px 15px 0; /* 오른쪽 끝만 둥글게 */
   }
   
   /* 버튼 호버 효과 */
   button.search-button:hover {
       background-color: none; /* 호버 시 배경색 */
   }
   
   /* 아이콘 스타일 */
   .my-component > button.search-button i {
       font-size: 21.2px; /* 아이콘 크기 */
   }
       
       
    
        body {
            font-family: "JejuGothic", "Poppins", sans-serif;
            background-color: #fff;
        }
        .sidebar {
            min-width: 180px;
        }
        .mypage-title h2 {
            font-size: 32px;
            text-transform: uppercase;
        }
        .main-content .myprofile_title {
            font-size: 24px;
            font-weight: 700;
            border-bottom: 3px solid #222;
            padding-bottom: 16px;
            margin-bottom: 20px;
        }
        .input_search_bar {
            background-color: #f4f4f4;
            border-radius: 8px;
            font-size: 15px;
            padding: 15px 43px 15px 12px;
            width: 100%;
        }
        /* 테이블 기반 탭 네비게이션 스타일 */
        .tab-table {
            width: 100%;
            margin-bottom: 20px;
            border-collapse: collapse; /* 셀 간 테두리 합치기 */
            border: 1px solid #e2e6ea; /* 테이블 외곽 테두리 */
        }
        .tab-table td {
            border: 1px solid #e2e6ea; /* 각 셀의 테두리 */
            padding: 0; /* 패딩 제거 */
        }
        .tab-table button {
            width: 100%;
            padding: 10px;
            border: none; /* 버튼 테두리 제거 */
            background-color: #fff; /* 배경색 흰색으로 설정 */
            cursor: pointer;
            font-weight: 500;
            color: #666; /* 기본 텍스트 색상 */
            transition: none; /* 전환 효과 제거 */
        }
        .tab-table button.active {
            background-color: #fff; /* 배경색 흰색 유지 */
            color: #212529; /* 텍스트 색상 어둡게 변경 */
            font-weight: 700; /* 텍스트 두껍게 */
        }
        .tab-table button:hover {
            background-color: #fff; /* 호버 시 배경색 변화를 없앰 */
            color: #212529; /* 호버 시 텍스트 색상 어둡게 변경 */
        }
        /* FAQ 목록 스타일 */
        .faq-list {
            list-style: none;
            padding: 0;
        }
        .faq-item {
            border-bottom: 1px solid #e2e6ea;
            padding: 15px 0;
            cursor: pointer;
            transition: background-color 0.3s;
        }
        .faq-item:hover {
            background-color: #f8f9fa;
        }
        .faq-question {
            font-weight: 600;
        }
        .faq-answer {
            display: none;
            margin-top: 10px;
            padding-left: 15px;
        }
        .faq-item.active .faq-answer {
            display: block;
        }
        /* "더보기" 버튼 스타일 */
        .load-more-btn {
            display: block;
            margin: 20px auto;
        }
        .btn-primary {
        
           --bs-btn-hover-bg: #fff;
           --bs-btn-hover-border-color: #000;
        }
        
    </style>
    <script>
        document.addEventListener('DOMContentLoaded', function() {
            // 검색어를 처리하는 함수
            function searchFunction() {
                const activeTab = document.querySelector('.tab-pane.active');
                const searchTerm = document.getElementById('search_input').value.trim().toLowerCase();
                const faqItems = activeTab.querySelectorAll('.faq-item');
                faqItems.forEach(item => {
                    const question = item.querySelector('.faq-question').textContent.toLowerCase();
                    const answer = item.querySelector('.faq-answer').textContent.toLowerCase();
                    if (question.includes(searchTerm) || answer.includes(searchTerm)) {
                        item.style.display = '';
                    } else {
                        item.style.display = 'none';
                    }
                });
                // 리셋 "더보기" 버튼
                const loadMoreBtn = activeTab.querySelector('.load-more-btn');
                if (loadMoreBtn) {
                    loadMoreBtn.style.display = (faqItems.length > 10) ? 'block' : 'none';
                }
            }

            // 엔터키를 눌렀을 때 검색을 실행
            document.getElementById('search_input').addEventListener('keypress', function(event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    searchFunction();
                }
            });

            // FAQ 아이템 클릭 시 내용 토글
            function initializeFaqItems(faqList) {
                const faqItems = faqList.querySelectorAll('.faq-item');
                faqItems.forEach(item => {
                    item.addEventListener('click', function() {
                        // 현재 클릭한 항목이 이미 활성화되어 있는지 확인
                        const isActive = this.classList.contains('active');
                        
                        // 모든 FAQ 항목에서 'active' 클래스 제거
                        faqItems.forEach(i => i.classList.remove('active'));
                        
                        // 클릭한 항목이 비활성화 상태였다면 'active' 클래스 추가
                        if (!isActive) {
                            this.classList.add('active');
                        }
                    });

                    // 키보드 접근성 추가 (Enter, Space)
                    item.setAttribute('tabindex', '0'); // 포커스 가능하게 설정
                    item.addEventListener('keypress', function(event) {
                        if (event.key === 'Enter' || event.key === ' ') {
                            event.preventDefault();
                            this.click();
                        }
                    });
                });
            }

            // 탭 버튼 클릭 시 내용 전환 및 강조 효과
            const tabButtons = document.querySelectorAll('.tab-table button');
            tabButtons.forEach(button => {
                button.addEventListener('click', function() {
                    // 활성 탭 버튼 업데이트
                    tabButtons.forEach(btn => btn.classList.remove('active'));
                    this.classList.add('active');

                    // 활성 탭 내용 전환
                    const target = this.getAttribute('data-target');
                    const tabContents = document.querySelectorAll('.tab-content > div');
                    tabContents.forEach(content => {
                        if (content.id === target) {
                            content.classList.add('show', 'active');
                        } else {
                            content.classList.remove('show', 'active');
                        }
                    });

                    // 검색 입력 초기화
                    document.getElementById('search_input').value = '';

                    // "더보기" 버튼과 FAQ 목록 초기화
                    const activeTab = document.getElementById(target);
                    const faqList = activeTab.querySelector('.faq-list');
                    const loadMoreBtn = activeTab.querySelector('.load-more-btn');
                    const faqItems = faqList.querySelectorAll('.faq-item');
                    const initialDisplay = 10;
                    let currentIndex = initialDisplay;

                    // 모든 FAQ 항목의 'active' 클래스 제거
                    const allFaqItems = document.querySelectorAll('.faq-item');
                    allFaqItems.forEach(item => item.classList.remove('active'));

                    // 초기 표시
                    faqItems.forEach((item, index) => {
                        if (index < initialDisplay) {
                            item.style.display = '';
                        } else {
                            item.style.display = 'none';
                        }
                    });

                    // "더보기" 버튼 상태 설정
                    if (faqItems.length > initialDisplay) {
                        loadMoreBtn.style.display = 'block';
                    } else {
                        loadMoreBtn.style.display = 'none';
                    }

                    // "더보기" 버튼의 currentIndex 재설정
                    loadMoreBtn.dataset.currentIndex = initialDisplay;

                    // FAQ 아이템 초기화 (이벤트 리스너 재설정)
                    initializeFaqItems(faqList);
                });
            });

            // 초기 활성화된 탭 콘텐츠 표시 및 초기화
            const initialActiveTab = document.querySelector('.tab-table button.active').getAttribute('data-target');
            const initialTabContent = document.getElementById(initialActiveTab);
            initialTabContent.classList.add('show', 'active');
            const initialFaqList = initialTabContent.querySelector('.faq-list');
            const initialLoadMoreBtn = initialTabContent.querySelector('.load-more-btn');
            const initialFaqItems = initialFaqList.querySelectorAll('.faq-item');
            const initialDisplay = 10;
            let initialCurrentIndex = initialDisplay;

            // 초기 FAQ 항목 표시
            initialFaqItems.forEach((item, index) => {
                if (index < initialDisplay) {
                    item.style.display = '';
                } else {
                    item.style.display = 'none';
                }
            });

            // "더보기" 버튼 초기 상태 설정
            if (initialFaqItems.length > initialDisplay) {
                initialLoadMoreBtn.style.display = 'block';
            } else {
                initialLoadMoreBtn.style.display = 'none';
            }

            // FAQ 아이템 초기화 (이벤트 리스너 설정)
            initializeFaqItems(initialFaqList);

            // "더보기" 버튼 기능 구현
            function initializeLoadMoreButtons() {
                const loadMoreButtons = document.querySelectorAll('.load-more-btn');
                loadMoreButtons.forEach(button => {
                    const faqList = button.previousElementSibling;
                    const faqItems = faqList.querySelectorAll('.faq-item');
                    const initialDisplay = 10;
                    let currentIndex = initialDisplay;

                    // 데이터 속성으로 currentIndex 저장
                    button.dataset.currentIndex = initialDisplay;

                    // 버튼 클릭 시 다음 10개 표시
                    button.addEventListener('click', function() {
                        const hiddenItems = Array.from(faqItems).filter((item, index) => index >= currentIndex && item.style.display === 'none');
                        hiddenItems.slice(0, 10).forEach(item => {
                            item.style.display = '';
                        });
                        currentIndex += 10;
                        button.dataset.currentIndex = currentIndex;

                        // 더 이상 숨겨진 항목이 없으면 버튼 숨기기
                        const remaining = Array.from(faqItems).filter((item, index) => index >= currentIndex && item.style.display === 'none').length;
                        if (remaining === 0) {
                            button.style.display = 'none';
                        }
                    });

                    // 초기 버튼 상태
                    if (faqItems.length <= initialDisplay) {
                        button.style.display = 'none';
                    }
                });
            }

            // 초기 "더보기" 버튼 초기화
            initializeLoadMoreButtons();
        });
    </script>
</head>
<body>
    <%@include file="/WEB-INF/views/include/shopCate.jsp" %>
    <!-- 메인 컨텐츠 -->
    <div class="container py-4 buying_container">
        <div class="row">
            
         <nav class="col-md-3 mb-4 mb-md-0 mysidebar" style="flex-shrink: 0; flex:none; width:180px;">
             
         
             <!-- 고객 지원 섹션 -->
             <div class="mb-4">
                 <h5 class="border-bottom pb-2 mb-3" style="font-weight: 600; font-size: 16px;">
                     고객 지원
                 </h5>
                 <ul class="nav flex-column" style="padding-left: 0;">
                     <li class="nav-item">
                         <a href="/notice/notice" class="nav-link" style="color: inherit; padding: 8px 0">
                             공지사항
                         </a>
                     </li>
                     <li class="nav-item">
                         <a href="/notice/qna" class="nav-link" style="color: inherit; padding: 8px 0;">
                             자주 물어보는 질문
                         </a>
                     </li>
                 </ul>
             </div>
         </nav>

            <!-- 메인 컨텐츠 -->
            <main class="col-md-9 main-content">
                <div class="myprofile_title mb-4" style="margin-bottom: 15px !important;">
                    자주 묻는 질문
                </div>
                <!-- 검색 바 -->
                <div class="my-component" style="display: flex; align-items: center; padding-bottom: 15px;">
                <!-- 검색창 -->
                <input type="text" id="search_input" placeholder="검색하세요.."/>
                <!-- 검색 버튼 (아이콘 포함) -->
                <button class="search-button" onclick="searchFunction()">
                    <i class="fa fa-search"></i>
                </button>
            </div>
                <!-- 테이블 기반 탭 네비게이션 -->
                <table class="tab-table mb-4">
                    <tr>
                        <td><button class="active" data-target="orderTab">주문/결제 문의</button></td>
                        <td><button data-target="cancelTab">취소 문의</button></td>
                        <td><button data-target="exchangeTab">교환, 반품 문의</button></td>
                    </tr>
                    <tr>
                        <td><button data-target="deliveryTab">배송관련 문의</button></td>
                        <td><button data-target="userTab">회원정보 관련 문의</button></td>
                        <td><button data-target="productTab">상품 관련 문의</button></td>
                    </tr>
                </table>
                <!-- FAQ 내용 -->
                <div class="tab-content" id="faqTabContent">
                    <!-- 주문/결제 문의 -->
                    <div class="tab-pane" id="orderTab" role="tabpanel" aria-labelledby="order-tab">
                        <ul class="faq-list">
                            <!-- FAQ 항목들 (초기 10개 표시, 추가는 "더보기" 버튼으로) -->
                            <li class="faq-item">
                                <div class="faq-question">결제 수단으로는 어떤 것들이 있나요?</div>
                                <div class="faq-answer">현재 결제 수단으로 카카오페이를 지원 중이며 추후 다른 결제수단이 추가될 예정입니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">현금영수증 또는 신용카드 매출전표는 어떻게 받나요?</div>
                                <div class="faq-answer">상품을 구매하면 영수증/매출전표는 자동으로 발급됩니다. 
                                    단, PC 웹사이트에서는 개별 확인, 일괄 확인, 출력까지 모두 가능하나, 모바일에서는 각 주문 개별로만 확인할 수 있습니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">카드 즉시할인은 어떻게 확인할 수 있나요?</div>
                                <div class="faq-answer">각 카드사에서 제공하는 즉시할인은 프로모션 혜택 페이지와 상품 페이지, 그리고 주문/결제 페이지에서 확인할 수 있습니다. 카드 즉시할인이 적용되면 결제 전 주문/결제 페이지의 최종 결제금액에서 [카드 즉시할인(OO카드) -0,000원] 문구가 노출됩니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">신용카드 무이자 할부가 가능한가요?</div>
                                <div class="faq-answer">일반 신용카드 및 쿠페이에 등록한 신용카드로 5만원 이상 결제 시 할부가 가능합니다. 
                                    단, 무이자 할부 가능 여부는 주문서 페이지에서 할부 개월을 선택하면 확인할 수 있습니다. 
                                    결제를 할 때에도 카드 설정 칸 아래에 [무이자 할부 및 할인 혜택]에서 각 카드사별 무이자 할부 혜택을 확인할 수 있습니다. 
                                    무이자 할부 혜택은 매월 새롭게 변경되고 카드사별로 무이자 할부 기준이 다르기에 보다 자세한 내용은 이용하시는 카드사로 문의해 주시기 바랍니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">세금계산서를 발급받고 싶어요</div>
                                <div class="faq-answer">2015년 7월 16일 이후 결제된 주문 건은 영수증/매출전표가 자동으로 발급됩니다. 신용카드 매출전표와 현금영수증이 발행되므로 '부가가치세법 제33조(세금계산서 발급의무의 면제 등)'에 의거하여 별도로 세금계산서를 발행하지 않습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">이미 주문했는데 결제 수단을 변경할 수 있나요?</div>
                                <div class="faq-answer">아니요. 상품을 주문/결제한 후에는 결제 수단 변경이 불가합니다. 
                                    상품이 아직 배송 전이라면 주문목록에서 주문을 취소한 후 원하는 결제 수단으로 다시 주문/결제해 주시기 바랍니다. 
                                    상품이 이미 배송을 시작했다면 배송 완료 후 반품을 접수해 주시기 바랍니다. 
                                    단, 상품 배송 이후 단순 변심으로 반품할 경우 왕복 배송비가 부과될 수 있습니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">법인카드로 결제할 수 있나요?</div>
                                <div class="faq-answer">   
                                    네, 법인카드는 개인 명의 또는 법인 명의에 따라 아래와 같이 결제할 수 있습니다.<br>
                                    개인 명의 법인카드 (고객 본인 명의 기명식)<br> 
                                    일반 결제는 물론 간편 결제 서비스 에 등록해서도 결제할 수 있습니다.<br>
                                    법인 명의 법인카드<br>
                                    PC 웹사이트에서 [사업자 범용 공인인증서]로 인증한 후에 결제할 수 있습니다. 단, 간편결제 등록 및 앱 카드 결제는 불가합니다.
                                    ※ 법인카드는 할부 결제가 불가합니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">재입고 알림은 어떻게 신청하나요?</div>
                                <div class="faq-answer">품절 상태인 상품의 상품 페이지 내 [재입고 알림신청] 버튼을 클릭하면 신청이 완료됩니다. 이후 상품의 재고가 확보되면 알림을 받을 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">할인쿠폰은 어떻게 사용하나요?</div>
                                <div class="faq-answer">할인쿠폰은 주문/결제 페이지에서 적용 가능한 할인쿠폰을 확인 후 사용할 수 있습니다. 할인쿠폰의 사용 조건은 각 쿠폰마다 상이합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품에 대해서 문의하려면 어떻게 해야 하나요?</div>
                                <div class="faq-answer">상품에 관한 정보는 해당 상품의 [상품상세] 페이지에 자세히 안내되어 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">간편결제 등록된 계좌를 삭제하고 싶어요</div>
                                <div class="faq-answer">간편결제 등록한 계좌 삭제는 [결제수단 관리] 메뉴에 등록된 계좌를 선택하고 [삭제] 버튼을 누르면 됩니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">건강식품은 몇 개까지 구매할 수 있나요?</div>
                                <div class="faq-answer">건강기능식품은 최대 6병까지 구매 가능하며, 면세 통관범위를 초과한 경우에는 세관에서 폐기될 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">자가사용 인정기준이 어떻게 되나요?</div>
                                <div class="faq-answer">자가사용(자가소비, 개인소비) 인정기준은 각 품목마다 상이합니다.<br>
                                    품목별 자세한 기준은 관세청 홈페이지()를 확인해 주시기 바랍니다.<br>
                                    면세 범위 내에서 상품을 구매했어도 자가사용 인정기준을 초과하면 구매 금액에 상관없이 관세와 부가세가 부과됩니다.<br>
                                    또한, 특정 품목은 자가사용 인정기준 초과 분에 대해 폐기될 수 있습니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">가입하지 않고 주문할 수 있나요?</div>
                                <div class="faq-answer">아니요. 런플루언스는 회원 가입을 해야만 주문이 가능합니다. 회원으로 가입하면 상품 구매가 가능하고 다양한 러닝 이벤트와 강습 쿠폰 등을 경험할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">전화로도 주문할 수 있나요?</div>
                                <div class="faq-answer">아니요. 런플루언스는 PC 웹사이트로 주문할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">문화상품권으로 결제할 수 있나요?</div>
                                <div class="faq-answer">아니요. 문화상품권을 이용한 결제 서비스는 지원하지 않습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">한 사람이 구매할 수 있는 수량에 제한이 있나요?</div>
                                <div class="faq-answer">네, 각 상품마다 1인 최대 구매 수량이 있습니다. 그 수량은 상품마다 다르며 구매 옵션에서 확인할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">최소 판매수량이 충족되지 않으면 어떻게 되나요?</div>
                                <div class="faq-answer">판매 기간 동안 최소 판매수량이 충족되지 않은 경우 주문은 자동으로 취소됩니다.<br>
                                    주문이 취소되면 최초 결제수단으로 환불이 진행되며, 취소 및 환불 내역은 마이쿠팡에서 확인이 가능합니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문하지 않은 상품을 받았는데 누가 주문한지 알 수 있나요?</div>
                                <div class="faq-answer">배송출발 또는 배송완료 안내 문자를 받은 경우, 문자에서 주문자의 이름을 확인할 수 있습니다.<br>
                                    단, 해당 주문자가 누구인지 모르거나 안내 문자를 받지 못했다면 운송장에 기재된 주문번호(주문번호 확인 불가 시 운송장 번호)를 확인하여 고객센터로 연락 주시기 바랍니다.<br>
                                    상품의 정상 배송 확인 및 주문자와 연락을 통해 주문자 확인을 도와드리겠습니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">복합결제가 가능한가요?</div>
                                <div class="faq-answer">주 결제수단 간의 복합결제는 지원되지 않습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">이미 주문했는데, 상품을 추가하고 싶어요.</div>
                                <div class="faq-answer">주문 완료 이후에는 상품을 추가할 수 없습니다. <br>
                                    추가 구매를 원하시면 취소 후 다시 함께 주문하시거나 따로 주문해 주시기 바랍니다.
                                </div>
                            </li>
                        </ul>
                        <button class="btn btn-primary load-more-btn">더보기</button>
                    </div>
                    
                    <!-- 취소 문의 -->
                    <div class="tab-pane" id="cancelTab" role="tabpanel" aria-labelledby="cancel-tab">
                        <ul class="faq-list">
                            <li class="faq-item">
                                <div class="faq-question">주문 취소는 어떻게 하나요?</div>
                                <div class="faq-answer">주문 완료 후 24시간 이내에 고객센터로 연락 주시면 취소를 도와드립니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품을 취소하고 싶어요.</div>
                                <div class="faq-answer">상품의 주문 취소는 고객님께서 마이페이지를 통해 직접 할 수 있습니다.<br> 
                                    단, 주문목록에서 [주문취소] 버튼이 보이지 않는다면 배송상태에 따라 취소가 불가능한 시점이니 이 경우엔 반품으로 진행해 주시기 바랍니다.<br>
                                    주문 취소 및 반품의 조건은 각 상품마다 다르니 자세한 내용은 상품의 상세페이지를 확인해 주세요.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송 전 주문을 취소했는데, 상품이 배송됐습니다.</div>
                                <div class="faq-answer">상품 준비 중 상태에서 주문을 취소했고 판매자가 아직 상품을 발송하지 않았다면 배송을 취소할 수 있습니다.<br>
                                    그러나 판매자가 이미 상품을 발송했다면 배송을 취소할 수 없습니다. 
                                    이 경우, 상품이 배송되었을 때 택배기사에게 수취거부를 말씀해 주시기 바랍니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문 취소 내역과 취소 전표는 어디에서 확인하나요?</div>
                                <div class="faq-answer">주문 취소 내역과 취소 전표는 마이페이지를 통해 확인할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문을 부분 취소하면 배송비가 부과되나요?</div>
                                <div class="faq-answer">상품의 배송 조건과 금액에 따라 다릅니다. 무료배송의 조건이 있는 상품을 구매한 후 부분 취소를 할 경우, 남아있는 상품의 금액이 무료배송 조건에 충족하는지 확인하게 됩니다. 만약, 남아있는 상품의 금액이 무료배송 조건을 충족하지 못한다면 배송비가 부과됩니다.<br>
                                    이때, 부분 취소한 상품의 금액이 배송비보다 크면, 취소한 상품 금액에서 배송비를 차감한 후 환불됩니다. 그러나 만약 부분 취소한 상품의 금액이 배송비보다 작으면, 배송비를 입금한 후 부분 취소한 상품 금액의 전부가 환불됩니다. 배송비 입금 방법은 고객센터로 문의해 주시기 바랍니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품 품절로 취소되었어요.</div>
                                <div class="faq-answer">   
                                    주문한 상품이 입고지연, 상품단종 등의 사유로 품절되면, 주문이 취소되고 고객님께 취소 안내문자가 발송됩니다. 
                                    이후 결제취소 승인이 완료되면, 원결제 수단으로 환불이 진행됩니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문을 취소했는데, 언제 환불되나요?</div>
                                <div class="faq-answer">주문의 취소 처리가 완료된 후에 결제금액 환불이 진행됩니다. 
                                    결제수단별 환불 소요시간이 각기 다르니 아래의 세부내용을 참고 부탁드립니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문목록에서 취소하려는 상품의 취소버튼이 보이지 않아요.</div>
                                <div class="faq-answer">고객님께서 직접 주문취소가 가능한 상태의 상품에만 [취소신청] 버튼이 보입니다. 해당 주문에 [취소신청] 버튼이 보이지 않는다면, 이미 배송 준비 중이거나 배송 시작인 상태로 이는 [반품신청]으로 진행해 주셔야 합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문취소 신청을 철회(취소)하고 싶어요.</div>
                                <div class="faq-answer">배송 상품은 주문을 취소하면 바로 결제 취소가 적용되어, 이후 주문취소를 철회(취소) 할 수 없습니다. 이미 주문취소를 하셨다면 재구매를 부탁드립니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송이 늦어 주문을 취소하고 싶어요.</div>
                                <div class="faq-answer">상품에 따라 배송 일정이 다릅니다. 주문목록에서 배송예정일을 확인할 수 있으며, 마이쿠팡에서 직접 주문 취소가 가능합니다. 단, 배송상태에 따라 [주문취소]가 불가할 경우 [교환, 반품 신청]으로 진행해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">여러 상품을 한꺼번에 주문했는데, 부분 취소가 가능한가요?</div>
                                <div class="faq-answer">네, 배송상품은 옵션 단위로, 티켓상품은 수량 단위로 취소할 수 있습니다.<br>                            
                                    주문 취소하기<br>
                                    마이쿠팡 →  → 상품선택 → [주문취소] 클릭<br>
                                    이후 각 단계에 해당하는 항목을 선택하여 취소를 완료합니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">편의점 반품 서비스란 무엇인가요?</div>
                                <div class="faq-answer">고객님께서 희망하는 시간에 CU 편의점을 통해 자유롭게 반품할 수 있는 간편 서비스입니다.<br>
                                    반품신청 페이지에서 'CU 편의점으로 발송할게요.' 클릭 후, 원하는 CU 편의점 위치를 선택하여 해당 장소에서 상품을 접수해주시면 됩니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">편의점 반품신청 건을 취소할 수 있나요?</div>
                                <div class="faq-answer">편의점 반품신청 건은 CU 편의점에 상품을 접수한 후 택배사에서 상품을 수거하기 전까지 반품 신청 철회할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">이미 발행받은 세금계산서를 취소하려면 어떻게 해야 하나요?</div>
                                <div class="faq-answer">발행된 세금계산서는 교부가 완료된 것으로 처리됩니다. 부득이 발행된 세금계산서의 수정 및 취소가 필요하신 경우 고객센터로 연락해 주시면 처리해 드리겠습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">입금 지연으로 주문이 취소되었는데 주문을 복구할 수 있나요?</div>
                                <div class="faq-answer">취소 완료된 주문은 복구되지 않습니다.<br>
                                    입금 기한(주문일＋1일) 내에 입금하지 않아 주문이 취소되었다면, 상품이 판매 중인지 확인 후 재구매해 주셔야 합니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">현금영수증 신청 후 부분취소를 하면 재신청해야하나요?</div>
                                <div class="faq-answer">부분취소하셔도 현금영수증은 재신청하지 않으셔도 됩니다.<br>
                                    현금영수증 내역은 예매 익일 국세청으로 자동발급 신청이 진행됩니다. 때문에 부분취소를 하시면 자동으로 전체금액이 취소되고 재산정된 금액에 대해서만 현금영수증 재신청 처리됩니다.
                                </div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">일부 구성품이 누락되었는데 부분 환불 가능한가요?</div>
                                <div class="faq-answer">부분 환불 처리는 어려운 점 양해 부탁드려요.<br>
                                    전체 환불 처리만 가능하고, 부분 환불은 어려워요.
                                </div>
                            </li>
                        </ul>
                        <button class="btn btn-primary load-more-btn">더보기</button>
                    </div>

                    <!-- 교환, 반품 문의 -->
                    <div class="tab-pane" id="exchangeTab" role="tabpanel" aria-labelledby="exchange-tab">
                        <ul class="faq-list">
                            <li class="faq-item">
                                <div class="faq-question">교환 및 반품 절차는 어떻게 되나요?</div>
                                <div class="faq-answer">제품에 이상이 있을 경우, 수령 후 7일 이내에 교환 및 반품 신청이 가능합니다. 고객센터로 문의해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품을 교환/반품하고 싶어요.</div>
                                <div class="faq-answer">교환 및 반품은 사용하지 않은 상품에 한하여 가능하며, 고객님께서 직접 교환/반품을 신청할 수 있습니다. <br>상품을 회수한 후 검수 단계에서 문제가 발견되면 고객님께 연락을 드릴 수 있습니다. 교환은 기본적으로 구매 상품과 동일한 상품으로만 가능합니다. 색상 및 사이즈 변경을 원하시면 반품 후 재구매를 해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품의 포장을 훼손했는데 반품할 수 있나요?</div>
                                <div class="faq-answer">상품의 포장도 상품의 가치 중 하나로 인정받는 상품이 있습니다. 이러한 상품의 포장이 훼손되어 상품의 가치가 감소했다면 단순 변심에 의한 반품이 불가합니다. 예를 들어, 의류의 태그, 신발의 박스, 전자제품의 박스와 비닐이 훼손 및 누락된 경우 등이 해당합니다. 상품 회수 후 검수 단계에서 이러한 문제가 발견되면 고객님께 연락을 드릴 수 있으며, 반품이 불가한 상품은 다시 반송해 드립니다. 상품별 반품 세부내용은 상품 상세페이지를 확인해 주시기 바랍니다.<br>이와 별도로 상품의 포장이 아닌 택배의 박스나 비닐이 훼손된 경우, 배송직원 또는 택배기사가 상품을 회수할 수 있도록 다른 박스에 재포장하여 반품해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">교환/반품이 가능한 기준은 무엇인가요?</div>
                                <div class="faq-answer">미사용 상품에 한하여 교환/반품이 가능합니다. 상품을 회수한 후 검수 단계에서 문제가 발견될 시 고객님께 연락을 드릴 수 있습니다. '전자상거래 등에서의 소비자보호에 관한 법률'에 의거하여, 상품 수령 후 7일 이내 교환/반품을 요청할 수 있습니다. 단, 로켓배송 상품의 경우 배송 완료 후 30일 이내, 로켓모바일 상품은 주문일 포함 14일 이내로 교환/반품이 가능합니다. 세부내용은 아래를 참고하시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">반품 비용은 누가 부담하나요?</div>
                                <div class="faq-answer">귀책사유에 따라 반품 비용의 부담 주체가 다릅니다. 상품 불량/파손/오배송 등 판매자의 귀책인 경우에는 고객에게 교환/반품 비용이 발생하지 않습니다. 그러나 구매자의 단순 변심인 경우에는 고객에게 반품 비용이 부담될 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">교환/반품 신청을 철회하고 싶어요.</div>
                                <div class="faq-answer">교환/반품할 상품이 아직 회수되지 않았거나 교환 받을 상품이 아직 발송되지 않은 경우라면 마이페이지를 통해 직접 철회가 가능합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">반품하려는 상품은 어떻게 포장해야 하고, 어떻게 보내야 하나요?</div>
                                <div class="faq-answer">먼저 반품 신청을 부탁드립니다.<br>그 다음 반품할 상품을 재포장하여, 반품 신청 시 선택한 회수지에 상품을 보관해 주세요. 이후 배송직원 또는 택배기사가 방문하여 반품 상품을 회수해 갑니다. <br>상품 유형에 따라 회수 일정이 다르니 아래의 세부내용을 참고해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">교환/반품 비용 결제는 어떻게 하나요?</div>
                                <div class="faq-answer">상품 문제 혹은 배송 지연 등 판매자 사유로 교환/반품을 하는 경우에는 비용이 발생하지 않습니다.<br>단, 구매자의 단순 변심으로 교환/반품을 하는 경우에는 아래와 같이 비용이 발생합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">교환/반품 접수 후 상품은 언제 가져가나요?</div>
                                <div class="faq-answer">접수한 상품의 회수 예정일은 모바일 앱 메인 화면에서 확인할 수 있습니다.<br>회수 예정일은 각 상품 유형에 따라 다르므로 마이쿠팡에서 직접 확인해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품 검수 결과에 따라 환불이 불가할 수도 있나요?</div>
                                <div class="faq-answer">반품된 상품을 검수한 결과가 교환/반품 제한사항에 해당하는 경우에는 환불이 불가능하며, 반품된 상품은 고객님께 반환됩니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">무료반품이라고 기재된 상품은 어떻게 반품하나요?</div>
                                <div class="faq-answer">상품 상세페이지에 [무료반품]이라고 안내된 상품은 단순 변심인 경우에도 반품비용이 발생하지 않습니다. 단, 일부 상품의 경우 단순 변심으로 인한 반품이 불가하니 상품의 상세페이지 내 교환/반품 제한사항을 확인해 주시기 바랍니다. <br>반품 접수 화면에서 반품비를 제외한 환불 예정금액 확인이 가능합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">선물 받은 상품을 교환/반품하고 싶습니다.</div>
                                <div class="faq-answer">선물을 받는 분(수취인)께서 상품을 교환/반품하시려면 고객센터로 연락 주시기 바랍니다. 선물을 받은 분(수취인)의 휴대폰 번호 또는 운송장 번호를 조회하여 교환/반품을 진행할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품을 반품할 때, 제가 이용하는 택배로 보내도 되나요?</div>
                                <div class="faq-answer">만약 반품 상품을 직접 발송하시고 싶다면 원활한 반품 진행을 위해 판매자와 계약된 택배사를 통해 반송해 주시기 바랍니다. 판매자와 계약하지 않은 다른 택배사를 통해 반송할 경우 추가 배송비(추가 반품비용)가 부과될 수 있습니다.</div>
                            </li>
                        </ul>
                        <button class="btn btn-primary load-more-btn">더보기</button>
                    </div>

                    <!-- 배송관련 문의 -->
                    <div class="tab-pane" id="deliveryTab" role="tabpanel" aria-labelledby="delivery-tab">
                        <ul class="faq-list">
                            <li class="faq-item">
                                <div class="faq-question">주문한 상품은 언제 배송되나요?</div>
                                <div class="faq-answer">일반적으로 주문 후 2-3일 이내에 배송이 시작되며, 지역에 따라 배송 기간이 다소 차이가 있을 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송 상태가 멈춰 있어요.</div>
                                <div class="faq-answer">악천후, 천재지변, 주문량 증가, 출고작업 지연, 명절 연휴 등 예외적인 사유 발생 시 배송 예정일보다 배송이 다소 지연될 수 있습니다. 상품 유형별 배송지연 사유 확인 및 처리 방법에 대해서는 다음을 참고해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품을 받지 못했는데 배송완료로 확인됩니다.</div>
                                <div class="faq-answer">배송상태가 [배송완료]로 확인되나 상품을 받지 못했다면 다음을 먼저 확인해 주시기 바랍니다.<br>배송완료 문자 또는 대리 수령 가능 장소(경비실, 이웃, 주변 편의점 등) 확인</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송 받은 상품이 파손되었어요.</div>
                                <div class="faq-answer">상품이 파손되어 배송된 경우 정해진 기간 내에 교환 및 반품이 가능합니다.<br>교환 및 반품을 직접 신청해 주시거나, 신청이 불가한 경우 고객센터로 연락 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">개인통관고유부호 발급 및 입력 방법을 알고 싶어요.</div>
                                <div class="faq-answer">개인통관고유부호란 해외배송 상품을 통관할 때 주민등록번호 대신 사용하는 13자리 부호(P+12개의 숫자)입니다. 해외배송 상품을 구매하려면 개인통관고유부호 입력은 필수 사항입니다. 개인통관고유부호는 상품을 ‘받는 사람(수취인)’의 정보로 입력하셔야 합니다. 구매한 사람과 받는 사람이 다른 경우엔 입력에 유의를 부탁드립니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품을 구매했는데 일부만 배송되었어요.</div>
                                <div class="faq-answer">상품이 누락되었다면 교환을 통해 상품을 다시 받거나, 반품 후 환불을 받을 수 있습니다. 구성품의 일부가 누락된 경우에는 부분 배송이 불가하므로 상품 전체를 교환/반품으로 진행해 주시기 바랍니다. 교환 및 반품은 아래의 경로를 통해 직접 신청이 가능합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">새벽배송 상품이 왜 공동현관문 앞에 배송되었나요?</div>
                                <div class="faq-answer">새벽배송 상품은 주문 시 입력하신 [새벽배송 수령방법] 위치로 배송됩니다. 고객님께서 수령방법을 문 앞으로 요청했으나, 새벽에 문 앞까지 갈 수 없는 경우에는 부득이하게 1층 공동현관문 앞(또는 그 외 장소)으로 배송해 드릴 수 있습니다. [새벽배송 수령방법]에 공동현관 출입번호를 꼭 입력해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송상태가 계속 상품 준비 중입니다.</div>
                                <div class="faq-answer">배송상태가 ‘상품준비중’인 단계는 판매자가 고객님의 주문을 확인하고 상품을 포장하여 배송을 준비하는 상태입니다. 갑작스러운 주문량 증가 등 판매자 측에 예상치 못한 상황이 발생할 경우 ‘상품준비중’ 단계가 길어질 수 있습니다. 또한, 해외배송 상품의 경우 시차로 인해 주문 확인 및 상품 준비에 시간이 더 소요될 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송조회를 했는데 배송정보가 없다고 나와요.</div>
                                <div class="faq-answer">운송장 번호는 등록되어 있으나, 배송 정보가 없다고 안내되는 경우<br>주문 당일 상품을 발송하여 시스템에 운송장 번호가 아직 등록되지 않은 상황으로, 다음 날부터 배송조회가 가능합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송 날짜와 시간을 지정할 수 있나요?</div>
                                <div class="faq-answer">아니요. 배송은 상품재고, 배송준비시간, 배송경로, 배송물량 등 다양한 요소에 따라 배송 방문시간이 달라지기에 배송 날짜와 시간을 지정할 수 없습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">정식 건축물이 아닌데 배송지로 등록할 수 있나요?</div>
                                <div class="faq-answer">네, 행정부에 등록된 주소라면 정식 건축물이 아니어도 배송지로 등록할 수 있습니다. (예 : 가건물, 비닐하우스, 건축 중인 건물 등) 따라서, 고객님의 주소가 []에서 검색되는지 확인한 후 등록된 주소를 사용해 주시기 바랍니다. 만약, 고객님의 주소가 행정부에 등록되어 있지 않다면 관할 행정구역 및 []에 등록을 먼저 요청해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주소가 검색되지 않아요.</div>
                                <div class="faq-answer">본인의 주소가 검색되지 않는다면 다음의 사항을 확인해 주세요.<br>① 주소 입력 시 오타가 있는지 또는 띄어쓰기를 정확히 입력했는지 확인해 주세요.<br>② 고객님께서 입력한 주소가 []에서 검색되는지 확인한 후 등록된 주소를 사용해 주세요.<br>③ 고객님의 주소가 행정부에 등록되어 있지 않다면 관할 행정구역 및 []에 등록을 요청해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">배송지를 미리 저장해 놓을 수 있나요?</div>
                                <div class="faq-answer">네, 주소지 관리 메뉴에서 배송지를 미리 저장해 놓을 수 있습니다.<br>기본 배송지 뿐 아니라 자주 쓰는 다른 배송지까지 최대 20개까지 추가 등록 및 저장할 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">착불 배송이란 무엇인가요?</div>
                                <div class="faq-answer">착불 배송이란 상품의 배송비를 고객님이 직접 택배기사에게 바로 지불하는 방법을 말합니다.<br>착불 배송 상품을 구매하신 경우에는 상품 수령 시, 택배기사에게 택배비를 지불하셔야 합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문한 상품과 다른 상품이 배송되었어요.</div>
                                <div class="faq-answer">주문한 상품과 다른 상품을 받은 경우, 마이쿠팡을 통해 직접 쉽고 빠르게 교환 및 반품을 신청할 수 있습니다. 아래의 경로에서 교환/반품을 신청해 주시기 바랍니다.</div>
                            </li>
                        </ul>
                        <button class="btn btn-primary load-more-btn">더보기</button>
                    </div>

                    <!-- 회원정보 관련 문의 -->
                    <div class="tab-pane" id="userTab" role="tabpanel" aria-labelledby="user-tab">
                        <ul class="faq-list">
                            <li class="faq-item">
                                <div class="faq-question">회원 정보는 어떻게 수정하나요?</div>
                                <div class="faq-answer">마이페이지에서 '회원 정보 수정' 메뉴를 통해 개인정보를 수정하실 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">비밀번호/아이디가 기억나지 않아요.</div>
                                <div class="faq-answer">아이디/비밀번호 찾기 메뉴를 통해 확인해 주시길 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">광고성 이메일과 문자를 받지 않으려면 어떻게 하나요?</div>
                                <div class="faq-answer">광고성 정보 수신 동의를 철회하시면 됩니다. 수신 동의 철회 후 약 2~3일 뒤부터 광고성 이메일과 문자가 발송되지 않습니다. 단, 구매 정보 및 서비스 정책 변경 등의 정보성 안내 메일은 수신 동의 철회와 무관하게 발송됩니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">탈퇴하면 개인정보는 모두 삭제되나요?</div>
                                <div class="faq-answer">회원 탈퇴와 함께 고객님의 개인정보는 완전히 삭제되므로 재가입을 하여도 구매내역은 확인이 불가합니다.<br>단, 「상법」 및 「전자상거래 등에서의 소비자보호에 관한 법률」 등 관련 법령에 따라 거래 관련 권리 의무 관계의 확인 등을 이유로 보유하여야 할 필요가 있을 경우, 거래정보는 법에서 정해진 기간동안 별도로 보관 후 파기합니다.<br>• 계약 또는 청약철회 등에 관한 기록 : 5년<br>• 대금 결제 및 재화 등의 공급에 관한 기록 : 5년<br>• 소비자의 불만 또는 분쟁에 관한 기록 : 3년</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">회원정보 수정은 어떻게 하나요?</div>
                                <div class="faq-answer">회원정보 수정 페이지에서 이메일을 제외한 비밀번호 전화번호 이름을 수정 가능합니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">아이디를 여러 개 사용할 수 있나요?</div>
                                <div class="faq-answer">인증을 받지 않은 아이디는 여러 개 보유할 수 있지만, 상품을 구매하려면 본인인증이 필요합니다. 또한, 정기배송과 같은 일부 서비스는 본인 인증이 완료된 아이디 1개만 사용이 가능합니다. 구매 활동에 대한 정확한 안내를 위하여 1인당 1개의 아이디만 사용하실 것을 권장합니다. 이미 가입(인증)한 아이디가 있으나 아이디가 기억나지 않는 경우, 아래의 경로에서 본인 확인 후 아이디를 찾아 이용해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품문의 작성 후 수정 또는 삭제가 가능한가요?</div>
                                <div class="faq-answer">상품문의 페이지에서 본인이 작성한 문의 글을 선택하면 [삭제] 버튼이 보입니다. 이 버튼을 선택하여 직접 삭제할 수 있습니다. 수정 기능은 제공되지 않으므로 수정이 필요한 경우 삭제 후 다시 문의 글을 작성해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">다른 사람의 이름으로 쿠팡에서 메일이 오고 있어요.</div>
                                <div class="faq-answer">쿠팡에서는 회원정보에 등록되어 있는 이메일 주소(아이디)로 메일을 발송합니다. 간혹 영문이나 숫자 한자리가 다른 이메일 계정을 사용하는 다른 회원이 실수로 이메일 주소를 잘못 입력하면, 타인의 이름으로 메일을 받으실 수 있습니다. 이 경우 고객님의 이메일 주소를 확인한 후 고객센터로 연락 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">인증된 아이디가 이미 존재한다고 나옵니다.</div>
                                <div class="faq-answer">본인 인증 시 ‘회원님 명의로 인증된 아이디가 이미 존재합니다.’라는 안내가 나오면, 고객님 정보로 이미 가입된 다른 아이디가 있다는 것을 의미합니다. 로그아웃 후 기존 아이디를 사용해 주시기 바랍니다. 만약, 기존 아이디가 기억나지 않는다면 아래의 경로를 통해 통신사 본인 인증 후 아이디를 찾을 수 있습니다.</div>
                            </li>
                        </ul>
                        <button class="btn btn-primary load-more-btn">더보기</button>
                    </div>

                    <!-- 상품 관련 문의 -->
                    <div class="tab-pane" id="productTab" role="tabpanel" aria-labelledby="product-tab">
                        <ul class="faq-list">
                            <li class="faq-item">
                                <div class="faq-question">상품에 대한 자세한 정보는 어디에서 확인할 수 있나요?</div>
                                <div class="faq-answer">각 상품 페이지에서 상세 정보를 확인하실 수 있으며, 추가 문의는 고객센터로 연락해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품에 대해서 문의하려면 어떻게 해야 하나요?</div>
                                <div class="faq-answer">상품에 관한 정보는 해당 상품의 [상품상세] 페이지에 자세히 안내되어 있습니다. 이외에 추가적인 질문이 있는 경우 아래의 방법을 통해 문의하실 수 있습니다.<br>상품 주문 전 문의하는 방법<br>• 상품 페이지 내 [상품문의] 부분으로 이동하여 [문의하기] 버튼을 클릭한 후 문의 글을 등록하시면 판매자가 확인 후에 답변을 드립니다.<br>• 전화 문의가 필요한 경우에는 상품 페이지 내 [배송/교환/반품/판매자 안내] 부분으로 이동하여 가장 하단에 표기되어 있는 [판매자 정보] 연락처를 확인한 후 판매자에게 직접 전화로 문의하실 수 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품후기(상품평)는 누구나 작성이 가능한가요?</div>
                                <div class="faq-answer">상품후기(상품평)는 해당 상품을 실제로 구매한 고객님만 작성할 수 있으며, 일부 상품은 상품후기(상품평) 기능이 제공되지 않습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품문의 작성 후 수정 또는 삭제가 가능한가요?</div>
                                <div class="faq-answer">상품문의 페이지에서 본인이 작성한 문의 글을 선택하면 [삭제] 버튼이 보입니다. 이 버튼을 선택하여 직접 삭제할 수 있습니다. 수정 기능은 제공되지 않으므로 수정이 필요한 경우 삭제 후 다시 문의 글을 작성해 주시기 바랍니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품문의 후 답변은 어디서 확인할 수 있나요?</div>
                                <div class="faq-answer">상품문의에 대한 답변은 아래의 경로에서 확인할 수 있습니다.<br>문의내역 확인하기<br>마이페이지 → MY 활동 → 문의내역 확인</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품 A/S를 받고 싶은데, 어떻게 해야 하나요?</div>
                                <div class="faq-answer">A/S가 가능한 상품의 경우 구매한 상품페이지에서 관련 A/S 고객센터 연락처를 찾을 수 있습니다.<br>A/S 고객센터 연락처 확인이 어려운 경우 판매자에게 문의해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">주문한 상품의 가격이 낮아졌는데,어떻게 하나요?</div>
                                <div class="faq-answer">관리자가 환율 및 판매량에 따라 상품 등록, 가격 설정 및 변경을 자유롭게 할 수 있습니다.<br>따라서 판매자의 설정에 따라 상품의 가격은 수시로 변경될 수 있습니다.<br>변동 된 가격으로 상품 구매를 원하신다면, 기존 주문 건 취소 후 다시 구매해 주세요.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">장바구니 상품은 언제까지 보관이 되나요?</div>
                                <div class="faq-answer">장바구니에 상품은 최대 99개까지 담을 수 있으며 90일까지 보관됩니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">상품을 직접 방문하여 수령할 수는 없나요?</div>
                                <div class="faq-answer">일부 상품에 한하여 직접 매장에 방문해서 손쉽게 픽업할 수 있는 스마트픽 서비스를 제공해 드리고 있습니다.</div>
                            </li>
                            <li class="faq-item">
                                <div class="faq-question">비회원은 상품평을 쓸 수 없나요?</div>
                                <div class="faq-answer">상품평 작성은 회원만 가능합니다.</div>
                            </li>
                        </ul>
                        <button class="btn btn-primary load-more-btn">더보기</button>
                    </div>
                </div>
            </main>
        </div>
    </div>
    <!-- Bootstrap 5 JS Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>
