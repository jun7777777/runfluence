<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    
 <style>
@media (min-width: 992px) {
    .col-lg-3 {
        flex: 0 0 25%;
        max-width: 15%;
    }
@media (min-width: 1200px) {
    .pl-xl-5, .px-xl-5 {
        padding-left: 3rem !important;
    }
}

.col-lg-9 {
    flex: 0 0 85%;
    max-width: 85%;
}

.product-grid {
    display: grid;
    grid-template-columns: repeat(auto-fill, minmax(400px, 2fr)); /* 반응형으로 카드 크기 설정 */
    gap: 25px; /* 카드 간격 */
    padding: 0 15px;
}
.pb-1, .py-1 {
    padding-bottom: 20px !important;
    }
.card.product-item {
   width: 100%; /* 원하는 카드 너비 */
    height: 100%; /* 원하는 카드 높이 */
    border: 1px solid #ddd;
    border-radius: 8px;
    overflow: hidden;
    background: #fff;
    box-shadow: 5px 0 6px rgba(0, 0, 0, 0.1);
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
 </style>
</head>

<script>
$(document).ready(function() {
   $("#array").change(function() {
           var array = $(this).val();
           document.shopForm.array.value = array;
           document.shopForm.submit();
   });
/*   
   $("#_searchValue").on("keypress", function (e) {
       if (e.key === "Enter") { // Enter 키 감지
           e.preventDefault(); // 기본 Enter 동작(폼 제출) 방지
           $("#searchBtn").click(); // 버튼 클릭 이벤트 호출
       }
   });
   
   $("#searchBtn").click(function(){
      if($.trim($("#_searchValue").val()).length <= 0) {
         alert("조회값을 입력하세요.");
         $("#_searchValue").val("");
         $("#_searchValue").focus();
         return;
      }
      
      document.shopForm.prodId.value = "";
      document.shopForm.searchValue.value = $("#_searchValue").val();
      document.shopForm.curPage.value = 1;
      
      document.shopForm.action = "/shop/shopList";
      document.shopForm.submit();
   });
*/
});

function fn_view(prodId)
{
   document.shopForm.prodId.value = prodId;
   document.shopForm.action = "/shop/detail";
   document.shopForm.submit();
}

function fn_list(curPage)
{
   document.shopForm.prodId.value = "";
   document.shopForm.curPage.value = curPage;
   document.shopForm.action = "/shop/shopList";
   document.shopForm.submit();
}

function genderOnlyOne(element) {
    $('input[name="gender"]').prop('checked', false);
    $(element).prop('checked', true);
    
    document.shopForm.action = "/shop/shopList";
    document.shopForm.submit();
}

function priceOnlyOne(element) {
    $('input[name="price"]').prop('checked', false);
    $(element).prop('checked', true);
    
    document.shopForm.action = "/shop/shopList";
    document.shopForm.submit();
}

function brandOnlyOne(element) {
    $('input[name="brand"]').prop('checked', false);
    $(element).prop('checked', true);
    
    document.shopForm.action = "/shop/shopList";
    document.shopForm.submit();
}

function materialOnlyOne(element) {
    $('input[name="material"]').prop('checked', false);
    $(element).prop('checked', true);
    
    document.shopForm.action = "/shop/shopList";
    document.shopForm.submit();
}

</script>

<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
    <!-- Shop Start -->
    <form name="shopForm" id="shopForm" method="post">
    <div class="container-fluid pt-5">
        <div class="row px-xl-5" style="padding-left: 10rem !important; padding-right: 10rem !important;">
            <!-- Shop Sidebar Start -->
            <div class="col-lg-3 col-md-12" style="max-width: auto;">
            
             <input type="hidden" name="prodId" value="">
             <input type="hidden" name="searchValue" value="${searchValue }">
               <input type="hidden" name="curPage" value="${curPage }">
               <input type="hidden" name="cateId" value="${cateId }">
                 <!-- Gender Start -->
                 <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">성별</h5>
                    
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="gender-all" name="gender" value="all" onclick='genderOnlyOne(this)' <c:if test='${gender == "all" }'> checked </c:if>>
                            <label class="custom-control-label check" for="gender-all">All</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="gender-1" name="gender" value="WOMAN" onclick='genderOnlyOne(this)' <c:if test='${gender == "WOMAN" }'> checked </c:if>>
                            <label class="custom-control-label check" for="gender-1">Women</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="gender-2" name="gender" value="MAN" onclick='genderOnlyOne(this)' <c:if test='${gender == "MAN" }'> checked </c:if>>
                            <label class="custom-control-label check" for="gender-2">Man</label>
                        </div>

                </div>
                <!-- Gender End -->
                <!-- Price Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">가격</h5>

                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-all" name="price" value="all" onclick='priceOnlyOne(this)' <c:if test='${price == "all" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-all">All Price</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-1" name="price" value="100000" onclick='priceOnlyOne(this)' <c:if test='${price == "100000" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-1">~ 10만원</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-2" name="price" value="200000" onclick='priceOnlyOne(this)' <c:if test='${price == "200000" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-2">10만원~20만원</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-3" name="price" value="300000" onclick='priceOnlyOne(this)' <c:if test='${price == "300000" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-3">20만원~30만원</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-4" name="price" value="400000" onclick='priceOnlyOne(this)' <c:if test='${price == "400000" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-4">30만원~40만원</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-5" name="price" value="500000" onclick='priceOnlyOne(this)' <c:if test='${price == "500000" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-5">40만원~50만원</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="price-6" name="price" value="600000" onclick='priceOnlyOne(this)' <c:if test='${price == "600000" }'> checked </c:if>>
                            <label class="custom-control-label check" for="price-6">50만원 이상</label>
                        </div>
                </div>
                <!-- Price End -->
                
                <!-- Color Start -->
                <div class="border-bottom mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">브랜드</h5>

                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-all" name="brand" value="all" onclick='brandOnlyOne(this)' <c:if test='${brand == "all" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-all">All Brand</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-1" name="brand" value="NIKE" onclick='brandOnlyOne(this)' <c:if test='${brand == "NIKE" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-1">Nike</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-2" name="brand" value="ADDIDAS" onclick='brandOnlyOne(this)' <c:if test='${brand == "ADDIDAS" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-2">Adidas</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-3" name="brand" value="PUMA" onclick='brandOnlyOne(this)' <c:if test='${brand == "PUMA" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-3">Puma</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-4" name="brand" value="ON" onclick='brandOnlyOne(this)' <c:if test='${brand == "ON" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-4">On</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-5" name="brand" value="HOKA" onclick='brandOnlyOne(this)' <c:if test='${brand == "HOKA" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-5">Hoka</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="brand-6" name="brand" value="other" onclick='brandOnlyOne(this)' <c:if test='${brand == "other" }'> checked </c:if>>
                            <label class="custom-control-label check" for="brand-6">Other</label>
                        </div>
                   </div>
                <!-- Color End -->
                
                <!-- Size Start material-->
                <div class="mb-4 pb-4">
                    <h5 class="font-weight-semi-bold mb-4">소재</h5>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="material-all" name="material" value="all" onclick='materialOnlyOne(this)' <c:if test='${material == "all" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-all">All</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="material-1" name="material" value="COTTON" onclick='materialOnlyOne(this)' <c:if test='${material == "COTTON" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-1">COTTON</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="material-2" name="material" value="POLYESTER" onclick='materialOnlyOne(this)' <c:if test='${material == "POLYESTER" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-2">POLYESTER</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="material-3" name="material" value="WOOL" onclick='materialOnlyOne(this)' <c:if test='${material == "WOOL" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-3">WOOL</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="material-4" name="material" value="SPANDEX" onclick='materialOnlyOne(this)' <c:if test='${material == "SPANDEX" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-4">SPANDEX</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between mb-3">
                            <input type="checkbox" class="custom-control-input" id="material-5" name="material" value="LINEN" onclick='materialOnlyOne(this)' <c:if test='${material == "LINEN" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-5">LINEN</label>
                        </div>
                        <div class="custom-control custom-checkbox d-flex align-items-center justify-content-between">
                            <input type="checkbox" class="custom-control-input" id="material-6" name="material" value="RAYON" onclick='materialOnlyOne(this)' <c:if test='${material == "RAYON" }'> checked </c:if>>
                            <label class="custom-control-label check" for="material-6">RAYON</label>
                        </div>
                   </div>
                
                <!-- Size2 End -->
            </div>
            <!-- Shop Sidebar End -->


            <!-- Shop Product Start -->
            <div class="col-lg-9 col-md-12" style="padding-left: 40px;">
                <div class="row pb-3">
                    <div class="col-12 pb-1">
                        <div class="d-flex align-items-center justify-content-between mb-4">
                            <form action="">
                                <div class="input-group">
                                    <div class="input-group-append">
                                    </div>
                                </div>
                            </form>
                            <div class="dropdown ml-4">
                         <select class="form-select border" id="array" name="array">
                             <option value="">정렬 기준</option>
                             <option value="1" <c:if test='${array == "1" }'> selected </c:if>>최신순</option>
                             <option value="2" <c:if test='${array == "2" }'> selected </c:if>>인기순</option>
                             <option value="3" <c:if test='${array == "3" }'> selected </c:if>>할인순</option>
                         </select>
                     </div>
                        </div>
                    </div>
                    
                    <!-- 단품 제품 영역 start -->
                    <c:if test="${!empty list}">
                    
                    <c:forEach var="prod" items="${list}" varStatus="status">
                    
                    <div class="col-lg-4 col-md-6 col-sm-12 pb-1">
                        <div class="card product-item border-0 mb-4">
                            <div class="card-header product-img bg-transparent border p-0">
                                <a href="javascript:void(0)" onclick="fn_view('${prod.prodId}');">
                                    <img class="product-image" src="/resources/prod-img/${prod.prodMainCateId }/mainImg/${prod.prodId }.png" alt="Colorful Stylish Shirt">
                                </a>
                            </div>
                            <div class="card-body border-left border-right text-center p-0 pt-4 pb-3">
                                <h6 class="text-truncate mb-3">${prod.prodName }</h6>
                                <div class="d-flex justify-content-center">
                                    <h6><fmt:formatNumber value="${prod.prodPrice - (prod.prodPrice * (prod.prodDiscountPercent / 100)).intValue()}" type="number" groupingUsed="true"/>￦</h6>
                                    <h6 class="text-muted ml-2"><del><fmt:formatNumber value="${prod.prodPrice}" type="number" groupingUsed="true"/>￦</del></h6>
                                </div>
                            </div>
                            <div class="card-footer d-flex justify-content-between bg-light border">
                                <div class="btn btn-sm text-dark p-0 wish" data-prod-id="${prod.prodId}">
                                    <i class="heart <c:if test='${prod.heart != "Y"}'>bi-heart</c:if> <c:if test='${prod.heart == "Y"}'>bi-heart-fill</c:if>" id="heart-icon" style="font-size:15px; color: red; cursor: pointer;"></i> Wish
                                </div>
                            </div>
                        </div>
                    </div>
                    </c:forEach>
                    
                    </c:if>
                    <!-- 단품 제품 영역 end -->
                    
                    <!-- 페이징 start -->
                    <c:if test="${!empty paging }">
                    <div class="col-12 pb-1">
                        <nav aria-label="Page navigation">
                          <ul class="pagination justify-content-center mb-3">
                          
                          <!-- 이전 페이징 start -->
                          <c:if test="${paging.prevBlockPage gt 0}">
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})" aria-label="Previous">
                                <span aria-hidden="true">&laquo;</span>
                                <span class="sr-only">Previous</span>
                              </a>
                            </li>
                            </c:if>
                            <!-- 이전 페이징 end -->
                            
                            <c:forEach var="i" begin="${paging.startPage }" end="${paging.endPage }">
                     <c:choose>
                        <c:when test="${paging.curPage ne i }">
                                  <li class="page-item"><a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a></li>
                        </c:when>
                        
                           <c:otherwise>
                                  <li class="page-item active"><a class="page-link" href="javascript:void(0)">${i}</a></li>
                               </c:otherwise>   
                     </c:choose>
                            </c:forEach>
                            <!-- 다음 페이징 start -->
                            <c:if test="${paging.nextBlockPage gt 0 }">
                            <li class="page-item">
                              <a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})" aria-label="Next">
                                <span aria-hidden="true">&raquo;</span>
                                <span class="sr-only">Next</span>
                              </a>
                            </li>
                            </c:if>
                            <!-- 다음 페이징 end -->
                            
                          </ul>
                        </nav>
                    </div>
                    </c:if>
                    <!-- 페이징 end -->
                    
                </div>
            </div>
            <!-- Shop Product End -->
        </div>
    </div>
    </form>
    <!-- Shop End -->
    
    <!-- form 태그 start -->
    

    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>

</html>