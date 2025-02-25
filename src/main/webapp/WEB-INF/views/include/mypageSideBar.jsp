<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!-- 사이드바 -->
<nav class="col-md-3 mb-4 mb-md-0 mysidebar" style="flex-shrink: 0; flex:none; width:180px;">
	<a href="/user/myPage" style="color: inherit;">
		<div class="mypage-title" style="font-size: 24px; font-weight: 700; letter-spacing: -0.15px; line-height: 29px; padding-bottom: 30px;">
		마이페이지
		</div>
	</a>
    <!-- 쇼핑 정보 섹션 -->
    <div class="mb-4">
        <h5 class="border-bottom pb-2 mb-3" style="font-weight: 600; font-size: 16px; width: 80%;">
            쇼핑 정보
        </h5>
        <ul class="nav flex-column" style="padding-left: 0;">
            <li class="nav-item">
                <a href="/user/buy" class="nav-link" style="color: inherit; padding: 8px 0">
                    구매 내역
                </a>
            </li>
            <li class="nav-item">
                <a href="/shop/wish" class="nav-link" style="color: inherit; padding: 8px 0">
                    찜한 상품
                </a>
            </li>
        </ul>
    </div>

    <!-- 내 정보 섹션 -->
    <div class="mb-4">
        <h5 class="border-bottom pb-2 mb-3" style="font-weight: 600; font-size: 16px; width: 80%;">
	        내 정보
	    </h5>
	    <ul class="nav flex-column" style="padding-left: 0;">
            <li class="nav-item">
                <a href="/user/userUpdate" class="nav-link" style="color: inherit; padding: 8px 0">
                    정보 수정
                </a>
            </li>
            <li class="nav-item">
                <a href="/user/userProfile" class="nav-link" style="color: inherit; padding: 8px 0">
                    프로필 관리
                </a>
            </li>
            <li class="nav-item">
                <a href="/user/userAddrList" class="nav-link" style="color: inherit; padding: 8px 0">
					주소록
                </a>
            </li>
            <li class="nav-item">
                <a href="/community/myFreeBoard" class="nav-link" style="color: inherit; padding: 8px 0">
					작성한 글
                </a>
            </li>
            <li class="nav-item">
                <a href="/community/myComments" class="nav-link" style="color: inherit; padding: 8px 0">
					댓글단 글
                </a>
            </li>
        </ul>
    </div>
    <!-- 대회 관련 섹션 -->
</nav>

