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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <link href="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/summernote@0.8.18/dist/summernote-lite.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/summernote/0.8.20/lang/summernote-ko-KR.min.js"></script>

    <style>
    .mypage-title {
    font-size: 24px;
    font-weight: bold;
    padding: 20px 0;
    
    }

    .nav-link {
    color: #666;
    padding: 8px 0;
    border-bottom: 2px solid #c4c1c1; /* 아래에 테두리 추가 */
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
        margin-bottom: 40px;
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

    /* 제목 입력창 스타일 */
    .title_input {
        width: 100%; /* 제목을 화면에 꽉 채우도록 설정 */
        padding: 10px;
        padding-left: 10px; /* 좌측 여백 추가 */
        padding-right: 10px; /* 우측 여백 추가 */
        font-size: 16px;
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px;
        margin-bottom: 15px; /* 아래쪽 여백 */
        box-sizing: border-box; /* padding을 포함한 크기 계산 */
        margin-left: 30px;
        margin-right: 30px;
    }

    /* 내용 입력창 스타일 */
    .content_input {
        width: 100%; /* 내용 입력 공간도 화면을 꽉 채우도록 설정 */
        padding: 10px;
        font-size: 14px;
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px;
        height: 200px; /* 내용 공간의 높이를 설정 */
        box-sizing: border-box; /* padding을 포함한 크기 계산 */
        resize: vertical; /* 세로로 크기 조정 가능 */
    }

    /* 입력창의 placeholder 스타일 */
    .title_input::placeholder, .content_input::placeholder {
        color: #9e9e9e;
        font-style: italic; /* placeholder 텍스트를 이탤릭체로 설정 */
    }

    .category_select_wrapper {
        margin-top: 10px; /* 제목 input과 select 사이에 간격을 둡니다 */
    }

    /* Select 태그 스타일 */
    .category_select {
        width: 100%; /* 제목 입력 필드와 동일하게 화면에 꽉 차도록 설정 */
        padding: 10px;
        padding-left: 10px; /* 좌측 여백 추가 */
        padding-right: 10px; /* 우측 여백 추가 */
        font-size: 16px;
        border: 1px solid #ccc; /* 테두리 */
        border-radius: 5px;
        
        box-sizing: border-box; /* padding을 포함한 크기 계산 */
        margin-left: 30px;
        margin-right: 30px;
        cursor: pointer; /* 커서를 포인터로 변경 */
    }

    /* 카테고리 선택 div (dropdown_head의 스타일을 적용) */
    .category_select_wrapper {
        align-items: center;
        cursor: pointer;
        display: flex;
        padding: 17px 0 19px;
    }

    .category_and_title_wrapper {
        border: 1px solid #ccc;  /* 외곽선 추가 */
        border-radius: 5px;       /* 모서리 둥글게 */
        padding: 10px;            /* 안쪽 여백 */
        margin-bottom: 15px;      /* 아래쪽 여백 */
    }



    /* 파일 업로드 input */
    .file_upload_input {
        display: none; /* 기본 input 요소는 숨깁니다 */
    }

    /* 파일 업로드를 위한 레이블 (클릭 가능한 텍스트) */
    .file_upload_label {
        display: inline-block;
        padding: 10px 20px;
        background-color: #000000; /* 배경색 */
        color: white; /* 텍스트 색상 */
        font-size: 14px;
        border-radius: 5px;
        cursor: pointer;
        margin-right: 10px; /* 파일명 텍스트와 간격을 둡니다 */
        margin-top: 20px;
    }

    /* 파일명이 표시될 부분 */
    .file_name_placeholder {
        font-size: 14px;
        color: #555;
    }
</style>
<script>
    $(document).ready(function(){

        $("#content").summernote({
            lang: 'ko-KR',
            height: 400,
            toolbar: [
                ["insert", ['picture']],
                ["fontname", ["fontname"]],
                ["fontsize", ["fontsize"]],
                ["color", ["color"]],
                ["style", ["style"]],
                ["font", ["strikethrough", "superscript", "subscript"]],
                ["table", ["table"]],
                ["para", ["ul", "ol", "paragraph"]],
                ["height", ["height"]],
            ],
            fontNames: ['제주고딕', 'Nanum Gothic', 'Noto Sans KR', 'Spoqa Han Sans'],
            fontNamesIgnoreCheck: ['제주고딕', 'Nanum Gothic', 'Noto Sans KR', 'Spoqa Han Sans'],
            callbacks: {
                onInit: function() {
                    $("#prodInfo").summernote("fontSize", "17");
                    $("#prodInfo").summernote("fontName", "제주고딕");
                },
                onImageUpload: function(files) {
                    for (let i = 0; i < files.length; i++) {
                        uploadImage(files[i]);
                    }
                }
            },
            disableDragAndDrop: true  
        });

        $(".btn_edit").on("click",function(){
            var comSeq = $(this).data("seq");
            const commentItem = $("#" + comSeq);

            commentItem.find(".btn_edit").css("display", "none");
            commentItem.find(".btn_cancel").css("display", "block"); 
            commentItem.find(".comment_text").css("display", "none");
            commentItem.find(".comment_input").css("display", "block"); 
            commentItem.find(".submit_comment").css("display", "block"); 
        
        });

        $("#cancel").on("click",function(){
            var comSeq = $(this).data("seq");
            const commentItem = $("#" + comSeq);

            commentItem.find(".btn_edit").css("display", "block");
            commentItem.find(".btn_cancel").css("display", "none"); 
            commentItem.find(".comment_text").css("display", "block");
            commentItem.find(".comment_input").css("display", "none"); 
            commentItem.find(".submit_comment").css("display", "none"); 
            
            document.updateForm.action ="/style/detail";
    		document.updateForm.submit();
        });

        document.getElementById('file_upload').addEventListener('change', function(event) {
            const fileInput = event.target;
            const fileName = fileInput.files.length > 0 ? fileInput.files[0].name : '선택된 파일 없음';
            
            // 파일명을 #file_name 요소에 표시
            document.getElementById('file_name').textContent = fileName;
        });
	/*
        $("#insert").on("click",function(){
        	document.updateForm.action = "/style/updateProc";
        	document.updateForm.submit();
        	alert("수정이 완료되었습니다.")
        });
        */
        //수정 입력 등록시 
    	$("#insert").on("click",function(){	       
        
	 	   if($("#category").val() === ""){
	                 alert("게시판을 선택해주세요.");
	                 $("#category").focus();
	                 return;
	             }
	
	             if($.trim($("#title").val()).length === 0){
	                 alert("제목을 입력해주세요.");
	                 $("#title").val("");
	                 $("#title").focus();
	                 return;
	             }
	
	             if($.trim($("#content").val()).length === 0){
	                 alert("내용을 입력해주세요.");
	                 $("#content").val();
	                 $("#content").focus();
	                 return;
	             }
	 	        if($.trim($("#file_upload").val()).length === 0){
	 	        	alert("첨부파일을 추가해주세요.");
	 		        $("#file_upload").val();
	 		        $("#file_upload").focus();
	 		        return;
	     		}
	 	       document.updateForm.action = "/style/updateProc";
	 
		 	  var form = $("#updateForm")[0];
		 	  var formData = new FormData(form);
 	  
		 	  $.ajax({
		 		 type:"POST",
		 		 enctype:"multipart/form-data",
		 		 url:"/style/updateProc",
		 		 data:formData,
		 		 processData:false,
		 		 contentType:false,
		 		 cache:false,
		 		 beforeSend:function(xhr)
		 		 {
		 			xhr.setRequestHeader("AJAX","true"); 
		 		 },
		 		 success:function(response)
		 		 {
		 			if(response.code == 0)
		 			{
		 				document.updateForm.submit();
		 				alert("게시물 수정되었습니다.");
		 				document.updateForm.action ="/style/detail";	
		 				document.updateForm.curPage="1";
		 				document.updateForm.submit();
		 			}
		 			else if(response.code == 400)
		 			{
		 				alert("파라미터 값이 올바르지 않습니다.");
		 			}
		 			else if(response.code == 403)
		 			{
		 				alert("본인 글이 아니므로 수정할 수 없습니다.");
		 			}
		 			else if(response.code == 404)
		 			{
		 				alert("해당 게시물이 존재하지 않습니다.");
		 				location.href="/style/styleIndex";
		 			}
		 			else
		 			{
		 				alert("게시물 수정 중 오류가 발생했습니다.");
		 				
		 			}
		 		 },
		 		 error:function(xhr,status,error)
		 		 {
		 			icia.common.error(error);	
		 			alert("게시물 수정 중 오류가 발생했습니다.");
		 		 }
		 	  });
 	      });    
    	 
        $("#btnList").on("click", function() {
    		    document.bbsDetailForm.action ="/style/styleIndex";
    			document.bbsDetailForm.submit();
    	});
    	
    });
</script>
</head>
<body>
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
                    
                    <div class="category_select_wrapper">
                        <select id="category" class="category_select">
                            <option value="">선택하세요</option>
                            <option value="CMSY" <c:if test='${bbsSubCateCombinedId eq "CMSY"}'>selected</c:if>>Style</option>
                            <option value="CMFO"  <c:if test='${bbsSubCateCombinedId eq "CMFO"}'>selected</c:if>>FreeBoard</option>
                        </select>
                    </div>
 			<form name="updateForm" id="updateForm" method="post" enctype="multipart/form-data">  
                    <div data-v-e0f90538="" class="dropdown_head">
                       <input type="text" id="title" name="title" class="title_input" placeholder="${bbs.bbsTitle} 	">
                    </div>
                </div>
                <div data-v-e0f90538="" class="dropdown_content">
                    <textarea id="content" name="content" class="summernote" class="content_input" placeholder="">${bbs.bbsContent}</textarea>
                    <div class="file_upload_wrapper">
 						<label for="file_upload" class="file_upload_label">
                            첨부파일
                        </label>
                        <input type="file" name="file_upload" id="file_upload" class="file_upload_input" placeholder="파일을 선택하세요." multiple />
							
							<c:if test="${!empty bbs.bbsImg}">
								<c:forEach var="bbsImgList" items="${bbs.bbsImg}" varStatus="status">
							      <div style="margin-bottom:0.3em;">${bbsImgList.bbsImgOrgName}</div>
							    </c:forEach>
							</c:if> <!-- 선택된 파일명이 여기에 표시됨 -->
                    </div>
                </div>
               <div data-v-e0f90538="" class="btn_list">
                    <a data-v-7122e1e2="" data-v-e0f90538="" id = "insert"  class="btn outlinegrey medium"> 수정완료 </a>
                    <a data-v-7122e1e2="" data-v-e0f90538="" id = "cancel"  class="btn outlinegrey medium"> 취소 </a>                
                </div>
                
            </main>
        </div>
    </div>
     		<input type="hidden" name="curPage" id="curPage" value="${curPage}">
            
            <input type="hidden" name="searchType" value="${searchType}" />
      		<input type="hidden" name="searchValue" value="${searchValue}" />
            <input type="hidden" name="bbsSeq" id="bbsSeq" value="${bbs.bbsSeq}">
   </form>
</body>
</html>