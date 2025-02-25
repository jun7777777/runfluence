<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="ko">
<head>
    <!-- 메타 정보 -->
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>마이페이지</title>
    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons CSS -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <!-- 커스텀 스타일 -->
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<style>
/* 공통 스타일 */
:root {
    --border-color: #ebebeb;
    --text-primary: #222;
    --text-secondary: rgba(34, 34, 34, 0.8);
    --bg-hover: #f8f8f8;
}

/* 작은 텍스트 */
.text-sm {
    font-size: 12px;
    color: var(--text-secondary);
}

.mypage_container {
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    padding-top: 40px;
    padding-right: 40px;
   	padding-bottom: clamp(320px, 15%, 480px);
    padding-left: 40px
}

/* 레이아웃 컴포넌트 */
.mypage_container .my_home_title {
    display: flex;
    justify-content: space-between;
    align-items: center;
    margin-top: 42px;
    max-width: 100%;
    padding: 1rem 1rem 16px 1rem;
}

.mypage_container .btn_more {
    display: flex;
    align-items: center;
    gap: 0.5rem;
}

.mypage_container .recent_purchase {
    background-color: #fafafa;
    border-radius: 12px;
    display: table;
    table-layout: fixed;
    width: 100%;
    margin-top: 20px;
    border: 1px solid var(--border-color);
}

.mypage_container .purchase_list_tab {
    display: flex;
    justify-content: space-around;
    padding: 1rem;
}

.mypage_container .tab_box {
    text-align: center;
    margin: 0;
}

.mypage_container .tab_item {
    position: relative;
    flex: 1;
    text-align: center;
}

.mypage_container .tab_item:not(:last-child)::after {
    content: '';
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    height: 50%;
    width: 1px;
    background-color: var(--border-color);
}

.mypage_container .purchase_item_list {
    background-color: transparent;
    border: none;
    margin-top: 20px;
    padding: 1rem;
}

.mypage_container .purchase_item {
    display: flex;
    gap: 1rem;
    padding: 1rem;
    border-radius: 8px;
    background-color: #fff;
    transition: background-color 0.2s;
    text-decoration: none;
    color: inherit;
    margin-bottom: 1rem;
    align-items: center; /* 수직 중앙 정렬 */
}

.mypage_container .purchase_item:hover {
    background-color: var(--bg-hover);
}

.mypage_container .item_image {

    border: 1px solid var(--border-color);
    border-radius: 4px;
    overflow: hidden;
    flex-shrink: 0;
}

.item_image2{
	width: auto; /* 너비는 자동으로 조정 */
    height: auto; /* 높이도 자동으로 조정 */
    max-width: 150px; /* 최대 너비 제한 */
    max-height: 150px; /* 최대 높이 제한 */
}

.mypage_container .item_image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
}

.mypage_container .item_info {
    flex: 1;
}

.mypage_container .item_status {
    margin-left: auto;
    text-align: right;
}

.mypage_container .item_name {
    font-size: 18px;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.mypage_container .item_price {
    font-size: 12px;
    color: var(--text-secondary);
    margin-bottom: 0.5rem;
}

.mypage_container .purchase_date {
    font-size: 12px;
    color: var(--text-secondary);
}

.mypage_container .status_text {
    font-size: 14px;
    font-weight: 500;
    color: var(--text-primary);
}

.mypage_container .status_action {
    font-size: 12px;
    color: var(--text-secondary);
    margin-top: 0.5rem;
}

.mypage_container .count {
    font-size: 0.9rem;
    margin-top: 0.2rem;
}

.mypage_container .tab_box .title {
    font-size: 12px;
}

.mypage_container .tab_box .count {
    font-size: 12px;
    color: var(--text-secondary);
}

/* 프로필 이미지 */
.mypage_container .profile-image-container {
    position: relative;
    width: 80px;
    height: 80px;
    margin: 0 auto;
}

.mypage_container .profile-image-container img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    background-color: #f8f9fa;
}

.mypage_container .profile-upload-label {
    position: absolute;
    bottom: 0;
    right: 0;
    background-color: #f2b048;
    width: 28px;
    height: 28px;
    border-radius: 50%;
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: pointer;
    transition: background-color 0.3s;
}

.mypage_container .profile-upload-label:hover {
    background-color: #eaad70;
}

.mypage_container .profile-upload-label i {
    color: white;
    font-size: 16px;
}

/* 링크 상태별 스타일 */
.mypage_container a:not(.btn) {
    color: #000000;
    text-decoration: none;
}

.mypage_container a:not(.btn):visited,
.mypage_container a:not(.btn):hover,
.mypage_container a:not(.btn):active {
    color: #000000;
}

/* 큰 글자 (제목, 메인 텍스트) */
.mypage_container .my_home_title .title,
.mypage_container .user-info-section h2 {
    font-size: 18px;
    font-weight: bold;
}

/* 작은 글자 (부가 정보, 설명) */
.mypage_container .btn_txt {
    font-size: 12px;
}

/* body 스타일 */
.mypage_container body {
    background-color: #fff;
}

/* 찜한 상품 스타일 */
.mypage_container .wishlist_item_list {
    margin-top: 20px;
    padding: 1rem;
    display: flex;
    flex-wrap: wrap;
    gap: 1rem;
}

.mypage_container .wishlist_item {
    width: calc(25% - 1rem); /* 4열 레이아웃 */
    box-sizing: border-box;
    text-decoration: none;
    color: inherit;
}

.mypage_container .wishlist_item .item_image {
    width: 100%;
    aspect-ratio: 1 / 1; /* 정사각형 비율 */
    overflow: hidden;
    border-radius: 4px;
    border: 1px solid var(--border-color);
}

.mypage_container .wishlist_item .item_image img {
    width: 100%;
    height: 100%;
    object-fit: cover;
    transition: transform .3s ease;
}

.mypage_container .wishlist_item .item_image:hover img {
    transform: scale(1.05);
}

.mypage_container .wishlist_item .item_info {
    margin-top: 0.5rem;
    text-align: center;
}

.mypage_container .wishlist_item .item_name {
    font-size: 16px;
    font-weight: bold;
    margin-bottom: 0.3rem;
}

.mypage_container .wishlist_item .item_price {
    font-size: 14px;
    color: var(--text-secondary);
}

/* 구매 내역 섹션 아래쪽 보더 추가 */
.mypage_container .purchase-history-section {
    border-bottom: 1px solid var(--border-color);
    
}

/* 기존 클래스에 padding 추가 */
.mypage_container .d-flex.align-items-center.justify-content-between.w-100 {
    padding: 15px;
    height: auto;
    min-height: 120px;
    border: 1px solid #ebebeb;
    border-radius: 12px;
}

/* 정보 수정과 프로필 관리 버튼에 스타일 적용 */
.mypage_container .button-class {
    border: 1px solid #d3d3d3;
    color: rgba(34, 34, 34, 0.8);
    background-color: white;
    transition: none;
}

/* hover 효과 제거 */
.mypage_container .button-class:hover {
    background-color: white !important; /* 기존 배경색 유지 */
    color: rgba(34, 34, 34, 0.8) !important; /* 기존 텍스트 색상 유지 */
    border-color: #d3d3d3 !important; /* 기존 테두리 색상 유지 */
}

/* 섹션 제목 스타일 */
.mypage_container nav h5.border-bottom {
    font-weight: bold;
    font-size: 16px;
    padding-bottom: 8px;
    margin-bottom: 8px;
}

.col-md-9 {
	flex-grow: 1;
	max-width: 100%;
}
.row.mx-0 {
	gap:20px;
}
     
.thumbnail {
	width: 100px;
	height: 100px;
	object-fit: cover;
	border: 2px solid #ddd;
	border-radius: 50%;
}

.item_image2 {
    width: auto; /* 부모 크기에 맞게 너비 자동 조정 */
    height: auto; /* 높이 자동 조정 */
    max-width: 100px; /* 최대 너비 150px */
    max-height: 100px; /* 최대 높이 150px */
    display: flex; /* 자식 이미지 정렬에 유용 */
    justify-content: center; /* 가로 정렬 */
    align-items: center; /* 세로 정렬 */
    overflow: hidden; /* 초과 부분 숨김 */
}

.item_image2 img {
    width: auto; /* 너비 비율 유지 */
    height: auto; /* 높이 비율 유지 */
    max-width: 100%; /* 부모 크기 내에서 제한 */
    max-height: 100%; /* 부모 크기 내에서 제한 */
    object-fit: contain; /* 비율 유지하며 내용 표시 */
}

</style>
</head>

<script>
function fn_detail(prodId)
{
	document.detailForm.prodId.value = prodId;
	document.detailForm.action = "/shop/detail";
	document.detailForm.submit();
}

function fn_detail(element) {
	var prodId = $(element).data("prod-id");
	
	document.wishForm.prodId.value = prodId;
	document.wishForm.action = "/shop/detail";
	document.wishForm.submit();
}

$(document).ready(function() {
	$(".wishlist_item").on("click", function () {
		fn_detail(this);
	});
});

</script>

<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
    <!-- 메인 컨테이너 -->
    <div class="container mypage_container">
        <div class="row">
			<%@include file="/WEB-INF/views/include/mypageSideBar.jsp" %>
            <!-- 메인 컨텐츠 -->
            <main class="col-md-9">
                <!-- 사용자 정보 섹션 -->
                <section class="bg-light rounded mb-4 user-info-section">
                    <div class="d-flex align-items-center justify-content-between w-100">
                        <!-- 프로필 이미지 및 사용자 정보 -->
                        <div class="d-flex align-items-center">
                            <div class="me-3 text-center">
                                <div class="profile-image-container">
                                    <c:choose>
										<c:when test="${not empty user.userProfileImg}">
											<img src="/resources/profile/${user.userProfileImg}"
												alt="프로필 사진" class="thumbnail">
										</c:when>
										<c:otherwise>
											<img src="/resources/profile/default_profile.png"
												alt="프로필 기본 사진" class="thumbnail">
										</c:otherwise>
									</c:choose>
                                </div>
                            </div>
                            <div>
                                <h2 class="mb-2">${user.userName}</h2>
                                <p class="mb-1">이메일: <c:out value="${user.userEmail}"/></p>
                            </div>
                        </div>  
                        
                        <!-- 버튼 -->
                        <div class="ms-auto">
                            <div class="d-flex gap-2">
                                <a href="/user/userUpdate" class="btn button-class">정보 수정</a>
                                <a href="/user/userProfile" class="btn button-class">프로필 관리</a>
                            </div>
                        </div>
                    </div>
                </section>

                <!-- 구매 내역 섹션 시작 -->
                <section class="purchase-history-section">
                    <div class="my_home_title">
                        <h3 class="title">구매 내역</h3>
                        <a href="/user/buy" class="btn_more">
                            <span class="btn_txt text-sm">더보기</span>
                            <i class="bi bi-chevron-right"></i>
                        </a>
                    </div>

                    <!-- 구매 상태 탭 -->
                    <div class="recent_purchase">
                        <div class="purchase_list_tab">
                            <div class="tab_item total">
                                <a href="/user/buy?tab=all" class="tab_link">
                                    <dl class="tab_box">
                                        <dt class="title">전체</dt>
                                        <dd class="count">${allCnt }</dd>
                                    </dl>
                                </a>
                            </div>
                            <div class="tab_item">
                                <a href="/user/buy?tab=inProgressing" class="tab_link">
                                    <dl class="tab_box">
                                        <dt class="title">진행 중</dt>
                                        <dd class="count">${progressingCnt }</dd>
                                    </dl>
                                </a>
                            </div>
                            <div class="tab_item">
                                <a href="/user/buy?tab=complete" class="tab_link">
                                    <dl class="tab_box">
                                        <dt class="title">종료</dt>
                                        <dd class="count">${endCnt }</dd>
                                    </dl>
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- 구매 아이템 리스트 -->
                    <div class="purchase_item_list">
					    <c:if test='${!empty myPageOrder }'>
					        <c:forEach var="list" items="${myPageOrder}" varStatus="status">
					            <c:if test="${status.index == 0}"> <!-- 첫 번째 항목만 출력 -->
					                <a href="javascript:void()" onclick="fn_detail('${list.prodId}')" class="purchase_item">
					                    <div class="item_image2">
					                        <img src="/resources/prod-img/${list.prodMainCateId }/mainImg/${list.prodId }.png" alt="상품 이미지">
					                    </div>
					                    <div class="item_info">
					                        <div class="item_name">${list.orderProdName }</div>
					                        <div class="item_price">
					                            <fmt:formatNumber value="${list.orderProdPrice}" type="number" groupingUsed="true"/>￦
					                        </div>
					                        <div class="purchase_date">구매일: ${list.regDate }</div>
					                    </div>
					                    <div class="item_status">
					                        <p class="status-text">${list.orderStatus}</p>
					                        <c:if test='${list.orderStatus == "결제 완료" }'>
					                            <p class="status-subtext">발송대기</p>
					                        </c:if>
					                    </div>
					                </a>
					            </c:if>
					        </c:forEach>
					    </c:if>
					</div>

                </section>
                <!-- 구매 내역 섹션 끝 -->

                <!-- 찜한 상품 섹션 -->
                <div class="my_home_title">
                    <h3 class="title">찜한 상품명</h3>
                    <a href="/shop/wish" class="btn_more">
                        <span class="btn_txt text-sm">더보기</span>
                        <i class="bi bi-chevron-right"></i>
                    </a>
                </div>
				
                <!-- 찜한 상품 리스트 -->
                <div class="wishlist_item_list">
                    <!-- 찜한 상품 1 -->
                    <c:if test="${!empty wishList }">
                    <c:forEach var="list" items="${wishList}" varStatus="status">
	                    <a class="wishlist_item" data-prod-id = "${list.prodId}">
	                        <div class="item_image">
	                            <img src="/resources/prod-img/${list.prodMainCateId }/mainImg/${list.prodId }.png" alt="상품 이미지">
	                        </div>
	                        <div class="item_info">
	                            <div class="item_name">${list.prodName }</div>
	                            <div class="item_price"><fmt:formatNumber value="${list.prodPrice}" type="number" groupingUsed="true"/>￦</div>
	                        </div>
	                    </a>
                    </c:forEach>
                    </c:if>
                    <!-- 필요한 만큼 추가 -->
                </div>
            </main>
        </div>
    </div>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
    
    <form name="detailForm" method="post">
    	<input type="hidden" name="prodId" value="">
    </form>
    
    <form name="wishForm" id="wishForm" method="post">
		<input type="hidden" name="curPage" id="curPage" value="">
		<input type="hidden" name="prodId" id="prodId" value="">
		<input type="hidden" name="bbsSeq" id="bbsSeq" value="">
	</form>

    <!-- Bootstrap JS 번들 -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
</body>
</html>
