<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>    
<!doctype html>
<html data-n-head-ssr lang="ko" data-n-head="%7B%22lang%22:%7B%22ssr%22:%22ko%22%7D%7D">

<head>
    <meta data-n-head="ssr" charset="utf-8">
    <meta data-n-head="ssr" data-hid="description" name="description" content="한정판을 거래하는 가장 확실한 방법">
    <meta data-n-head="ssr" data-hid="viewport" name="viewport"
        content="width=device-width, initial-scale=1.0, maximum-scale=1.0, minimum-scale=1.0, user-scalable=no, viewport-fit=cover">
    <meta data-n-head="ssr" name="apple-mobile-web-app-title" content="KREAM">
    <meta data-n-head="ssr" name="application-name" content="KREAM">
    <meta data-n-head="ssr" name="msapplication-TileColor" content="#111111">
    <meta data-n-head="ssr" name="theme-color" content="#ffffff">
    <meta data-n-head="ssr" name="msapplication-config" content="/browserconfig.xml">
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <style>

    @font-face {
      font-family: 'JejuGothic';
      src: url('./WEB-INF/views/resources/shop/fonts/JejuGothic.ttf') format('truetype');
    }

    body {
      font-family: 'JejuGothic', sans-serif;
    }
    
    /* 여기는 외곽선 */
    .lg[data-v-480ae706] .layout__main--without-search {
        min-height: calc(100vh - 340px);
    }

    .container[data-v-eef1de34] {
        background-color: #f4f4f4;
        padding: 20px 0;
    }

    style 특성 {
        --vh: 8.290000000000001px;
        --global-header-height: 44px;
    }

    input {
        text-rendering: auto;
        color: fieldtext;
        letter-spacing: normal;
        word-spacing: normal;
        line-height: normal;
        text-transform: none;
        text-indent: 0px;
        text-shadow: none;
        display: inline-block;
        text-align: start;
        appearance: auto;
        -webkit-rtl-ordering: logical;
        cursor: text;
        background-color: field;
        margin: 0em;
        padding: 1px 0px;
        border-width: 2px;
        border-style: inset;
        border-color: light-dark(rgb(118, 118, 118), rgb(133, 133, 133));
        border-image: initial;
        padding-block: 1px;
        padding-inline: 2px;
    }

    .blind, .u_skip {
        clip: rect(0, 0, 0, 0) !important;
        height: 1px !important;
        margin: -1px !important;
        overflow: hidden !important;
        position: absolute !important;
        width: 1px !important;
    }
    


    body, html {
        -ms-text-size-adjust: none;
        -moz-text-size-adjust: none;
        -webkit-text-size-adjust: none;
        -moz-osx-font-smoothing: grayscale;
        -webkit-font-smoothing: antialiased;
        -webkit-overflow-scrolling: touch;
        font-feature-settings: "frac" 0, "numr" 0;
        height: 100%;
        touch-action: manipulation;
        word-break: break-all;
    }

    style {
        --vh: 8.290000000000001px;
        --global-header-height: 86px;
    }
    .inner[data-v-eef1de34] {
        padding: 20px 16px 0;
    }

    .join-title[data-v-eef1de34] {
        color: #000;
        font-size: 32px;
        font-size: 30px;
        letter-spacing: -.48px;
        margin-bottom: 6px;
    }

    div {
        display: block;
        unicode-bidi: isolate;
    }

    .content[data-v-eef1de34] {
        background-color: #fff;
        border-radius: 10px;
        margin-left: auto;
        margin-right: auto;
        max-width: 480px;
    }
    
    .join-footer[data-v-eef1de34] {
        padding: 0 16px 20px;
    }

    footer {
        display: block;
        unicode-bidi: isolate;
    }
    /* 여기까지 footer */
    .solid.disabled[data-v-7122e1e2], .solid[data-v-7122e1e2]:disabled {
        background-color: rgba(34, 34, 34, .2);
        color: #fff;
        cursor: default;
        font-weight: 400;
    }

    .solid.disabled[data-v-7122e1e2], .solid[data-v-7122e1e2]:disabled {
        background-color: rgba(34, 34, 34, .2);
        color: #fff;
        cursor: default;
        font-weight: 400;
    }

    .full[data-v-7122e1e2] {
        font-size: 16px;
        font-weight: 700;
        height: 52px;
        letter-spacing: -.16px;
        width: 100%;
    }

    .btn[data-v-7122e1e2] {
        align-items: center;
        background-color: #fff;
        color: rgba(34, 34, 34, .8);
        cursor: pointer;
        display: inline-flex
    ;
        justify-content: center;
        text-align: center;
        vertical-align: middle;
    }

    a, a:active, a:focus, a:hover {
        -webkit-text-decoration: none;
        text-decoration: none;
    }
    .full[data-v-7122e1e2] {
        font-size: 16px;
        font-weight: 700;
        height: 52px;
        letter-spacing: -.16px;
        width: 100%;
    }

    .btn.btn_buy_exclusive[data-v-7122e1e2], .full[data-v-7122e1e2] {
        border-radius: 10px;
    }

    style 특성 {
        --vh: 8.290000000000001px;
        --global-header-height: 44px;
    }

    *, :after, :before {
        -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
        box-sizing: border-box;
    }

    /* 여기서부터 이메일 */
    .input-join[data-v-eef1de34] {
        padding-bottom: 18px !important;
    }

    .input_box[data-v-5f866f8a] {
        padding: 10px 0 14px;
        position: relative;
    }

    .input_txt[data-v-5f866f8a] {
        border-bottom: 1px solid #ebebeb;
        font-size: 15px;
        letter-spacing: -.15px;
        line-height: 22px;
        padding: 8px 0;
        width: 100%;
    }

    .input_title.ess[data-v-5f866f8a] {
        display: inline-block;
        padding-right: 6px;
        position: relative;
    }

    .input_title[data-v-5f866f8a] {
        font-size: 13px;
        letter-spacing: -.07px;
        line-height: 18px;
    }

    input, textarea {
        -webkit-appearance: none;
        background-color: transparent;
        border: 0;
        border-radius: 0;
        outline: 0;
        padding: 0;
        resize: none;
        font-family: 'JejuGothic';
    }
    
    input[type=password]::placeholder {
    	font-family: JejuGothic !important;
    }
    
    input[type=password] {
    	font-family: Arial !important;
    }

    body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
        margin: 0;
        padding: 0;
    }
    
    /* 여기는 비밀번호 */
    .has_button .input_txt[data-v-5f866f8a] {
        height: 38px;
        padding-right: 30px;
    }

    input[type="password" i] {
        -webkit-text-security: disc !important;
        padding-block: 1px;
        padding-inline: 2px;
    }
/*  
    .input_txt[data-v-5f866f8a] {
        border-bottom-color: #ef6253;
    }
*/
    .input_error[data-v-5f866f8a] {
        color: #f15746;
        display: none;
        font-size: 11px;
        line-height: 16px;
        position: absolute;

    }

    style 특성 {
        --vh: 8.290000000000001px;
        --global-header-height: 44px;
    }

    /* 동의 */
    .join-terms[data-v-eef1de34] {
        display: flex;
        flex-direction: column;
        gap: 8px;
        padding-bottom: 16px;
        padding-top: 16px;
    }

    .join-terms[data-v-eef1de34] {
        padding-bottom: 36px;
    }

    .join-terms__item--all[data-v-eef1de34] {
        margin-bottom: 6px;
    }

    .tnc-list-item--large .tnc-list-item__label[data-v-36e631ba] {
        font-size: 17px;
        font-weight: 600;
    }

    .tnc-list-item--large .tnc-list-item__description[data-v-36e631ba] {
        margin-top: 2px;
    }

    .tnc-list-item__description[data-v-36e631ba] {
        font-size: 13px;
        font-weight: 400;
        line-height: normal;
        margin-top: 4px;
    }

    .tnc-list-item__description[data-v-36e631ba], [disabled]~.tnc-list-item__label[data-v-36e631ba] {
        color: rgba(0, 0, 0, .44);
        color: var(--greyscale-dark-alpha-40-dark-50, rgba(0, 0, 0, .44));
    }

    .tnc-list-item__label[data-v-36e631ba] {
        color: #222;
        color: var(--greyscale-dark-90-dark, #222);
        font-size: 14px;
        font-weight: 400;
        line-height: normal;
        padding-left: 12px;
        padding-top: 2px;
    }

    .tnc-list-item[data-v-36e631ba] {
        display: flex;
        -webkit-user-select: none;
        -moz-user-select: none;
        user-select: none;
    }

    .tnc-list-item__checkbox[data-v-36e631ba] {
        display: flex;
    }

    </style>
</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

<script>
let formValidity = {
	    email: false,
	    password1: false,
	    password2: false,
	    name: false,
	    jumin: false,
	    gender: false,
	    tel: false
	};


    $(document).ready(function(){
    	
    	let debounceTimer;
    	
    	
        $("#id_btn").on("click", function () {
        
            $("#userEmail").val("");
        });

        $("#pw_btn1").on("click", function (event) {
            event.preventDefault(); // 폼 제출 방지

            let inputType = $("#userPwd1").attr("type"); // 비밀번호 입력 필드의 타입을 확인

            if (inputType === 'password') {
                // 비밀번호를 표시로 변경
                $("#userPwd1").css("font-family", "JejuGothic");
                $("#userPwd1").attr("type", "text");

                // 비밀번호 표시 상태일 때 새로운 SVG 아이콘으로 교체
                $("#pw_btn1").html('<svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20"><g fill="#222"><path d="M12.875 10.757a2.875 2.875 0 11-5.75 0 2.875 2.875 0 015.75 0z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10 17.257c6.269 0 9.166-5.231 9.166-6.5 0-1.27-2.897-6.5-9.166-6.5-6.27 0-9.167 5.23-9.167 6.5 0 1.269 2.898 6.5 9.167 6.5zm4.375-6.5a4.375 4.375 0 11-8.75 0 4.375 4.375 0 018.75 0z"></path></g></svg>');
            } else {
                // 비밀번호를 숨기는 상태로 변경
                $("#userPwd1").css("font-family", "Courier New");
                $("#userPwd1").attr("type", "password");

                // 비밀번호 숨김 상태일 때 기존 SVG 아이콘으로 교체
                $("#pw_btn1").html('<svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20"><g fill="#222"><path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z"></path><path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z"></path><path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z"></path></g></svg>');
            }
        });

        $("#pw_btn2").on("click", function (event) {
            event.preventDefault(); // 폼 제출 방지

            let inputType = $("#userPwd2").attr("type"); // 비밀번호 입력 필드의 타입을 확인

            if (inputType === 'password') {
                // 비밀번호를 표시로 변경
                $("#userPwd2").css("font-family", "JejuGothic");
                $("#userPwd2").attr("type", "text");

                // 비밀번호 표시 상태일 때 새로운 SVG 아이콘으로 교체
                $("#pw_btn2").html('<svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20"><g fill="#222"><path d="M12.875 10.757a2.875 2.875 0 11-5.75 0 2.875 2.875 0 015.75 0z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10 17.257c6.269 0 9.166-5.231 9.166-6.5 0-1.27-2.897-6.5-9.166-6.5-6.27 0-9.167 5.23-9.167 6.5 0 1.269 2.898 6.5 9.167 6.5zm4.375-6.5a4.375 4.375 0 11-8.75 0 4.375 4.375 0 018.75 0z"></path></g></svg>');
            } else {
                // 비밀번호를 숨기는 상태로 변경
                $("#userPwd2").css("font-family", "Courier New");
                $("#userPwd2").attr("type", "password");

                // 비밀번호 숨김 상태일 때 기존 SVG 아이콘으로 교체
                $("#pw_btn2").html('<svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20"><g fill="#222"><path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z"></path><path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z"></path><path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z"></path></g></svg>');
            }
        });
        
        $("#jm_btn").on("click", function (event) {
            event.preventDefault(); // 폼 제출 방지

            let inputType = $("#userJumin").attr("type"); // 비밀번호 입력 필드의 타입을 확인

            if (inputType === 'password') {
                // 비밀번호를 표시로 변경
                $("#userJumin").css("font-family", "JejuGothic");
                $("#userJumin").attr("type", "text");

                // 비밀번호 표시 상태일 때 새로운 SVG 아이콘으로 교체
                $("#jm_btn").html('<svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20"><g fill="#222"><path d="M12.875 10.757a2.875 2.875 0 11-5.75 0 2.875 2.875 0 015.75 0z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10 17.257c6.269 0 9.166-5.231 9.166-6.5 0-1.27-2.897-6.5-9.166-6.5-6.27 0-9.167 5.23-9.167 6.5 0 1.269 2.898 6.5 9.167 6.5zm4.375-6.5a4.375 4.375 0 11-8.75 0 4.375 4.375 0 018.75 0z"></path></g></svg>');
            } else {
                // 비밀번호를 숨기는 상태로 변경
                $("#userJumin").css("font-family", "Courier New");
                $("#userJumin").attr("type", "password");

                // 비밀번호 숨김 상태일 때 기존 SVG 아이콘으로 교체
                $("#jm_btn").html('<svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20"><g fill="#222"><path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z"></path><path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z"></path><path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z"></path></g></svg>');
            }
        });
        
        

        $("#name_btn").on("click", function () {
            $("#userName").val("");
        });
        
        //체크박스
        $("#checkbox").on("change", function () {
            let checkboxChecked = $(this).prop("checked");

            if (checkboxChecked) {
                // 체크박스가 체크된 경우 아이콘 변경
                $("#checkboxIcon").html('<svg data-v-36e631ba="" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.915 4.483a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1h-16.8a1 1 0 01-1-1v-16.8zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="#222"></path></svg>');
            } else {
                // 체크박스가 체크되지 않은 경우 다른 아이콘으로 변경
                $("#checkboxIcon").html('<svg data-v-36e631ba="" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon"><path fill-rule="evenodd" clip-rule="evenodd" d="M2.915 4.483a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1h-16.8a1 1 0 01-1-1v-16.8z" fill="#222"></path></svg>');
            }
        });


        // DOM 요소를 변수에 저장
        const allCheck = document.getElementById('allCheck');
        const childCheck = document.getElementById('childCheck');
        const checkIcon = document.getElementById('checkIcon');
        const chCheckIcon = document.getElementById('chCheckIcon'); // Define this variable

        // 'allCheck' 체크 상태 변화 감지
        allCheck.addEventListener('change', function() {
            // 'allCheck'가 체크된 경우에만 SVG 아이콘 변경
            if (allCheck.checked) {
                checkIcon.innerHTML = `
                <svg data-v-36e631ba="" viewBox="0 0 25 25" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M2.915 4.483a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1h-16.8a1 1 0 01-1-1v-16.8zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="#222"></path>
                </svg>
                `;
                // 'allCheck'가 체크되면 'childCheck'도 체크되도록 설정
                childCheck.checked = true;  // childCheck를 체크 상태로 만듬

                chCheckIcon.innerHTML = `
                    <svg viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon" data-v-36e631ba="">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19.147 5.448L7.785 16.81l-5.448-5.448 1.06-1.06 4.388 4.387L18.086 4.388l1.06 1.06z" fill="#000"></path>
                    </svg>
                `;

            } else {
                // 'allCheck'가 체크 해제된 경우 기본 아이콘으로 되돌리기
                checkIcon.innerHTML = `
                <svg id="checkIcon" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon" data-v-36e631ba>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 4.483a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1v-16.8zm1.5 16.3v-15.8h15.8v15.8H4.1z" fill="#000" fill-opacity=".17"></path>
                </svg>
                `;

                // 'allCheck'가 체크 해제되면 'childCheck'도 체크 해제되도록 설정
                childCheck.checked = false;  // childCheck를 체크 해제 상태로 만듬

                // 'childCheck' 상태에 맞게 아이콘 변경
                chCheckIcon.innerHTML = `
                    <svg id="chCheckIcon" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" opacity="0.17" class="tnc-list-item__icon" data-v-36e631ba>
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19.147 5.448L7.785 16.81l-5.448-5.448 1.06-1.06 4.388 4.387L18.086 4.388l1.06 1.06z" fill="#ccc" ></path>
                    </svg>
                `;
            }
        });

        childCheck.addEventListener('change', function() {
            if (childCheck.checked) {
                chCheckIcon.innerHTML = `
                    <svg viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon" data-v-36e631ba="">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19.147 5.448L7.785 16.81l-5.448-5.448 1.06-1.06 4.388 4.387L18.086 4.388l1.06 1.06z" fill="#000"></path>
                    </svg>
                `;
            } else {
                chCheckIcon.innerHTML = `
                    <svg id="chCheckIcon" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" opacity="0.17" class="tnc-list-item__icon" data-v-36e631ba="">
                        <path fill-rule="evenodd" clip-rule="evenodd" d="M19.147 5.448L7.785 16.81l-5.448-5.448 1.06-1.06 4.388 4.387L18.086 4.388l1.06 1.06z" fill="#ccc" ></path>
                    </svg>
                `;
            }
        });

        //이메일 유효성 검사
        $("input[type=email]").on("input", function () {
        	clearTimeout(debounceTimer);
        	
        	let email = $.trim($(this).val());
            let errorMessage = $(this).closest(".input_item").siblings(".input_error");

            debounceTimer = setTimeout(function(){
            	// 이메일이 비어 있으면 오류 메시지 숨기기
                if (email.length === 0) 
                {
                    errorMessage.css("display", "block");
                    return;
                } 
                
                if(!fn_validateEmail(email))
                {
                	errorMessage.css("display", "block");
                	return;
                }
                else 
                {
                    errorMessage.css("display", "none");
                    
                    $.ajax({
                    	type:"post",
                    	url:"/user/idCheck",
                    	data: {
                    		userEmail:email
                    	},
                    	dataType:"json",
                    	success:function(data)
                    	{
                    		if(data.flag == 0)
                    		{
                    			errorMessage.text("사용 가능한 이메일입니다.").css({"color": "green","display": "block"});
                    			formValidity.email=true;
                    		}
                    		else if(data.flag == 1)
                    		{
                    			errorMessage.text("중복 이메일입니다").css({"color": "red","display": "block"});
                    			formValidity.email=false;
                    		}
                    		else
                    		{
                    			errorMessage.text("이메일을 확인해주세요").css({"color": "red","display": "block"});
                    			formValidity.email=false;
                    		}
                    		checkFormValidity();
                    	}
                    });
                    return;
                }
                checkFormValidity();
            },500); 
        });

        // 비밀번호 입력 시 유효성 검사
        $("#userPwd1").on("input", function () {
            let password = $.trim($(this).val());
            let errorMessage = $(this).closest(".input_item").siblings(".input_error");

            // 비밀번호 유효성 검사
            if (password.length === 0 || !fn_validatePwd(password)) {
                errorMessage.css("display", "block");
                formValidity.password1=false;
            } else {
             errorMessage.css("display", "none");
             	formValidity.password1=true;
            }
			
            $("#userPwd2").trigger("input");
            checkFormValidity();
            
        })

        $("#userPwd2").on("input", function () {
            let password1 = $.trim($("#userPwd1").val());  // 첫 번째 비밀번호
            let password2 = $.trim($("#userPwd2").val());  // 두 번째 비밀번호
            let errorMessage = $(this).closest(".input_item").siblings(".input_error");  // 오류 메시지 요소 찾기

            // 오류 메시지가 제대로 선택되었는지 확인
            if (errorMessage.length === 0) {
                console.log("Error message element not found!");
            }

            // 두 비밀번호가 일치하지 않으면 오류 메시지 표시
            if (password1 !== password2) {
                console.log("Passwords do not match.");  // 디버깅을 위한 로그
                errorMessage.css("display", "block");
                formValidity.password2=false;
            } else {
                console.log("Passwords match.");  // 디버깅을 위한 로그
                errorMessage.css("display", "none");
                formValidity.password2=true;
            }
            checkFormValidity();
        });

        $("#userName").on("input", function() {
            let userName = $.trim($("#userName").val());  // .val() 호출
            let errorMessage = $(this).closest(".input_item").siblings(".input_error");

            if (userName.length === 0 || !fn_validateName(userName)) {
                errorMessage.css("display", "block");  // 오류 메시지 표시
                formValidity.name=false;
            } else {
                errorMessage.css("display", "none");  // 오류 메시지 숨기기
                formValidity.name=true;
            }
            checkFormValidity();
        });
        
         $("#userJumin").on("input", function() {
            let userJumin = $.trim($("#userJumin").val());  // .val() 호출
            let errorMessage = $(this).closest(".input_item").siblings(".input_error");

            if (userJumin.length === 0 || !fn_validateJumin(userJumin)) {
                errorMessage.css("display", "block");  // 오류 메시지 표시
                formValidity.jumin=false;
            } else {
                errorMessage.css("display", "none");  // 오류 메시지 숨기기
                formValidity.jumin=true;
            }
            checkFormValidity();
        });
         
         $("#userTel").on("input", function() {
             let userTel = $.trim($("#userTel").val());  // .val() 호출
             let errorMessage = $(this).closest(".input_item").siblings(".input_error");

             if (userTel.length === 0 || !fn_validateTel(userTel)) {
                 errorMessage.css("display", "block");  // 오류 메시지 표시
                 formValidity.tel=false;
             } else {
                 errorMessage.css("display", "none");  // 오류 메시지 숨기기
                 formValidity.tel=true;
             }
             checkFormValidity();
         });
         
         $('input[name="gender"]').on("change", function() {
             let selectedGender = $('input[name="gender"]:checked').val();
             if(selectedGender){
                 formValidity.gender = true;
             } else {
                 formValidity.gender = false;
             }
             checkFormValidity();
         });
         
         checkFormValidity();
        
        $("#regbtn").on("click", function(){
        	
        	var selectedGender = $('input[name="gender"]:checked').val();
        	
        	$.ajax({
        		
        		type:"post",
            	url:"/user/regProc",
            	data: {
            		userEmail: $("#userEmail").val(),
            		userPwd: $("#userPwd2").val(),
            		userName: $("#userName").val(),
            		userJumin: $("#userJumin").val(),
            		userGender: selectedGender,
            		userTel: $("#userTel").val()
            	},
            	dataType: "json",
            	success: function(response)
            	{
            		if(response.code == 0)
            		{
            			Swal.fire({
                		    title: '성공',
                		    text: '회원가입 성공',
                		    icon: 'success',
                		});
            			location.href="/index";
            		}
            		else if(response.code == 400)
            		{
            			Swal.fire({
                		    title: '실패',
                		    text: '클라이언트 오류',
                		    icon: 'error',
                		});
            		}
            		else if(response.code == 100)
            		{
            			Swal.fire({
                		    title: '실패',
                		    text: '중복 이메일입니다.',
                		    icon: 'error',
                		});
            		}
            		else if(response.code == 500)
            		{
            			Swal.fire({
                		    title: '실패',
                		    text: '회원가입 오류',
                		    icon: 'error',
                		});            			
            		}
            		else
            		{
            			Swal.fire({
                		    title: '실패',
                		    text: '회원가입 오류',
                		    icon: 'error',
                		});            			
            		}
            	}
        	});
        	
        });
        
    })
    
    // 이메일 정규식
    function fn_validateEmail(value) {
        let emailReg = /^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$/;
        return emailReg.test(value);
    }

     // 영문, 숫자, 특수문자를 포함하고 8자 이상 16자 이하로 입력하는 정규식
    function fn_validatePwd(value) {
        let pwdReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;
        return pwdReg.test(value);
    }

    //이름 정규표현식
    function fn_validateName(value){
        let nameReg = /^[가-힣]{2,4}$/;
        return nameReg.test(value)
    }
    
    function fn_validateJumin(value)
    {
    	let juminReg = /^\d{2}([0]\d|[1][0-2])([0][1-9]|[1-2]\d|[3][0-1])[-]*[1-4]\d{6}$/;
    	return juminReg.test(value)
    }
    
    function fn_validateTel(value){
        let telReg = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/;
        return telReg.test(value);
    }
    
    //입력값이 유효한지 확인
    function checkFormValidity() {
        const isValid = Object.values(formValidity).every(Boolean);
        $("#regbtn").prop("disabled", false);
    } 

</script>

<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
    <div data-server-rendered="true" id="__nuxt"><!---->
        <div id="__layout">
            <div id="wrap" tabindex="0" class="layout_base sm wrap win_os sm" data-v-480ae706 data-v-4f6329ba style="background-color: #f4f4f4;"><!---->
                <div class="container layout__main--without-search" data-v-eef1de34 data-v-4f6329ba>
                    <div class="content" data-v-eef1de34>
                        <div class="inner" data-v-eef1de34>
                            <h2 class="join-title" data-v-eef1de34>회원가입</h2>
                            <div class="input-join input_box" data-v-5f866f8a data-v-eef1de34>
                                <h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>이메일 주소</h3>
                                <div class="input_item" data-v-5f866f8a>
                                    <input type="email" id="userEmail" placeholder="예) kream@kream.co.kr" autocomplete="off" value="" class="input_txt text_fill" data-v-5f866f8a>
                                    <button data-v-7122e1e2="" id ="id_btn" data-v-5f866f8a="" type="button" class="btn" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;">
                                        <svg data-v-5f866f8a="" viewBox="0 0 20 21"
                                            fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                d="M18.333 10.757a8.333 8.333 0 11-16.667 0 8.333 8.333 0 0116.667 0z" fill="#D3D3D3"></path>
                                            <path
                                                d="M6.129 7.828l2.928 2.929-2.929 2.928.943.943 2.93-2.928 2.928 2.928.943-.943-2.93-2.928 2.93-2.929-.943-.943L10 9.814 7.071 6.885l-.942.943z"
                                                fill="#fff"></path>
                                        </svg>
                                    </button>   
                                </div>
                                <p class="input_error" data-v-5f866f8a data-v-eef1de34>이메일 주소를 정확히 입력해주세요.</p>
                            </div><!---->
                            <div class="input_box input-join has_button eye_on" data-v-5f866f8a data-v-eef1de34>
                                <h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>비밀번호</h3>
                                <div class="input_item" data-v-5f866f8a>
                                    <input type="password" id="userPwd1" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="new-password" value="" class="input_txt text_fill" data-v-5f866f8a><!---->
                                    <button data-v-7122e1e2="" id = "pw_btn1" data-v-5f866f8a="" type="button" class="btn" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;">
                                        <svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                                            <g fill="#222">
                                                <path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z">
                                                </path>
                                                <path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z">
                                                </path>
                                                <path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z">
                                                </path>
                                            </g>
                                        </svg>
                                    </button>
                                </div>  
                                <p class="input_error" data-v-5f866f8a data-v-eef1de34>영문, 숫자, 특수문자를 조합하여 입력해주세요.</p>
                            </div>
                            <div class="input_box input-join has_button eye_on" data-v-5f866f8a data-v-eef1de34>
                                <h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>비밀번호 확인</h3>
                                <div class="input_item" data-v-5f866f8a>
                                    <input type="password" id="userPwd2" placeholder="영문, 숫자, 특수문자 조합 8-16자" autocomplete="new-password" value="" class="input_txt text_fill" data-v-5f866f8a><!---->
                                    <button data-v-7122e1e2="" id = "pw_btn2" data-v-5f866f8a="" type="button" class="btn"style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;">
                                        <svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                                            <g fill="#222">
                                                <path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z">
                                                </path>
                                                <path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z">
                                                </path>
                                                <path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z">
                                                </path>
                                            </g>
                                        </svg>
                                    </button>
                                </div>
                                <p class="input_error" data-v-5f866f8a data-v-eef1de34>비밀번호가 일치하지 않습니다.</p>
                            </div>
                            <div class="input_box input-join has_button eye_on" data-v-5f866f8a data-v-eef1de34>
                                <h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>이름</h3>
                                <div class="input_item" data-v-5f866f8a>
                                    <input type="text" id="userName" placeholder="한글" autocomplete="new-password" value="" class="input_txt text_fill" data-v-5f866f8a><!---->
                                    <button data-v-7122e1e2="" id = "name_btn" data-v-5f866f8a="" type="button" class="btn"style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;">
                                        <svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M18.333 10.757a8.333 8.333 0 11-16.667 0 8.333 8.333 0 0116.667 0z" fill="#D3D3D3"></path>
                                            <path d="M6.129 7.828l2.928 2.929-2.929 2.928.943.943 2.93-2.928 2.928 2.928.943-.943-2.93-2.928 2.93-2.929-.943-.943L10 9.814 7.071 6.885l-.942.943z"fill="#fff"></path>
                                        </svg>
                                    </button>
                                </div>
                                <p class="input_error" data-v-5f866f8a data-v-eef1de34>이름의 형식이 올바르지 않습니다.</p>
                            </div>
                            <div class="input_box input-join has_button eye_on" data-v-5f866f8a data-v-eef1de34>
                                <h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>주민등록번호</h3>
                                	<div class="input_item" data-v-5f866f8a>
                                		<input type="password" id="userJumin" placeholder="주민등록번호 13자리를 - 없이 입력하세요" autocomplete="new-password" value=""class="input_txt text_fill" data-v-5f866f8a><!---->
											<button data-v-7122e1e2="" id = "jm_btn" data-v-5f866f8a="" type="button" class="btn"style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;">
		                                        <svg data-v-5f866f8a="" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
		                                            <g fill="#222">
		                                                <path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z">
		                                                </path>
		                                                <path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z">
		                                                </path>
		                                                <path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z">
		                                                </path>
		                                            </g>
		                                        </svg>
                                    		</button>
                                	</div>
                                <p class="input_error" data-v-5f866f8a data-v-eef1de34>주민등록변호 양식을 지켜주세요</p>
                            </div>
                            
                            <div class="input_box input-join has_button eye_on" data-v-5f866f8a data-v-eef1de34>
                                <h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>성별</h3>
                                <div class="input_item" style="display: flex;" data-v-5f866f8a>
                                	<div class="form-check form-check-inline d-flex align-items-center">
									  <input class="form-check-input" type="radio" name="gender" id="male" value="M">
									  <label class="form-check-label" for="male">남성</label>
									</div>
									<div class="form-check form-check-inline d-flex align-items-center">
									  <input class="form-check-input" type="radio" name="gender" id="female" value="F" >
									  <label class="form-check-label" for="female">여성</label>
									</div>
                                </div>
                            </div>
                            <div class="input_box input-join has_button eye_on" data-v-5f866f8a data-v-eef1de34>
                            	<h3 class="input_title ess" data-v-5f866f8a data-v-eef1de34>전화번호</h3>
                            	<div class="input_item" style="display: flex;" data-v-5f866f8a>
                            	<input type="text" id="userTel" placeholder="전화번호를 입력하세요" autocomplete="new-password" value=""class="input_txt text_fill" data-v-5f866f8a><!---->
                            	</div>
                            	<p class="input_error" data-v-5f866f8a data-v-eef1de34>전화번호 양식에 맞게 입력하세요.</p>
                            </div>
                            <div class="join-terms" data-v-eef1de34>
                                <div class="tnc-list-item join-terms__item--all tnc-list-item--large" data-v-36e631b adata-v-eef1de34>
                                    <label class="tnc-list-item__checkbox" data-v-36e631ba>
                                        <input type="checkbox" id="allCheck" class="blind" data-v-36e631ba>
                                        <svg id="checkIcon" viewBox="0 0 24 25" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24" class="tnc-list-item__icon" data-v-36e631ba>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 4.483a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1v-16.8zm1.5 16.3v-15.8h15.8v15.8H4.1z" fill="#000" fill-opacity=".17"></path>
                                        </svg>
                                        <span class="tnc-list-item__label" data-v-36e631ba> 모두 동의합니다 <p class="tnc-list-item__description" data-v-36e631ba>선택 동의 항목 포함</p>
                                        </span>
                                    </label>
                                </div>
                                <div class="tnc-list-item join-terms__item tnc-list-item--small" data-v-36e631b adata-v-eef1de34>
                                    <label class="tnc-list-item__checkbox" data-v-36e631ba>
                                        <input type="checkbox" id ="childCheck"class="blind" data-v-36e631ba>
                                        <svg id="chCheckIcon" viewBox="0 0 21 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                            opacity="0.17" class="tnc-list-item__icon" data-v-36e631ba>
                                            <path fill-rule="evenodd" clip-rule="evenodd" d="M19.147 5.448L7.785 16.81l-5.448-5.448 1.06-1.06 4.388 4.387L18.086 4.388l1.06 1.06z" fill="#ccc" ></path>
                                        </svg>
                                        <span class="tnc-list-item__label" data-v-36e631ba> [필수] 만 14세 이상입니다</span>
                                    </label>
                                </div>
                            </div>
                        </div>
                        <footer class="join-footer" data-v-eef1de34>
                            <button id="regbtn" class="btn btn-join full solid border" 
                            data-v-7122e1e2 data-v-7122e1e2 data-v-eef1de34> 본인 인증하고 가입하기 </button>
                        </footer>
                    </div>     
                </div>
            </div>
        </div>          
    </div>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>              
</body>

</html>