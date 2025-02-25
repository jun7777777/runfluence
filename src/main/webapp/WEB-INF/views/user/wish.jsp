<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Runfluence</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
  	<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
  	<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.1/css/all.min.css" rel="stylesheet">
  
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

	<%@include file="/WEB-INF/views/include/shopHead.jsp" %>   
    <style>
        /* 공통 스타일 */
        :root {
            --border-color: #ebebeb;
            --text-primary: #222;
            --text-secondary: rgba(34, 34, 34, 0.8);
        }

        body {
            background-color: #fff;
        }

        /* 사이드바 스타일 */
        .sidebar {
            width: 180px;
            flex-shrink: 0;
            margin-right: 20px;
        }

        .nav-link {
            color: inherit;
            padding: 8px 0;
        }

        .nav-item {
            margin: 0;
        }

        .mypage-title {
            font-size: 24px;
            font-weight: 700;
            letter-spacing: -0.15px;
            line-height: 29px;
            padding-bottom: 30px;
        }

        nav h5.border-bottom {
            font-weight: bold;
            font-size: 16px;
            padding-bottom: 8px;
            margin-bottom: 8px;
        }

        .nav.flex-column {
            padding-left: 0;
        }

        /* 링크 스타일 */
        a:not(.btn) {
            color: #000000;
            text-decoration: none;
        }

        a:not(.btn):visited,
        a:not(.btn):hover,
        a:not(.btn):active {
            color: #000000;
        }

        /* 헤더 영역 스타일 */
        header {
            border-bottom: 1px solid var(--border-color);
            background-color: #fff;
        }

        /* 푸터 영역 스타일 */


        .myprofile_title {
            font-size: 24px;
            font-weight: 700;
            border-bottom: 3px solid #222;
            padding-bottom: 16px;
        }
		
        /* container_my 스타일 수정 */
        .container_my {
            display: flex;
            margin-left: auto;
            margin-right: auto;
            max-width: 1280px;
            padding-top: 40px;
		    padding-right: 40px;
		    padding-bottom: clamp(340px, 15%, 480px);
		    padding-left: 40px
        }

        /* row 클래스 스타일 추가 */
        .container_my .row {
            width: 100%;
            display: flex;
            flex-direction: row;
        }

        /* 메인 컨텐츠 영역 스타일 */
        .col-md-9 {
            flex: 1;
        }

        .userprofile {
            align-items: center;
            background-color: #fff;
            display: flex;
            padding: 38px 0;
            border-bottom: 1px solid #ebebeb;
        }

        .userprofile_detail {
            margin-left: 16px;
        }

        .userprofile_detail .userId {
            font-size: 18px;
            color: #000;
            letter-spacing: -.27px;
            line-height: 1.3;
        }

        .profile_btn_box {
            margin-top: 12px;
            font-size: 0px;
        }

        .btn.outlinegrey {
            color: rgba(34, 34, 34, 0.8);
            border: 1px solid #d3d3d3;
            outline: none;
        }

        .btn.outlinegrey:focus,
        .btn.outlinegrey:active {
            outline: none;
            box-shadow: none;
        }

        .btn {
            border-radius: 12px;
            align-items: center;
            background-color: #fff;
            color: rgba(34,34,34,.8);
            cursor: pointer;
            display: inline-flex;
            justify-content: center;
            text-align: center;
            vertical-align: middle;
        }

        .btn.small {
            padding: 0px 14px;
            font-size: 12px;
            border-radius: 10px;
            height: 34px;
            letter-spacing: -0.06px;
        }

        .profile_info {
            padding-top: 38px;
            max-width: 480px;
        }

        .profile_group {
            padding-top: 0px;
        }

        .group_title {
            font-size: 18px;
            font-weight: 600;
            letter-spacing: -0.27px;
        }

        .unit {
            border-bottom: 1px solid #ebebeb;
            display: flex;
            flex-direction: column;
            padding: 25px 0 12px;
            position: relative;
        }

        .unit_title {
            color: rgba(34,34,34,.5);
            font-size: 13px;
            font-weight: 400;
            letter-spacing: -0.07px;
        }

        .unit_content {
            align-items: center;
            display: flex;
            justify-content: center;
            width: 100%;
        }

        .desc {
            flex: 1;
            font-size: 16px;
            letter-spacing: -0.16px;
            overflow: hidden;
            padding-bottom: 8px;
            padding-top: 8px;
            text-overflow: ellipsis;
            white-space: nowrap;
            width: 100%;
        }

        .desc_modify {
            padding-right: 58px;
        }

        .desc.placeholder {
            color: rgba(34,34,34,.5);
        }

        .btn_modify {
            position: absolute;
            right: 0;
        }

        .edit-form {
            padding-top: 25px;
        }

        .form-control {
            position: relative;
            padding: auto;
        }

        .modify_btn_box {
            padding-top: 28px;
            text-align: center;
            
        }

        .modify_btn_box .btn + .btn {
            margin-left: 8px;
        }

        .modify_btn_box .btn {
            padding: 0 38px;
        }

        .btn_cancel {
            border: 1px solid #d3d3d3;
            color: rgba(34, 34, 34, 0.8);
            height: 42px;
            letter-spacing: -0.14px;
        }

        .btn_save {
            background-color: #222;
            color: #fff;
            font-weight: 700;
            height: 42px;
            letter-spacing: -0.14px;
        }

        .edit-form .form-control {
            font-size: 15px;
            letter-spacing: -.15px;
            padding-bottom: 7px;
            padding-top: 7px;
            background-color: transparent;
            border: 0;
            border-radius: 0;
            outline: 0;
            resize: none;
            border-bottom: 1px solid #ebebeb;
            line-height: 22px;
            padding: 8px 0;
            width: 100%;
        }

        .form-text {
            color: rgba(34, 34, 34, .5);
            font-size: 11px;
            line-height: 16px;
            position: absolute;
        }

        .modal-content {
            position: relative;
            display: flex;
            flex-direction: column;
            width: 448px;
            pointer-events: auto;
            background-color: #fff;
            background-clip: padding-box;
            border: 1px solid rgba(0, 0, 0, .2);
            border-radius: .3rem;
            outline: 0;
        }

        .modal-title {
            background-color: #fff;
            color: #000;
            font-size: 18px;
            font-weight: 700;
            letter-spacing: -.27px;
            letter-spacing: -.15px;
            line-height: 22px;
            min-height: 44px;
            padding: 18px 50px;
            text-align: center;
            width: 100%;
        }

        .block-modal {
            background-color: #fff;
            border-radius: 16px;
            box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
            left: 50%;
            overflow: hidden;
            position: absolute;
            top: 50%;
            transform: translate(-50%, -50%) !important;
            width: 448px;
        }

        .modal-body {
            height: 446px;
            overflow-y: auto;
            overscroll-behavior: contain;
            padding-left: 32px;
            padding-right: 32px;
            width: 100%;
        }

        .block-modal-header {
            padding: 18px 50px;
        }

        .brand_follow {
            align-items: center;
            display: flex;
            justify-content: space-between;
            font-size: 16px;
            letter-spacing: -0.16px;
            color: var(--text-primary);
            padding: 8px 0;
            width: 100%;
        }

        .brand_follow_title {
            text-align: left;
        }

        /* 토글 스위치 컨테이너 여백 조정 */
        .form-check.form-switch {
            margin: 0;
            padding-left: 2.5em;
        }
        .button-group {
            display: flex;
            gap: 10px;
        }

        .button-group button {
            padding: 10px 20px;
            border: none;
            border-radius: 20px;
            font-size: 14px;
            cursor: pointer;
            background-color: #f5f5f5;
            color: #333;
            transition: background-color 0.3s, color 0.3s;
        }

        .button-group button:hover {
            background-color: #ddd;
        }

        .button-group .active {
            background-color: #000;
            color: #fff;
        }
        .wish_item {
		    align-items: center;
		    border-bottom: 1px solid #ebebeb;
		    /*display: flex;*/
		    gap: 8px;
		    padding: 20px 0 19px;
		}
		.wish_product {
		    cursor: pointer;
		    display: flex;
		    width: 100%;
		}
		.wish_list {
		  list-style: none; /* 점(Bullet) 제거 */
		}
		.product_detail {
		    display: flex;
		    flex-direction: column;
		    margin-left: 13px;
		    overflow: hidden;
		    text-align: left;
		    flex-direction: column;
		}
		.p {
		    margin-top: 0;
		  /*  margin-bottom: 1rem;*/
		}
		.division_btn_box .btn_action {
	    align-items: center;
	    border-radius: 10px;
	    color: #fff;
	    cursor: pointer;
	    display: inline-flex;
	    flex: 1;
	    position: relative;
	}
	.division_btn_box {
	    display: flex;
	    height: 60px;
	}
	.strong {
    	font-weight: bold;
	}
	
	.wish_buy {
		display: inline-flex;
		flex-direction: column;
	    flex-shrink: 0;
	    margin-left: auto;
	    text-align: right;
	}
	
	.btn_action:before {
	    /*background-color: rgba(34, 34, 34, .1);*/
	    bottom: 0;
	    content: "";
	    left: 55px;
	    position: absolute;
	    top: 0;
	    width: 1px;
	}
	
	.status_link {
		color: rgba(34, 34, 34, .8) !important;
	    display: inline-flex;
	    font-size: 12px;
	    letter-spacing: -.06px;
	    margin-top: 6px;
	    padding: 0 3px;
	    -webkit-text-decoration: underline;
	    text-decoration: underline !important;
	}
    </style>
</head>
<body>
    <!-- 헤더 영역 -->
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>  
    <!-- 메인 컨테이너 -->
    <div class="container_my">
        <div class="row">
            <!-- 사이드바 -->
            <nav class="sidebar">
                <div class="mypage-title">마이페이지</div>
                <!-- 쇼핑 정보 섹션 -->
                <div class="mb-4">
                    <h5 class="border-bottom pb-2 mb-3">
                        <b>쇼핑 정보</b>
                    </h5>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="/user/buy" class="nav-link">
                                구매 내역
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/user/wish" class="nav-link">
                                찜한 상품
                            </a>
                        </li>
                    </ul>
                </div>

                <!-- 내 정보 섹션 -->
                <div class="mb-4">
                    <h5 class="border-bottom pb-2 mb-3">
                        <b>내 정보</b>
                    </h5>
                    <ul class="nav flex-column">
                        <li class="nav-item">
                            <a href="/user/myPage" class="nav-link">
                                정보 수정
                            </a>
                        </li>
                        <li class="nav-item">
                            <a href="/user/profile" class="nav-link">
                                프로필 관리
                            </a>
                        </li>
                    </ul>
                </div>
            </nav>

            <!-- 메인 컨텐츠 영역 -->
            <main class="col-md-9">
                <div class="myprofile_title">
                    <div class="title">찜한 상품</div>
                </div>
				
				 <div class="button-group" style="padding: 10px;">
			        <button class="active">상품</button>
			        <button>스타일</button>
			        
			    </div>
				<div class="saved-product">
					<div class="saved-product-mobile">
						<div class="my_interest">
							<div class="wish-content-header" style="text-size:10px;">
								<div class="total-rows">전체 2개</div>
								<ul class="wish_list">
									<li>
										<div class="wish_item">
											<div class="wish_product">
												<div class="product_box">
													<div class="product_image">
														<a href="/shop/detail">
															<img src="../resources/shop/img/1.jpg" width="80px" height="80px" class="image">
														</a>
													</div>
												</div>
												<div class="product_detail">
													<div class="brand_name">
														<a class="brand_text">
															<span>Adidas</span>
														</a>
													</div>
													<a href="/shop/detail">
														<p class="name" style="margin-bottom:0px;">아디다스 오리지널스 퀼티드 슈퍼스타 봄버 자켓 블랙</p>
													</a>
													<p class="size" style="margin-bottom:0px; margin-top:auto;"><span>S</span></p>
												</div>
												<div class="wish_buy">
													<div>
													<div class="division_btn_box">
														<a href="/shop/cart" disabled="disabled" class="wish_btn">
														</a>
														<button class="btn_action" style="background-color: rgb(239, 98, 83);">
														<strong class="title" style="font-size: 18px; letter-spacing: -.27px; text-align: center; width: 75px;">장바구니</strong>
														<div class="price">
														<span class="amount">
														<em class="num">155,000</em>
														<span class="won">원</span></span>
														
														</div>
														</button>
													</div>
													<a href="#" class="status_link" id="status_link">삭제</a>
													</div>
												</div>
											</div>											
										</div>
										<div class="wish_item">
											<div class="wish_product">
												<div class="product_box">
													<div class="product_image">
														<a href="/shop/detail">
															<img src="../resources/shop/img/1.jpg" width="80px" height="80px" class="image">
														</a>
													</div>
												</div>
												<div class="product_detail">
													<div class="brand_name">
														<a class="brand_text">
															<span>Adidas</span>
														</a>
													</div>
													<a href="/shop/detail">
														<p class="name" style="margin-bottom:0px;">아디다스 오리지널스 퀼티드 슈퍼스타 봄버 자켓 블랙</p>
													</a>
													<p class="size" style="margin-bottom:0px; margin-top:auto;"><span>S</span></p>
												</div>
												<div class="wish_buy">
													<div>
													<div class="division_btn_box">
														
														<button class="btn_action" style="background-color: rgb(239, 98, 83);">
														<strong class="title" style="font-size: 18px; letter-spacing: -.27px; text-align: center; width: 75px;">장바구니</strong>
														<div class="price">
														<span class="amount">
														<em class="num">155,000</em>
														<span class="won">원</span></span>
														
														</div>
														</button>
													</div>
													<a href="#" class="status_link" id="status_link">삭제</a>
													</div>
												</div>
											</div>											
										</div>
									</li>
								</ul>	
							</div>
						</div>
					</div>
				</div>
				
				<div class="style-list" style="display: none;">
				    <div class="style-product-mobile">
				        <div class="my_interest">
				            <div class="wish-content-header">
				                <div class="total-rows">전체 1개</div>
				                <ul class="wish_list">
				                    <li>
				                        <div class="wish_item">
				                            <div class="wish_product">
				                                <div class="product_box">
				                                    <div class="product_image">
				                                        <a href="/style/">
				                                            <img src="" width="100px" height="100px" class="image">
				                                        </a>
				                                    </div>
				                                </div>
				                                <div class="product_detail">
				                                	<a href="/style/">
				                                    	<p class="name">스타일 1</p>
				                                    </a>
				                                </div>
				                                <div class="wish_buy">
				                                    <a href="#" class="status_link">삭제</a>
				                                </div>
				                            </div>
				                        </div>
				                    </li>
				                </ul>
				            </div>
				        </div>
				    </div>
				</div>
				
	           </main>
	       </div>
   </div>


	<form name="wishForm" id="wishForm" method="post">
		<input type="hidden" name="curPage" id="curPage" value="">
		<input type="hidden" name="" id="" value="">
		<input type="hidden" name="" id="" value="">
		<input type="hidden" name="" id="" value="">
	</form>

    <!-- Bootstrap Bundle with Popper -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"></script>
	<script>
	$(document).ready(function () {
	    // 버튼 클릭 이벤트
	    $(".button-group button").on("click", function () {
	        var buttonText = $(this).text(); 

	        if (buttonText == "상품") {
	            $(".saved-product").show();
	            $(".style-list").hide(); 
	        } 
	        else if (buttonText == "스타일") {
	            $(".saved-product").hide(); 
	            $(".style-list").show(); 
	        }

	    });

	    // 삭제 버튼
	    $(".status_link").on("click", function () {
	        fn_delete(this); // 삭제 함수 호출
	    });
	    
	    $(".btn_action").on("click", function () {
	        window.location.href = "/shop/cart"; // 장바구니 페이지로 이동
	    });
	});

	// 삭제 함수
	function fn_delete(element) {
    	// 클릭된 삭제 버튼의 가장 가까운 <li> 요소 삭제
    	$(element).closest("li").remove();

    	// 페이지 새로 고침
    	location.reload();
    	
	}

	</script>
</body>
<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</html>