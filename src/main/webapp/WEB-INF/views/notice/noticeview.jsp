<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_공지사항</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <style>
   		.main-content .notice_title {
            font-size: 24px;
            font-weight: 700;
            border-bottom: 3px solid #222;
            padding-bottom: 16px;
       }
       
       .notice-header {
       		padding: 17px 0 19px;
       		border-color: #ebebeb;
       }
       
       .notice-content {
       		padding: 30px 30px 28px;
       		background-color: #fafafa;
       		display: block;
       }
       
       .back-button-btn {
       		align-items: center;
    		background-color: #fff;
    		color: rgba(34, 34, 34, .8);
    		cursor: pointer;
		    text-align: center;
		    vertical-align: middle;
		    border: 1px solid #d3d3d3;
		    height: 42px;
		    letter-spacing: -.14px;
		    padding: 0 18px;
		    border-radius: 10px;
    		font-size: 14px;
       }
    </style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
	
	<div class="container py-4 buying_container">
        <div class="row">
            
			<nav class="col-md-3 mb-4 mb-md-0 mysidebar" style="flex-shrink: 0; flex:none; width:180px;">
			    <a href="/notice/notice" style="color: inherit;">
			        <div class="mypage-title" style="font-size: 24px; font-weight: 700; letter-spacing: -0.15px; line-height: 29px; padding-bottom: 30px;">
			            고객센터
			        </div>
			    </a>
			
			    <!-- 고객 지원 섹션 -->
			    <div class="mb-4">
			        <h5 class="border-bottom pb-2 mb-3" style="font-weight: 600; font-size: 16px;">
			            고객 지원
			        </h5>
			        <ul class="nav flex-column" style="padding-left: 0;">
			            <li class="nav-item">
			                <a href="/notice/notice" class="nav-link" style="color: inherit; padding: 8px 0">
			                    공지사항
			                </a>
			            </li>
			            <li class="nav-item">
			                <a href="/notice/qna" class="nav-link" style="color: inherit; padding: 8px 0">
			                    자주 물어보는 질문
			                </a>
			            </li>
			        </ul>
			    </div>
			</nav>

            <!-- 메인 컨텐츠 -->
            <main class="col-md-9 main-content">
                <div class="notice_title">
                    공지사항
                </div>
                 
                <div class="notice-content-section">
                    <div class="notice-header d-flex align-items-center border-bottom ">
                    	<div class="title_box">
                    		<div class="title fs-3">${bbs.bbsTitle}</div><!-- 공지사항제목 -->
                    		<div class="writer">${bbs.userName}</div>
                    		<c:choose>
                    			<c:when test="${not empty bbs.updateDate}">
                    				<div class="date">${bbs.updateDate}</div><!-- 수정일 -->
                    			</c:when>
                    			<c:otherwise>
                    				<div class="date">${bbs.regDate}</div><!-- 작성일 -->
                    			</c:otherwise>
                    		</c:choose>
                    		
                    	</div>
                    </div>
                    <div class="notice-content border-bottom fs-6">
                   		<div class="content">
                   			${bbs.bbsContent}
                   		</div>
                    </div>
                    <div class="back-button d-flex justify-content-center mt-4">
					    <form action="/notice/notice" method="get">
					        <input type="hidden" name="curPage" value="${curPage}">
					        <input type="hidden" name="searchValue" value="${searchValue}">
					        <button type="submit" class="btn btn-primary back-button-btn">목록 보기</button>
					    </form>
					</div>
                </div>
            </main>
        </div>
    </div>
		
	<!-- Bootstrap 5 JS Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>