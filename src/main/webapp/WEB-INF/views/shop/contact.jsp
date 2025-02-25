<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_자주묻는질문</title>
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
.mypage-title {
   font-size: 24px;
   font-weight: bold;
   margin-bottom: 30px;
   padding: 20px 0;
   border-bottom: 2px solid #eee;
}

.nav-link {
   color: #666;
   padding: 8px 0;
}

.nav-link:hover {
   color: #000;
}

/* 사이드바 h태그 스타일 */
nav h5 {
   font-weight: bold;
   font-size: 16px;
}

.nav-link {
   color: inherit;
}

.mypage-title {
   font-size: 24px;
   font-weight: 700;
   letter-spacing: -0.15px;
   line-height: 29px;
   padding-bottom: 30px;
}

.buying_container {
   margin-left: auto;
   margin-right: auto;
   max-width: 1280px;
   padding: 40px 40px 160px;
   height: 100vh;
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
   text-align: center; /* 내부 요소들 중앙 정렬 */
   width: 100%;
}

/* 타이틀 스타일 */
.buying_container .text_body_title {
   color: rgba(0, 0, 0, 0.804);
   font-size: 14px;
   font-weight: 500;
   margin-bottom: 12px; /* 타이틀과 버튼 사이 간격 */
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
   flex-direction: row; /* 가로 방향 배치 */
   gap: 20px; /* 사이드바와 메인 컨텐츠 사이 간격 */
}

/* 사이드바 스타일 */
.sidebar {
   width: 180px;
   flex-shrink: 0; /* 사이드바 크기 고정 */
}

/* 메인 컨텐츠 스타일 */
.buying_container .main-content {
   flex: 1; /* 남은 공간 모두 차지 */
   min-width: 0; /* 오버플로우 방지 */ . sidebar { width : 100%;
   margin-bottom: 20px;
   }

}

/* 모달 스타일 */
.buying_modal .modal-content {
   border-radius: 16px;
   border: none;
}

.buying_modal .modal-header {
   padding: 18px 20px;
   position: relative;
}

.buying_modal .modal-header-content {
   width: 100%;
   position: relative;
   display: flex;
   justify-content: center; /* 가로 중앙 정렬 */
   align-items: center; /* 세로 중앙 정렬 */
}

.buying_modal .modal-title {
   font-size: 18px;
   font-weight: bold;
   margin: 0;
   line-height: 24px;
}

.buying_modal .modal-header .btn-close {
   position: absolute;
   right: 0;
   top: 50%;
   transform: translateY(-50%);
   padding: 0;
   margin: 0;
   width: 24px;
   height: 24px;
}

/* 닫기 버튼 위치 조정 */
.buying_modal .modal-header .btn-close {
   margin: 0; /* 기본 마진 제거 */
   padding: 18px; /* 클릭 영역 확보 */
}

/* 모달 크기 조정 */
.buying_modal .modal-dialog {
   max-width: 480px; /* 모달 너비 조정 */
}

.buying_modal .button-list {
   padding: 0;
   margin: 0;
   width: 100%;
   display: flex;
   flex-wrap: wrap;
   gap: 8px; /* 버튼 사이 간격 */
   list-style: none;
   background-color: #fff; /* 배경색을 흰색으로 변경 */
}

.buying_modal .button-item {
   flex: 0 0 calc(33.333% - 8px);
}

.buying_modal .modal-body .button {
   background-color: #fff;
   border: 1px solid #ebebeb;
   border-radius: 12px;
   display: block;
   font-size: 14px;
   line-height: 20px;
   padding: 15px 14px;
   text-align: center;
   white-space: nowrap;
   text-decoration: none;
   color: #222;
   width: 100%;
   height: 100%;
}



.myprofile_title {
   font-size: 24px;
   font-weight: 700;
   border-bottom: 3px solid #222;
   padding-bottom: 16px;
}

.input_search_bar {
   height: 40px;
   margin-bottom: 16px;
   padding: 11px 30px 11px 12px;
}

.input_search_bar {
   background-color: #f4f4f4;
   border-radius: 8px;
   font-size: 15px;
   height: 48px;
   margin: 16px 0 20px;
   padding: 15px 43px 15px 12px;
   width: 100%;
}

.category_list_items {
   width: 100%;
}


a, a:active, a:focus, a:hover {
   -webkit-text-decoration: none;
   text-decoration: none;
}

a {
   -webkit-tap-highlight-color: rgba(0, 0, 0, .1);
   color: inherit;
}

*, :after, :before {
   -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
   box-sizing: border-box;
}

.category {
   background-color: #fff;
   color: rgba(34, 34, 34, .5);
   display: inline-flex;
   flex-direction: column-reverse;
   font-size: 16px;
   height: 60px;
   justify-content: center;
   text-align: center;
}

.category.category_on {
   color: #222;
   /*font-weight: 700;*/
}

.category.chunk_3 {
   width: 33.3333333333%;
}

.category_list_items td {
   border-left: 1px solid #ebebeb;
   border-right: 1px solid #ebebeb;
   border-bottom: 1px solid #ebebeb;
    border-top: 1px solid #ebebeb;
}
body {
    margin: 0;
    font-family: "JejuGothic", "Poppins", sans-serif;
    font-size: 1rem;
    font-weight: 400;
    line-height: 1.5;
    color: #000;
    text-align: left;
    background-color: #fff;
}

.dropdown_head {
    align-items: center;
    border-bottom: 1px solid #ebebeb;
    cursor: pointer;
    display: flex;
    padding: 17px 0 19px;
}
.dropdown_head .sort {
    font-size: 14px;
    letter-spacing: -.21px;
    min-width: 98px;
    width: 68px;
}
.dropdown_head .title_box {
    margin-right: 10px;
}

.dropdown_head .title {
    font-size: 15px;
    letter-spacing: -.15px;
}

.dropdown_head::before {
    position: absolute;
    right: 4%;
    top: 0;
    content: '';
    width: 17px;
    height: 17px;
    border-top: 4px solid #000;
    border-right: 4px solid #000;
    transform: rotate(135deg);
    transition: all 0.2s;
    margin-top: 15px;
}

.content {
    margin-top: 20px;
    background: #f7f7f7;
    box-sizing: border-box;
    padding: 40px 30px;
    display: none;
}

</style>
</head>
<body>
   <%@include file="/WEB-INF/views/include/shopCate.jsp" %>
   <!-- 메인 컨텐츠 -->
    <div class="container py-4 buying_container">
        <div class="row">
            <!-- 사이드바 -->
            <nav class="sidebar">
                <div class="mypage-title">고객센터</div>
                
                <!-- 쇼핑 정보 섹션 -->
                <div class="mb-4">
           
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                공지사항
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="#" class="nav-link">
                                자주 물어보는 질문
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="myprofile_title">
                    <div class="title">자주 묻는 질문</div>
                </div>
                <!-- 여기에 구매 내역 컨텐츠 추가 -->
               <div class="search_bar">
                  <input type="text" placeholder="검색" title="검색창" class="input_search_bar">
               </div>
                
                <div>
                   <div class="category_list">
                      <table class="category_list_items" style="border-collapse: collapse;">
                         <tbody>
                            <tr>
                               <td class="category chunk_3 category_on">
                                  <a href="#" class="category_list">
                                     <span class="category_text">주문/결제 문의</span>
                                  </a>
                               </td>
                               <td class="category chunk_3 category_on">
                                  <a href="#" class="category_list">
                                     <span class="category_text">취소 문의</span>
                                  </a>
                               </td>
                               <td class="category chunk_3 category_on">
                                  <a href="#" class="category_list">
                                     <span class="category_text">교환, 반품 문의</span>
                                  </a>
                               </td>
                               
                            </tr>
                            <tr>
                               <td class="category chunk_3 category_on">
                                  <a href="#" class="category_list">
                                     <span class="category_text">배송관련 문의</span>
                                  </a>
                               </td>
                               <td class="category chunk_3 category_on">
                                  <a href="#" class="category_list">
                                     <span class="category_text">회원정보 관련 문의</span>
                                  </a>
                               </td>
                               <td class="category chunk_3 category_on">
                                  <a href="#" class="category_list">
                                     <span class="category_text">상품 관련 문의</span>
                                  </a>
                               </td>
                            </tr>
                         </tbody>
                      </table>
                   </div>
                   
                <div class="contact_order">   
                   <ul class="dropdown_list" style="margin-top: 1rem; padding-left: 0.5rem;">
                      <li style="list-style-type: none;">
                      
                         <div class="dropdown">
                            <div class="dropdown_head">   
                               <strong class="sort">주문/결제 문의</strong>
                               <div class="title_box">
                                  <p class="title" style="margin-bottom: auto;">비회원도 주문할 수 있나요?</p>
                               </div>
                            </div>
                            <div class="dropdown_content">
                               <div class="content">
                                  <p>비회원도 언제든지 상품 주문이 가능합니다.</p>
                               </div>
                            </div>             
                         </div>
                      
                         <div class="dropdown">
                            <div class="dropdown_head">
                               <strong class="sort">주문/결제 문의</strong>
                               <div class="title_box">
                                  <p class="title display_paragraph" style="margin-bottom: auto;">주문한 내용을 확인하고싶어요</p>
                               </div>
                            </div>
                            <div class="dropdown_content" >
                               <div class="content">
                                  <p>RunFluence 회원일 경우, 주문이 완료되면 등록 카카오톡으로 주문내역을 알려드립니다. 주문 상세내역은 마이페이지 내 주문내역 탭을 통해서도 확인 가능합니다. </p>
                               </div>
                            </div>             
                         </div>
                      
                         </li>
                      </ul>
                   
                   </div>
                   
                   <div class="contact_cancel">
                      <ul class="dropdown_list" style="margin-top: 1rem; padding-left: 0.5rem;">
                      <li style="list-style-type: none;">
                      
                         <div class="dropdown">
                            <div class="dropdown_head">   
                               <strong class="sort">취소 문의</strong>
                               <div class="title_box">
                                  <p class="title" style="margin-bottom: auto;">주문한 상품을 취소하려면 어떻게 하나요?</p>
                               </div>
                            </div>
                            <div class="dropdown_content">
                               <div class="content">
                                  <p>주문접수 상태에서는 마이페이지>주문내역에서 직접 주문 취소가 가능합니다.
                                 배송 준비 중으로 상태가 변경되면 제품 포장 작업이 시작된 상태로, 취소 신청 버튼이 사라지며 주문 취소가 불가하니 제품 수령 후 반품 접수로 이용 부탁드립니다.
                                 배송 출발/배송 완료로 확인될 시에는 상품의 발송(출고)이 완료된 상태로 반품 접수만 가능합니다.
                                 ※주문변경
                                 결제가 완료된 이후에는 주문 변경(주소지 및 옵션 등)이 불가하므로 주문 취소 후 재주문이 필요합니다.
                                 ※주문 부분 취소
                                 주문 완료 상태에서는 취소를 희망하는 상품에 대한 부분 취소 진행이 가능합니다.</p>
                               </div>
                            </div>             
                         </div>
        
                         </li>
                      </ul>
                   </div>
                </div>
            </main>
        </div>
    </div>

<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
   
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

    <!-- 자바스크립트 추가 -->
    <script>
    $(document).ready(function () {
        $(".dropdown_head").on("click", function(){
            $(".content").show(); 
            
        });
    });
    </script>
</body>
</html>