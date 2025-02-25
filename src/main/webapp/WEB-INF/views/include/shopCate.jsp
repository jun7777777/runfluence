<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>

<!-- Topbar Start -->
       <div class="container-fluid" style="padding-left: 1rem !important;">
        <div class="row bg-secondary py-2 px-xl-5" style="flex-wrap:nowrap; background-color: #c6cbce !important;">
            <div class="col-lg-6 d-none d-lg-block">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="/shop/shopIndex">SHOP</a></li>
                    <a class="text-dark px-2" href="/community/freeBoard">Community</a>
                    <!-- <a class="text-dark px-2" href="#">Event</a> -->
                </div>
            </div>
        
            <div class="col-lg-6 text-center text-lg-right" style="text-align: right !important">
                <div class="d-inline-flex align-items-center">
                    <a class="text-dark px-2" href="">
                        <i class="fab fa-instagram"></i>
                    </a>
                    <a class="text-dark pl-2" href="">
                        <i class="fab fa-youtube"></i>
                    </a>
                </div>
            </div>
        </div>
        <div class="row align-items-center py-3 px-xl-5">
            <div class="col-lg-3 d-none d-lg-block"  style="text-align: center;">
                <a href="/" class="text-decoration-none">
                <img src="/resources/index/img/logo.png" alt="" style="width: 150px;" >
                    
                </a>
            </div>
            <div class="col-lg-6 col-6 text-left" role="listbox">
                <nav class="navbar navbar-light align-items-start p-0 bg-light" style="width: 100%; z-index: 1; justify-content: center; background-color: #FFFFFF !important;">
                    <ul class="custom-navbar SMN_effect-36">
                        <li><a href="javascript:void(0)" onclick="fn_cateList('SH')">SHOES</a></li>
                        <li><a href="javascript:void(0)" onclick="fn_cateList('TP')">TOP</a></li>
                        <li><a href="javascript:void(0)" onclick="fn_cateList('BT')">PANTS</a></li>
                        <li><a href="javascript:void(0)" onclick="fn_cateList('OU')">OUTER</a></li>
                        <li><a href="javascript:void(0)" onclick="fn_cateList('AC')">PRODUCT</a></li>
                    </ul>
                </nav>
            </div>
            
            <div class="col-lg-3 col-6 text-right">
                <form action="">
                    <div class="input-group">
                        <input type="text" class="form-control" id="_searchValue" placeholder="Search for products">
                        <div class="input-group-append" id="searchBtn">
                            <span class="input-group-text bg-transparent text-primary search" style="border-radius:0;">
                                <i class="fa fa-search"></i>
                            </span>
                        </div>
                    </div>
                </form>        
                <a href="/shop/cart" class="btn">
                    <i class="fas fa-shopping-cart text-primary cart"></i>
                    <!-- <span class="badge">0</span> 카운트값  -->
                </a>
                <a href="javascript:void(0)">
                    <i class="fas fa-user" id="shop-menuButton"></i> 
                </a>  
            </div>
        </div>
    </div>
    <!-- Topbar End -->
    
<script>
$(document).ready(function() {
   $("#_searchValue").on("keypress", function (e) {
       if (e.key === "Enter") { // Enter 키 감지
           e.preventDefault(); // 기본 Enter 동작(폼 제출) 방지
           $("#searchBtn").click(); // 버튼 클릭 이벤트 호출
       }
   });
   
   $("#searchBtn").click(function(){
      console.log("test");
      if($.trim($("#_searchValue").val()).length <= 0) {
         alert("조회값을 입력하세요.");
         $("#_searchValue").val("");
         $("#_searchValue").focus();
         return;
      }
      
      document.cateForm.prodId.value = "";
      document.cateForm.searchValue.value = $("#_searchValue").val();
      
      document.cateForm.action = "/shop/shopList";
      document.cateForm.submit();
   });
});

function fn_cateList(cateId) {
   document.cateForm.cateId.value = cateId;
   document.cateForm.action = "/shop/shopList";
   document.cateForm.submit();
}
</script>
<form name="cateForm" id="cateForm" method="post">
   <input type="hidden" name="cateId" id="cateId" value="">
   <input type="hidden" name="prodId" value="">
   <input type="hidden" name="searchValue" value="">
</form>

