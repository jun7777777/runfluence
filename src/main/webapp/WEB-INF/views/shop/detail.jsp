<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="en">

<head>
<%@include file="/WEB-INF/views/include/shopHead.jsp" %>
<link href="/resources/shop/css/reviewModal.css" rel="stylesheet">
<style>
.btn-spaced {
    margin: 0 10px; /* 좌우 여백을 10px로 설정 */
}
</style>
</head>
<script>
$(document).ready(function () {
    // 메시지 전송 버튼 클릭 이벤트
    $("#sendMessageButton").click(function () {
        // Form 데이터 가져오기
        const userName = $("#userName").val();
        const userEmail = $("#userEmail").val();
        const prodName = $("#prodName").val();
        const message = $("#message").val();

        // 입력값 유효성 검사
        if (!userName || !userEmail || !prodName || !message) {
           Swal.fire({
                icon: "error",
                title: "입력란을 모두 작성해주세요"
              });
            return;
        }

        console.log("이메일 테스트 : ", userEmail);

        // Ajax 요청
        $.ajax({
            type: "POST",
            url: "/shop/sendEmail",
            data: {
                userEmail: userEmail,
                userName: userName,
                prodName: prodName,
                message: message
            },
            datatype: 'JSON',
            success: function (response) {
                if (response.code == 0) {
                    alert("이메일이 성공적으로 전송되었습니다.");
                    $("#contactForm")[0].reset(); // 폼 초기화
                } else {
                    alert("이메일 전송 중 오류가 발생했습니다.");
                }
            },
            error: function (xhr, status, error) {
                icia.common.error(error);
                Swal.fire({
                  icon: "error",
                  title: "이메일 전송 중 오류가 발생했습니다."
                });
            }
        });
    });

    // 별점 초기값
    var rating = 0;

    // 별점 클릭 이벤트
    $(".reviewStar").on("click", function () {
        var index = $(this).data("index"); // 클릭된 별의 index 가져오기
        rating = index; // 별점 값 설정

        // 모든 별 초기화
        $(".reviewStar").removeClass("fas fa-star").addClass("far fa-star");

        // 클릭된 별과 이전 별들 활성화
        $(".reviewStar").each(function () {
            if ($(this).data("index") <= index) {
                $(this).removeClass("far fa-star").addClass("fas fa-star");
            }
        });

        // hidden input에 별점 값 설정
        $("#rating").val(rating);
        $("#ratingUpdate").val(rating);
        console.log(rating); // 별점 값 확인
    });

    // 리뷰 등록 버튼 클릭 이벤트
    $("#reviewBtn").on("click", function () {
        if ($.trim($("#content").val()).length <= 0) {
            alert("내용을 입력하세요");
            $("#content").val("").focus();
            return;
        }

        if ($.trim($("#userReviewEmail").val()).length <= 0) {
            alert("아이디를 입력하세요");
            $("#userReviewEmail").val("").focus();
            return;
        }

        const form = $('#reviewForm')[0]; // JavaScript DOM 객체로 변환
        const formData = new FormData(form);

        formData.append('userReviewEmail', $('#userReviewEmail').val());
        formData.append('prodId', "${prod.prodId}");
        formData.append('reviewContent', $('#content').val());
        formData.append('reviewRating', $('#rating').val());

        const files = $('#tt-add-photos-input')[0].files; // 파일 input 요소에서 파일 가져오기
        if (files.length > 5) {
            alert("파일은 최대 5개까지만 등록 가능합니다.");
            return;
        }
        
        $.ajax({
            url: "/shop/reviewAdd",
            type: "POST",
            enctype: "multipart/form-data",
            data: formData,
            datatype: 'JSON',
            processData: false,
            contentType: false,
            cache: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("AJAX", "true");
            },
            success: function (response) {
                if (response.code == 0) {
                   $('#tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
                   Swal.fire({
                      title: "리뷰가 성공적으로 등록 되었습니다.",
                      text: "확인버튼을 눌러주세요",
                      icon: "success"
                    }).then(() => {
                          // 필요 시 페이지 새로고침 또는 다른 작업
                          window.location.reload(true);
                      });
                } else {
                    alert("리뷰 등록 중 오류 발생");
                }
            },
            error: function (xhr, status, error) {
                icia.common.error(error);
                alert("리뷰 등록 중 오류가 발생되었습니다.");
            }
        });
    });
    // 모달 닫기
    $('#close-review-modal').on('click', function () {
        $('#tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
    });
    
    
    // 리뷰 수정 버튼 클릭 이벤트
    $("#reviewUpdateBtn").on("click", function () {
        if ($.trim($("#contentUpdate").val()).length <= 0) {
            alert("내용을 입력하세요");
            $("#contentUpdate").val("").focus();
            return;
        }

        if ($.trim($("#userReviewUpdateEmail").val()).length <= 0) {
            alert("아이디를 입력하세요");
            $("#userReviewUpdateEmail").val("").focus();
            return;
        }

        const form = $('#reviewUpdateForm')[0]; // JavaScript DOM 객체로 변환
        const formData = new FormData(form);

        formData.append('userReviewEmail', $('#userReviewUpdateEmail').val());
        formData.append('prodId', "${prod.prodId}");
        formData.append('reviewContent', $('#contentUpdate').val());
        formData.append('reviewRating', $('#ratingUpdate').val());
        formData.append('reviewSeq', $('#reviewSeq').val());

        const files = $('#update-tt-add-photos-input')[0].files; // 파일 input 요소에서 파일 가져오기

        $.ajax({
            url: "/shop/reviewUpdate",
            type: "POST",
            enctype: "multipart/form-data",
            data: formData,
            datatype: 'JSON',
            processData: false,
            contentType: false,
            cache: false,
            beforeSend: function (xhr) {
                xhr.setRequestHeader("AJAX", "true");
            },
            success: function (response) {
                if (response.code == 0) {
                   // 모달 창 닫기
                    $('#update-tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
                   
                   Swal.fire({
                        title: "리뷰가 성공적으로 수정 되었습니다.",
                        text: "확인버튼을 눌러주세요",
                        icon: "success"
                      }).then(() => {
                            // 필요 시 페이지 새로고침 또는 다른 작업
                            window.location.reload(true);
                        });
                } else if (response.code == 500) {
                   alert("500");
                } else if (response.code == 402) {
                   alert("402");
                } else if (response.code == 405) {
                   alert("405")
                } else if (response.code == 400) {
                   alert("400");
                } else {
                    alert("리뷰 수정 중 오류 발생");
                }
            },
            error: function (xhr, status, error) {
                icia.common.error(error);
                alert("리뷰 수정 중 오류가 발생되었습니다.");
            }
        });
    });
   
 // 수정 모달 닫기 버튼 클릭 이벤트
    $('#update-close-review-modal').on('click', function () {
        $('#update-tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
    });
 
    // 위시리스트 하트 클릭 이벤트
    $('.heart-wish').on('click', function () {
        const heartIcon = $(this).find('.detail-heart'); // 버튼 내부의 하트 아이콘
        const prodId = $(this).data('prod-id'); // 제품 ID 가져오기

        if (heartIcon.hasClass('bi-heart')) {
            // 위시리스트 추가
            $.ajax({
                url: '/wishlist/add',
                method: 'POST',
                data: { prodId: prodId },
                datatype: 'JSON',
                success: function (response) {
                    if (response.code === 0) {
                        heartIcon.removeClass('bi-heart').addClass('bi-heart-fill'); // 하트 모양 변경
                        Swal.fire({
                             title: "위시리스트에 추가 되었습니다!",
                             icon: "success"
                           });
                    } else {
                        alert(response.message || '위시리스트 추가 중 오류가 발생했습니다.');                    
               }
                },
                error: function (xhr, status, error) {
                    icia.common.error(error);
                    alert('위시리스트 추가 중 오류가 발생했습니다.');
                }
            });
        } else {
            // 위시리스트 제거
            $.ajax({
                url: '/wishlist/del',
                method: 'POST',
                data: { prodId: prodId },
                datatype: 'JSON',
                success: function (response) {
                    if (response.code === 0) {
                        heartIcon.removeClass('bi-heart-fill').addClass('bi-heart'); // 하트 모양 변경
                        Swal.fire({
                             title: "위시리스트에서 제거되었습니다!",
                             icon: "success"
                           });
                    } else {
                        alert(response.message || '위시리스트 제거 중 오류가 발생했습니다.');
                    }
                },
                error: function (xhr, status, error) {
                    icia.common.error(error);
                    alert('위시리스트 제거 중 오류가 발생했습니다.');
                }
            });
        }
    });

    // 장바구니 추가 버튼 클릭 이벤트
    $("#cartBtn").on("click", function (event) {
        event.preventDefault(); // 기본 폼 제출 방지

        const selectOption = $('input[name="size"]:checked').val();
        const selectedSize = $('input[name="shoesSize"]:checked').val();
        const selectedColor = $('input[name="color"]:checked').val();
        const cartQuantity = $("#cartQuantity").val();

        const isSizeOptionVisible = $('input[name="shoesSize"]').length > 0;
        const isColorOptionVisible = $('input[name="color"]').length > 0;

        let variantsOptionValueCombId = "";

        if (selectOption) {
            variantsOptionValueCombId = selectOption;
        } else if (isSizeOptionVisible || isColorOptionVisible) {
            if (!selectedSize || !selectedColor) {
                alert("사이즈와 색상을 모두 선택해 주세요.");
                return;
            }
            variantsOptionValueCombId = selectedSize + '_' + selectedColor;
        } else {
            variantsOptionValueCombId = "DEFAULT";
        }

        $.ajax({
            url: "/shop/cartInsert",
            type: "POST",
            data: {
                variantsOptionValueCombId: variantsOptionValueCombId,
                prodId: "${prodId}",
                cartQuantity: cartQuantity
            },
            datatype: "JSON",
            success: function (res) {
                if (res.code == 200) {
                   Swal.fire({
                        icon: "success",
                        title: "장바구니에 추가되었습니다!",
                      });
                } else if (res.code == 400) {
                   Swal.fire({
                      icon: "error",
                      title: "재고가 소진되었습니다.",
                    });
                } else if (res.code == 409) {
                   Swal.fire({
                	   icon: "warning",
                	   title: "장바구니에 존재합니다."});
                } else {
                   Swal.fire({
                        icon: "error",
                        title: "오류가 발생했습니다",
                        text: "다시 시도해주세요!",
                      });
               }
           },
           error: function (xhr, status, error) {
               alert("오류가 발생했습니다. 다시 시도해주세요.");
           }
       });
   });
   
   // 모달 열기
    $('#open-review-modal').on('click', function () {
        $('#tt-submission-modal').css('display', 'block').attr('aria-hidden', 'false');
    });

    /* 모달 닫기
    $('#close-review-modal').on('click', function () {
        $('#tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
    });
   */
    
    // 모달 외부 클릭 시 닫기
    $(window).on('click', function (event) {
        if ($(event.target).is('#tt-submission-modal')) {
            $('#tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
        }
    });
    
    /* 수정 모달 닫기
    $('#update-close-review-modal').on('click', function () {
        $('#update-tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
    });
   */
   
    // 수정 모달 외부 클릭 시 닫기
    $(window).on('click', function (event) {
        if ($(event.target).is('#tt-submission-modal')) {
            $('#update-tt-submission-modal').css('display', 'none').attr('aria-hidden', 'true');
        }
    }); 
});

function editReviewModal(reviewSeq) {
    // Ajax를 통해 reviewSeq 값을 서버로 전달
    $.ajax({
        type: 'POST',
        url: '/shop/reviewSel', // 컨트롤러의 매핑 URL
        data: { reviewSeq: reviewSeq },
        datatype: "JSON",
        success: function (res) {
            // 서버에서 받은 데이터를 기반으로 모달에 값 세팅
            $('#contentUpdate').val(res.data.reviewContent);
            $('#userReviewUpdateEmail').val(res.data.userEmail);
            $('#ratingUpdate').val(res.data.reviewRating);
            $('#reviewSeq').val(res.data.reviewSeq);

            // 별점 초기화 및 세팅
         const rating = res.data.reviewRating; // 가져온 rating 값
         console.log(rating);

         $(".reviewStar").each(function () {
             var starIndex = $(this).data("index"); // 각 별의 data-index 값 가져오기
             if (starIndex <= rating) {
                 $(this).removeClass("far").addClass("fas"); // 별을 채움
             } else {
                 $(this).removeClass("fas").addClass("far"); // 빈 별로 설정
             }
         });

            // 모달 열기
            $('#update-tt-submission-modal').css('display', 'block').attr('aria-hidden', 'false');
        },
        error: function (xhr, status, error) {
            console.error('Ajax Error:', error);
            alert('리뷰 데이터를 불러오는 데 실패했습니다.');
        }
    });
}

function deleteReview(reviewSeq) {
    const swalWithBootstrapButtons = Swal.mixin({
        customClass: {
            confirmButton: "btn btn-success btn-spaced",
            cancelButton: "btn btn-danger btn-spaced"
        },
        buttonsStyling: false
    });

    swalWithBootstrapButtons.fire({
        title: "리뷰를 삭제하시겠습니까?",
        icon: "warning",
        showCancelButton: true,
        confirmButtonText: "삭제",
        cancelButtonText: "취소",
        reverseButtons: true
    }).then((result) => {
        if (result.isConfirmed) {
            // 삭제 확인 시에만 AJAX 요청 실행
            $.ajax({
                url: "/shop/reviewDel",
                type: "POST",
                data: {
                    reviewSeq: reviewSeq,
                    prodId: "${prodId}"
                },
                datatype: "JSON",
                success: function (res) {
                    if (res.code == 0) {
                        swalWithBootstrapButtons.fire({
                            title: "삭제되었습니다.",
                            text: "리뷰가 삭제되었습니다.",
                            icon: "success",
                        });

                        // 1초 후 화면 새로고침
                        setTimeout(() => {
                            window.location.reload(true);
                        }, 1800);
                    } else {
                        alert("리뷰 삭제에 실패했습니다. 다시 시도해주세요.");
                    }
                },
                error: function () {
                    alert("리뷰 삭제 중 오류가 발생했습니다. 다시 시도해주세요.");
                }
            });
        } else if (result.dismiss === Swal.DismissReason.cancel) {
            // 취소 버튼 눌렀을 때는 아무 작업도 하지 않음
            swalWithBootstrapButtons.fire({
                title: "취소되었습니다.",
                icon: "error"
            });
        }
    });
}


</script>
<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
    <!-- Shop Detail Start -->
<div class="container-fluid py-5">
   <div class="row px-xl-5">
      <div class="col-lg-5 pb-5">
         <div id="product-carousel" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner border">
               <c:forEach var="i" begin="1" end="5">
                    <div class="carousel-item ${i == 1 ? 'active' : ''}">
                        <img class="w-100 h-100" src="/resources/prod-img/${prod.prodMainCateId}/mainImg/${prod.prodId}_${i}.png" alt="Image">
                    </div>
                </c:forEach>
            </div>
            <a class="carousel-control-prev" href="#product-carousel" data-slide="prev">
               <i class="fa fa-2x fa-angle-left text-dark"></i>
            </a>
            <a class="carousel-control-next" href="#product-carousel" data-slide="next">
               <i class="fa fa-2x fa-angle-right text-dark"></i>
            </a>
         </div>
      </div>

      <div class="col-lg-7 pb-5">
         <div class="product-title">
            <h3 class="font-weight-semi-bold mb-0">${prod.prodName }</h3>
         </div>
                
         <div class="d-flex mb-3">
            <div class="text-primary mr-2">
               <c:forEach var="i" begin="1" end="${fullStars}">
                  <small class="fas fa-star"></small>
                </c:forEach>
                <c:if test="${hasHalfStar}">
                    <small class="fas fa-star-half-alt"></small>
                </c:if>
                <c:forEach var="i" begin="1" end="${emptyStars}">
                    <small class="far fa-star"></small>
                </c:forEach>
            </div>
            <small class="pt-1">(${reviewCount } Reviews)</small>
         </div>
         
         <h3 class="font-weight-semi-bold mb-4">₩<fmt:formatNumber value="${prod.prodPrice}" type="number" groupingUsed="true"/></h3>
              
         <c:if test='${!empty optionList}'>
         <div class="d-flex mb-3">
            <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
            <c:forEach var="optionlist" items="${optionList}" varStatus="status">
               <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" class="custom-control-input" id="size-${status.index}" name="size" value="${optionlist.vauleId}">
                  <label class="custom-control-label" for="size-${status.index}">${optionlist.varOptionName }</label>
                      </div>
            </c:forEach>           
         </div>
         </c:if>
                
         <c:if test='${!empty sizeList}'>
         <div class="d-flex mb-3">
            <p class="text-dark font-weight-medium mb-0 mr-3">Sizes:</p>
            <c:forEach var="sizelist" items="${sizeList}" varStatus="status">
               <div class="custom-control custom-radio custom-control-inline">
                  <!-- 각 size의 ID를 status.index로 고유하게 설정 -->
                  <input type="radio" class="custom-control-input" id="shoesSize-${status.index}" name="shoesSize" value="${sizelist.vauleId}">
                  <label class="custom-control-label" for="shoesSize-${status.index}">${sizelist.varOptionName}</label>
               </div>
            </c:forEach>
         </div>
         </c:if>

         <c:if test='${!empty colorList}'>
         <div class="d-flex mb-3">
            <p class="text-dark font-weight-medium mb-0 mr-3">Colors:</p>
            <c:forEach var="colorlist" items="${colorList}" varStatus="status">
               <div class="custom-control custom-radio custom-control-inline">
                  <input type="radio" class="custom-control-input" id="color-${status.index}" name="color" value="${colorlist.vauleId}">
                  <label class="custom-control-label" for="color-${status.index}" style="font-size:12px;">${colorlist.varOptionName }</label>
               </div>
            </c:forEach>
         </div>
         </c:if>
            
         <div class="d-flex align-items-center mb-4 pt-2">
            <div class="input-group quantity mr-3" style="width: 130px;">
               <div class="input-group-btn">
                  <button class="btn btn-primary btn-minus" >
                     <i class="fa fa-minus"></i>
                  </button>
               </div>
               <input type="text" class="form-control bg-secondary text-center" id="cartQuantity" value="1" readonly>
               <div class="input-group-btn">
                  <button class="btn btn-primary btn-plus">
                     <i class="fa fa-plus"></i>
                  </button>
               </div>
            </div>
            <button class="btn btn-primary px-3" id="cartBtn"><i class="fa fa-shopping-cart mr-1"></i> 장바구니</button>
            <button class="btn btn-primary px-3 heart-wish" data-prod-id="${prod.prodId}"><i class="detail-heart <c:if test='${prod.heart != "Y"}'>bi-heart</c:if> <c:if test='${prod.heart == "Y"}'>bi-heart-fill</c:if>" style="font-size:20px; color: red; cursor: pointer; padding-top:3px; padding-right:5px;"></i>위시리스트</button>
         </div>
                
      </div>
   </div>
   
   <div class="row px-xl-5">
      <div class="col">
         <div class="nav nav-tabs justify-content-center border-secondary mb-4">
            <a class="nav-item nav-link active" data-toggle="tab" href="#tab-pane-1">상품상세</a>
            <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-2">상품문의</a>
            <a class="nav-item nav-link" data-toggle="tab" href="#tab-pane-3">Reviews (${reviewCount })</a>
         </div>
         <div class="tab-content">
            <div class="tab-pane fade show active" id="tab-pane-1">
               <h4 class="mb-3">${prod.prodName }</h4>
               <p style="white-space: pre-line;">${prod.prodInfo }</p>
            </div>
            <div class="tab-pane fade" id="tab-pane-2">
               <div class="container-fluid pt-5">
                  <div class="text-center mb-4">
                     <h2 class="section-title px-5"><span class="px-2">상품 문의</span></h2>
                  </div>
                        <div class="row px-xl-5">
                     <div class="col-lg-7 mb-5">
                        <div class="contact-form">
                           <div id="success"></div>
                              <form name="sentMessage" id="contactForm" novalidate="novalidate">
                                 <div class="control-group">
                                    <input type="text" class="form-control" id="userName" placeholder="이름"
                                       required="required" data-validation-required-message="Please enter your name" />
                                      <p class="help-block text-danger"></p>
                                  </div>
                                  <div class="control-group">
                                      <input type="email" class="form-control" id="userEmail" placeholder="이메일"
                                          required="required" data-validation-required-message="Please enter your email" />
                                      <p class="help-block text-danger"></p>
                                  </div>
                                  <div class="control-group">
                                      <input type="text" class="form-control" id="prodName" placeholder="상품명"
                                          required="required" data-validation-required-message="Please enter a prodName" value="${prod.prodName }"/>
                                      <p class="help-block text-danger"></p>
                                  </div>
                                  <div class="control-group">
                                      <textarea class="form-control" rows="6" id="message" placeholder="문의 내용"
                                          required="required" data-validation-required-message="Please enter your message"></textarea>
                                      <p class="help-block text-danger"></p>
                                  </div>
                                  <div>
                                      <button class="btn btn-primary py-2 px-4" type="button" id="sendMessageButton">Send
                                          Message</button>
                                  </div>
                              </form>
                        </div>
                     </div>
                     <div class="col-lg-5 mb-5">
                                <h5 class="font-weight-semi-bold mb-3">교환 및 반품 안내</h5>
                                <p style="white-space: pre-line; font-size: 15px;">상품 수령일로부터 7일 이내에 교환/반품 신청을 해주시기 바랍니다.
                                    다음과 같은 경우 교환 및 반품 처리가 불가합니다.
                                    &#128095; 상품을 이미 사용한 경우
                                    &#128095; 상품 수령일로부터 7일이 경과한 경우
                                    &#128095; 상품과 상품 액세서리(신발박스, 가격 택, 라벨, 폴리백 포장 등)를 분실 또는 훼손한 경우
                                    &#128095; 구매한 상품의 구성품(세트 상품 중 일부상품, 사은품, 증정품 등)이 누락된 경우
                                    &#128095; 상품 교환 안내
                                    </p>
                        <div class="d-flex flex-column mb-3">
                           <h5 class="font-weight-semi-bold mb-3">기타 문의사항 및 FAQs는 <a href="/notice/notice" style="color: #036635;">문의게시판</a>을 확인하세요</h5>
                        </div>
                     </div>
                  </div>
               </div>
            </div>
                    
            <div class="tab-pane fade" id="tab-pane-3">
               <h4 class="mb-4">리뷰 (${reviewCount})</h4>
               <div class="row">
                  <div class="col-md-6">
                      <c:if test="${!empty reviewList}">
                       <c:forEach var="reviewlist" items="${reviewList}" varStatus="status">
                        <c:if test="${status.index < 4}"> <!-- 첫 번째 그룹: 0 ~ 3 -->
                         
                         <div class="media mb-4">
                             <img src="/resources/profile/${user.userProfileImg}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px; height: 45px; border-radius: 50%;">
                             <div class="media-body">
                                 <h6>${reviewlist.userName}<small> - <i>${reviewlist.reviewDate}</i></small></h6>
                              
                                 <div class="text-primary mb-2">
                                     <c:forEach begin="1" end="5" var="i">
                                         <c:choose>
                                             <c:when test="${i <= reviewlist.reviewRating}">
                                                 <!-- Full star -->
                                                 <i class="fas fa-star"></i>
                                             </c:when>
                                             <c:otherwise>
                                                 <!-- Empty star -->
                                                 <i class="far fa-star"></i>
                                             </c:otherwise>
                                         </c:choose>
                              </c:forEach>
                                 </div>
                                 <p>${reviewlist.reviewContent}</p>
                                 <c:if test='${reviewlist.userEmail == userEmail }'>
                                 <div style="text-align: right;">
                                 <small><a href="javascript:void(0);" onclick="editReviewModal(${reviewlist.reviewSeq});" style="margin-right: 10px; color:black;">수정</a></small>
                                 <small><a href="javascript:void(0);" onclick="deleteReview(${reviewlist.reviewSeq});" style="color: red;">삭제</a></small>
                             </div>
                             </c:if>
                             </div>
                         </div>
                        </c:if>
                       </c:forEach>
                      </c:if>
                  </div>
                     
                  <div class="col-md-6">
                     <c:if test="${!empty reviewList}">
                     <c:forEach var="reviewlist" items="${reviewList}" varStatus="status">
                     <c:if test="${status.index >= 4 && status.index < 8}"> <!-- 두 번째 그룹: 4 ~ 7 -->
                     <div class="media mb-4">
                        <img src="/resources/profile/${user.userProfileImg}" alt="Image" class="img-fluid mr-3 mt-1" style="width: 45px; height: 45px; border-radius: 50%;">
                        <div class="media-body">
                           <h6>${user.userName}<small> - <i>${reviewlist.reviewDate}</i></small></h6>
                           <div class="text-primary mb-2">
                              <c:forEach begin="1" end="5" var="i">
                                 <c:choose>
                                 <c:when test="${i <= reviewlist.reviewRating}">
                                    <!-- Full star -->
                                    <i class="fas fa-star"></i>
                                 </c:when>
                                 
                                 <c:otherwise>
                                    <!-- Empty star -->
                                    <i class="far fa-star"></i>
                                 </c:otherwise>
                                 </c:choose>
                              </c:forEach>
                           </div>
                           <p>${reviewlist.reviewContent}</p>
                           <c:if test='${reviewlist.userEmail == userEmail }'>
                           <div style="text-align: right;">
                                 <small><a href="javascript:void(0);" onclick="editReviewModal(${reviewlist.reviewSeq});" style="margin-right: 10px; color:black;">수정</a></small>
                                 <small><a href="javascript:void(0);" onclick="deleteReview(${reviewlist.reviewSeq});" style="color: red;">삭제</a></small>
                             </div>
                             </c:if>
                        </div>
                     </div>
                     </c:if>
                     </c:forEach>
                     </c:if>
                  </div>
                  <div class="text-center mt-4" style="margin-left: auto;">
                     <button type="button" class="btn btn-primary" id="open-review-modal">리뷰 작성하기</button>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>
</div>
<!-- Shop Detail End -->

<!-- 리뷰 모달 시작 -->
<div id="tt-submission-modal" style="display: none;" aria-hidden="true" data-v-app="">
    <div class="tt-o-modal tt-w-submission-modal tt-w-submission-modal__review-form" role="dialog" aria-label="제출 창" aria-modal="true" id="tt-submission-modal">
        <div class="tt-o-modal__container" tabindex="-1">
            <div class="tt-o-modal__close">
                <button class="tt-o-button tt-o-button--icon tt-o-modal__close-btn" aria-label="제출 창 닫기" title="제출 창 닫기" type="button">
                    <!--<svg class="tt-o-icon tt-o-icon--close tt-o-icon--xs" aria-hidden="true" focusable="false">
                        <use xlink:href="#tt-icon-close"></use>
                    </svg>-->
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="36" height="36" viewBox="0,0,256,256" id="close-review-modal" aria-hidden="true">
                  <g fill="#ebebeb" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M128,248.32c-66.4509,0 -120.32,-53.8691 -120.32,-120.32v0c0,-66.4509 53.8691,-120.32 120.32,-120.32v0c66.4509,0 120.32,53.8691 120.32,120.32v0c0,66.4509 -53.8691,120.32 -120.32,120.32z" id="shape"></path></g><g fill="#000000" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.12,5.12)"><path d="M11.5,11c-0.128,0 -0.25602,0.04898 -0.35352,0.14648c-0.097,0.098 -0.14648,0.22552 -0.14648,0.35352c0,0.128 0.04848,0.25552 0.14648,0.35352l13.14649,13.14648l-13.14648,13.14648c-0.195,0.195 -0.195,0.51203 0,0.70703c0.098,0.097 0.22552,0.14648 0.35352,0.14648c0.128,0 0.25552,-0.04848 0.35352,-0.14648l13.14648,-13.14648l13.14648,13.14648c0.195,0.195 0.51203,0.195 0.70703,0c0.195,-0.196 0.196,-0.51103 0,-0.70703l-13.14648,-13.14648l13.14648,-13.14648c0.195,-0.195 0.195,-0.51203 0,-0.70703c-0.196,-0.195 -0.51103,-0.196 -0.70703,0l-13.14648,13.14649l-13.14648,-13.14648c-0.0975,-0.0975 -0.22552,-0.14648 -0.35352,-0.14648z"></path></g></g>
               </svg>
                </button>
            </div>
            <div class="tt-o-modal__body">
                <div class="tt-submission-mediator">
                    <div class="tt-c-review-form">
                        <form class="tt-c-review-form__form tt-u-spacing--xl" id="reviewForm" name="reviewForm" method="post" enctype="multipart/form-data">   <!-- enctype="multipart/form-data" -->
                            <!-- Header -->
                            <div class="tt-c-review-form-header-container">
                                <div class="tt-c-review-form-header">
                                    <div class="tt-c-review-form-header__content--left">
                                        <div class="tt-c-review-form-header__heading" role="heading" aria-level="2">리뷰 작성</div>
                                        <p class="tt-c-review-form-header__text">제품에 대한 리뷰를 작성해 주세요</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Product Section -->
                            <div class="tt-c-review-flow-product tt-c-review-flow-product--review-form tt-c-review-form__item">
                                <img src="/resources/prod-img/${cateId}/mainImg/${prod.prodId}.png" alt="" class="tt-o-product__image tt-c-review-flow-product__item-image" loading="lazy">
                                <div class="tt-c-review-flow-product__item-heading">
                                    <div class="tt-c-review-flow-product__item-title">${prod.prodName}</div>
                                </div>
                            </div>

                            <!-- Rating Section -->
                            <fieldset class="tt-u-spacing--lg">
                                <fieldset class="tt-o-field-group tt-u-spacing--xs tt-c-review-form__overall-rating" aria-required="true" aria-labelledby="tt-review-form-rating" role="radiogroup">
                                    <legend class="tt-o-field-group__label" id="tt-review-form-rating">
                                        <span class="tt-o-field-group__label-text">평점</span>
                                        <span class="tt-o-field-group__required" style="font-size: 1rem;"> *</span>
                                    </legend>
                                    <div class="tt-c-rating tt-c-rating--actionable">
                                        <div class="text-primary">
                                            <i class="reviewStar far fa-star" data-index="1" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="2" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="3" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="4" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="5" style="font-size: 30px; color: #F1C40F !important;"></i>
                                        </div>
                              <input type="hidden" id="rating" name="rating" value="0">
                                    </div>
                                </fieldset>

                                <!-- Review Text Section -->
                                <div class="tt-o-field-group tt-u-spacing--xs tt-c-review-form__body-text">
                                    <label class="tt-o-field-group__label" for="tt-review-form-text">
                                        <span class="tt-o-field-group__label-text">내 리뷰</span>
                                        <span class="tt-o-field-group__required"> *</span>
                                    </label>
                                    <textarea class="tt-o-textarea" required="" id="content" name="tt-review-form-text" rows="5"></textarea>
                                    <div class="tt-o-hint tt-o-hint--info tt-u-spacing--left--xs" id="tt-review-form-text-hint">
                                        <svg class="tt-o-icon tt-o-icon--info tt-o-icon--xs tt-o-hint__icon" aria-hidden="true" focusable="false">
                                            <use xlink:href="#tt-icon-info"></use>
                                        </svg>
                                        <span class="tt-o-hint__text">마음에 들었던 점과 그렇지 않았던 점, 다른 구매자들에게 도움이 될 내용 등을 작성해 주세요. (최소 30자)</span>
                                    </div>
                                </div>

                                <!-- User ID Section -->
                                <div class="tt-o-field-group tt-u-spacing--xs tt-c-review-form__title">
                                    <label class="tt-o-field-group__label" for="tt-review-form-title">
                                        <span class="tt-o-field-group__label-text">아이디</span>
                                    </label>
                                    <input class="tt-o-text-field" aria-invalid="false" type="text" id="userReviewEmail" aria-describedby="tt-hint-6ff1aa1d54" value="${userEmail}">
                                    <div class="tt-o-hint tt-o-hint--info tt-u-spacing--left--xs" id="tt-hint-6ff1aa1d54">
                                        <svg class="tt-o-icon tt-o-icon--info tt-o-icon--xs tt-o-hint__icon tt-o-hint__icon" aria-hidden="true" focusable="false">
                                            <use xlink:href="#tt-icon-info"></use>
                                        </svg>
                                        <span class="tt-o-hint__text"></span>
                                    </div>
                                </div>

                                <!-- Media Section -->
                                <div class="tt-o-field-group tt-u-spacing--xs tt-c-added-media tt-c-added-media--alt tt-c-review-form__added-media">
                                    <label class="tt-o-field-group__label" id="added-media-label">
                                        <span class="tt-o-field-group__label-text">사진 추가</span>
                                    </label>
                                    <div class="tt-o-hint tt-o-hint--info tt-u-spacing--left--xs tt-o-hint--above" id="tt-add-media-desc">
                                        <svg class="tt-o-icon tt-o-icon--info tt-o-icon--xs tt-o-hint__icon tt-o-hint__icon" aria-hidden="true" focusable="false">
                                            <use xlink:href="#tt-icon-info"></use>
                                        </svg>
                                        <span class="tt-o-hint__text">제품 착용 모습, 스타일링을 보여주는 사진을 추가하세요. (최대 5장)</span>
                                    </div>
                                    <div class="tt-c-added-media__items-area">
                                        <div class="tt-c-added-media__items">
                                            <div class="tt-c-added-media__add-photo">
                                                <!-- 사진 추가 버튼 -->
                                                <label class="tt-c-added-media__add-photo" for="tt-add-photos-input">
                                                    <div class="tt-u-clip-hide">사진 추가</div>
                                                    <button class="tt-o-button tt-o-button--tertiary tt-c-added-media__add-photo-btn tt-c-added-media__add-photo-btn" aria-describedby="tt-add-media-desc" type="button" onclick="document.getElementById('tt-add-photos-input').click();">
                                                        <img width="36" height="36" src="https://img.icons8.com/ios-glyphs/30/plus-math.png" alt="plus-math"/>
                                                    </button>
                                                </label>
                                                
                                                <!-- 실제 사진 첨부를 위한 파일 입력 -->
                                                <input id="tt-add-photos-input" type="file" name="reviewFiles" accept="image/jpeg,image/jpg,image/pjpeg,image/png,image/x-png" multiple tabindex="-1" style="display: none;">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="tt-c-review-form__actions">
                                    <button class="tt-o-button tt-o-button--primary tt-c-review-form__submit tt-c-review-form__submit" type="button" id="reviewBtn">등록</button>
                                    <div class="tt-o-spinner tt-o-spinner--submit" style="display: none;"></div>
                                </div>
                            </fieldset>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 리뷰 모달 끝 -->

<!-- 리뷰 수정 모달 시작 -->
<div id="update-tt-submission-modal" style="display: none;" aria-hidden="true" data-v-app="">
    <div class="tt-o-modal tt-w-submission-modal tt-w-submission-modal__review-form" role="dialog" aria-label="제출 창" aria-modal="true" id="tt-submission-modal">
        <div class="tt-o-modal__container" tabindex="-1">
            <div class="tt-o-modal__close">
                <button class="tt-o-button tt-o-button--icon tt-o-modal__close-btn" aria-label="제출 창 닫기" title="제출 창 닫기" type="button">
                    <!--<svg class="tt-o-icon tt-o-icon--close tt-o-icon--xs" aria-hidden="true" focusable="false">
                        <use xlink:href="#tt-icon-close"></use>
                    </svg>-->
                    <svg xmlns="http://www.w3.org/2000/svg" x="0px" y="0px" width="36" height="36" viewBox="0,0,256,256" id="update-close-review-modal" aria-hidden="true">
                  <g fill="#ebebeb" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><path d="M128,248.32c-66.4509,0 -120.32,-53.8691 -120.32,-120.32v0c0,-66.4509 53.8691,-120.32 120.32,-120.32v0c66.4509,0 120.32,53.8691 120.32,120.32v0c0,66.4509 -53.8691,120.32 -120.32,120.32z" id="shape"></path></g><g fill="#000000" fill-rule="nonzero" stroke="none" stroke-width="1" stroke-linecap="butt" stroke-linejoin="miter" stroke-miterlimit="10" stroke-dasharray="" stroke-dashoffset="0" font-family="none" font-weight="none" font-size="none" text-anchor="none" style="mix-blend-mode: normal"><g transform="scale(5.12,5.12)"><path d="M11.5,11c-0.128,0 -0.25602,0.04898 -0.35352,0.14648c-0.097,0.098 -0.14648,0.22552 -0.14648,0.35352c0,0.128 0.04848,0.25552 0.14648,0.35352l13.14649,13.14648l-13.14648,13.14648c-0.195,0.195 -0.195,0.51203 0,0.70703c0.098,0.097 0.22552,0.14648 0.35352,0.14648c0.128,0 0.25552,-0.04848 0.35352,-0.14648l13.14648,-13.14648l13.14648,13.14648c0.195,0.195 0.51203,0.195 0.70703,0c0.195,-0.196 0.196,-0.51103 0,-0.70703l-13.14648,-13.14648l13.14648,-13.14648c0.195,-0.195 0.195,-0.51203 0,-0.70703c-0.196,-0.195 -0.51103,-0.196 -0.70703,0l-13.14648,13.14649l-13.14648,-13.14648c-0.0975,-0.0975 -0.22552,-0.14648 -0.35352,-0.14648z"></path></g></g>
               </svg>
                </button>
            </div>
            <div class="tt-o-modal__body">
                <div class="tt-submission-mediator">
                    <div class="tt-c-review-form">
                        <form class="tt-c-review-form__form tt-u-spacing--xl" id="reviewUpdateForm" name="reviewUpdateForm" method="post" enctype="multipart/form-data">   <!-- enctype="multipart/form-data" -->
                            <!-- Header -->
                            <div class="tt-c-review-form-header-container">
                                <div class="tt-c-review-form-header">
                                    <div class="tt-c-review-form-header__content--left">
                                        <div class="tt-c-review-form-header__heading" role="heading" aria-level="2">리뷰 수정</div>
                                        <p class="tt-c-review-form-header__text">리뷰를 수정해 주세요</p>
                                    </div>
                                </div>
                            </div>

                            <!-- Product Section -->
                            <div class="tt-c-review-flow-product tt-c-review-flow-product--review-form tt-c-review-form__item">
                                <img src="/resources/prod-img/${cateId}/mainImg/${prod.prodId}.png" alt="" class="tt-o-product__image tt-c-review-flow-product__item-image" loading="lazy">
                                <div class="tt-c-review-flow-product__item-heading">
                                    <div class="tt-c-review-flow-product__item-title">${prod.prodName}</div>
                                </div>
                            </div>

                            <!-- Rating Section -->
                            <fieldset class="tt-u-spacing--lg">
                                <fieldset class="tt-o-field-group tt-u-spacing--xs tt-c-review-form__overall-rating" aria-required="true" aria-labelledby="tt-review-form-rating" role="radiogroup">
                                    <legend class="tt-o-field-group__label" id="tt-review-form-rating">
                                        <span class="tt-o-field-group__label-text">평점</span>
                                        <span class="tt-o-field-group__required" style="font-size: 1rem;"> *</span>
                                    </legend>
                                    <div class="tt-c-rating tt-c-rating--actionable">
                                        <div class="text-primary">
                                            <i class="reviewStar far fa-star" data-index="1" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="2" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="3" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="4" style="font-size: 30px; color: #F1C40F !important;"></i>
                                            <i class="reviewStar far fa-star" data-index="5" style="font-size: 30px; color: #F1C40F !important;"></i>
                                        </div>
                              <input type="hidden" id="ratingUpdate" name="ratingUpdate" value="0">
                                    </div>
                                </fieldset>

                                <!-- Review Text Section -->
                                <div class="tt-o-field-group tt-u-spacing--xs tt-c-review-form__body-text">
                                    <label class="tt-o-field-group__label" for="tt-review-form-text">
                                        <span class="tt-o-field-group__label-text">내 리뷰</span>
                                        <span class="tt-o-field-group__required"> *</span>
                                    </label>
                                    <textarea class="tt-o-textarea" required="" id="contentUpdate" name="tt-review-form-text" rows="5"></textarea>
                                    <div class="tt-o-hint tt-o-hint--info tt-u-spacing--left--xs" id="tt-review-form-text-hint">
                                        <svg class="tt-o-icon tt-o-icon--info tt-o-icon--xs tt-o-hint__icon" aria-hidden="true" focusable="false">
                                            <use xlink:href="#tt-icon-info"></use>
                                        </svg>
                                        <span class="tt-o-hint__text">마음에 들었던 점과 그렇지 않았던 점, 다른 구매자들에게 도움이 될 내용 등을 작성해 주세요. (최소 30자)</span>
                                    </div>
                                </div>

                                <!-- User ID Section -->
                                <div class="tt-o-field-group tt-u-spacing--xs tt-c-review-form__title">
                                    <label class="tt-o-field-group__label" for="tt-review-form-title">
                                        <span class="tt-o-field-group__label-text">아이디</span>
                                    </label>
                                    <input class="tt-o-text-field" aria-invalid="false" type="text" id="userReviewUpdateEmail" aria-describedby="tt-hint-6ff1aa1d54" value="${userEmail}">
                                    <div class="tt-o-hint tt-o-hint--info tt-u-spacing--left--xs" id="tt-hint-6ff1aa1d54">
                                        <svg class="tt-o-icon tt-o-icon--info tt-o-icon--xs tt-o-hint__icon tt-o-hint__icon" aria-hidden="true" focusable="false">
                                            <use xlink:href="#tt-icon-info"></use>
                                        </svg>
                                        <span class="tt-o-hint__text"></span>
                                    </div>
                                </div>

                                <!-- Media Section -->
                                <div class="tt-o-field-group tt-u-spacing--xs tt-c-added-media tt-c-added-media--alt tt-c-review-form__added-media">
                                    <label class="tt-o-field-group__label" id="added-media-label">
                                        <span class="tt-o-field-group__label-text">사진 추가</span>
                                    </label>
                                    <div class="tt-o-hint tt-o-hint--info tt-u-spacing--left--xs tt-o-hint--above" id="tt-add-media-desc">
                                        <svg class="tt-o-icon tt-o-icon--info tt-o-icon--xs tt-o-hint__icon tt-o-hint__icon" aria-hidden="true" focusable="false">
                                            <use xlink:href="#tt-icon-info"></use>
                                        </svg>
                                        <span class="tt-o-hint__text">제품 착용 모습, 스타일링을 보여주는 사진을 추가하세요. (최대 5장)</span>
                                    </div>
                                    <div class="tt-c-added-media__items-area">
                                        <div class="tt-c-added-media__items">
                                            <div class="tt-c-added-media__add-photo">
                                                <!-- 사진 추가 버튼 -->
                                                <label class="tt-c-added-media__add-photo" for="tt-add-photos-input">
                                                    <div class="tt-u-clip-hide">사진 추가</div>
                                                    <button class="tt-o-button tt-o-button--tertiary tt-c-added-media__add-photo-btn tt-c-added-media__add-photo-btn" aria-describedby="tt-add-media-desc" type="button" onclick="document.getElementById('update-tt-add-photos-input').click();">
                                                        <img width="36" height="36" src="https://img.icons8.com/ios-glyphs/30/plus-math.png" alt="plus-math"/>
                                                    </button>
                                                </label>
                                                
                                                <!-- 실제 사진 첨부를 위한 파일 입력 -->
                                                <input id="update-tt-add-photos-input" type="file" name="reviewFilesUpdate" accept="image/jpeg,image/jpg,image/pjpeg,image/png,image/x-png" multiple tabindex="-1" style="display: none;">
                                            </div>
                                        </div>
                                    </div>
                                </div>

                                <!-- Submit Button -->
                                <div class="tt-c-review-form__actions">
                                    <button class="tt-o-button tt-o-button--primary tt-c-review-form__submit tt-c-review-form__submit" type="button" id="reviewUpdateBtn">수정</button>
                                    <div class="tt-o-spinner tt-o-spinner--submit" style="display: none;"></div>
                                </div>
                            </fieldset>
                            <input type="hidden" name="reviewSeq" id="reviewSeq" value="">
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
</div>
<!-- 리뷰 수정 모달 끝 -->

<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>

</html>