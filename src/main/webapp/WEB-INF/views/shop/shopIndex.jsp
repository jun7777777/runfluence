<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>    
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <link rel='stylesheet' href='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.7/css/swiper.min.css'>
    <link rel="stylesheet" href="/resources/shop/css/style_main.css">

     <!--wish-->
     <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.8.0/font/bootstrap-icons.css">
     <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 <style>
  .product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(400px, 2fr)); /* 반응형으로 카드 크기 설정 */
    gap: 25px; /* 카드 간격 */
    padding: 0 15px;
}

.card.product-item {
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    background: #fff;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    display: flex;
    flex-direction: column;
    justify-content: space-between;
}

.card-header.product-img {
    position: relative;
    overflow: hidden;
    height: 100%; /* 컨테이너 높이 설정 */
    padding: 0; /* 여백 제거 */
    margin: 0; /* 여백 제거 */
}

.product-image {
    width: 100%; /* 컨테이너의 너비에 맞게 설정 */
    height: 100%; /* 컨테이너의 높이에 맞게 설정 */
    object-fit: cover; /* 비율을 유지하면서 여백 없이 꽉 채우기 */
    display: block; /* 불필요한 공백 제거 */
}

.card-body {
    padding: 15px;
    text-align: center;
}

.price h6 {
    margin: 0;
    font-size: 14px;
    color: #333;
}

.price .text-muted {
    margin-left: 10px;
    font-size: 12px;
}

.card-footer {
    padding: 10px 15px;
    background: #f8f9fa;
}

.wish {
    display: flex;
    align-items: center;
    cursor: pointer;
}

.heart {
    margin-right: 5px;
    font-size: 16px;
    color: red;
}
 .vendor-item {
    display: flex;
    justify-content: center;
    align-items: center;
    height: 150px; /* 고정된 높이 설정 */
    width: 100%; /* 컨테이너 너비에 맞춤 */
    background-color: #fff; /* 필요 시 배경색 지정 */
    border: 1px solid #ddd; /* 테두리 스타일 */
    box-sizing: border-box; /* 테두리와 패딩 포함한 크기 계산 */
}

.vendor-item img {
    max-width: 100%; /* 이미지의 너비를 컨테이너 안에 맞춤 */
    max-height: 100%; /* 이미지의 높이를 컨테이너 안에 맞춤 */
    object-fit: contain; /* 이미지 비율을 유지하며 컨테이너 안에 맞춤 */
    padding: 10px; /* 이미지와 테두리 사이 간격 */
    display: block; /* 이미지를 블록 요소로 처리 */
}

.vendor-carousel .owl-stage {
    display: flex;
    align-items: center;
}
    
 </style>
</head>
<script>
function fn_genderOption(gender)
{
   document.genderForm.gender.value = gender;
   document.genderForm.action = "/shop/shopList";
   document.genderForm.submit();
}

function fn_view(prodId)
{
   document.shopForm.prodId.value = prodId;
   document.shopForm.action = "/shop/detail";
   document.shopForm.submit();
}
</script>
<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>

    <!-- Navbar Start -->
    <div class="container-fluid mb-5">
        <div class="row px-xl-5">
            <div class="col-lg-9 swiper-container main-slider loading">
                <div class="swiper-wrapper">
                    <div class="swiper-slide">
                        <figure class="slide-bgimg" style="background-image:/resources/shop/img/mainShoes.jpg">
                            <img src="/resources/shop/img/mainShoes.jpg" class="entity-img" />
                        </figure>                        
                      <div class="content">
                        <p class="title" style="color: black;">SHOES</p>
                        <span class="caption"></span>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <figure class="slide-bgimg" style="background-image:/resources/shop/img/topIndex.png">
                        <img src="/resources/index/img/topIndex.png" class="entity-img" />
                      </figure>
                      <div class="content">
                        <p class="title" style="color: black;">TOP</p>
                        <span class="caption"></span>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <figure class="slide-bgimg" style="background-image:/resources/index/img/pantsIndex.jpg">
                        <img src="/resources/index/img/pantsIndex.jpg" class="entity-img" />
                      </figure>
                      <div class="content" style="color: black;">
                        <p class="title">PANTS</p>
                        <span class="caption"></span>
                      </div>
                    </div>
                    <div class="swiper-slide" style="color: black;">
                      <figure class="slide-bgimg" style="background-image:/resources/index/img/outerIndex.png">
                        <img src="/resources/index/img/outerIndex.png" class="entity-img" />
                      </figure>
                      <div class="content" style="color: black;">
                        <p class="title">OUTER</p>
                        <span class="caption"></span>
                      </div>
                    </div>
                    <div class="swiper-slide">
                      <figure class="slide-bgimg" style="background-image:/resources/index/img/productIndex.jpg">
                        <img src="/resources/index/img/productIndex.jpg" class="entity-img" />
                      </figure>
                      <div class="content" style="color: black;">
                        <p class="title">PRODUCT</p>
                        <span class="caption"></span>
                      </div>
                    </div>
                  </div>
                  <!-- If we need navigation buttons -->
                  <div class="swiper-button-prev swiper-button-white"></div>
                  <div class="swiper-button-next swiper-button-white"></div>
            </div>
            <div class="swiper-container nav-slider loading">
                <div class="swiper-wrapper" role="navigation">
                  <div class="swiper-slide">
                    <a href="javascript:void(0)" onclick="fn_cateList('SH')">
                        <figure class="slide-bgimg" style="background-image:url('/resources/shop/img/mainShoes.jpg')">
                            <img src="/resources/shop/img/mainShoes.jpg" class="entity-img" />
                        </figure>                    
                        <div class="content" style="color: black;">
                        <p class="title">SHOES</p>
                        </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="javascript:void(0)" onclick="fn_cateList('TP')">
                        <figure class="slide-bgimg" style="background-image:/resources/shop/img/topIndex.png">
                        <img src="/resources/index/img/topIndex.png" class="entity-img" />
                        </figure>
                        <div class="content" style="color: black;">
                        <p class="title">TOP</p>
                        </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="javascript:void(0)" onclick="fn_cateList('BT')">
                        <figure class="slide-bgimg" style="background-image:/resources/index/img/pantsIndex.jpg">
                        <img src="/resources/index/img/pantsIndex.jpg" class="entity-img" />
                        </figure>
                        <div class="content" style="color: black;">
                        <p class="title">PANTS</p>
                        </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="javascript:void(0)" onclick="fn_cateList('OU')">
                        <figure class="slide-bgimg" style="background-image:/resources/index/img/outerIndex.png">
                        <img src="/resources/index/img/outerIndex.png" class="entity-img" />
                        </figure>
                        <div class="content" style="color: black;">
                        <p class="title">OUTER</p>
                        </div>
                    </a>
                  </div>
                  <div class="swiper-slide">
                    <a href="javascript:void(0)" onclick="fn_cateList('AC')">
                        <figure class="slide-bgimg" style="background-image:/resources/index/img/productIndex.jpg">
                        <img src="/resources/index/img/productIndex.jpg" class="entity-img" />
                        </figure>
                        <div class="content" style="color: black;">
                        <p class="title">PRODUCT</p>
                        </div>
                    </a>
                  </div>
                </div>
              </div>
        </div>
    </div>
    <!-- Navbar End -->
    <script src='https://cdnjs.cloudflare.com/ajax/libs/Swiper/4.0.7/js/swiper.min.js'></script>
    <script  src="/resources/shop/js/main_swiper.js"></script>
    <!-- Categories Start -->
    
    <!-- Categories End -->

    <!-- Products Start -->
<div class="container-fluid pt-5">
    <div class="text-center mb-4">
        <h2 class="section-title px-5"><span class="px-2">Trendy Products</span></h2>
    </div>
    <div class="product-grid">
        <c:forEach var="prod" items="${list}" varStatus="status">
            <c:if test="${status.index < 8}">
                <div class="card product-item">
                <div class="card-header product-img">
                    <a href="javascript:void(0)" onclick="fn_view('${prod.prodId}');">
                        <img class="product-image" src="/resources/prod-img/${prod.prodMainCateId}/mainImg/${prod.prodId}.png" alt="">
                    </a>
                </div>
                <div class="card-body text-center">
                    <h6 class="text-truncate mb-3">${prod.prodName}</h6>
                    <div class="price d-flex justify-content-center">
                        <h6>
                            <fmt:formatNumber value="${prod.prodPrice - (prod.prodPrice * (prod.prodDiscountPercent / 100)).intValue()}" type="number" groupingUsed="true"/>￦
                        </h6>
                        <h6 class="text-muted ml-2">
                            <del><fmt:formatNumber value="${prod.prodPrice}" type="number" groupingUsed="true"/>￦</del>
                        </h6>
                    </div>
                </div>
                <div class="card-footer d-flex justify-content-between">
                    <div class="btn btn-sm text-dark wish" data-prod-id="${prod.prodId}">
                        <i class="heart <c:if test='${prod.heart != "Y"}'>bi-heart</c:if> <c:if test='${prod.heart == "Y"}'>bi-heart-fill</c:if>" 
                           id="heart-icon" style="font-size:15px; color: red; cursor: pointer;"></i> Wish
                    </div>
                </div>
            </div>

            </c:if>
        </c:forEach>
    </div>
</div>
<!-- Products End -->

   <!-- Vendor Start -->
   <div class="container-fluid py-5" style="padding-top: 7rem !important;">
       <div class="row px-xl-5">
           <div class="col">
               <div class="owl-carousel vendor-carousel">
                   <div class="vendor-item">
                       <img src="/resources/shop/img/nikeLogo.png" alt="Nike Logo" class="vendor-logo">
                   </div>
                   <div class="vendor-item">
                       <img src="/resources/shop/img/adidasLogo.jpg" alt="Adidas Logo" class="vendor-logo">
                   </div>
                   <div class="vendor-item">
                       <img src="/resources/shop/img/pumaLogo.png" alt="Puma Logo" class="vendor-logo">
                   </div>
                   <div class="vendor-item">
                       <img src="/resources/shop/img/onLogo.png" alt="On Logo" class="vendor-logo">
                   </div>
                   <div class="vendor-item">
                       <img src="/resources/shop/img/hokaLogo.png" alt="Hoka Logo" class="vendor-logo">
                   </div>
                   <div class="vendor-item">
                       <img src="/resources/shop/img/salomonLogo.png" alt="Salomon Logo" class="vendor-logo">
                   </div>
               </div>
           </div>
       </div>
   </div>
   <!-- Vendor End -->

    
    <form name="genderForm" id="genderForm" method="POST">
       <input type="hidden" name="gender" value="">
    </form>
    
    <form name="shopForm" method="POST">
       <input type="hidden" name="prodId" value="">
    </form>

<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>

</html>