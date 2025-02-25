<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<%@include file="/WEB-INF/views/include/shopHead.jsp" %>
<style>
.swal-icon-center {
    margin: 0 auto; /* 수평 가운데 정렬 */
    display: block; /* 블록 요소로 변경 */
    width: 4em; /* 아이콘 크기에 맞게 조정 */
    padding: 10px;
}
 div:where(.swal2-container) div:where(.swal2-popup) {
    display: none;
    position: relative;
    box-sizing: border-box;
    grid-template-columns: minmax(0, 100%);
    width: 32em;
    max-width: 100%;
    padding: 1.25em 0 1.25em;
    border: none;
    border-radius: 5px;
    background: #fff;
    color: hsl(0, 0%, 33%);
    font-family: inherit;
    font-size: 1rem;
}
  @font-face {
    font-family: 'JejuGothic';
    src: url('../resources/shop/fonts/JejuGothic.ttf') format('truetype');
  }

  body {
    font-family: 'JejuGothic', sans-serif;
    min-height: 100%;
    overflow: scroll;
    position: relative;
  }

  div {
    margin: 0;
    padding: 0;
  }

  p {
    margin-bottom: 0;
  }

  .header {
    background-color: #fff;
    position: fixed;
    top: 0;
    left: 0;
    right: 0;
    z-index: 3;
  }

  .inner {
    height: 44px;
    padding: 0 50px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    position: relative;
  }

  .btn_cancel,
  .btn_close {
    height: 24px;
    position: absolute;
    top: 50%;
    left: 22px;
    transform: translateY(-50%);
    will-change: transform;
  }

  .title_txt {
    color: #000;
    font-size: 18px;
    font-weight: normal;
    letter-spacing: -0.015em;
    word-break: break-word;
    margin: 0;
  }

  .btn_standard {
    position: absolute;
    top: 50%;
    right: 22px;
    transform: translateY(-50%);
    will-change: transform;
  }

  /* Wrap content 시작 */
  .wrap-content {
    flex: 1;
    display: flex;
    flex-direction: column;
    background-color: #f4f4f4 !important;
  }

  .container-lg.buy.step-2 {
    margin: 0 auto;
    padding: 20px 0;
  }

  .order-content {
    margin-left: auto;
    margin-right: auto;
    max-width: 700px;
  }

  .text-header-checkout {
    display: flex;
    align-items: center;
    gap: 8px;
    width: 100%;
  }

  .text-header-checkout .left {
    flex-grow: 1;
  }

  .title-item {
    display: flex;
    align-items: center;
    max-width: fit-content;
    gap: 2px;
  }

  .text-lookup.semibold {
    font-weight: 600;
    font-size: 16px;
    color: #222;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  .text-truncate {
    display: -webkit-box;
    text-overflow: ellipsis;
  }

  .text_table_left_align {
    display: flex;
    padding: 3px 0;
    width: -webkit-fill-available;
  }

  .text_table_left_align .title {
    align-items: flex-start;
    display: flex;
    flex: 0 0 auto;
    margin-right: 8px;
    width: 84px;
  }

  .text_table_right_align {
    padding: 3px 0;
    width: -webkit-fill-available;
  }

  .text_table_right_align .title-labels {
    display: flex;
    justify-content: space-between;
  }

  .text_table_right_align .title-labels .title {
    align-items: flex-start;
    display: flex;
    flex: 0 0 auto;
    margin-right: 8px;
  }

  .text_table_right_align .title-labels .labels {
    flex: 1 1 auto;
    text-align: right;
  }

  .text_table_left_align .labels-description {
    flex: 1 1 auto;
  }

  .text_table_labels {
    display: flex;
    flex-direction: column;
    gap: 2px;
  }

  .text_table_labels .labels {
    display: flex;
    justify-content: flex-start;
    text-align: left;
  }

  .text_table_labels .labels .labels__label1 {
    min-width: fit-content;
  }

  .text_body {
    align-items: center;
    display: flex;
  }

  .line_break_by_truncating_tail {
    -webkit-box-orient: vertical;
    display: -webkit-box;
    text-overflow: ellipsis;
  }

  .text-lookup {
    text-align: left;
    width: inherit;
    font-size: 14px;
  }

  .text-element {
    color: #909090;
  }

  .text-element.display_paragraph {
    color: #222;
  }

  .control_data_box {
    cursor: pointer;
    min-height: 48px;
    padding: 14px;
    width: -webkit-fill-available;
    box-shadow: #ebebeb 0px 0px 0px 1px inset;
    margin: 8px 16px 20px;
  }

  .control_data_box__text__title {
    flex: 1 0 100px;
  }

  .divider_horizontal {
    width: -webkit-fill-available;
  }

  .product-list-info-default {
    width: -webkit-fill-available;
  }

  .content_image {
    display: inline-block;
  }

  .picture {
    border: none;
  }

  .product-list-info-default .content {
    display: flex;
    flex: 1;
    flex-direction: column;
    flex-wrap: wrap;
    margin-left: 16px;
  }

  .product-list-info-default .bottom {
    align-items: flex-start;
    display: flex;
    gap: 4px;
    justify-content: space-between;
    margin-top: 8px;
  }

  .cursor-pointer {
    cursor: pointer;
  }

  .radio-element {
    margin-right: 8px;
  }

  .text_collapse {
    width: -webkit-fill-available;
  }

  .text-lookup.has_action {
    cursor: pointer;
  }

  .text-lookup.underline {
    -webkit-text-decoration: underline;
    text-decoration: underline;
  }

  .subtitle_item.tag_body {
    min-width: 20px;
  }

  .subtitle_item {
    flex: 0 1 auto;
    gap: 4px;
  }

  .tag_body {
    align-items: center;
    display: flex;
    height: 20px;
    justify-content: center;
    text-align: center;
  }

  .cart-buy-footer>.layout_list_horizontal_equal {
    margin: 0 auto !important;
    max-width: 700px;
    padding-top: 8px;
  }
  
 .cart-buy-footer {
  position: fixed; /* 버튼을 고정 */
  bottom: 0; /* 페이지 하단에 배치 */
  left: 0; /* 왼쪽 끝에 배치 */
  width: 100%; /* 너비를 화면 전체로 설정 */
  z-index: 999; /* 다른 요소 위에 표시되도록 설정 */
  padding-bottom: 10px; /* 여백 추가 */
  padding-top: 10px; /* 여백 추가 */
  transition: all 0.5s ease-in-out; /* 트랜지션 부드럽게 */
}

.layout_list_horizontal_equal {
  display: flex;
  justify-content: center;
  gap: 16px;
}
  
  .button.disabled {
    cursor: not-allowed !important;
  }

  .layout_list_horizontal_equal {
    display: flex;
    width: -webkit-fill-available;
  }

  .button_xlarge {
    min-height: 52px;
    min-width: 140px;
    padding: 10px 16px;
  }

  .button_xlarge .button__text {
    align-items: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    min-height: 32px;
  }

  .button_xlarge .title_item {
    font-size: 16px;
  }

  .text-lookup.bold {
    font-weight: 700;
  }

  .flex-align-center {
    align-items: center;
    display: flex;
  }

  .fixed-top {
    position: relative;
  }

  .group {
    align-items: center;
    display: flex;
  }

  .group .checkbox {
    cursor: pointer;
    margin-right: 8px;
  }

  .group .button {
    margin-left: 6px;
  }

  input[type=checkbox] {
    clip: rect(0, 0, 0, 0) !important;
    height: 1px !important;
    margin: -1px !important;
    overflow: hidden !important;
    position: absolute !important;
    width: 1px !important;
  }

  input,
  textarea {
    -webkit-appearance: none;
    background-color: transparent;
    border: 0;
    border-radius: 0;
    outline: 0;
    padding: 0;
    resize: none;
  }

  .text-header-checkout-select {
    align-items: center;
    display: flex;
    justify-content: space-between;
    width: -webkit-fill-available;
  }

  .text-header-checkout-select .title {
    flex: 0 0 auto;
    margin-right: 3px;
  }

  .button-left,
  .button-right {
    background-color: white;
    border: 1px solid #e0e0e0;
    width: 32px;
    /* 버튼 크기 */
    height: 32px;
    /* 버튼 크기 */
    display: flex;
    align-items: center;
    justify-content: center;
    cursor: not-allowed;
    border-radius: 4px;
  }

  .button-left:disabled,
  .button-right:disabled {
    background-color: #f5f5f5;
    color: #cccccc;
  }

  .prodQty {
    display: flex;
    align-items: center;
  }

  .input-field {
    background-color: white;
    border: 1px solid #e0e0e0;
    padding: 0 10px;
    text-align: center;
    width: 40px;
    height: 32px;
    font-size: 12px;
    font-weight: 400;
    color: black;
    cursor: default;
    pointer-events: none;
    border-radius: 4px;
  }

  .input-field:disabled {
    background-color: #f5f5f5;
    color: #cccccc;
  }

  .stroke {
    stroke: black;
  }

  button:disabled .stroke {
    stroke: #ccc;
  }

  .original-price {
    text-decoration: line-through;
    color: #a7a7a7;
    font-size: 14px;
    margin-right: 8px;
  }

  .discounted-price {
    font-size: 16px;
    font-weight: bold;
  }

  .discount-percent {
    font-size: 14px;
    color: #e74c3c;
    margin-left: 5px;
  }

  .lg .cart-max-width {
    margin: 0 auto;
    width: 700px;
  }

  .empty-page {
    align-items: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    min-height: 192px;
    padding: 56px 28px;
    width: -webkit-fill-available;
  }

  .text_body {
    align-items: center;
    display: flex;
  }

  .md .text-element {
    font-size: 13px;
  }

  .button>div,
  .button:not(button) {
    align-items: center;
    display: flex;
    justify-content: center;
  }

  .button_small .button__text {
    align-items: center;
    display: flex;
    flex-direction: column;
    justify-content: center;
    min-height: 20px;
  }

  .button_small .title_item {
    font-size: 13px;
  }
  
  .layout_list_vertical {
    align-items: flex-start;
    display: flex;
    flex-direction: column;
    width: -webkit-fill-available;
  }
  
  .button.disabled {
    cursor: not-allowed !important;
  } 
  
  .cart-not-fixed {
  position: relative !important; /* fixed 해제 */
}

.swal2-popup.swal2-modal.swal2-icon-question.swal2-show {
	padding-top:20px;
}
</style>
<script>
$(document).ready(function () {
   $("#order-btn").on("click", function(e) {
       e.preventDefault();
       const check = $('input[name="text_header_checkout_select"]:checked');

       // 확인창 표시
       Swal.fire({
           title: "총 " + check.length + "개의" +"<br>"+"상품을 주문하시겠습니까?",
           icon: "question",
           showCancelButton: true, // 취소 버튼 표시
           confirmButtonText: "예",
           cancelButtonText: "아니오",
           customClass: {
               icon: 'swal-icon-center' // 사용자 정의 클래스
           }
       }).then((result) => {
           if (result.isConfirmed) { // 사용자가 "예"를 클릭했을 경우
               var prodIds = [];
               var combIds = [];

               check.each(function() {
                   const $orderContent = $(this).closest('.order-content');
                   const $product = $orderContent.find('.prodQty');
                   const prodId = $product.data('prodid');
                   const combId = $product.data('combid');

                   prodIds.push(prodId);
                   combIds.push(combId);
               });

               $('#prodIds').val(prodIds.join(','));
               $('#combIds').val(combIds.join(','));

               document.orderForm.action = '/shop/order';
               document.orderForm.submit();
           }
       });
   });
   
   
   $('#prod-check-all').on('click', function(e) {
      e.preventDefault();
      
      var svg = $(this);
      var checkbox = $(this).closest('label').find('input[name="text_header_checkout_select_all"]'); 
      var isChecked = checkbox.prop('checked');
      
      if (isChecked) {
         checkbox.prop('checked', false);
         
            svg.html(
                    '<path d="M17.193 8.995l-.848-.849-6.362 6.362-2.849-2.85-.848.85 3.697 3.697 7.21-7.21z" fill="inherit"></path>' +
                    '<path fill-rule="evenodd" clip-rule="evenodd" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v16a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm1.2 15.8V4.2h15.6v15.6H4.2z" fill="inherit"></path>'
            );
            
            svg.attr('fill', '#2222224D'); 
            
            $('input[name="text_header_checkout_select"]').each(function() {
                var productSvg = $(this).closest('label').find('svg');
                $(this).prop('checked', false);
                productSvg.html(
                    '<path d="M17.193 8.995l-.848-.849-6.362 6.362-2.849-2.85-.848.85 3.697 3.697 7.21-7.21z" fill="inherit"></path>' +
                    '<path fill-rule="evenodd" clip-rule="evenodd" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v16a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm1.2 15.8V4.2h15.6v15.6H4.2z" fill="inherit"></path>'
                );
                productSvg.attr('fill', '#2222224D');
            });
             
      } else {
         checkbox.prop('checked', true);
            
            svg.html(
                '<path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 3.6a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1V3.6zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="inherit"></path>'
            );
            svg.attr('fill', '#222222'); 
           
            $('input[name="text_header_checkout_select"]').each(function() {
                var productSvg = $(this).closest('label').find('svg');
                $(this).prop('checked', true);
                productSvg.html(
                    '<path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 3.6a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1V3.6zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="inherit"></path>'
                );
                productSvg.attr('fill', '#222222');
            });
      }
      
      detectOrderBtn();
      updateTotalPrice();
   });
   
    $('.prod-check').on('click', function (e) {
        e.preventDefault();
        
        var checkbox = $(this).closest('label').find('input[name="text_header_checkout_select"]'); // name 속성으로 체크박스 찾기
        var svg = $(this); 
        var isChecked = checkbox.prop('checked'); 
       
        if (isChecked) {
            checkbox.prop('checked', false);
            
            svg.html(
                '<path d="M17.193 8.995l-.848-.849-6.362 6.362-2.849-2.85-.848.85 3.697 3.697 7.21-7.21z" fill="inherit"></path>' +
                '<path fill-rule="evenodd" clip-rule="evenodd" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v16a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm1.2 15.8V4.2h15.6v15.6H4.2z" fill="inherit"></path>'
            );
            svg.attr('fill', '#2222224D'); 
            
        } else {
            checkbox.prop('checked', true);
            
            svg.html(
                '<path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 3.6a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1V3.6zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="inherit"></path>'
            );
            svg.attr('fill', '#222222'); 
        }
        
        detectAllCheckbox();
        detectOrderBtn();
        updateTotalPrice();
    });
    
    $('.plus-btn').on('click', function () {
        updateQuantity.call(this, true); 
    });

    $('.minus-btn').on('click', function () {
        updateQuantity.call(this, false);
    });
    //선택한 상품 삭제
    $('.prod-del').on('click', function(e) {
       e.preventDefault();
       
        Swal.fire({
               title: "선택한 상품을" + "<br>" + "장바구니에서 제거하시겠습니까?",
               text: "이 작업은 되돌릴 수 없습니다",
               icon: "warning",
               showCancelButton: true,
               confirmButtonColor: "#d33",
               cancelButtonColor: "#3085d6",
               confirmButtonText: "삭제하기",
               cancelButtonText: "취소",
               reverseButtons: true,
               customClass: {
                   icon: 'swal-icon-center' // 사용자 정의 클래스
               }
           }).then((result) => {
               if (result.isConfirmed) {
                   // 사용자가 '확인' 버튼을 클릭한 경우에만 실행
            const $orderContent = $(this).closest('.order-content');
            const $product = $orderContent.find('.prodQty');
            const prodId = $product.data('prodid');
            const combId = $product.data('combid');
            
            $('#prodIds').val(prodId);
            $('#combIds').val(combId);
            
            $.ajax({
                url: '/shop/cartDelete',
                type: 'POST',
                data: {
                    prodIds: $('#prodIds').val(),
                    combIds: $('#combIds').val()
                },
                dataType: 'JSON',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function (response) {
                    if (response.code === 200) {
                        $('#prodIds').val("");
                        $('#combIds').val("");
                        
                        var currentSize = parseInt($("#cart-size").text().replace('총 ', '').replace('건', '').trim());
                        
                        if (currentSize - 1 === 0) {
                            var container = $('.container.content-step-2-cart-buy-immediate-container');
                            
                            container.find('.order-content').not(':first').remove();
                            container.find('.divider_horizontal').not(':first').remove();
                            
                            var emptyMessageHTML = 
                              '<div style="background-color: #f4f4f4;">' +
                                '<div class="cart-max-width">' +
                                  '<div class="layout_list_vertical" style="background-color: #f4f4f4;">' +
                                    '<div class="empty-page" style="gap: 11px 0px; padding: 60px 0px;">' +
                                      '<div class="text_body" style="gap: 0px 2px; margin: 0px;">' +
                                        '<p class="text-lookup text-element display_paragraph" style="color: #000000CD; text-align: center; width: inherit;">' +
                                          '장바구니에 담긴 상품이 없습니다.' +
                                          '원하는 상품을 장바구니에 담아보세요!' +
                                        '</p>' +
                                      '</div>' +
                                      '<a href="/search" rel="noreferrer nofollow" class="button button_small" style="border-radius: 10px; margin: 10px 0px 0px; padding: 5px 8px; background-color: #ffffff; box-shadow: #222222 0px 0px 0px 1px inset; cursor: pointer;">' +
                                        '<div class="button__text">' +
                                          '<div class="text_body title_item" style="gap: 0px 2px;">' +
                                            '<p class="text-lookup text-element bold display_paragraph white-space-nowrap ellipsis-1" style="color: #222222; text-align: left; width: inherit;">' +
                                              'SHOP 바로가기' +
                                            '</p>' +
                                          '</div>' +
                                        '</div>' +
                                      '</a>' +
                                    '</div>' +
                                  '</div>' +
                                '</div>' +
                              '</div>';
                                  
                              container.find('.divider_horizontal').last().after(emptyMessageHTML);
                            
                        } else {
                            $("#cart-size").text('총 ' + (currentSize - 1) + '건');
                            $orderContent.prev('.divider_horizontal').remove();  
                            $orderContent.remove(); 
                            
                            updateTotalPrice();
                        }
                       
                        
                    } else if (response.code === 500) {
                        alert("DB 정합성 오류 입니다.");

                    } else {
                        alert("서버 응답 오류로 장바구니 제품 삭제에 실패하였습니다.");
                    }
                },
                error: function (error) {
                    alert("서버 응답 오류로 장바구니 제품 삭제에 실패하였습니다.");
                    icia.common.error(error);
                }
            });
       }
    });
  });  
    //선택 상품들 삭제 
    $('#prod-del-select').on('click', function (e) {
       e.preventDefault();
       
          Swal.fire({
                 title: "선택한 상품들을" + "<br>" + "장바구니에서 제거하시겠습니까?",
                 text: "이 작업은 되돌릴 수 없습니다",
                 icon: "warning",
                 showCancelButton: true,
                 confirmButtonColor: "#d33",
                 cancelButtonColor: "#3085d6",
                 confirmButtonText: "삭제하기",
                 cancelButtonText: "취소",
                 reverseButtons: true,
                 customClass: {
                     icon: 'swal-icon-center' // 사용자 정의 클래스
                 }
             }).then((result) => {
                 if (result.isConfirmed) {
                  // 사용자가 '확인' 버튼을 클릭한 경우에만 실행
          
            const check = $('input[name="text_header_checkout_select"]:checked');
    
            var prodIds = [];
            var combIds = [];
            
            check.each(function() {
                const $orderContent = $(this).closest('.order-content');
                const $product = $orderContent.find('.prodQty');
                const prodId = $product.data('prodid');
                const combId = $product.data('combid');
                
                prodIds.push(prodId);
                combIds.push(combId);
            });
            
            $('#prodIds').val(prodIds.join(','));
            $('#combIds').val(combIds.join(','));
            
            $.ajax({
                url: '/shop/cartDelete',
                type: 'POST',
                data: {
                    prodIds: $('#prodIds').val(),
                    combIds: $('#combIds').val()
                },
                dataType: 'JSON',
                beforeSend: function (xhr) {
                    xhr.setRequestHeader("AJAX", "true");
                },
                success: function (response) {
                    if (response.code === 200) {
                       $('#prodIds').val("");
                       $('#combIds').val("");
                       
                        var currentSize = parseInt($("#cart-size").text().replace('총 ', '').replace('건', '').trim());
                       
                       if (currentSize - check.length === 0) {
                            var container = $('.container.content-step-2-cart-buy-immediate-container');
                
                            container.find('.order-content').not(':first').remove();
                            container.find('.divider_horizontal').not(':first').remove();
                
                            var emptyMessageHTML = 
                              '<div style="background-color: #f4f4f4;">' +
                                '<div class="cart-max-width">' +
                                  '<div class="layout_list_vertical" style="background-color: #f4f4f4;">' +
                                    '<div class="empty-page" style="gap: 11px 0px; padding: 60px 0px;">' +
                                      '<div class="text_body" style="gap: 0px 2px; margin: 0px;">' +
                                        '<p class="text-lookup text-element display_paragraph" style="color: #000000CD; text-align: center; width: inherit;">' +
                                          '장바구니에 담긴 상품이 없습니다.' +
                                          '원하는 상품을 장바구니에 담아보세요!' +
                                        '</p>' +
                                      '</div>' +
                                      '<a href="/search" rel="noreferrer nofollow" class="button button_small" style="border-radius: 10px; margin: 10px 0px 0px; padding: 5px 8px; background-color: #ffffff; box-shadow: #222222 0px 0px 0px 1px inset; cursor: pointer;">' +
                                        '<div class="button__text">' +
                                          '<div class="text_body title_item" style="gap: 0px 2px;">' +
                                            '<p class="text-lookup text-element bold display_paragraph white-space-nowrap ellipsis-1" style="color: #222222; text-align: left; width: inherit;">' +
                                              'SHOP 바로가기' +
                                            '</p>' +
                                          '</div>' +
                                        '</div>' +
                                      '</a>' +
                                    '</div>' +
                                  '</div>' +
                                '</div>' +
                              '</div>';
                
                            container.find('.divider_horizontal').last().after(emptyMessageHTML);
                            
                        } else {
                            check.each(function () {
                                var orderContent = $(this).closest('.order-content');
                                orderContent.prev('.divider_horizontal').remove(); 
                                orderContent.remove(); 
                            });
                
                            $("#cart-size").text('총 ' + (currentSize - check.length) + '건');
                            updateTotalPrice();
                        }
                       
                    } else if (response.code === 500) {
                        alert("DB 정합성 오류 입니다.");

                    } else {
                        alert("서버 응답 오류로 장바구니 제품 삭제에 실패하였습니다.");
                    }
                },
                error: function (error) {
                    alert("서버 응답 오류로 장바구니 제품 삭제에 실패하였습니다.");
                    icia.common.error(error);
                }
            });
       }
    });
  });  
    
});

function toggleButtons(prodId, combId, prodQuantity, stock) {
    var $product = $('[data-prodid="' + prodId + '"][data-combid="' + combId + '"]');
    var $minusBtn = $product.find('.minus-btn');
    var $plusBtn = $product.find('.plus-btn');

    if (prodQuantity <= 1) {
        $minusBtn.prop('disabled', true);
    } else {
        $minusBtn.prop('disabled', false);
    }


    if (prodQuantity >= stock) {
        $plusBtn.prop('disabled', true);
    } else {
        $plusBtn.prop('disabled', false);
    }
}

function updateTotalPrice() {
    let totalPrice = 0;
    let orderDiscountRate = ${orderDiscountRate};

    $('input[name="text_header_checkout_select"]:checked').each(function () {
      const prodContainer = $(this).closest('#prod-container'); 
      
      const quantity = parseInt(prodContainer.find('.input-field').val()) || 1;
      const price = parseInt(prodContainer.find('.discounted-price').text().replace(/[^0-9]/g, '')) || 0;
      
      totalPrice += quantity * price;
    });
    
    let totalDiscountPrice = Math.round(totalPrice * (orderDiscountRate / 100.0));
    
    const totalPriceFormatted = new Intl.NumberFormat('ko-KR').format(totalPrice);
    const totalDiscountPriceFormatted = new Intl.NumberFormat('ko-KR').format(totalDiscountPrice);
    
    const $totalPriceElement = $('.cart-buy-footer .button__text .text-lookup');
    
    const $totalPrice = $("#totalPrice").text(totalPriceFormatted + '원'); 
    const $totalDiscountPrice = $("#totalDiscountPrice").text(totalDiscountPriceFormatted + '원');
    
    $totalPriceElement.text(totalPriceFormatted + '원');
    
    $totalPriceElement.append(
      $('<em>')
        .addClass('text-lookup bold')
        .css('color', 'rgba(255, 255, 255, 0.65)')
        .text('·')
    ).append(' 주문하기');
    
}
 
function updateQuantity(isIncrease) {
    var $product = $(this).closest('.prodQty');
    var prodId = $product.data('prodid');
    var combId = $product.data('combid');
    var stock = $product.data('stock');
    var $inputField = $product.find('.input-field');
    var prodQuantity = parseInt($inputField.val());

    if (isIncrease) {
        if (prodQuantity < stock) {
            prodQuantity++;
        }
        
    } else {
        if (prodQuantity > 1) {
            prodQuantity--;
        }
    }

    $.ajax({
        url: '/shop/cartUpdate',
        type: 'POST',
        data: {
            prodId: prodId,
            variantsOptionValueCombId: combId,
            cartQuantity: prodQuantity
        },
        dataType: 'JSON',
        beforeSend: function (xhr) {
            xhr.setRequestHeader("AJAX", "true");
        },
        success: function (response) {
            if (response.code === 200) {
                $inputField.val(prodQuantity);
                toggleButtons(prodId, combId, prodQuantity, stock);
                updateTotalPrice();
                
            } else if (response.code === 500) {
                alert("DB정합성 오류 입니다.");
                
            } else if (response.code === 400) {
                alert("재고가 소진되었습니다.");
                $(this).closest('.order-content').prev('.divider_horizontal').remove();  
                $(this).closest('.order-content').remove();  
            } else {
                alert("서버 응답 오류로 프로필 사진 수정에 실패하였습니다.");
            }
        },
        error: function (error) {
            alert("서버 응답 오류로 수량 수정에 실패하였습니다.");
            icia.common.error(error);
        }
    });
}

function detectAllCheckbox() {
   var isAllChecked = true;

   $('input[name="text_header_checkout_select"]').each(function() {
        if (!$(this).prop('checked')) {
            isAllChecked = false;
            return false; 
        }
    });

    var svg = $('#prod-check-all'); 
    var checkbox = svg.closest('label').find('input[name="text_header_checkout_select_all"]'); 

    if (isAllChecked) {
        checkbox.prop('checked', true);
        svg.html(
            '<path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 3.6a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1V3.6zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="inherit"></path>'
        );
        svg.attr('fill', '#222222');
        
    } else {
        checkbox.prop('checked', false);
        svg.html(
            '<path d="M17.193 8.995l-.848-.849-6.362 6.362-2.849-2.85-.848.85 3.697 3.697 7.21-7.21z" fill="inherit"></path>' +
            '<path fill-rule="evenodd" clip-rule="evenodd" d="M3 4a1 1 0 011-1h16a1 1 0 011 1v16a1 1 0 01-1 1H4a1 1 0 01-1-1V4zm1.2 15.8V4.2h15.6v15.6H4.2z" fill="inherit"></path>'
        );
        svg.attr('fill', '#2222224D');
    }
}

function detectOrderBtn() {
   const checkCnt = $('input[name="text_header_checkout_select"]:checked').length;
   
   if (checkCnt === 0) {
      $("#order-btn").prop("disabled", true);
      $("#order-btn").addClass("disabled");
      $("#order-btn").css("background-color", "#d3d3d3");
      
   } else {
      $("#order-btn").prop("disabled", false);
      $("#order-btn").removeClass("disabled");
      $("#order-btn").css("background-color", "#ef6253");
   }
}

document.addEventListener("DOMContentLoaded", function () {
	  const cartFooter = document.querySelector(".cart-buy-footer");
	  const targetElement = document.querySelector(".text-footer-section");

	  const observerOptions = {
	    root: null, // 뷰포트를 기준으로 감지
	    threshold: 0.1, // 요소의 10% 이상이 보이면 트리거
	  };

	  const observer = new IntersectionObserver((entries) => {
	    entries.forEach((entry) => {
	      if (entry.isIntersecting) {
	        // 요소가 화면에 보이면 고정 해제
	        cartFooter.classList.add("cart-not-fixed");
	      } else {
	        // 요소가 화면에서 사라지면 다시 고정
	        cartFooter.classList.remove("cart-not-fixed");
	      }
	    });
	  }, observerOptions);

	  // 타겟 요소 관찰 시작
	  observer.observe(targetElement);
	});

</script>
</head>
<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
<div class="header fixed-top">
  <div class="wrap-content d-flex flex-column flex-grow-1 bg-light">
    <div class="container-lg buy step-2">
      <div class="content content-step-2">
        <div class="container content-step-2-cart-buy-immediate-container">
        
          <div class="order-content">
            <div class="order-content-wrapper bg-white rounded p-3 flex-column align-items-start d-flex">
              <h2 class="title_txt mx-auto" style="text-align:center;"><b>장바구니</b></h2>
            </div>
          </div>
          
          <div class="divider_horizontal" style="height: 8px;">
            <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
          </div>
          
          <c:choose>
            <c:when test="${cartList.size() eq 0}">
              <div style="background-color: #f4f4f4;">
                <div class="cart-max-width">
                  <div class="layout_list_vertical" style="background-color: #f4f4f4;">
                    <div class="empty-page" style="gap: 11px 0px; padding: 60px 0px;">
                      <div class="text_body" style="gap: 0px 2px; margin: 0px;">
                        <p class="text-lookup text-element display_paragraph" style="color: #000000CD; text-align: center; width: inherit;">
                          장바구니에 담긴 상품이 없습니다.
                          원하는 상품을 장바구니에 담아보세요!
                        </p>
                      </div>
                      <a href="/shop/shopIndex" rel="noreferrer nofollow" class="button button_small" style="border-radius: 10px; margin: 10px 0px 0px; padding: 5px 8px; background-color: #ffffff; box-shadow: #222222 0px 0px 0px 1px inset; cursor: pointer;">
                        <div class="button__text">
                          <div class="text_body title_item" style="gap: 0px 2px;">
                            <p class="text-lookup text-element bold display_paragraph white-space-nowrap ellipsis-1" style="color: #222222; text-align: left; width: inherit;">
                              SHOP 바로가기
                            </p>
                          </div>
                        </div>
                      </a>
                    </div>
                  </div>     
                </div>
              </div>
            </c:when>
            <c:otherwise>
              <div class="order-content">
                <div class="order-content-wrapper bg-white rounded p-3 ">
                  <div class="text-header-checkout d-flex align-items-center" style="gap: 8px;">
                    <div class="flex-grow-1">
                      <div class="text-body title-item d-flex align-items-center" style="gap: 0px 2px;">
                        <p class="text-lookup text-element semibold display_paragraph">
                          장바구니 상품
                        </p>
                      </div>
                    </div>
                    <div class="d-flex align-items-center gap-1">
                      <div class="text_body description_item" style="gap: 4px;">
                        <p id="cart-size" class="text-lookup semibold text-truncate m-0" style="color: #222; font-size: 16px;">
                          총 <c:out value="${cartList.size()}" />건
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="divider_horizontal" style="height: 8px;">
                <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;" ></div>
              </div>
              
              <!-- 선택 상품 삭제 전체 선택 -->
              <div class="order-content">
                <div class="order-content-wrapper bg-white rounded p-1 flex-column align-items-start d-flex" style="width: -webkit-fill-available;">
                  <div class="text-header-checkout-select d-flex" style="padding: 12px 16px; background-color: rgb(255, 255, 255);">
                    <div class="group">
                      <label class="d-flex checkbox" style="margin-bottom: 0px;">
                        <svg id="prod-check-all" viewBox="0 0 24 24" fill="#222222" xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                          <path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 3.6a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1V3.6zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z" fill="inherit"></path>
                        </svg>
                        <input type="checkbox" name="text_header_checkout_select_all" value="whole_header_c2c" checked>
                      </label>
                      <div class="text_body title" style="gap: 0px 4px;">
                        <p class="text-lookup text-element display_paragraph" style="color: rgb(34, 34, 34); text-align: left; width: inherit; -webkit-line-clamp: 1; color: #222222; font-size: 14px;">
                          전체 선택
                        </p>
                      </div>
                    </div>
                    <div class="group">
                      <button id="prod-del-select" class="btn btn-outline-secondary btn-sm rounded-pill d-flex align-items-center justify-content-center" style="padding: 2px 10px; min-height: 24px; min-width: 60px; border-color: #ebebeb;">
                        <span class="text-black text-truncate" style="max-width: 100%; font-size: 12px; white-space: nowrap;">선택 삭제</span>
                      </button>
                    </div>
                  </div>
                </div>
              </div>
              
              <div class="divider_horizontal" style="height: 8px;">
                <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
              </div>
              
              <c:forEach var="cart" items="${cartList}" varStatus="status" >
                <div class="order-content">
                  <div id="prod-container" class="order-content-wrapper bg-white rounded p-1 flex-column align-items-start d-flex" style="width: -webkit-fill-available;">
                    <div class="text-header-checkout-select d-flex" style="padding: 20px 16px 10px; background-color: #fff">
                      <div class="group">
                        <label class="d-flex checkbox" style="margin-bottom: 0px;">
                          <svg class="prod-check" viewBox="0 0 24 24" fill="#222222" xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                            <path fill-rule="evenodd" clip-rule="evenodd" d="M2.6 3.6a1 1 0 011-1h16.8a1 1 0 011 1v16.8a1 1 0 01-1 1H3.6a1 1 0 01-1-1V3.6zm13.544 4.444l1.131 1.131-7.311 7.312-3.82-3.82 1.131-1.13 2.689 2.687 6.18-6.18z"fill="inherit"></path>
                          </svg>
                          <input type="checkbox" name="text_header_checkout_select" value="whole_header_c2c" checked>
                        </label>
                      </div>
                      <div class="group">
                        <button class="btn btn-outline-secondary btn-sm rounded-pill d-flex align-items-center justify-content-center prod-del" style="padding: 2px 10px; min-height: 24px; min-width: 60px; border-color: #ebebeb;">
                          <span class="text-black text-truncate" style="max-width: 100%; font-size: 12px; white-space: nowrap;">삭제</span>
                        </button>
                      </div>
                    </div>
                      
                    <div class="product-list-info-default d-flex" style="padding: 0px 16px;">
                      <div class="thumbnail d-inline-block position-relative" style="border-radius: 10px; background-color: #f4f4f4; width: 80px; height: 80px;">
                        <div class="content_image" style="width: 80px; height: 80px;">
                          <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                            <source type="image/webp" srcset="/resources/prod-img/${fn:substring(cart.prodId, 0, 2)}/mainImg/${cart.prodId}.png">
                            <source srcset="/resources/prod-img/${fn:substring(cart.prodId, 0, 2)}/mainImg/${cart.prodId}.png">
                            <img src="/resources/prod-img/${fn:substring(cart.prodId, 0, 2)}/mainImg/${cart.prodId}.png" loading="lazy" width="80px" height="80px" class="image">
                          </picture>
                        </div>
                      </div>
              
                      <div class="content">
                        <div class="d-flex flex-column align-items-start" style="width: -webkit-fill-available;">
                          <div class="text_body" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail" style="color: #222;">
                              <c:out value="${cart.prodName}" />
                            </p>
                          </div>
                          <div class="text_body" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-start" style="color: #a7a7a7; font-size: 12px;">
                              제품 코드 : <c:out value="${cart.prodId}" />
                            </p>
                          </div>
                          <div class="text_body" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-start" style="color: #a7a7a7; font-size: 12px;">
                              <c:if test='${cart.variantsOptionValueCombId ne "DEFAULT"}'>
                                옵션 : <c:out value="${cart.variantsOptionValueCombText}" />
                              </c:if>
                            </p>
                          </div>
                          <div class="text_body" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-start" style="color: #a7a7a7; font-size: 12px;">
                              재고 : <c:out value="${cart.variantsOptionValueCombStock}" />
                            </p>
                          </div>
                        </div>
                        <div class="bottom d-flex justify-content-end">
                          <div class="prodQty" data-prodid="${cart.prodId}" data-combid="${cart.variantsOptionValueCombId}" data-stock="${cart.variantsOptionValueCombStock}">
                            <button class="button-left minus-btn" <c:if test="${cart.cartQuantity eq 1}">disabled</c:if>>
                              <svg width="16px" height="16px" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M4 10H16" class="stroke" stroke-miterlimit="10" vector-effect="non-scaling-stroke"></path>
                              </svg>
                            </button>
                            <input class="input-field" readonly value="${cart.cartQuantity}" data-prodid="${cart.prodId}" data-combid="${cart.variantsOptionValueCombId}">
                            <button class="button-right plus-btn" <c:if test="${cart.cartQuantity eq cart.variantsOptionValueCombStock}">disabled</c:if>>
                              <svg width="16px" height="16px" viewBox="0 0 20 20" fill="none" xmlns="http://www.w3.org/2000/svg">
                                <path d="M10 4V10M10 10V16M10 10H4M10 10H16" class="stroke" stroke-miterlimit="10" vector-effect="non-scaling-stroke"></path>
                              </svg>
                            </button>
                          </div>
                        </div>
                      </div>
                    </div>
                      
                    <div style="height: 20px;"></div>
                    
                    <div class="text_table_right_align" style="padding: 3px 16px 7px; background-color: #fff">
                      <div class="title-labels">
                        <div class="text_body title" style="gap: 0px 2px; padding: 1px 0px 0px;">
                          <p class="text-lookup text-element display_paragraph" style="color: #222222; text-align: left; width: inherit; font-size: 16px;">
                            상품 금액
                          </p>
                        </div>
                        <div class="text_table_labels labels" style="justify-content: flex-end; position: right;">
                          <div class="labels" style="justify-content: flex-end;">
                            <div class="text_body labels__label1" style="gap: 0px 2px;">
                              <p class="text-lookup text-element bold display_paragraph" style="color: #222222; text-align: right; width: inherit; font-size: 16px;">
                                <c:choose>
                                
                                  <c:when test="${cart.prodDiscountPercent gt 0}">
                                    <span class="original-price">
                                      <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${cart.prodPrice}" />원
                                    </span>
                                    <span class="discounted-price">
                                      <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${cart.discountedProdPrice}" />원
                                    </span>
                                    <span class="discount-percent">(<fmt:formatNumber type="Number" maxFractionDigits="0" value="${cart.prodDiscountPercent}" />%)</span>
                                  </c:when>
                                  
                                  <c:otherwise>
                                    <span class="discounted-price">
                                      <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${cart.prodPrice}" />원
                                    </span>
                                  </c:otherwise>
                                  
                                </c:choose>
                              </p>
                            </div>
                          </div>
                        </div>
                      </div>
                    </div>
                    <div style="height: 20px;"></div>
              
                  </div>
                </div>
                <div class="divider_horizontal" style="height: 8px;">
                  <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
                </div>
              </c:forEach>
              
              <div class="order-content">
                <div class="text_body" style="border-radius: 10px 10px 0px 0px; width: -webkit-fill-available; gap: 0px 2px; padding: 15px 16px; background-color: #FFFFFF;">
                  <p class="text-lookup text-element bold display_paragraph" style="color: #222222; text-align: left; width: inherit; --font-size-main: 16px; --text-color-main: #222222; --padding-main: 16px; --margin-main: 16px;">
                    선택 주문정보
                  </p>
                </div>
                
                <div class="divider_horizontal" style="height: 2px; padding: 0px 16px; background-color: #FFFFFF;">
                  <div class="divider" style="background-color: #F4F4F4; width: 100%; height: 2px;"></div>
                </div>
                
                <div class="layout_list_vertical" style="gap: 4px 0px; padding: 12px 16px; background-color: #FFFFFF;">
                  <div class="text_table_right_align" style="padding: 3px 0px; background-color: #FFFFFF;">
                    <div class="title-labels">
                      <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                        <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; --font-size-sub: 14px; --text-color-sub: #909090; --padding-sub: 14px; --margin-sub: 14px;">
                          총 상품금액
                        </p>
                      </div>
                      <div class="text_table_labels labels" style="align-items: flex-end; text-align: right;">
                        <div class="labels">
                          <div class="text_body labels__label1" style="gap: 0px 2px;">
                            <p id="totalPrice" class="text-lookup text-element display_paragraph" style="color: #222222; text-align: right; width: inherit; --font-size-sub: 14px; --text-color-sub: #222222;">
                              <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${totalProdPrice}"/>원
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                              
                  <div class="text_table_right_align" style="padding: 3px 0px;">
                    <div class="title-labels">
                      <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                        <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; --font-size-sub: 14px; --text-color-sub: #909090;">
                          할인금액
                        </p>
                        <div class="content_image" style="border-radius: 50%; width: 16px; height: 16px; margin: 0px 0px 0px 2px; cursor: pointer;">
                          <picture style="object-fit: none; aspect-ratio: auto;">
                            <source type="image/webp" srcset="/resources/shop/img/help.png">
                            <source srcset="/resources/shop/img/help.png">
                            <img src="/resources/shop/img/help.png" style="width: 100%; height: 100%; object-fit: contain;" class="image">
                          </picture>
                        </div>
                      </div>
                      <div class="text_table_labels labels" style="align-items: flex-end; text-align: right;">
                        <div class="labels">
                          <div class="text_body labels__label1" style="gap: 0px 2px;">
                            <p id="totalDiscountPrice" class="text-lookup text-element display_paragraph" style="color: #222222; text-align: right; width: inherit; --font-size-sub: 14px; --text-color-sub: #222222;">
                              <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${totalDiscountPrice}"/>원
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              
                <div class="divider_horizontal" style="height: 8px;">
                  <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;">
                  </div>
                </div>
              
                <div class="order-content">
                  <div class="order-content-wrapper">
                    <div class="text_body text-footer-section" style="border-radius: 10px; gap: 0px 2px; padding: 16px; background-color: #fff;">
                      <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 13px;">
                        상품은 Runfluence 또는 제휴 업체가 판매하며 각 거래 조건 등은 
                        <span class="text-lookup underline has_action">판매자 정보</span>
                        에서 확인해주시기 바랍니다.
                      </p>
                    </div>
                  </div>
                </div>
              
                <div class="divider_horizontal" style="height: 8px;">
                  <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;">
                  </div>
                </div>
                
                <div class="cart-buy-footer">
                  <div class="layout_list_horizontal_equal" style="margin: 8px; gap: 16px; justify-content: center;">
                    <button id="order-btn" class="button button_xlarge" style="border-radius: 10px; padding: 10px 16px; background-color: #ef6253; cursor: pointer; flex-grow:1; border: none;">
                      <div class="button__text">
                        <div class="text_body title_item" style="gap: 0px 4px;">
                          <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-truncate" style="color: #fff; text-align: left; width: inherit; font-size: 16px; white-space: nowrap;">
                            <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${totalProdPrice}"/>원
                            <em class="text-lookup bold" style="color: #fff; opacity: 0.65;">·</em> 주문하기
                          </p>
                        </div>
                      </div>
                    </button>
                  </div>
                </div>
                
              </div>
            </c:otherwise>
          </c:choose> 
        </div>
      </div>
    </div>
  </div>
</div>
<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
<form id="orderForm" name="orderForm" action="" method="post">
  <input type="hidden" id="prodIds" name="prodIds" value="">
  <input type="hidden" id="combIds" name="combIds" value="">
</form>
</body>
</html>