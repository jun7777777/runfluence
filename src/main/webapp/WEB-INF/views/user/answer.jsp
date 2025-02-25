<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
 <meta charset="UTF-8">
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_Notice</title>
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
   padding: 20px 0;
   
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

.container.customer .snb_main_title[data-v-17d26eed] {
    color: #000;
    font-size: 32px;
    letter-spacing: -.48px;
    padding-bottom: 25px;
    text-transform: uppercase;
}
body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}
*, :after, :before {
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    box-sizing: border-box;
}

h2 {
    display: block;
    font-size: 1.2em;
    margin-block-start: 0.83em;
    margin-block-end: 0.83em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    font-weight: bold;
    unicode-bidi: isolate;
}

.nav-link {
   color: inherit;
}

.mypage-title {
   font-size: 24px;
   font-weight: 700;
   letter-spacing: -0.15px;
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
    float: left;
    margin-right: 40px;
    width: 160px;
}

/* 메인 컨텐츠 스타일 */
.buying_container .main-content {
   flex: 1; /* 남은 공간 모두 차지 */
   min-width: 0; /* 오버플로우 방지 */ 
   .sidebar { width : 100%;
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

/* 검색바 */
input, textarea {
    -webkit-appearance: none;
    background-color: transparent;
    border: 0;
    border-radius: 0;
    outline: 0;
    padding: 0;
    resize: none;
}

/* 리스트 css */

li, ol, ul {
    list-style: none;
}

body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}

ul {
    display: block;
    list-style-type: disc;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    padding-inline-start: 40px;
    unicode-bidi: isolate;
}

li {
    display: list-item;
    text-align: -webkit-match-parent;
    unicode-bidi: isolate;
}

.dropdown_head[data-v-433857c6] {
    align-items: center;
    border-bottom: 1px solid #ebebeb;
    cursor: pointer;
    display: flex;
    padding: 17px 0 19px;
}

.dropdown_head .sort[data-v-433857c6] {
    font-size: 14px;
    letter-spacing: -.21px;
    min-width: 68px;
    width: 68px;
}

.dropdown_head .sort[data-v-e0f90538] {
    font-size: 14px;
    letter-spacing: -.21px;
    min-width: 68px;
    width: 68px;
}

.dropdown_head[data-v-e0f90538] {
    align-items: center;
    border-bottom: 1px solid #ebebeb;
    cursor: pointer;
    display: flex
;
    padding: 17px 0 19px;
}

strong {
    font-weight: bold;
}

.dropdown_head .title_box[data-v-433857c6] {
    margin-right: 10px;
}

.dropdown_head .title[data-v-433857c6] {
    font-size: 15px;
    letter-spacing: -.15px;
}

.dropdown_head .date[data-v-e0f90538] {
    display: inline-flex
;
    font-size: 12px;
    letter-spacing: -.06px;
    margin-bottom: 1px;
}

.dropdown_head .title[data-v-e0f90538] {
    font-size: 15px;
    letter-spacing: -.15px;
}

.dropdown_content[data-v-e0f90538] {
    background-color: #fafafa;
    border-bottom: 1px solid #ebebeb;
    display: none;
    font-size: 14px;
    padding: 30px 30px 28px;
}

.dropdown_content[data-v-e0f90538] {
    display: block;
}

.btn_list[data-v-e0f90538] {
    margin-top: 30px;
    text-align: center;
}

.outlinegrey[data-v-7122e1e2] {
    border: 1px solid #d3d3d3;
    color: rgba(34, 34, 34, .8);
}


p {
    display: block;
    margin-block-start: 1em;
    margin-block-end: 1em;
    margin-inline-start: 0px;
    margin-inline-end: 0px;
    unicode-bidi: isolate;
}

body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}

div {
    display: block;
    unicode-bidi: isolate;
}

a, a:active, a:focus, a:hover {
    -webkit-text-decoration: none;
    text-decoration: none;
}

a {
    -webkit-tap-highlight-color: rgba(0, 0, 0, .1);
    color: inherit;
}

/* 페이징 css */

.paginations {
    padding: 28px 0 !important;
}

.paginations_box {
    display: flex;                /* flexbox로 변경 */
    justify-content: center;      /* 중앙 정렬 */
    align-items: center;          /* 수직 중앙 정렬 */
    position: relative;
}

.prev_btn_box[data-v-68b0dbec],
.next_btn_box[data-v-68b0dbec] {
    margin-right: 25px;
}

.prev_btn_box[data-v-68b0dbec], .next_btn_box[data-v-68b0dbec] {
    display: inline-block;
    vertical-align: middle;       /* vertical-align을 middle로 설정 */
}

.next_btn_box .btn_arr[data-v-68b0dbec], .prev_btn_box .btn_arr[data-v-68b0dbec] {
    height: 24px;
    padding: 3px;
    width: 24px;
}

[class*=arr-page-][data-v-68b0dbec] {
    height: 22px;
    width: 18px;
}

.btn_page+.btn_page {
    margin-left: 12px;
}

.btn_page{
    color: rgba(34, 34, 34, .5);
    display: inline-block;
    font-size: 16px;
    padding: 0 8px;
}
</style>
<script>
    // 검색어를 처리하는 함수
    function searchFunction() {
        // 입력값을 가져옵니다.
        const searchTerm = document.getElementById('search_input').value;

        // 검색어가 비어있지 않은지 확인
        if (searchTerm.trim() !== '') {
            // 검색어를 출력하거나, 실제 검색을 처리하는 로직을 추가합니다.
            alert('검색어: ' + searchTerm);

            // 여기에 실제 검색 로직을 추가하세요.
            // 예를 들어, 서버에 요청을 보내거나, 페이지 내에서 검색 결과를 보여주는 방식으로 처리할 수 있습니다.
        } else {
            alert('검색어를 입력해주세요!');
        }
    }

    // 엔터키를 눌렀을 때 검색을 실행
    document.getElementById('search_input').addEventListener('keypress', function(event) {
        if (event.key === 'Enter') {
            event.preventDefault();  // 기본 엔터키 동작을 막습니다 (폼 제출 방지)
            searchFunction();  // 검색 함수 실행
        }
    });
</script>
</head>
<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
   <!-- 메인 컨텐츠 -->
    <div class="container py-4 buying_container">
        <div class="row">
            <!-- 사이드바 -->
            <nav class="sidebar">
                <div class="mypage-title">
                    <a data-v-17d26eed="" href="/notice" class="nuxt-link-active">
                        <h2 data-v-17d26eed="" class="snb_main_title">고객센터</h2></a>
                </div>
                
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

                <!-- 내 정보 섹션 -->
    
            </nav>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="myprofile_title">
                    <div class="title">공지 사항</div>
                </div>
                <!-- 여기에 구매 내역 컨텐츠 추가 -->
                <div data-v-e0f90538="" class="dropdown">
                    <div data-v-e0f90538="" class="dropdown_head">
                        <strong data-v-e0f90538="" class="sort">이벤트</strong>
                        <div data-v-e0f90538="" class="title_box">
                            <span data-v-e0f90538="" class="date"> 2024.12.03 </span>
                            <p data-v-e0f90538="" class="title">[안내] KREAM DRAW - 오딧세이 X 미하라 야스히로 서프라이즈 드로우 응모 안내</p>
                        </div>
                    </div>
                    <div data-v-e0f90538="" class="dropdown_content">
                        <div data-v-e0f90538="" class="content"><p>안녕하세요. KREAM 입니다.</p>
                            <p>11/24(일) - 11/28(목) 진행된 KREAM DRAW - 오딧세이 X 미하라 야스히로 서프라이즈 드로우 응모 안내 드립니다.</p>
                            <p>&nbsp;</p>
                            <ul style="list-style-type: circle;">
                                <li>당첨 여부는 마이 페이지 &gt; 구매 내역 &gt; 구매 입찰에서 확인 가능합니다.</li>
                                <li>당첨자에 한하여 당첨 체결 알림 드리며, 미당첨자에게는 별도의 연락을 드리지 않습니다.</li>
                                <li>당첨자에게는 오늘 중으로 상품 수령 시 필요한 서류를 가입된 이메일로 요청하고 있습니다. 서류를 모두 전달 받은 후에 이벤트 상품이 발송되는 점 유의 부탁 드립니다.</li>
                            </ul>
                            <p>&nbsp;</p>
                                <p class="mb-0 text-wrap" style="box-sizing: border-box; margin-top: 0px; margin-bottom: 0px !important;">
                                    <strong><span>-&nbsp;</span></strong><strong>오딧세이 챕터파이브 ✕ 메종 미하라 야스히로 리미티드 에디션 세트</strong></p>
                            
                                    <p><span><strong>&nbsp;&nbsp;</strong><span style="caret-color: rgba(34, 34, 34, 0.5); color: rgba(34, 34, 34, 0.5); font-family: 'Pretendard Variable', Pretendard, -apple-system, BlinkMacSystemFont, system-ui, 'Segoe UI', Roboto, Ubuntu, Cantarell, 'Noto Sans', sans-serif, 'Helvetica Neue', 'Apple SD Gothic Neo', 'Noto Sans KR', 'Malgun Gothic', 'Apple Color Emoji', 'Segoe UI Emoji', 'Segoe UI Symbol'; letter-spacing: -0.21px;"><span style="font-size: 14px; letter-spacing: -0.21px;">
                                        ODYSSEY Chapter V ✕ Maison MIHARA YASUHIRO Limited Edition Set</span><br></span></span></p>
                            
                            <p><span>감사합니다.<br><br></span></p>
                            <p>&nbsp;</p>
                            <p><span><strong>유의사항</strong></span></p>
                            <p><span>*당첨 체결 시 등록한 결제정보로 결제가 진행되지 않으면, 당첨은 즉시 취소되며 후 순위 당첨자로 변경됩니다.</span></p>
                            <p><span>*제세공과금은 KREAM에서 부담하며, 제세공과금 처리를 위해 가입된 이메일 주소로 신분증 등 서류를 요청 드립니다.</span></p>
                            <p><span>*이메일로 요청한 서류(신분증/ 개인정보수집이용동의서)가 당첨자 발표 공지 시점으로부터 72시간 내 제출되지 않을 경우 당첨은 취소되며, 이로 인한 재추첨은 진행되지 않습니다.&nbsp;</span></p>
                            <p><span>*회원정보가 일치하지 않거나 부당한 방법으로 응모한 고객의 경우, 구매 취소 및 추후 이벤트 응모 시 불이익을 받을 수 있습니다.</span></p>
                            <p><span>*잘못된 정보를 기입하여 발생된 불이익에 대해서는 당사는 책임이 없음을 알려드립니다.</span></p>
                            <p><span>*지급된 이벤트 상품은 교환 및 환불이 불가합니다.</span></p>
                            <p><span>*이벤트 상품은 출시 연기 및 수급 상황에 따라 배송이 늦어질 수 있습니다.</span></p>
                        </div>
                    </div>
                </div>
                <div data-v-e0f90538="" class="btn_list">
                    <a data-v-7122e1e2="" data-v-e0f90538="" href="#" class="btn outlinegrey medium"> 목록보기 </a>
                </div>
            </main>
        </div>
    </div>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>