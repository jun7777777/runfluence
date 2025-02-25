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
        p {
    font-family: "JejuGothic", sans-serif !important;
}
    
    
html, body {
    height: 100%;         /* 페이지 높이를 100%로 설정 */
    margin: 0;            /* body 기본 여백 제거 */
}

body {
  display: flex;
  flex-direction: column;
}

.container {
    width: 100%;
    max-width: 1280px;     /* 최대 너비 설정 */
    margin: 0 auto;        /* 중앙 정렬 */
    padding: 0 15px;       /* 양쪽 패딩 */
    box-sizing: border-box;
}

.row {
    display: flex;         /* 자식 요소들을 가로로 배치 */
    flex-wrap: wrap;       /* 화면 크기에 맞게 자식 요소들이 줄 바꿈 되도록 설정 */
    gap: 20px;             /* 자식 요소 간의 간격 */
    margin-left: -15px;    /* 양쪽 margin을 없애기 위해 부정값 사용 */
    margin-right: -15px;   /* 양쪽 margin을 없애기 위해 부정값 사용 */
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
  flex: 1; /* 남은 공간을 채우도록 설정 */
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

.write_button {
    padding: 12px 45px; /* 버튼 좌우 크기 증가 */
    background-color: #F0F0F0; /* 버튼 배경 색상 */
    color: black; /* 글쓰기 텍스트 색상 */
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 16px;
    width: 100%; /* 버튼을 부모 너비에 맞게 100%로 설정 */
    box-sizing: border-box; /* padding 포함 전체 너비에 맞추기 */
    margin-top: 20px; 
}

.write_button:hover {
    background-color: #e0e0e0; /* 버튼 호버 시 색상 변경 */
}
/* 댓글 입력창 스타일 */
.comment_section {
    margin-top: 20px;
    padding: 10px;
    border-top: 1px solid #ddd;
}

.comment_input, .modify_input, .reply_input {
    width: 100%;
    height: 80px;
    padding: 10px;
    border: 1px solid #ccc;
    border-radius: 5px;
    font-size: 14px;
    resize: none; /* 크기 조정 불가 */
    margin-bottom: 10px;
}

.submit_comment,.modify_comment, .reply_comment {
    padding: 10px 20px;
    background-color: #F0F0F0; /* 버튼 배경 색상 */
    color: black;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 14px;
    margin-left: auto; /* 부모 div에서 버튼을 우측으로 정렬 */
    display: block;
}

.submit_comment:hover,.modify_comment:hover {
    background-color: #F0F0F0;
}

/* 댓글 리스트 스타일 */
.comment_list {
    margin-top: 20px;
    margin-bottom: 20px;
}

/* 댓글 항목 */
.comment_item {
    position: relative; /* 버튼을 최상단 우측에 배치하기 위해 상대적으로 위치 설정 */
    padding: 10px;
    border-bottom: 1px solid #ddd;
    margin-bottom: 20px; /* 댓글 항목 간 여백 */
}

/* 댓글 내용 */
.comment_content {
    padding-right: 40px; /* 버튼이 오른쪽에 위치할 공간을 마련하기 위한 여백 */
}

.comment_author {
    font-weight: bold;
    margin-bottom: 5px;
}

.comment_text {
    font-size: 14px;
    line-height: 1.5;
}

/* 댓글 수정, 삭제 버튼 */
.comment_buttons {
    position: absolute; /* 버튼을 부모 영역 안에서 절대 위치로 배치 */
    top: 10px; /* 최상단으로 배치 */
    right: 10px; /* 우측으로 배치 */
    display: flex; /* 가로로 배치 */
    justify-content: flex-end; /* 버튼들을 오른쪽 정렬 */
}

.comment_buttons a {
    font-size: 14px;
    color: #9E9E9E;
    text-decoration: none;
    margin-left: 10px; /* 버튼 간 간격 */
    cursor: pointer;
}



/* 댓글 작성자 */
.comment_author {
    font-weight: bold;
    margin-bottom: 5px;
}   

.reply_list {
  display: block;
  visibility: visible;  /* 부모 요소에서 visibility 설정이 잘못되었을 수 있음 */
}

.reply-item {
  background-color: white;  /* 배경색을 명시적으로 설정하여 보이지 않지 않도록 */
  padding: 10px;
  margin-bottom: 10px;
  border: 1px solid #ddd;
}

.reply-item {
  display: block;
  padding: 10px;
  margin-bottom: 10px;
  background-color: #f9f9f9;
  border: 1px solid #ddd;
  color: #333;
}

.reply-item {
    display: block; /* 강제로 블록 형태로 표시 */
    margin-bottom: 10px;
}

.btn_delete {
    background: none;        /* 배경색 제거 */
    border: none;            /* 테두리 제거 */
    padding: 0;              /* 여백 제거 */
    color: #000000;          /* 텍스트 색상 (원하는 색으로 설정) */
    font-size: 14px;         /* 텍스트 크기 */
    cursor: pointer;        /* 클릭할 수 있는 커서 */
    text-decoration: none;   /* 링크 스타일 제거 */
    float: right;            /* 우측 끝에 정렬 */
}

.btn_delete:hover {
    color: #000000;          /* 마우스를 올렸을 때 색상 변화 */
    text-decoration: underline; /* 마우스를 올렸을 때 밑줄 추가 */
}

</style>
<script>
    $(document).ready(function(){
        $(".write_button").on("click",function(){
            document.freeBoardForm.action = "/community/board_writeForm";
            document.freeBoardForm.submit();
        });

        $(".btn_edit").on("click",function(){
            var comSeq = $(this).data("seq");
            const commentItem = $("#" + comSeq);

            commentItem.find(".btn_edit").css("display", "none");
            commentItem.find(".btn_cancel").css("display", "block"); 
            commentItem.find(".comment_text").css("display", "none");
            commentItem.find(".modify_input").css("display", "block"); 
            commentItem.find(".modify_comment").css("display", "block"); 
        });

        $(".btn_cancel").on("click",function(){
            var comSeq = $(this).data("seq");
            const commentItem = $("#" + comSeq);

            commentItem.find(".btn_edit").css("display", "block");
            commentItem.find(".btn_cancel").css("display", "none"); 
            commentItem.find(".comment_text").css("display", "block");
            commentItem.find(".modify_input").css("display", "none"); 
            commentItem.find(".modify_comment").css("display", "none");  
        });
        
        $(".btn_reply").on("click", function() {
            var comSeq = $(this).data("seq");
            const commentItem = $("#" + comSeq);

            commentItem.find(".btn_reply_cancel").css("display", "block");
            commentItem.find(".btn_reply").css("display", "none");
            commentItem.find(".comment_text").css("display", "block");
            commentItem.find(".reply_input").css("display", "block");
            commentItem.find(".reply_comment").css("display", "block");

            var replyList = commentItem.find(".reply_list");
            replyList.css("display", "block");

            $.ajax({
                type: "POST",
                data: {
                    commSeq: comSeq
                },
                dataType: "JSON",
                url: "/comm/replyList",
                beforeSend: function(xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function(response) {
                    if (response.code == 0) {
                        var replies = response.data;
                        console.log("Replies data:", replies);

                        if (replies && replies.length > 0) {
                            replies.forEach(function(reply) {
                                // 데이터를 제대로 받았는지 확인
                                console.log("reply.userEmail: ", reply.userEmail);
                                console.log("reply.commContent: ", reply.commContent);

                                const replyHTML = '<div class="comment_item" id="' + reply.commSeq + '">' +
                                '<p class="reply-author">' + reply.userEmail + 
                                ' <button class="btn_delete" data-seq="' + reply.commSeq + '">삭제</button>' +
                                '</p>' +
                                '<p class="reply-content">' + reply.commContent + '</p>' +
                            	'</div>';
                            	
                                console.log("replyHTML:", replyHTML);  // replyHTML 확인
                                replyList.append(replyHTML);  // append로 추가
                            });
                        }
                    } else if (response.code == 404) {
                    	Swal.fire({
                    	    title: '오류',
                    	    text: '해당 댓글이 존재하지 않습니다.',
                    	    icon: 'error',
                    	    confirmButtonText: '확인'
                    	});
                    } else {
                    	Swal.fire({
                    	    title: '오류',
                    	    text: '알 수 없는 오류가 발생했습니다.',
                    	    icon: 'error',
                    	    confirmButtonText: '확인'
                    	});
                    }
                },
                error: function(error) {
                    console.log("AJAX Error:", error);
                }
            });
        });
       	
       	$(".btn_reply_cancel").on("click",function(e){
       		var comSeq = $(this).data("seq");
            const commentItem = $("#" + comSeq); 
            
            commentItem.find(".btn_reply_cancel").css("display", "none");
            commentItem.find(".btn_reply").css("display", "block"); 
            commentItem.find(".comment_text").css("display", "block");
            commentItem.find(".reply_input").css("display", "none"); 
            commentItem.find(".reply_comment").css("display", "none"); 
            commentItem.find(".reply_input").val("");
            
            commentItem.find('.reply_list').empty(); 
 
       	});
        
        $("#btn_modify").on("click",function(){
        	document.freeBoardForm.action = "/community/board_updateForm";
			document.freeBoardForm.submit();
        });
        
        $("#btn_delete").on("click",function(){
        	if(confirm("해당 게시물을 삭제하시겠습니까?") == true){
        		$.ajax({
            		type:"POST",
            		url:"/bbs/bbsDelete",
            		data:{
            			bbsSeq:$("#bbsSeq").val()
            		},
            		dataType:"JSON",
            		beforeSend:function(xhr){
            			xhr.setRequestHeader("AJAX","true");	
            		},
            		success : function(response){
            			if(response.code == 0 )
            			{
            				Swal.fire({
            				    title: '성공',
            				    text: '게시글이 정상적으로 삭제되었습니다.',
            				    icon: 'success',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    location.href = "/community/freeBoard";
            				});
            			}
            			else if(response.code == 404)
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '게시글의 작성자가 일치하지 않습니다.',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				});
            			}
            			else if(response.code == 400)
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '존재하지 않는 게시글입니다.',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    location.href = "/community/freeBoard";
            				});
            			}
            			else{
            				Swal.fire({
            				    title: '오류',
            				    text: '잘못된 접근입니다.',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    location.href = "/community/freeBoard";
            				});
            			}
            		},
            		error:function(error){
            			Swal.fire({
            			    title: '오류',
            			    text: '게시글 작성에 실패하셨습니다.',
            			    icon: 'error',
            			    confirmButtonText: '확인'
            			});
                	}   				
            	});
        	}
        });
        
        $(".reply_comment").on("click",function(){
        	var commContent = $(this).closest(".comment_item").find(".reply_input").val().trim();
        	var commSeq = $(this).closest(".comment_item").attr("id");
        	
        	if(commContent != "")
        	{
        		$.ajax({
        			type:"POST",
        			url:"/comm/commReplyInsert",
        			data:{
        				comment: commContent,
        				commSeq: commSeq,
        				bbsSeq: $("#bbsSeq").val()
        			},
        			beforeSend:function(xhr){
        				xhr.setRequestHeader("AJAX","true");
        			},
        			success:function(response){
        				if(response.code == 0)
        				{
        					Swal.fire({
        					    title: '성공',
        					    text: '답글이 정상적으로 작동되었습니다.',
        					    icon: 'success',
        					    confirmButtonText: '확인'
        					}).then(() => {
        					    $(".reply_input").val(""); // 입력 필드 초기화
        					});
        				}
        				else if(response.code == 404)
        				{
        					Swal.fire({
        					    title: '오류',
        					    text: '존재하지 않는 게시물입니다.',
        					    icon: 'error',
        					    confirmButtonText: '확인'
        					}).then(() => {
        					    location.href = "/community/freeBoard";  // 페이지 리디렉션
        					});
        				}
        				else if(response.code == 400)
        				{
        					Swal.fire({
        					    title: '오류',
        					    text: '파라미터값 오류',
        					    icon: 'error',
        					    confirmButtonText: '확인'
        					});
        				}
        				else if(response.codde == -1)
        				{
        					Swal.fire({
        					    title: '오류',
        					    text: '답글 작성 중 오류가 발생하였습니다.',
        					    icon: 'error',
        					    confirmButtonText: '확인'
        					});
        				}
        				else
            			{
        					Swal.fire({
        					    title: '오류',
        					    text: '잘못된 접근입니다.',
        					    icon: 'error',
        					    confirmButtonText: '확인'
        					}).then(() => {
        					    location.href = "/community/freeBoard";  // 페이지 리디렉션
        					});
            			}
        				
        			},
        			error:function(error){
        				Swal.fire({
        				    title: '오류',
        				    text: '게시글 작성에 실패하셨습니다.',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
                	} 
        		});
        	}
        	else
        	{
        		Swal.fire({
        		    title: '오류',
        		    text: '답글을 입력해주세요.',
        		    icon: 'error',
        		    confirmButtonText: '확인'
        		});
        	}
        });
        
        $(".submit_comment").on("click",function(){
        	
        	var commContent = $(".comment_input").val().trim();
        	
        	if(commContent != "")
        	{
        		$.ajax({
        			type:"POST",
        			url:"/comm/commInsert",
        			data:{
        				comment: commContent,
        				bbsSeq: $("#bbsSeq").val()
        				
        			},
        			beforeSend:function(xhr){
            			xhr.setRequestHeader("AJAX","true");	
            		},
            		success : function(response){
            			if(response.code == 0 )
            			{
            				Swal.fire({
            				    title: '성공',
            				    text: '댓글이 정상적으로 작성되었습니다.',
            				    icon: 'success',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    $("#freeBoardForm").submit();  // 폼 제출
            				    location.reload();  // 페이지 리로드
            				});
            			}
            			else if(response.code == 404)
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '존재하지 않는 게시글입니다.',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    location.href = "/community/freeBoard";  // 게시판으로 리다이렉트
            				});
            			}
            			else if(response.code == 400)
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '파라미터값 오류',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				});
            			}
            			else if(response.code == -1)
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '댓글 작성중 오류가 발생하였습니다.',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				});
            			}
            			else
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '잘못된 접근입니다.',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    location.href = "/community/freeBoard";  // 게시판으로 리다이렉트
            				});
            			}
            		},
            		error:function(error){
                		Swal.fire({
        				    title: '오류',
        				    text: '게시글 작성에 실패하셨습니다.',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
                	} 
        			
        		});
        	}
        	else
        	{
        		Swal.fire({
				    title: '오류',
				    text: '댓글을 입력해주세요.',
				    icon: 'error',
				    confirmButtonText: '확인'
				});
        	}
        });
        
        $(".reply_list").on("click", ".btn_delete", function() {
            var commSeq = $(this).data("seq");  // 삭제할 댓글의 ID 가져오기

            // 댓글 삭제 AJAX 호출
            deleteComment(commSeq);
        });

        // 댓글 삭제를 처리하는 함수
        function deleteComment(commSeq) {
		    $.ajax({
		        type: "POST",
		        url: "/comm/commDeleteProc",  // 삭제 처리 URL
		        data: {
		            comSeq: commSeq,  // 댓글 ID
		            bbsSeq: $("#bbsSeq").val()  // 게시물 ID
		        },
		        beforeSend: function(xhr) {
		            xhr.setRequestHeader("AJAX", "true");
		        },
		        success: function(response) {
		            if (response.code == 0) {
		                Swal.fire({
		                    title: '성공',
		                    text: '댓글이 정상적으로 삭제되었습니다.',
		                    icon: 'success',
		                    confirmButtonText: '확인'
		                }).then(() => {  // 폼 제출
		                    location.reload();  // 페이지 리로드
		                });
		            } else {
		                Swal.fire({
		                    title: '오류',
		                    text: '댓글 삭제에 실패하였습니다.',
		                    icon: 'error',
		                    confirmButtonText: '확인'
		                });
		            }
		        },
		        error: function(error) {
		            Swal.fire({
		                title: '오류',
		                text: '댓글 삭제에 실패했습니다.',
		                icon: 'error',
		                confirmButtonText: '확인'
		            });
		        }
		    });
		}

        
       	$(".btn_delete").on("click",function(){
       		var comSeq = $(this).closest(".comment_item").attr("id");
       		
       		$.ajax({
       			type:"POST",
       			url:"/comm/commDeleteProc",
       			data:{
       				comSeq: comSeq,
       				bbsSeq: $("#bbsSeq").val() 
       			},
       			beforeSend:function(xhr){
        			xhr.setRequestHeader("AJAX","true");	
        		},
        		success : function(response){
        			if(response.code == 0 )
        			{
        				Swal.fire({
        					  title: '삭제 완료!',
        					  text: '댓글이 정상적으로 삭제되었습니다.',
        					  icon: 'success',
        					  confirmButtonText: '확인'
        					}).then(() => {
        					  location.reload();
        					});
        				
        				setTimeout(function() {
                            var commentSection = document.querySelector('.comment_list');
                            if (commentSection) {
                                commentSection.scrollIntoView({
                                    behavior: 'smooth', // 부드럽게 스크롤
                                    block: 'start'      // 요소가 화면 상단에 오도록 설정
                                });
                            }
                        }, 200); // 페이지가 로드된 후 잠시 대기 (300ms 정도)
        			}
        			else if(response.code == -1) {
        			    Swal.fire({
        			        title: '오류',
        			        text: '댓글 삭제 중 오류가 발생되었습니다.',
        			        icon: 'error',
        			        confirmButtonText: '확인'
        			    });
        			}
        			else if(response.code == 404) {
        			    Swal.fire({
        			        title: '오류',
        			        text: '게시글을 찾지 못했습니다.',
        			        icon: 'error',
        			        confirmButtonText: '확인'
        			    });
        			}
        			else if(response.code == 400) {
        			    Swal.fire({
        			        title: '오류',
        			        text: '파라미터값 오류',
        			        icon: 'warning',
        			        confirmButtonText: '확인'
        			    });
        			}
        			else if(response.code == 403) {
        			    Swal.fire({
        			        title: '오류',
        			        text: '사용자 정보가 올바르지 않습니다.',
        			        icon: 'warning',
        			        confirmButtonText: '확인'
        			    });
        			}
        			else {
        			    Swal.fire({
        			        title: '실패',
        			        text: '댓글 삭제에 실패하셨습니다.',
        			        icon: 'error',
        			        confirmButtonText: '확인'
        			    });
        			}
        		},
        		error:function(error){
            		Swal.fire({
    			        title: '실패',
    			        text: '댓글 삭제에 실패하셨습니다.',
    			        icon: 'error',
    			        confirmButtonText: '확인'
    			    });
            	} 
       		});
       	});
       
        $(".modify_comment").on("click",function(){
        	var modifyContent = $(this).closest(".comment_item").find(".modify_input").val().trim();
        	var comSeq = $(this).closest(".comment_item").attr("id");
        	
        	if(modifyContent != "")
        	{
        		$.ajax({
        			type:"POST",
        			url:"/comm/commUpdateProc",
        			data:{
        				comment: modifyContent,
        				comSeq: comSeq,
        				bbsSeq: $("#bbsSeq").val()
        			},
        			beforeSend:function(xhr){
            			xhr.setRequestHeader("AJAX","true");	
            		},
            		success : function(response){
            			if(response.code == 0 )
            			{
            				Swal.fire({
            				    title: '수정 완료!',
            				    text: '댓글이 정상적으로 수정되었습니다.',
            				    icon: 'success',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    $("#freeBoardForm").submit();  // 폼 제출
            				    location.reload();  // 페이지 새로 고침
            				});
            			}
            			else if(response.code == -1) {
            			    Swal.fire({
            			        title: '오류',
            			        text: '댓글 수정 중 오류가 발생되었습니다.',
            			        icon: 'error',
            			        confirmButtonText: '확인'
            			    });
            			}
            			else if(response.code == 404) {
            			    Swal.fire({
            			        title: '오류',
            			        text: '게시글을 찾지 못했습니다.',
            			        icon: 'error',
            			        confirmButtonText: '확인'
            			    });
            			}
            			else if(response.code == 400) {
            			    Swal.fire({
            			        title: '오류',
            			        text: '파라미터값 오류',
            			        icon: 'warning',
            			        confirmButtonText: '확인'
            			    });
            			}
            			else if(response.code == 403) {
            			    Swal.fire({
            			        title: '오류',
            			        text: '사용자 정보가 일치하지 않습니다.',
            			        icon: 'warning',
            			        confirmButtonText: '확인'
            			    });
            			}
            			else {
            			    Swal.fire({
            			        title: '실패',
            			        text: '댓글 수정에 실패하셨습니다.',
            			        icon: 'error',
            			        confirmButtonText: '확인'
            			    });
            			}
            		},
            		error:function(error){
            			 Swal.fire({
         			        title: '실패',
         			        text: '댓글 수정에 실패하셨습니다.',
         			        icon: 'error',
         			        confirmButtonText: '확인'
         			    });
                	} 
        			
        		});
        	}
        	else
        	{
        		Swal.fire({
        		    title: '입력 필요',
        		    text: '댓글을 입력해주세요.',
        		    icon: 'warning',
        		    confirmButtonText: '확인'
        		});
        	}
        });
    });

</script>
</head>
<body>
<%@include file="/WEB-INF/views/include/navigation.jsp" %>
   <!-- 메인 컨텐츠 -->
    <div class="container py-4 buying_container">
        <div class="row">
            <!-- 메인 컨텐츠 -->
            <main class="main-content">
                <div class="myprofile_title">
                    <div class="title">FreeBoard</div>
                </div>
                <!-- 여기에 구매 내역 컨텐츠 추가 -->
                <div data-v-e0f90538="" class="dropdown">
                    <div data-v-e0f90538="" class="dropdown_head">
                        <strong data-v-e0f90538="" class="sort">${bbs.bbsSubCateName}</strong>
                        <div data-v-e0f90538="" class="title_box">
                            <span data-v-e0f90538="" class="date">${bbs.regDate}</span>
                            <p data-v-e0f90538="" class="title">${bbs.bbsTitle}</p>
                        </div>
                    </div>
                    <div data-v-e0f90538="" class="dropdown_content">
                        <div data-v-e0f90538="" class="content">
                        	${bbs.bbsContent}
                        </div>
                    </div>
                </div>
                <div data-v-e0f90538="" class="btn_list">
                	<c:if test="${boardMe eq 'Y'}" >
                    <a data-v-7122e1e2="" data-v-e0f90538="" class="btn outlinegrey medium" id=btn_modify> 수정 </a>
                    <a data-v-7122e1e2="" data-v-e0f90538="" class="btn outlinegrey medium" id="btn_delete"> 삭제 </a>
                	</c:if>
                </div>

                <div class="comment_section">
                    <textarea class="comment_input" placeholder="댓글을 작성하세요..."></textarea>
                    <button class="submit_comment">댓글 등록</button>
                
                    <!-- 댓글 리스트 -->
                    <div class="comment_list">
                    <c:if test = "${!empty commList}">
                    	<c:forEach var="comment" items="${commList}">
	                        <div class ="comment_item" id="${comment.commSeq}">
	                            <p class="comment_author">${comment.userEmail}</p>
	                            <div class="comment_buttons">
	                                <a class="btn_edit" data-seq="${comment.commSeq}" style="display: block;" >수정</a>
	                                <a class="btn_cancel" data-seq="${comment.commSeq}" style="display: none;" >취소</a>
	                                <a class="btn_delete" data-seq="${comment.commSeq}">삭제</a>
	                            </div>
	                            <p class="comment_text" style = "display: block; margin-bottom: 10px;">${comment.commContent}</p>
	                            <textarea class="modify_input" placeholder="댓글을 수정하세요..." style = "display: none;">${comment.commContent}</textarea>
	                            <button class="modify_comment" style = "display: none;">댓글 수정</button>
	                            <a class="btn_reply" data-seq="${comment.commSeq}" style="display: block; " >답글</a>                      
	                            <div class="reply_list" style="display: none;"></div>
	                            <textarea class="reply_input" placeholder="답글을 작성하세요" style = "display: none;"></textarea>
	                            <a class="btn_reply_cancel" data-seq="${comment.commSeq}" style="display: none; " >닫기</a>
	                            <button class="reply_comment" style = "display: none;">답글 작성</button>
	                        </div>
                        </c:forEach>
                    </c:if>
                    </div>
                </div>
                
                    
                
            </main>
        </div>
        
    </div>
    <form name="freeBoardForm" id="freeBoardForm" method="post">
        <input type="hidden" name="curPage" id="curPage" value="${curPage}">
        <input type="hidden" name="prodId" id="prodId" value="">
        <input type="hidden" name="userEmail" id="userEmail" value="">
        <input type="hidden" name="searchTitle" id="searchTitle" value="${searchType}">
        <input type="hidden" name="searchContent" id="searchContent" value="${searchValue}">
        <input type="hidden" name="bbsSeq" id="bbsSeq" value="${bbsSeq}">
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>


</html>