<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Runfluence</title>
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
  <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
  <style>
    /* 폰트 설정 */
    @font-face {
      font-family: 'JejuGothic';
      src: url('./JejuGothic.ttf') format('truetype');
    }

    /* 기본 스타일 */
    body {
      font-family: 'JejuGothic', sans-serif;
    }

    input,
    textarea {
      -webkit-appearance: none;
      appearance: none;
      background-color: transparent;
      border: 0;
      border-radius: 0;
      outline: 0;
      padding: 0;
      resize: none;
      font-family: inherit;
      font-size: inherit;
      color: inherit;
      width: 100%;
    }

    input:focus,
    textarea:focus {
      outline: none;
      border-bottom: 2px solid #000000;
    }

    input::placeholder {
      font-family: 'JejuGothic'
    }

    /* 에러 메시지 */
    .error-message {
      color: #dc3545;
      font-size: 0.875rem;
    }

    .input_box {
      padding: 10px 0 14px;
      position: relative;
    }

    .input_title {
      font-weight: bold;
      margin-bottom: 5px;
      font-size: 13px;
    }

    .input_item {
      position: relative;
    }

    .input_txt {
      border-bottom: 1px solid #ebebeb;
      font-size: 15px;
      letter-spacing: -.15px;
      line-height: 22px;
      padding: 8px 0;
    }

    .input_error {
      display: none;
      color: red;
      font-size: 11px;
      line-height: 16px;
      position: absolute;
    }

    input .login-btn-box {
      padding-top: 20px;
    }

    .look-box {
      display: flex;
      justify-content: center;
      align-items: center;
      margin-top: 20px;
      font-size: 13px;
      padding-left: 0;
      list-style-type: none;
    }

    .look-box li {
      position: relative;
      padding: 0;
    }

    .look-box li:not(:last-child)::after {
      content: "|";
      margin-left: 16px;
      color: #212529;
    }

    .look-link {
      color: #212529;
      text-decoration: none;
    }

    .look-link:hover {
      text-decoration: underline;
    }

    /* 소셜 로그인 버튼 */
    .social-login button {
      margin-bottom: 10px;
      border: 1px solid #d3d3d3;
      width: 100%;
      position: relative;
    }

    .social-login button:hover {
      background-color: #c2c2c2;
    }

    .social-login .btn {
      font-weight: 700;
      height: 50px;
      border-radius: 10px;
      font-size: 16px;
    }

    .login-title::before {
      background: url('https://i.imgur.com/53pxOeT.png') no-repeat center center;
      background-size: auto;
      content: "";
      display: inline-block;
      height: 60px;
      width: 250px;
    }

    .login-btn-box button:disabled {
      cursor: not-allowed;
    }

    .login-btn-box button.active {
      cursor: pointer;
    }

    .logo-social {
      height: 24px;
      width: 24px;
    }

    /* 데스크탑 및 모바일 화면에서 top 아이템 스타일 */
    .header-top .top_item.has_new:after {
      background: #ef6253;
      border-radius: 50%;
      content: "";
      height: 5px;
      position: absolute;
      right: -7px;
      top: 0;
      width: 5px;
    }

    .header-mobile {
      display: none;
    }

    @media (max-width: 768px) {
      .header-mobile {
        display: block;
        position: fixed;
        top: 0;
        left: 0;
        width: 100%;
        z-index: 999;
      }

      .header-mobile.sticky {
        position: sticky;
        top: 0;
        z-index: 3;
      }

      .header-top {
        display: none !important;
      }

      .header-main {
        padding: 0 !important;
      }

      .header-main .main_inner {
        display: none !important
      }
    }
  </style>
  
  <script>
    $(document).ready(function () {
      // 이메일 입력 시 유효성 검사
      $("input[type=email]").on("input", function () {
        let email = $.trim($(this).val());
        let errorMessage = $(this).closest(".input_item").siblings(".input_error");

        // 이메일 유효성 검사
        if (email.length === 0 || !fn_validateEmail(email)) {
          errorMessage.css("display", "block");
        } else {
          errorMessage.css("display", "none");
        }

        // 이메일과 비밀번호 모두 유효할 때 로그인 버튼 활성화
        let password = $.trim($("input[type=password]").val());
        if (fn_validateEmail(email) && fn_validatePwd(password)) {
          $(".login-btn-box button").prop("disabled", false).removeClass("btn-secondary").addClass("btn-dark");
        } else {
          $(".login-btn-box button").prop("disabled", true).removeClass("btn-dark").addClass("btn-secondary");
        }
      });

      // 비밀번호 입력 시 유효성 검사
      $("input[type=password]").on("input", function () {
        let password = $.trim($(this).val());
        let errorMessage = $(this).closest(".input_item").siblings(".input_error");

        // 비밀번호 유효성 검사
        if (password.length === 0 || !fn_validatePwd(password)) {
          errorMessage.css("display", "block");
        } else {
          errorMessage.css("display", "none");
        }

        // 이메일과 비밀번호 모두 유효할 때 로그인 버튼 활성화
        let email = $.trim($("input[type=email]").val());
        if (fn_validateEmail(email) && fn_validatePwd(password)) {
          $(".login-btn-box button").prop("disabled", false).removeClass("btn-secondary").addClass("btn-dark");
        } else {
          $(".login-btn-box button").prop("disabled", true).removeClass("btn-dark").addClass("btn-secondary");
        }
      });

      $("#toggle-btn").on("click", function () {
        event.preventDefault(); // 폼 제출 방지
        let inputType = $("#userPwd").attr("type");

        if (inputType === 'password') {
          $("#userPwd").css("font-family", "JejuGothic");
          $("#userPwd").attr("type", "text");
          $("#toggle").html('<g fill="#222"><path d="M12.875 10.757a2.875 2.875 0 11-5.75 0 2.875 2.875 0 015.75 0z"></path><path fill-rule="evenodd" clip-rule="evenodd" d="M10 17.257c6.269 0 9.166-5.231 9.166-6.5 0-1.27-2.897-6.5-9.166-6.5-6.27 0-9.167 5.23-9.167 6.5 0 1.269 2.898 6.5 9.167 6.5zm4.375-6.5a4.375 4.375 0 11-8.75 0 4.375 4.375 0 018.75 0z"></path> </g>');

        } else {
          $("#userPwd").css("font-family", "Courier New");
          $("#userPwd").attr("type", "password");
          $("#toggle").html('<g fill="#222"><path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z"></path><path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z"></path><path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z"></path></g>');
        }
      });

      $("#cancel-btn").on("click", function () {
        event.preventDefault(); // 폼 제출 방지
        $("#userEmail").val("");
      });
      
      $("#loginForm").on("submit",function(){
    	  event.preventDefault();
    	  fn_login();
      });
      
      $("#loginForm").on('keypress', function(e){
    	  if(e.keyCode == '13') {
    		  event.preventDefault();
        	  fn_login();
    	  }
      });
      
    });
      
	function fn_login() {
		if ($.trim($("#userEmail").val()).length <= 0) {
			Swal.fire({
    		    title: '실패',
    		    text: '이메일을 입력하세요',
    		    icon: 'error',
    		});
			$("#userEmail").val("");
			$("#userEmail").focus();
			return;
		}
		
		if ($.trim($("#userPwd").val()).length <= 0) {
			Swal.fire({
    		    title: '실패',
    		    text: '비밀번호를 입력하세요',
    		    icon: 'error',
    		});
			$("#userPwd").val("");
			$("#userPwd").focus();
			return;
		}
		
		$.ajax({
			type:"post",
			url:"/user/loginProc",
			data: {
				userEmail: $("#userEmail").val(),
				userPwd: $("#userPwd").val()
			},
			dataType: "json",
			beforeSend: function(xhr){
				xhr.setRequestHeader("AJAX","true")
			},
			success: function(response){
				if(!icia.common.isEmpty(response)) {
					
					icia.common.log(response);
					
					var code = icia.common.objectValue(response,"code",-500);
					
					if(code == 0)
					{
						Swal.fire({
			    		    title: '성공',
			    		    text: '로그인 성공',
			    		    icon: 'success',
			    		}).then(result => {
			    			location.href="/index"
			    		});
						
					}
					else
					{
						if(code == -1)
						{
							Swal.fire({
				    		    title: '실패',
				    		    text: '비밀번호가 올바르지 않습니다',
				    		    icon: 'error',
				    		});
							$("#userPwd").focus();
						}
						
						else if(code == -99)
						{
							Swal.fire({
				    		    title: '실패',
				    		    text: '비밀번호가 올바르지 않습니다',
				    		    icon: 'error',
				    		});
							$("#userEmail").focus();
						}
						
						else if(code == 404)
						{
							Swal.fire({
				    		    title: '실패',
				    		    text: '아이디가 존재하지 않습니다',
				    		    icon: 'error',
				    		});
							$("#userEmail").focus();
						}
						
						else if(code == 400)
						{
							Swal.fire({
				    		    title: '실패',
				    		    text: '파라미터 값이 올바르지 않습니다',
				    		    icon: 'error',
				    		});
							$("#userEmail").focus();
						}
						
						else
						{
							Swal.fire({
				    		    title: '실패',
				    		    text: '로그인 오류가 발생하였습니다',
				    		    icon: 'error',
				    		});
							$("#userEmail").focus();
						}
					}
				}
				else
				{
					Swal.fire({
		    		    title: '실패',
		    		    text: '로그인 오류가 발생하였습니다',
		    		    icon: 'error',
		    		});
					$("#userEmail").focus();
				}
			}
			
		});
	}

    // 이메일 정규식
    function fn_validateEmail(value) {
      let emailReg = /^([\w-\.]+@([\w-]+\.)+[\w-]{2,4})?$/;
      return emailReg.test(value);
    }

    // 영문, 숫자, 특수문자를 포함하고 8자 이상 16자 이하로 입력하는 정규식
    function fn_validatePwd(value) {
      let pwdReg = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/;
      return pwdReg.test(value);
    }
  </script>
</head>

<body class="bg-light text-dark">
  <!-- 헤더 시작 -->
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
<div style="background:#f4f4f4">
  <div class="container layout__main--without-search" style="display: flex; justify-content: center; align-items: center; min-height: calc(100vh - 94px); padding: 0;">
    <div class="content" style="margin-left: auto; margin-right: auto; max-width: 1280px;">
      <form id="loginForm" class="login-area" style="background-color: #ffffff; border-radius: 10px; margin: 0 auto; padding: 60px 30px; width: 600px; box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.1);">
        <h2 class="login-title text-center" style="font-size: 14px; padding-bottom: 50px;"></h2>

        <div class="input_box">
          <h3 class="input_title">이메일 주소</h3>
          <div class="input_item">
            <input id="userEmail" type="email" placeholder="예) test@gmail.com" tabindex="1" autocomplete="off" class="input_txt text_fill" style="height: 38px; padding-right: 30px;">
            <button id="cancel-btn" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;">
              <svg viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20" aria-label="이메일 주소 검증">
                <path fill-rule="evenodd" clip-rule="evenodd"d="M18.333 10.757a8.333 8.333 0 11-16.667 0 8.333 8.333 0 0116.667 0z" fill="#D3D3D3"></path>
                <path d="M6.129 7.828l2.928 2.929-2.929 2.928.943.943 2.93-2.928 2.928 2.928.943-.943-2.93-2.928 2.93-2.929-.943-.943L10 9.814 7.071 6.885l-.942.943z" fill="#fff"></path>
              </svg>
            </button>
          </div>
          <p class="input_error">이메일 주소를 정확히 입력해주세요.</p>
        </div>
        <div class="input_box">
          <h3 class="input_title">비밀번호</h3>
          <div class="input_item position-relative">
            <input id="userPwd" type="password" placeholder="비밀번호" tabindex="2" class="input_txt text_fill" style="height: 38px; padding-right: 30px; font-family: 'Courier New';">
            <button id="toggle-btn" type="button" style="position: absolute; right: 10px; top: 50%; transform: translateY(-50%); background: none; border: none; padding: 0;" aria-label="비밀번호 보기">
              <svg id="toggle" viewBox="0 0 20 21" fill="none" xmlns="http://www.w3.org/2000/svg" width="20" height="20">
                <g fill="#222">
					<path d="M19.167 10.757c0 .608-.665 2.125-2.047 3.54l-2.967-2.16a4.375 4.375 0 00-6.74-4.908L5.071 5.523c1.32-.749 2.958-1.266 4.93-1.266 6.268 0 9.166 5.231 9.166 6.5z"></path>
					<path d="M12.875 10.757c0 .145-.01.287-.031.426L8.722 8.181a2.875 2.875 0 014.154 2.576zM10.488 13.591l-3.334-2.428a2.876 2.876 0 003.334 2.428z"></path>
					<path d="M5.625 10.757c0-.228.018-.451.051-.67l-3.253-2.37C1.35 8.977.833 10.222.833 10.758c0 1.27 2.898 6.5 9.167 6.5 1.65 0 3.067-.362 4.259-.92l-2.294-1.67a4.375 4.375 0 01-6.34-3.91zM1.966 6.096l15.333 11.167.736-1.01L2.7 5.085l-.736 1.01z"></path>
				</g>
              </svg>
            </button>
          </div>
          <p class="input_error">영문, 숫자, 특수문자를 조합해서 입력해주세요. (8-16자)</p>
        </div>

        <div class="login-btn-box" style="padding-top: 20px;">
          <button type="submit" class="btn btn-dark w-100 py-2" style="border-radius: 0.375rem" disabled>로그인</button>
        </div>

        <ul class="look-box d-flex gap-3">
          <li><a href="/user/regForm" class="look-link">이메일 가입</a></li>
          <li><a href="/user/idFind" class="look-link">이메일 찾기</a></li>
          <li><a href="/user/pwdFind" class="look-link">비밀번호 찾기</a></li>
        </ul>

        <div class="social-login mt-4">
          <button class="btn btn_login_naver mb-2 w-100 d-flex align-items-center justify-content-center">
            <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="logo-social me-3">
              <path d="M14.856 12.56L8.92 4H4v16h5.157v-8.56L15.081 20H20V4h-5.144v8.56z" fill="#5AC451" />
            </svg>
            <span>네이버 로그인</span>
          </button>
          <button class="btn btn_login_apple w-100 d-flex align-items-center justify-content-center">
            <svg viewBox="0 0 24 24" fill="none" xmlns="http://www.w3.org/2000/svg" class="logo-social me-3">
              <path d="M12,2.772c-5.523,0-10,3.53-10,7.885,0,2.815,1.872,5.285,4.687,6.68-.153.528-.984,3.4-1.017,3.624,0,0-.02.169.09.234A.3.3,0,0,0,6,21.209c.315-.043,3.649-2.385,4.226-2.792A12.608,12.608,0,0,0,12,18.541c5.523,0,10-3.53,10-7.884S17.523,2.772,12,2.772ZM7.048,12.858a.578.578,0,0,1-1.154,0V9.431h-.9a.565.565,0,1,1,0-1.13H7.948a.565.565,0,1,1,0,1.13h-.9Zm4.849.464a.875.875,0,0,1-.367.079.472.472,0,0,1-.48-.254l-.286-.748H9.005l-.286.748a.472.472,0,0,1-.48.254.874.874,0,0,1-.366-.079c-.159-.074-.312-.275-.137-.819L9.116,8.87a.8.8,0,0,1,1.538,0L12.033,12.5C12.209,13.047,12.056,13.249,11.9,13.322Zm2.916,0H12.962a.542.542,0,0,1-.553-.529V8.878a.589.589,0,0,1,1.178,0v3.389h1.226a.529.529,0,1,1,0,1.058Zm4.292-.054a.566.566,0,0,1-.347.116.573.573,0,0,1-.461-.229l-1.353-1.793-.2.2v1.259a.577.577,0,0,1-1.154,0V8.878a.577.577,0,0,1,1.154,0v1.24l1.609-1.61a.448.448,0,0,1,.32-.128.584.584,0,0,1,.567.536.451.451,0,0,1-.127.351L17.8,10.582l1.42,1.881a.577.577,0,0,1-.113.808ZM9.885,9.74l.576,1.637H9.308Z" fill="#3C1D1E" />
            </svg>
            <span>카카오 로그인</span>
          </button>
        </div>
      </form>
    </div>
  </div>
 </div>

  <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>

</html>