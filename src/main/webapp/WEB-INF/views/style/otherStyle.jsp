<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.sist.common.util.StringUtil"%>  
<%@include file="/WEB-INF/views/include/taglib.jsp" %>          
<html >
<head>
<%@include file="/WEB-INF/views/include/shopHead.jsp" %>
 <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_STYLE</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Optional Bootstrap JS and dependencies (jQuery and Popper.js) -->
<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<style>
body {
    margin: 0;
    font-family: "Nunito Sans", sans-serif;
    background-color: #fff;
    color: #333;
    display: center;
    flex-direction: column;
    align-items: center;
}

.main-header {
    text-align: center;
    padding: 20px 0;
    border-bottom: 1px solid #ddd;
}

.page-title {
    font-size: 2rem;
    font-weight: 700;
    margin-bottom: 10px;
}

.main-menu {
    text-align: center;
    margin: 10px 0;
}

.menu {
    list-style: none;
    padding: 0;
    display: inline-flex;
    gap: 20px;
}

.menu > li {
    position: relative;
}

.menu > li > a {
    text-decoration: none;
    color: #333;
    font-size: 1rem;
    font-weight: bold;
    transition: color 0.3s ease;
}

.menu > li > a:hover {
    color: #007bff;
}

.dropdown {
    list-style: none;
    padding: 10px;
    background-color: #f9f9f9;
    position: absolute;
    top: 100%;
    left: 0;
    display: none;
    box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
}

.menu > li:hover .dropdown {
    display: block;
}

.card-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(280px, 1fr)); /* 카드 크기 */
    gap: 30px; /* 카드 간 간격 */
    padding: 80px; /* 그리드 외부 여백 */
    padding-top: 15px;
}
.card {
    background-color: #fff;
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
    width: 280px;
    height: 350px;
}


.card-image {
    width: 100%;
    height: 200px;
    object-fit: cover;
}

.card-body {
   /*  padding: 15px; 카드 내부 여백 조정 */
}

.username {
    font-weight: bold;
    font-size: 1rem;
    margin-bottom: 5px;
}

.description {
    font-size: 0.9rem;
    color: #666;
}

.card-footer {
    margin-top: 10px;
    font-size: 1rem; /* 푸터 글자 크기 조정 */
}
.nav-menu {
	text-align: left !important; 
}
.bi-heart {
    color: red;
    cursor: pointer;
}
.style_title {
    text-align: center; /* 텍스트 중앙 정렬 */
    margin: 20px 0; /* 위아래 여백 추가 */
}

.style_title h3 {
    font-size: 2em; /* 폰트 크기 조정 */
    font-weight: bold; /* 글씨 두껍게 */
}

</style>

<script>
$(document).ready(function () {
    
	//글쓰기 버튼 클릭시
    $("#btnWrite").on("click", function () {
   		document.bbsDetailForm.action="/style/styleWrite";
    	document.bbsDetailForm.submit();
    });
	
  /*
	function fn_list(curPage) //페이징 처리 
	{	
		document.bbsDetailForm.bbsSeq.value =bbsSeq;
		document.bbsDetailForm.curPage.value = curPage;
		document.bbsDetailForm.action = "/style/styleIndex";
		document.bbsDetailForm.submit();
	}*/
	
	// 위시리스트 하트 클릭 이벤트
	$('.card-footer .heart').on('click', function () {
	    const heartIcon = $(this); // 클릭된 하트 아이콘만 선택
	    const bbsSeq = $(this).closest('.card-footer').data('prod-id'); 
	   
	    if (heartIcon.hasClass('bi-heart')) {
	        // 위시리스트에 추가 요청
			$.ajax({
	            url: '/wishlist/add',
	            method: 'POST',
	            data: { bbsSeq: bbsSeq },
	            datatype: "JSON",
	            beforeSend: function(xhr){
					xhr.setRequestHeader("AJAX", "true");
				},
	            success: function (res) 
	            {
	            	if(res.code == 0)
	            	{
		                heartIcon.removeClass('bi-heart').addClass('bi-heart-fill');
		                alert('위시리스트에 추가되었습니다.');
	                }
	                
	                else
	                {
	                	alert('위시리스트 추가 중 오류가 발생했습니다.1');
	                }
	            },
	            error: function(error){
					icia.common.error(error);
					alert('위시리스트 추가 중 오류가 발생했습니다.');
				}
	        });
	    }
	     
	    else {
	        // 위시리스트에서 삭제 요청
	        $.ajax({
	            url: '/wishlist/del',
	            method: 'POST',
	            data: { bbsSeq: bbsSeq },
	            datatype: "JSON",
	            beforeSend: function(xhr){
					xhr.setRequestHeader("AJAX", "true");
				},
	             success: function (res) 
	            {
	            	if(res.code == 0)
	            	{
		                heartIcon.removeClass('bi-heart-fill').addClass('bi-heart');
		                alert('위시리스트에서 제거되었습니다.');
	                }
		            else
					{
		                alert('위시리스트 제거 중 오류가 발생했습니다.');
		            }
	            },
	            error: function(error){
					icia.common.error(error);
					alert('위시리스트 제거 중 오류가 발생했습니다.');
				}

	        });
	    }
	});
	
/////////////////
// 무한 스크롤 기능
/////////////////

	    let start = 0; // 시작 인덱스
	    const limit = 10; // 한 번에 가져올 데이터 개수
	    let isLoading = false; // 중복 요청 방지 플래그
	    let hasMoreData = true; // 데이터가 더 있는지 여부

	    // 데이터 가져오는 함수
	    function getData() {
	        if (isLoading || !hasMoreData) return; // 로딩 중이거나 데이터가 더 이상 없으면 중단

	        isLoading = true;

	        $.ajax({
	            type: "POST",
	            url: "/style/scroll",
	            data: {
	                start: start, // 현재 시작 인덱스
	                limit: limit, // 가져올 데이터 개수
	                bbsSubCateCombinedId: "CMSY" // 카테고리
	            },
	            success: function (response) {
	                if (response.code === 0) {
	                    const data = response.data;

	                    if (data && data.length > 0) {
	                        // 데이터를 추가로 렌더링
	                        data.forEach(bbs => {
	                        	$(".card-grid").append(`
                       			  <div class="card">
                       			      <a href="/style/detail?bbsSeq=\${bbs.bbsSeq}">
                       			          <img src="/resources/style/\${bbs.bbsImgName}" alt="Style Image" class="card-image" />
                       			      </a>
                       			      <div class="card-body">
                       			          <span class="user_name">\${bbs.userEmail}</span>
                       			          <p class="description">\${bbs.bbsTitle}</p>
                       			          <div class="card-footer" data-prod-id="\${bbs.bbsSeq}">
                       			              <i class="heart bi-heart" style="font-size:15px; color: red; cursor: pointer;"></i>
                       			          </div>
                       			      </div>
                       			  </div>
                       			`);

	                        });

	                        start += limit; // 다음 요청을 위해 start 값 갱신
	                    } else {
	                        hasMoreData = false; // 더 이상 데이터 없음
	                        console.log("더 이상 데이터가 없습니다.");
	                    }
	                } 
	            },
	            error: function (xhr, status, error) {
	                console.error("Error fetching data:", status, error);
	            },
	            complete: function () {
	                isLoading = false; // 요청 완료 후 로딩 상태 해제
	            }
	        });
	    }

	    // 스크롤 이벤트
	    $(window).on("scroll", function () {
	        const scrollTop = $(this).scrollTop();
	        const scrollHeight = $(document).height();
	        const windowHeight = $(this).height();

	        if (scrollTop + windowHeight >= scrollHeight - 100) {
	            getData(); // 데이터 요청
	        }
	    });

	    // 초기 데이터 로드
	    getData();
	

});

</script>
<!-- Css Styles -->
    <link rel="stylesheet" href="/resources/index/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/magnific-popup.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="/resources/index/css/style.css" type="text/css">
</head>


<body>

<form name="bbsDetailForm" id="bbsDetailForm" method="post" > 
 
 <!-- Header Section Begin -->
  <div class="container-fluid" style="display: flex; align-items: center;">
      <div class="logo" style="padding-top: 15px;">
          <a href="/index">
              <img src="/resources/index/img/logo.png" alt="">
          </a>
      </div>
      <div class="container" style="text-align: -webkit-auto !important;">
          <div class="nav-menu" style="padding-top: 15px;">
              <nav class="mainmenu mobile-menu">
                  <ul class="menu align-center expanded text-center SMN_effect-36">
                      <li class="active"><a href="/index">Home</a></li>
                      <!-- <li><a href="./about-us">About us</a></li> -->
                      <li><a href="/shop/shopIndex"  style="color: #000">Shop</a></li>
                      <li><a href="/forum/forumIndex"  style="color: #000">Community</a>
                          <ul class="dropdown">
                              <li><a href="/forum/forumIndex"  style="color: #fff">Forum</a></li>
                              <li><a href="/style/styleIndex?bbsSubCateCombinedId=CMSY" style="color: #fff">STYLE</a></li>
                          </ul>
                      </li>
                      <li><a href="./marathon"  style="color: #000">EVENT</a></li>
                      <li><a href="./contact" style="color: #000">Assistance</a></li>
                  </ul>
              </nav>
          </div>
      </div>
      
      <div id="mobile-menu-wrap"></div>
  </div>
<!-- Header End -->
<div class="style_title" style="position: relative; padding: 20px; text-align: center;">
    <h3 style="margin: 0;">${bbs.bbsName}의 STYLE</h3>
    <button id="btnWrite" type="button" class="btn btn-dark" 
        style="position: absolute; right: 100px; top: 50%; transform: translateY(-50%); border-radius: 10px; padding: 8px 16px;" 
       >글쓰기</button>
</div>



<main class="content">
    <div class="card-grid">
  <c:if test='${!empty list}'>
    <c:forEach var="bbs" items="${list}" varStatus="status">
        <div class="card">
            <a href="javascript:void(0)" onclick="fn_view('${bbs.bbsSeq}')" >
    			<img src="<c:url value='/resources/style/${bbs.bbsImgName}' />" alt="Style Image" class="card-image" />
            </a>
            <div class="card-body">
                <span class="user_name">${bbs.userEmail}</span>
                <p class="description">${bbs.bbsTitle}</p>
                <div class="card-footer" data-prod-id="${bbs.bbsSeq}">
				    <i class="heart <c:if test='${bbs.heart != "Y"}'>bi-heart</c:if> <c:if test='${bbs.heart == "Y"}'>bi-heart-fill</c:if>" 
				       id="heart-icon" style="font-size:15px; color: red; cursor: pointer;"></i>
				</div>
            </div>
        </div>
     </c:forEach>
	</c:if>
    </div>
</main>

   <!-- 페이징 start 
     <div class="pagination">
         <c:if test="${!empty paging }">
         <div class="col-12 pb-1">
             <nav aria-label="Page navigation">
               <ul class="pagination justify-content-center mb-3">-->
               
               <!-- 이전 페이징 start 
               <c:if test="${paging.prevBlockPage gt 0}">
                 <li class="page-item">
                   <a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})" aria-label="Previous">
                     <span aria-hidden="true">&laquo;</span>
                     <span class="sr-only">Previous</span>
                   </a>
                 </li>
                 </c:if> -->
                 <!-- 이전 페이징 end 
                 
                 <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
					<c:choose>
						<c:when test="${paging.curPage ne i }">
				             <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
						</c:when>

						<c:otherwise>
	                  		<li class="page-item active"><a class="page-link" href="javascript:void(0)">${i}</a></li>
	                  	</c:otherwise>	
					</c:choose>
                 </c:forEach>-->
                 
                 <!-- 다음 페이징 start 
                 <c:if test="${paging.nextBlockPage gt 0 }">
	                 <li class="page-item">
	                   <a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})" aria-label="Next">
	                     <span aria-hidden="true">&raquo;</span>
	                     <span class="sr-only">Next</span>
	                   </a>
	                 </li>
                 </c:if>-->
                 <!-- 다음 페이징 end 
                 
               </ul>
             </nav>
         </div>
      </c:if>
     </div> -->
  <!-- 페이징 end -->
                    

            

    <input type="hidden" name="curPage" value="${curPage }">
	<input type="hidden" name="cateId" value="${cateId }">
    <input type="hidden" name="prodId" id="prodId" value="">
    <input type="hidden" name="userEmail" id="userEmail" value="">
    <input type="hidden" name="userName" id="userName" value="">
    <input type="hidden" name="bbsSeq" id="bbsSeq" value="">
    <input type="hidden" name="bbsImg" id="bbsImg" value="" >
</form>

 <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>

    <script>
        function fn_view(bbsSeq) {
            document.bbsDetailForm.bbsSeq.value = bbsSeq;
            document.bbsDetailForm.action = "/style/detail";
            document.bbsDetailForm.submit();
        }
    </script>

	
</body>
</html>