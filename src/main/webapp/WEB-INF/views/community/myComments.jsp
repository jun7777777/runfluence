<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sist.common.util.StringUtil"%>        
<%@include file="/WEB-INF/views/include/taglib.jsp" %>  
<!DOCTYPE html>
<html>
<head>
<%@include file="/WEB-INF/views/include/shopHead.jsp" %>
 <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_Notice</title>
    <!-- 부트스트랩 CSS -->
    
   
    <!-- Optional Bootstrap JS and dependencies (jQuery and Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"></script>

     <style>
    --font--
    
    p {
    font-family: "JejuGothic", sans-serif !important;
}
    
    p {
    font-size: 16px;
    font-family: "JejuGothic", sans-serif; /* JejuGothic으로 변경 */
    color: #797979;
    line-height: 24px;
    margin: 0 0 15px 0;
}
    html, body {
    height: 100%;
    font-family: "JejuGothic", sans-serif; /* 여기에 JejuGothic 적용 */
    -webkit-font-smoothing: antialiased;
    font-smoothing: antialiased;
}
    
    body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
    font-family: "JejuGothic", sans-serif; /* JejuGothic 폰트 추가 */
}

*, :after, :before {
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    box-sizing: border-box;
}

/* 다른 폰트 스타일들도 JejuGothic으로 설정 */
.mypage-title {
    font-family: "JejuGothic", sans-serif;
    font-size: 24px;
    font-weight: bold;
    padding: 20px 0;
}

.nav-link {
    font-family: "JejuGothic", sans-serif;
    color: #666;
    padding: 8px 0;
}

.nav-link:hover {
    font-family: "JejuGothic", sans-serif;
    color: #000;
}

/* 나머지 모든 텍스트 관련 스타일에도 폰트 적용 */
.nav-link.active {
    font-family: "JejuGothic", sans-serif;
}

h2 {
    font-family: "JejuGothic", sans-serif;
    font-size: 1.2em !important;
    font-weight: bold !important;
}

.buying_container .head_btn {
    font-family: "JejuGothic", sans-serif;
    font-size: 13px;
}

.buying_container .text_body_title {
    font-family: "JejuGothic", sans-serif;
    font-size: 14px;
    font-weight: 500;
}

.buying_modal .modal-title {
    font-family: "JejuGothic", sans-serif;
    font-size: 18px;
    font-weight: bold;
}

.input_search_bar {
    font-family: "JejuGothic", sans-serif;
    font-size: 15px;
}

.category {
    font-family: "JejuGothic", sans-serif;
    font-size: 16px;
}

.search_bar {
    font-family: "JejuGothic", sans-serif;
}

.btn_page {
    font-family: "JejuGothic", sans-serif;
    font-size: 16px;
}
    
    
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
    display: block !important;
    font-size: 1.2em !important;
    margin-block-start: 0.83em !important;
    margin-block-end: 0.83em !important;
    margin-inline-start: 0px !important;
    margin-inline-end: 0px !important;
    font-weight: bold !important;
    unicode-bidi: isolate ;
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
   padding: 40px 40px 240px;
   
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

.row {
    display: flex;         /* 자식 요소들을 가로로 배치 */
    flex-wrap: wrap;       /* 화면 크기에 맞게 자식 요소들이 줄 바꿈 되도록 설정 */
    gap: 20px;             /* 자식 요소 간의 간격 */
    margin-left: -15px;    /* 양쪽 margin을 없애기 위해 부정값 사용 */
    margin-right: -15px;   /* 양쪽 margin을 없애기 위해 부정값 사용 */
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
   font-family: "JejuGothic", sans-serif;
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
    font-family: "JejuGothic";
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
    font-family: "JejuGothic", sans-serif !important;
}

div {
    display: block;
    unicode-bidi: isolate;
}

a, a:active, a:focus, a:hover {
    -webkit-text-decoration: none;
    text-decoration: none;
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
/* 이미지 */
.icon {
    width: 30px;
    height: 30px;
    background-size: cover;  /* 이미지 크기를 요소 크기에 맞게 조정 */
    background-position: center;  /* 배경 이미지 중앙 정렬 */
    cursor: pointer;  /* 클릭 가능한 요소처럼 보이게 함 */
    margin-left: auto;
}

li.open .dropdown_content {
    display: block;  /* 드롭다운 열기 */
}

#dropdown-item{
    display:none;
}

#dropdown-item.open {
    display: block;
}

.dropdown_content[data-v-46bd0c14] {
    background-color: #fafafa;
    border-bottom: 1px solid #ebebeb;
    display: none;
    font-size: 14px;
    padding: 30px 30px 28px;
}

.dropdown_content .content[data-v-46bd0c14] {
    max-width: 640px;
    word-break: break-word;
}

.search_bar {
    position: relative; /* 자식 요소들이 절대 위치를 사용할 수 있도록 설정 */
}

.input_container {
    position: relative;
    display: flex;
    width: 300px; /* 검색창과 드롭다운을 포함할 전체 너비 설정 */
}

.input_search_bar {
    padding: 5px;
    width: 100%; /* 검색창이 부모 너비를 꽉 채우도록 설정 */
    box-sizing: border-box; /* 패딩을 포함하여 너비를 계산 */
}

#search-condition {
    position: absolute;
    right: 5px; /* 드롭다운 메뉴를 검색창의 오른쪽 끝에 위치 */
    top: 50%;
    transform: translateY(-50%); /* 세로로 중앙 정렬 */
    padding: 5px;
    border: none;
    background: none;
}


.write_button {
    padding: 12px 45px;
    background-color: #F0F0F0;
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    width: 180px; /* 고정된 너비 설정 */
    box-sizing: border-box;
    margin-top: 20px;
    margin-left: auto;  /* 버튼을 오른쪽으로 밀기 */
    display: block;  /* 부모의 너비를 다 채우도록 block 요소로 설정 */
}

.write_button:hover {
    background-color: #e0e0e0; /* 버튼 호버 시 색상 변경 */
}

.user{
	text-align: right;  /* 텍스트를 오른쪽 정렬 */
    display: block;     /* block 요소로 설정 */
    margin-left: auto;  /* 왼쪽 여백 자동 */
    margin-right: 10px;    /* 오른쪽 여백 0 */
}
    
#search_input {
    padding-left: 20px;
}

.title_box .title {
    margin-bottom: 0px;   /* 아래로 5px */
    margin-right: 0px;   /* 오른쪽으로 10px */
}

.user {
    margin-bottom: 0px;   /* 아래로 5px */
    margin-right: 0px;   /* 오른쪽으로 10px */
}

.btn_arr, .btn_page {
    cursor: pointer;  /* 마우스가 올려지면 포인터로 변경 */
}

.title_box {
    min-height: 30px; /* 최소 높이 */
    display: flex;
    align-items: center; /* 세로 중앙 정렬 */
}

.title {
    min-height: 20px; /* 최소 높이 */
    min-width: 200px; /* 최소 너비 */
    display: inline-block;
    white-space: nowrap;
    overflow: hidden;
    text-overflow: ellipsis; /* 텍스트가 길어지면 '...'으로 표시 */
}

</style>

<script>
	$(document).ready(function(){

	function toggleImage() {
	    var img = document.getElementById("down");
	    var li = document.getElementById("dropdown-item");
	    
	    // 이미지 경로를 바꾸기 전에 확인
	    if (img.src.includes("down.png")) {
	        img.src = "C:/Users/user/Desktop/up.png";  // 'down.png'에서 'up.png'로 변경
	    } else {
	        img.src = "C:/Users/user/Desktop/down.png";  // 'up.png'에서 'down.png'로 변경
	    }
	
	    li.classList.toggle("open");
	}

    // 검색어를 처리하는 함수
    function searchFunction() {
    // 입력값을 가져옵니다.
    const searchTerm = document.getElementById('search_input').value;

    // 검색어가 비어있지 않은지 확인
    if (searchTerm.trim() !== '') {
        // 실제 검색 로직 처리 (서버로 요청 또는 페이지 내에서 처리)
        document.freeBoardForm.searchValue.value = searchTerm;  
        document.freeBoardForm.searchType.value = $("#search-condition").val();  
        document.freeBoardForm.bbsSeq.value = "";  
        document.freeBoardForm.curPage.value = "1";  
        document.freeBoardForm.action = "/community/myFreeBoard";  
        document.freeBoardForm.submit();  
    } else {
    	Swal.fire({
    	    title: '검색어를 입력해주세요!',
    	    icon: 'warning',
    	    confirmButtonText: '확인'
    	});
    }
}

    // 엔터키를 눌렀을 때 검색을 실행
	    document.getElementById('search_input').addEventListener('keypress', function(event) {
	        if (event.key === 'Enter') {
	            event.preventDefault();  // 기본 엔터키 동작을 막습니다 (폼 제출 방지)
	            searchFunction();  // 검색 함수 실행
	        }
	    });
    
    
	    $(".write_button").on("click",function(){
	        document.freeBoardForm.bbsSeq.value = "";
	        document.freeBoardForm.curPage.value = "";
	        document.freeBoardForm.searchType.value = "";
	        document.freeBoardForm.searchValue.value = "";
	        document.freeBoardForm.action = "/community/board_writeForm";
	        document.freeBoardForm.submit();
	    });

    });
	
	function fn_view(bbsSeq) {
        document.freeBoardForm.searchValue.value = "";
        document.freeBoardForm.searchType.value = "";
        document.freeBoardForm.bbsSeq.value = bbsSeq; 
        document.freeBoardForm.action = "/community/freeBoard_Detail";
        document.freeBoardForm.submit();
    }
	
	function fn_list(curPage)
	   {
	      var listForm = document.getElementById('freeBoardForm');
	      if(listForm)
	      {
	         document.freeBoardForm.bbsSeq.value = "";
	         document.freeBoardForm.curPage.value = curPage;
	         document.freeBoardForm.action = "/community/myComments"
	         document.freeBoardForm.submit();
	      }
	   }
	
</script>

</head>
<body>
<%@include file="/WEB-INF/views/include/navigation.jsp" %>
   <!-- 메인 컨텐츠 -->
    <div class="buying_container">
        <div class="row">
           
           <%@include file="/WEB-INF/views/include/mypageSideBar.jsp" %>

            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="myprofile_title">
                    <div class="title">MyComments</div>
                </div>
                
                
                
                <!-- 여기에 구매 내역 컨텐츠 추가 -->

                <div class="search_bar">
                    <input type="text" id="search_input" placeholder="검색" title="검색창" class="input_search_bar">
                    <select name="search-condition" id="search-condition">
                        <option value="1"<c:if test='${searchType eq "1"}'>selected</c:if>>작성자 </option>
                        <option value="2"<c:if test='${searchType eq "2"}'>selected</c:if>>제목 </option>
                        <option value="3"<c:if test='${searchType eq "3"}'>selected</c:if>>내용 </option>
                    </select>
                </div>
                
                
                
                <div>
                	<ul data-v-433857c6="" class="dropdown_list">
                        <li data-v-433857c6="" >
                            <div data-v-433857c6="" class="dropdown">
                                <div data-v-433857c6="" class="dropdown_head">
                                	<div data-v-433857c6="" class="title_box">
                                    	<strong data-v-433857c6="" class="title">
                                    		게시글 제목
                                    	</strong>
									</div>
									<div data-v-433857c6="" class="title_box">
	                                    <strong data-v-433857c6="" class="title">
			                                댓글 내용
			                            </strong>
			                        </div>
                                    <strong data-v-433857c6="" class="user">작성자 이메일</strong>
                                </div>
                            </div>
                        </li>
                    </ul>
                    <ul data-v-433857c6="" class="dropdown_list">
                    	<c:if test ='${!empty list}'>
                    		<c:forEach var = "comments" items ="${list}" varStatus="status">
		                        <li data-v-433857c6="" onclick="fn_view('${comments.bbsSeq}')">
		                            <div data-v-433857c6="" class="dropdown">
		                                <div data-v-433857c6="" class="dropdown_head">
		                                	<div data-v-433857c6="" class="title_box">
		                                    	<p data-v-433857c6="" class="title">
		                                    		${fn:substring(comments.bbsTitle, 0, 8)}${comments.bbsTitle.length() > 8 ? '...' : ''}
		                                    	</p>
											</div>
											<div data-v-433857c6="" class="title_box">
			                                    <p data-v-433857c6="" class="title">
					                                ${fn:substring(comments.commContent, 0, 12)}${comments.commContent.length() > 12 ? '...' : ''}
					                            </p>
					                        </div>
		                                    <p data-v-433857c6="" class="user">${comments.userName}</p>
		                                </div>
		                            </div>
		                        </li>
                        	</c:forEach>
                       </c:if>
                    </ul>
                    
                    <div data-v-68b0dbec="" data-v-433857c6="" class="paginations">
                		<c:if test = "${!empty paging}">
	                        <div data-v-68b0dbec="" class="paginations_box">
	                        	<c:if test = "${paging.prevBlockPage gt 0}">
		                            <div data-v-68b0dbec="" class="prev_btn_box">
		                                <a data-v-68b0dbec="" class="btn_arr nuxt-link-active" onclick="fn_list(${paging.prevBlockPage})" aria-label="이전 페이지">
		                                    이전
		                                </a>
		                            </div>
	                            </c:if>
	                            <c:forEach var = "i" begin ="${paging.startPage}" end="${paging.endPage}">
		                            <div data-v-68b0dbec="" class="page_bind">
		                                <a data-v-68b0dbec="" class="nuxt-link-active btn_page" onclick="fn_list(${i})" aria-label=""> ${i}</a>
		                            </div>
	                            </c:forEach>
	                            <c:if test = "${paging.nextBlockPage gt 0}">
		                            <div data-v-68b0dbec="" class="next_btn_box">
		                                <a data-v-68b0dbec="" class="btn_arr nuxt-link-active" onclick="fn_list(${paging.nextBlockPage})" aria-label="다음 페이지">
		                                    다음
		                                </a>
		                            </div>
	                            </c:if>
	                        </div>
                        </c:if>
                    </div>
                </div>
            </main>
            <form name="freeBoardForm" id="freeBoardForm" method="post">
                <input type="hidden" name="curPage" id="curPage" value="${curPage}">
                <input type="hidden" name="prodId" id="prodId" value="">
                <input type="hidden" name="userEmail" id="userEmail" value="">
                <input type="hidden" name="searchType" id="searchType" value="${searchType}">
                <input type="hidden" name="searchValue" id="searchValue" value="${searchValue}">
                <input type="hidden" name="bbsSeq" id="bbsSeq" value="">
            </form>
        </div>
    </div>
    <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>