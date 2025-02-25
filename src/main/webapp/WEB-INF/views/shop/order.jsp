<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

}

/* SweetAlert2 전체 팝업 스타일 */
.swal2-popup {
    padding: 1.5em; /* 팝업 내부 여백 */
}

/* SweetAlert2 아이콘 스타일 */
.swal2-icon.swal-icon-center {
    margin: 0 auto; /* 수평 정렬 */
    display: flex; /* 플렉스 정렬 */
    align-items: center; /* 수직 정렬 */
    justify-content: center;
    width: 62px; /* 아이콘 크기 */
    height: 80px; /* 아이콘 크기 */
    padding: 10px; /* 내부 여백 */
    box-sizing: content-box; /* 패딩 포함 */
    border: .25em solid rgb(255, 255, 255);
}

/* 아이콘 내부 컨텐츠 크기 조정 */
.swal2-icon.swal-icon-center .swal2-icon-content {
    font-size: 50px; /* 아이콘 크기 */
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
    background-color: #f4f4f4;
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

  .text_table_left_align .title {
    align-items: flex-start;
    display: flex;
    flex: 0 0 auto;
    margin-right: 8px;
    width: 84px;
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
    color: #222222;
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
    display: grid;
    grid-template-columns: 1fr;  
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
    margin-top: 2px;
  }

  .product-list-info-default .bottom {
    align-items: flex-start;
    display: flex;
    gap: 4px;
    justify-content: space-between;
    margin-top: 8px;
  }

  .text-table-options--default {
    flex-wrap: wrap;
  }

  .text-table-options {
    align-items: center;
    display: flex;
    width: 100%;
  }

  .text-table-options--default .option1_item {
    flex: 0 1 auto;
  }

  .text-table-options--default .option-right-text {
    display: flex;
    flex: 0 1 auto;
  }

  .text-table-options--default .option-right-text .option2_item {
    margin: 0 3px;
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

  .text_table_right_align .title-labels {
    display: flex;
    justify-content: space-between;
  }

  .text-lookup.has_action {
    cursor: pointer;
  }

  .text-lookup.underline {
    -webkit-text-decoration: underline;
    text-decoration: underline;
  }

  .text-header-checkout>.left,
  .text-header-checkout>.right {
    align-items: center;
    display: flex;
    gap: 4px;
  }

  .text-header-checkout>.left {
    flex-grow: 1;
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

  .select_option_picker_justified {
    display: flex !important;
    flex-direction: column;
    justify-content: center;
    width: -webkit-fill-available;
  }

  .select_option_picker {
    background: #fff;
    border-radius: 10px;
    cursor: pointer;
    display: inline-flex;
    box-shadow: #ebebeb 0px 0px 0px 1px inset;
    width: -webkit-fill-available;
  }
  
  .select_option_picker_image {
    justify-content: center;
    padding: 2px 8px;
  }

  .select_option_picker_justified .justified__text {
    display: flex;
    flex-direction: column;
    justify-content: center;
    padding: 4px 0;
  }
  
  .select_option_picker_text > div {
    align-items: center;
    display: flex;
    flex-direction: column;
    gap: 2px;
    justify-content: center;
  }
  
  .select_option_picker_text {
    justify-content: center;
    padding: 8px 10px;
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

  .cart-buy-footer > .layout_list_horizontal_equal {
    margin: 0 auto !important;
    max-width: 700px;
    padding: 8px;
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

  .select_option_picker_justified> .justified {
    display: flex;
    gap: 8px;
    justify-content: space-between;
  }

  .select_option_picker_justified .justified__action-image {
    margin-right: -8px;
    padding: 8px;
  }

  .select_option_picker_justified .justified__right,
  .select_option_picker_justified .title-item {
    flex: 0 0 auto;
  }

  .flex-align-center {
    align-items: center;
    display: flex;
  }

  .fixed-top {
    position: relative;
  }
  
  .layout-grid-horizontal-equal {
    display: grid;
    grid-template-columns: repeat(3, 1fr);
    width: -webkit-fill-available;
  }
  
  .select_option_picker.selected {
    box-shadow: #222 0px 0px 0px 1px inset; 
  }
  
  .layout_list_vertical {
    align-items: flex-start;
    display: flex;
    flex-direction: column;
    width: -webkit-fill-available;
  }
  
  .cart-option-picker {
    position: relative;
    width: -webkit-fill-available;
  }
  
  .layer {
    bottom: 0;
    left: 0;
    position: fixed;
    right: 0;
    top: 0;
    z-index: 1010;
  }
  
  .layer .layer-background {
    background-color: rgba(34, 34, 34, .5);
    bottom: 0;
    height: 100%;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    width: 100%;
  }
  
  .layer-cart-my-address .layer_container {
    height: auto;
  }
  
  @media (max-width: 915px) {
    .layer_container {
        max-height: 100%;
    }
  }
  
  .layer_container {
    background-color: #fff;
    border-radius: 16px;
    box-shadow: 0 4px 10px 0 rgba(0, 0, 0, .1);
    left: 50%;
    overflow: hidden;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 448px;
  }
  
  .layer-cart-my-address .layer_container .btn_layer_close {
    top: 18px;
  }
  
  .btn_layer_close {
    cursor: pointer;
    position: absolute;
    right: 20px;
    top: 14px;
  }
  
  .ico-close {
    right: 20px;
  }
  
  [class*=ico-] {
    height: 24px;
    width: 24px;
  }
  
  .layer_header .title {
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
  }
  
  .lg .content-container, .md .content-container {
    height: 560px;
  }
  
  .content-container {
    height: calc(100vh - 60px);
    overflow-y: scroll;
    padding: 0 16px 80px;
  }
  
  .btn-address {
    align-items: center;
    border: 1px solid #ebebeb;
    border-radius: 10px;
    color: #222;
    cursor: pointer;
    display: flex;
    font-size: 14px;
    height: 44px;
    justify-content: center;
    margin-top: 8px;
    padding: 6px;
    text-align: center;
    width: 100%;
  }
  
  .address-container {
    border-bottom: 1px solid #ebebeb;
    color: #222;
    cursor: pointer;
    display: flex;
    font-size: 14px;
    padding: 20px 0;
  }
  
  .address-left {
    flex: 1;
  }
  
  .address-right, .name-container {
    align-items: center;
    display: flex;
  }
  
  .name {
    font-size: 15px;
    font-weight: 700;
    letter-spacing: -.15px;
  }
  
  .default-address {
    background: #f4f4f4;
    border-radius: 20px;
    font-size: 11px;
    margin-left: 4px;
    padding: 3px 8px;
  }
  
  .address {
    margin-top: 10px;
  }
  
  .phone {
    margin-top: 4px;
  }
  
  .address-right {
    margin-left: 12px;
  }
  
  .address-right, .name-container {
    align-items: center;
    display: flex;
  }
  
  
  /* 임시 추가 */
  .layer_shipping_memo .layer_container {
    height: auto;
    padding: 0 32px;
    width: 462px;
  }
  
  .btn_layer_close {
    cursor: pointer;
    position: absolute;
    right: 20px;
    top: 14px;
  }
  
  .layer_shipping_memo .layer_header .title {
    padding: 11px 0;
  }
  
  .button_shipping_memo_wrap.checked {
    font-weight: 700;
  }
  
  .ico-checked {
    height: 20px;
    width: 20px;
  }
  
  .button_shipping_memo_wrap + .button_shipping_memo_wrap {
    border-top: 1px solid rgba(34, 34, 34, .05);
  }
  
  .button_shipping_memo_wrap {
    cursor: pointer;
    display: flex;
    font-size: 15px;
    height: 54px;
    justify-content: space-between;
    padding: 17px 0;
  }
  
  .shipping_memo {
    border-top: 1px solid rgba(34, 34, 34, .05);
  }
  
  .shipping_memo_buttons {
    display: flex;
    gap: 8px;
    padding: 65px 0 32px;
    text-align: center;
  }
  
  .shipping_memo_buttons .btn {
    flex: 1;
  }
  
  .outlinegrey {
    border: 1px solid #d3d3d3;
    color: rgba(34, 34, 34, .8);
  }
  
  .large {
    letter-spacing: -.16px;
    padding: 0 25px;
  }
  
  .large, .xlarge.mobile {
    border-radius: 10px;
    font-size: 16px;
    height: 52px;
  }
  
  .solid {
    background-color: #222;
    color: #fff;
    font-weight: 700;
  }
  
  .large {
    letter-spacing: -.16px;
    padding: 0 25px;
  }
  
  .large, .xlarge.mobile {
    border-radius: 10px;
    font-size: 16px;
    height: 52px;
  }
  
  .textarea_shipping_memo {
    border: 1px solid #ebebeb;
    border-radius: 10px;
    font-size: 14px;
    height: 64px;
    padding: 14px 12px;
    width: 100%;
  }
  
  textarea {
    -webkit-appearance: none;
    background-color: transparent;
    outline: 0;
    padding: 0;
    resize: none;
    overflow: hidden;
  }
  
  .layer .layer-background {
    background-color: rgba(34, 34, 34, .5);
    bottom: 0;
    height: 100%;
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
    width: 100%;
  }
  
  .layer-cart-my-address .layer_container {
    height: auto;
  }
  
  .layer_delivery .layer_container {
    width: 520px;
  }
  
  .ico-header-back {
    left: 20px;
  }
  
  .header-button {
    cursor: pointer;
    position: absolute;
    top: 18px;
  }
  
  .layer-cart-my-address .delivery_bind, .mo .layer-register-address .layer_content, .sm .layer-register-address .layer_content {
    padding: 0 16px;
  }
  
  .layer_delivery .input_box:first-of-type {
    padding-top: 0;
  }
  
  .layer_delivery .input_box {
    padding-top: 16px;
  }
  
  .input_box {
    padding: 10px 0 14px;
    position: relative;
  }
  
  .has_error .input_title {
    color: #f15746;
  }
  
  .input_title {
    font-size: 13px;
    letter-spacing: -.07px;
    line-height: 18px;
    margin-bottom: 0 !important;
  }
  
  .input_item {
    position: relative;
  }
  
  .has_error .input_txt {
    border-bottom-color: #ef6253;
  }
  
  .input_txt {
    border-bottom: 1px solid #ebebeb;
    font-size: 15px;
    letter-spacing: -.15px;
    line-height: 22px;
    padding: 8px 0;
    width: 100%;
  }
  
  input {
    -webkit-appearance: none;
    background-color: transparent;
    border: 0;
    border-radius: 0;
    outline: 0;
    padding: 0;
    resize: none;
  }
  
  .has_error .input_error {
    color: #f15746;
    display: block;
    font-size: 11px;
    line-height: 16px;
    position: absolute;
  }
  
  .input_error {
    display: none;
  }
  
  .layer_delivery .input_box {
    padding-top: 16px;
  }
  
  .btn.btn_zipcode {
    bottom: 8px;
    position: absolute;
    right: 0;
  }
  
  .outline {
    border: 1px solid #d3d3d3;
  }
  
  .small {
    border-radius: 10px;
    font-size: 12px;
    height: 34px;
    letter-spacing: -.06px;
    padding: 0 14px;
  }
  
  .delivery_check .checkbox_item:last-child {
    margin-right: 0;
  }
  
  .delivery_check .checkbox_item {
    float: left;
    margin-right: 19px;
  }
  
  .checkbox_item {
    font-size: 0;
    position: relative;
  }
  
  .blind, .u_skip {
    clip: rect(0, 0, 0, 0) !important;
    height: 1px !important;
    margin: -1px !important;
    overflow: hidden !important;
    position: absolute !important;
    width: 1px !important;
  }
  
  .checkbox_item .check_label {
    cursor: pointer;
    display: inline-block;
    position: relative;
  }
  
  .layer_delivery .layer_btn {
    padding-top: 32px;
  }
  
  .layer_btn .btn {
    width: 120px;
  }
  
  .solid.disabled, .solid:disabled {
    background-color: rgba(34, 34, 34, .2);
    color: #fff;
    cursor: default;
    font-weight: 400;
  }
  
  .medium {
    height: 42px;
    letter-spacing: -.14px;
    padding: 0 18px;
  }
  
  .large.mobile, .medium {
    border-radius: 10px;
    font-size: 14px;
  }
  
  .checkbox_item .label_txt {
    display: inline-block;
    font-size: 13px;
    letter-spacing: -.07px;
    line-height: 24px;
    padding-left: 8px;
    vertical-align: top;
  }
  
  .layer_btn {
    display: flex;
    justify-content: center;
    padding: 24px 32px 32px;
  }
  
  .layer_delivery .delivery_check:after {
    clear: both;
    content: "";
    display: block;
  }
  
  .input_txt:focus {
    border-bottom: 2px solid #333;
    padding-bottom: 7px;
  }
  
    .cart-not-fixed {
  position: relative !important; /* fixed 해제 */
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="https://nsp.pay.naver.com/sdk/js/naverpay.min.js"></script>
<script src="https://js.tosspayments.com/v2/standard"></script>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
<c:choose>
  <c:when test="${cartList.size() eq 0}">
    alert("장바구니가 비었습니다.");
    location.href = "/shop/cart";
  </c:when>  
  <c:otherwise>
$(document).ready(function () {
    $("#toggle-icon").on("click", function () {
        if ($(".toggle-section").is(":visible")) {
            $(".toggle-section").slideUp();
            $("#arrow-down").show();
            $("#arrow-up").hide();
            
        } else {
            $(".toggle-section").slideDown();
            $("#arrow-down").hide();
            $("#arrow-up").show();
        }
    });
    
    $(document).on("click", "#btn-add-addr", function (e) {
        e.preventDefault();
        
        $.ajax({
            url: "/user/addrList",
            type: "POST",
            dataType: "JSON",   
            beforeSend: function (xhr) {
                 xhr.setRequestHeader("AJAX", "true");
            },
            success: function (response) {
                if (response.code === 200) {
                    var addrList = response.data; 
                    const addrNum = $("#selectedAddr").data('addrnum');

                    var modalContent = 
                        '<div class="vue-portal-target">' +
                          '<div>' +
                            '<div class="layer-cart-my-address layer lg full" id="myModal">' +
                              '<div class="layer-background"></div>' +
                              '<div class="layer_container" style="width: 520px; height: 620px;">' +
                                '<a href="#" class="btn_layer_close" id="closeModal">' +
                                  '<svg class="ico-close icon sprite-icons" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">' +
                                    '<path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"/>' +
                                  '</svg>' +
                                '</a>' +
                                '<div class="layer_header">' +
                                  '<h2 class="title">주소록</h2>' +
                                '</div>' +
                                '<div class="layer_content">' +
                                  '<div class="content-container">' +
                                    '<button id="btn-address" class="btn-address">+ 새 주소 추가하기</button>' +
                                    '<div>';

                    addrList.forEach(function (addr) {
                        modalContent += 
                            '<div class="address-container" data-addrnum="'+ addr.shippingAddrNum + '">' +
                              '<div class="address-left">' +
                                '<div class="name-container">' +
                                    '<span class="name">' + addr.recipientName + '</span>' +
                                    (addr.isDefault === 'Y' ? '<span class="default-address">기본 배송지</span>' : '') +
                                '</div>' +
                                '<div class="address">' +
                                    '<span>(' + addr.shippingAddrZipcode + ')</span>' +
                                    ' <span>' + addr.shippingAddrLine1 + ' ' + addr.shippingAddrLine2 + '</span>' +
                                '</div>' +
                                '<div class="phone">' + formatPhoneNumber(addr.recipientTel) + '</div>' +
                              '</div>' +
                              (addr.shippingAddrNum === addrNum ? 
                                  '<div class="address-right">' +
                                    '<svg class="ico-check-s icon sprite-icons" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">' +
                                      '<path fill="#222" d="M9 18l-5-5 1.4-1.4L9 15.2l9.6-9.6 1.4 1.4z"/>' +
                                    '</svg>' +
                                  '</div>' : '') +
                                '</div>';
                    });

                    modalContent += 
                                  '</div>' +
                                '</div>' +
                              '</div>' +
                            '</div>' +
                          '</div>' +
                        '</div>';

                    $("#modal-layer").append(modalContent);
            
                } else if (response.code === 500) {
                    alert("DB 정합성 오류 입니다.");
                   
                } else {
                    alert("서버 응답 오류로 배송지 조회에 실패하였습니다.");
                }
            },
            error: function (error) {
               alert("서버 응답 오류로 배송지 조회에 실패하였습니다.");
               icia.common.error(error);
            }
        });
    });
    
    $("#modal-layer").on("click", ".address-container", function () {
        const addrNum = $(this).data('addrnum');
        const name = $(this).find('.name').text();
        const address = $(this).find('.address span').map(function() {
            return $(this).text().trim(); 
        }).get().join(' ');
        const phone = $(this).find('.phone').text();
        
        var $selectedAddr = $("#selectedAddr");
        
        if ($selectedAddr.length) {
            $selectedAddr.data('addrnum', addrNum);
            $selectedAddr.find('#name').text(name);
            $selectedAddr.find('#phone').text(phone);
            $selectedAddr.find('#addressLine').text(address);
        
        } else {
            var $addressContentWrapper = $("#address-content-wrapper");
            
            $addressContentWrapper.empty();
            
            var htmlContent = 
                '<div class="text-header-checkout d-flex align-items-center mb-2" style="gap: 8px;">' +
                  '<div class="flex-grow-1">' +
                    '<div class="text-body title-item d-flex align-items-center" style="gap: 0px 2px;">' +
                      '<p class="text-lookup semibold text-truncate m-0" style="color: #222; font-size: 16px;">배송 주소</p>' +
                    '</div>' +
                  '</div>' +
                  '<div class="d-flex align-items-center gap-2">' +
                    '<button id="btn-add-addr" class="btn btn-outline-secondary btn-sm rounded-pill" style="padding: 2px 10px; min-height: 24px; min-width: 60px;">' +
                      '<span class="text-black text-truncate" style="max-width: 100%; font-size: 12px;">주소 변경</span>' +
                    '</button>' +
                  '</div>' +
                '</div>' +
                '<div id="selectedAddr" data-addrnum="' + addrNum + '">' +
                  '<div style="height: 8px;"></div>' +
                  '<div class="text_table_left_align" style="padding: 3px 16px;">' +
                    '<div>' +
                      '<div class="text_body title">' +
                        '<p class="text-lookup text-element line_break_by_truncating_tail">받는 분</p>' +
                      '</div>' +
                    '</div>' +
                    '<div class="labels-description">' +
                      '<div class="text_table_labels">' +
                        '<div class="labels">' +
                          '<div class="text-body labels__label1">' +
                            '<p id="name" class="text-lookup display_paragraph">' + name + '</p>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>' +
                  '</div>' +
                  '<div style="height: 4px;"></div>' +
                  '<div class="text_table_left_align px-3">' +
                    '<div>' +
                      '<div class="text_body title">' +
                        '<p class="text-lookup text-element line_break_by_truncating_tail">연락처</p>' +
                      '</div>' +
                    '</div>' +
                    '<div class="labels-description">' +
                      '<div class="text_table_labels labels">' +
                        '<div class="labels">' +
                          '<div class="text_body labels__label1">' +
                            '<p id="phone" class="text-lookup display_paragraph">' + phone + '</p>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>' +
                  '</div>' +
                  '<div style="height: 4px;"></div>' +
                  '<div class="text_table_left_align px-3">' +
                    '<div>' +
                      '<div class="text_body title">' +
                        '<p class="text-lookup text-element line_break_by_truncating_tail">주소</p>' +
                      '</div>' +
                    '</div>' +
                    '<div class="labels-description">' +
                      '<div class="text_table_labels labels">' +
                        '<div class="labels">' +
                          '<div class="text_body labels__label1">' +
                            '<p id="addressLine" class="text-lookup display_paragraph">' + address + '</p>' +
                          '</div>' +
                        '</div>' +
                      '</div>' +
                    '</div>' +
                  '</div>' +
                '</div>' +
                '<div id="btn-select-memo" class="control_data_box d-flex p-3 rounded-3 bg-white cursor-pointer">' +
                  '<div class="control_data_box__text d-flex align-items-center flex-grow-1 gap-1">' +
                    '<p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-muted" style="font-size: 14px;">요청사항 없음</p>' +
                  '</div>' +
                  '<div class="d-flex align-items-center">' +
                    '<div class="control_data_box__action content_image" style="color: #6c6c6c;">' +
                      '<div class="content_image" style="width: 7px; height: 14px; cursor: pointer;">' +
                        '<picture class="picture image" style="object-fit: none; aspect-ratio: auto;">' +
                          '<source type="image/webp" srcset="/resources/shop/img/arrow_right.png">' +
                          '<source srcset="/resources/shop/img/arrow_right.png">' +
                          '<img src="/resources/shop/img/arrow_right.png" width="7px" height="14px" class="image">' +
                        '</picture>' +
                      '</div>' +
                    '</div>' +
                  '</div>' +
                '</div>';

            $addressContentWrapper.append(htmlContent);
        }
        
        $(this).closest('.vue-portal-target').remove();
    });

    $("#modal-layer").on("click", "#btn-address", function () {
        $(this).closest('.layer_content').append(
          '<div class="layer_delivery layer-register-address layer lg">' +
            '<div class="layer-background"></div>' +
            '<div class="layer_container" style="width: 520px; height: 620px;">' +
              '<svg id="backModal" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" fill="none" class="ico-header-back header-button icon sprite-icons">' +
                '<path fill="#fff" d="M0 0h24v24H0z"/>' +
                '<g>' +
                  '<path d="M10.75 3.5l-8.485 8.485 8.485 8.486" stroke="#000" stroke-width="1.5"/>' +
                  '<path d="M3 12h19" stroke="#000" stroke-width="1.5" stroke-linejoin="round"/>' +
                '</g>' +
              '</svg>' +
              '<div>' +
                '<svg id="closeModal" xmlns="http://www.w3.org/2000/svg" class="ico-close header-button icon sprite-icons" viewBox="0 0 24 24">' +
                  '<path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd" />' +
                '</svg>' +
              '</div>' +
              '<div class="layer_header">' +
                '<h2 class="title"> 주소 추가하기 </h2>' +
              '</div>' +
              '<div class="layer_content">' +
                '<div class="delivery_bind">' +
                  '<div class="delivery_input">' +
                    '<div class="input_box">' +
                      '<h4 class="input_title">이름</h4>' +
                      '<div class="input_item">' +
                        '<input id="recipientName" name="recipientName" type="text" placeholder="수령인의 이름" autocomplete="off" class="input_txt text_fill">' +
                      '</div>' +
                      '<p class="input_error">올바른 이름을 입력해주세요. (2 - 50자)</p>' +
                    '</div>' +
                    '<div class="input_box">' +
                      '<h4 class="input_title">휴대폰 번호</h4>' +
                      '<div class="input_item">' +
                        '<input id="recipientTel" name="recipientTel" type="tel" placeholder="- 없이 입력" autocomplete="off" class="input_txt text_fill">' +
                      '</div>' +
                      '<p class="input_error">정확한 휴대폰 번호를 입력해주세요.</p>' +
                    '</div>' +
                    '<div class="input_box">' +
                      '<h4 class="input_title">우편번호</h4>' +
                      '<div class="input_item">' +
                        '<input id="zipcode" name="zipcode" type="text" placeholder="우편 번호를 검색하세요" readonly="readonly" autocomplete="off" class="input_txt text_fill">' +
                        '<a href="#" id="btn-zip" name="btn-zip" class="btn btn_zipcode d-inline-flex align-items-center justify-content-center text-center align-middle outline small"> 우편번호 </a>' +
                      '</div>' +
                    '</div>' +
                    '<div class="input_box">' +
                      '<h4 class="input_title">주소</h4>' +
                      '<div class="input_item">' +
                        '<input id="addrLine1" name="addrLine1" type="text" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly="readonly" autocomplete="off" class="input_txt text_fill">' +
                      '</div>' +
                    '</div>' +
                    '<div class="input_box">' +
                      '<h4 class="input_title">상세 주소</h4>' +
                      '<div class="input_item">' +
                        '<input id="addrLine2" name="addrLine2" type="text" placeholder="건물, 아파트, 동/호수 입력" autocomplete="off" class="input_txt text_fill">' +
                      '</div>' +
                    '</div>' +
                  '</div>' +
                  '<div class="delivery_check">' +
                    '<div class="checkbox_item">' +
                      '<input id="check1" type="checkbox" name="" class="blind">' +
                      '<label for="check1" class="check_label">' +
                        '<svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-check-inactive" viewBox="0 0 24 24" fill="none">' +
                          '<rect x=".5" y=".5" width="23" height="23" rx="1.5" stroke="#D3D3D3" />' +
                        '</svg>' +
                        '<span class="label_txt">기본 배송지로 설정</span>' +
                      '</label>' +
                    '</div>' +
                  '</div>' +
                '</div>' +
                '<div class="v-portal" style="display: none;"></div>' +
                '<div class="layer_btn">' +
                  '<a href="#" class="btn btn_save solid medium d-inline-flex align-items-center justify-content-center text-center align-middle disabled"> 저장하기 </a>' +
                '</div>' +
              '</div>' +
            '</div>' +
          '</div>'
        );
    });
    
    $("#modal-layer").on("input", "#recipientName", function() {
        var recipientName = $(this).val();
        var nameRegex = /^[A-Za-z가-힣]{2,50}$/;

        var $saveButton = $(this).closest('.layer_content').find('.btn_save');

        if (nameRegex.test(recipientName)) {
            $(this).closest('.input_box').removeClass('has_error');
            $(this).siblings('.input_error').hide();
            
        } else {
            $(this).closest('.input_box').addClass('has_error');
            $(this).siblings('.input_error').show();
            $saveButton.prop('disabled', true).addClass('disabled');
        }
    });
    
    $("#modal-layer").on("input", "#recipientTel", function() {
        var recipientTel = $(this).val();
        var telRegex = /^(01[0-9])\d{3,4}\d{4}$/;
        
        var $saveButton = $(this).closest('.layer_content').find('.btn_save');
        
        if (telRegex.test(recipientTel)) {
            $(this).closest('.input_box').removeClass('has_error');
            $(this).siblings('.input_error').hide();
            
        } else {
            $(this).closest('.input_box').addClass('has_error');
            $(this).siblings('.input_error').show();
            $saveButton.prop('disabled', true).addClass('disabled');   
        }
    });
    
    $("#modal-layer").on("click", "#btn-zip", function() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = '';
                var extraAddr = '';
    
                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }
    
                if (data.userSelectedType === 'R') {
                    if (data.bname && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    
                    addr += extraAddr;
                    
                } else {
                    $('#addrLine1').val('');
                }
    
                $('#zipcode').val(data.zonecode);
                $('#addrLine1').val(addr);
                $('#addrLine2').focus();
            }
        }).open();
    });
    
    $("#modal-layer").on("click", ".checkbox_item", function () {
        var $this = $(this); 
        var $input = $this.find("input[type='checkbox']"); 
        var $svg = $this.find("svg"); 

        var isChecked = !$input.prop("checked"); 
        $input.prop("checked", isChecked);

        if (isChecked) {
            var activeSvg = '<svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-check-active" viewBox="0 0 24 24" fill="none">' +
                              '<rect width="24" height="24" rx="2" fill="#000"/>' +
                              '<path d="M18.4 7.2L9.6 16l-4-4" stroke="#fff" stroke-width="1.5"/>' +
                            '</svg>';
            $svg.replaceWith(activeSvg);
        } else {
            var inactiveSvg = '<svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-check-inactive" viewBox="0 0 24 24" fill="none">' +
                                '<rect x=".5" y=".5" width="23" height="23" rx="1.5" stroke="#D3D3D3" />' +
                              '</svg>';
            $svg.replaceWith(inactiveSvg);
        }
    });
    
    $("#modal-layer").on("input", "#addrLine2", function () {
        var $recipientName = $('#recipientName');
        var recipientName = $('#recipientName').val();
        var nameRegex = /^[A-Za-z가-힣]{2,50}$/;
        var $saveButton = $(this).closest('.layer_content').find('.btn_save');

        if (!nameRegex.test(recipientName)) {
            $recipientName.closest('.input_box').addClass('has_error');
            $recipientName.siblings('.input_error').show();
            $saveButton.prop('disabled', true).addClass('disabled');
            return;
        }
        
        var $recipientTel = $('#recipientTel');
        var recipientTel = $('#recipientTel').val();
        var telRegex = /^(01[0-9])\d{3,4}\d{4}$/;

        if (!telRegex.test(recipientTel)) {
            $recipientTel.closest('.input_box').addClass('has_error');
            $recipientTel.siblings('.input_error').show();           
            $saveButton.prop('disabled', true).addClass('disabled');
            return;
        } 
        
        if (($.trim($('#zipcode').val()).length !== 0) && ($.trim($('#addrLine1').val()).length !== 0) && ($.trim($('#addrLine2').val()).length !== 0)) {
            $saveButton.prop('disabled', false).removeClass('disabled');
            
        } else {
            $saveButton.prop('disabled', true).addClass('disabled');
        }
    });
    
    $("#modal-layer").on("click", ".btn_save", function (e){
        e.preventDefault();
        
        var isChecked = $('#check1').prop('checked') ? 'Y' : 'N';
        
        $.ajax({
            url: "/user/addrInsert",
            type: "POST",
            dataType: "JSON",
            data: {
                recipientName: $('#recipientName').val(),
                recipientTel: $('#recipientTel').val(),
                addrLine1: $("#addrLine1").val(),
                addrLine2: $("#addrLine2").val(),
                zipcode: $("#zipcode").val(),
                isDefault: isChecked
            },
            beforeSend: function (xhr) {
                  xhr.setRequestHeader("AJAX", "true");
            },
            success: function (response) {
                if (response.code === 200) {
                    Swal.fire({
                          title: "배송지가 추가되었습니다!",
                          icon: "success",
                          customClass: {
                            popup: 'swal2-popup',
                            icon: 'swal-icon-center' 
                        }
                        });
                    $('.layer_delivery').remove();

                    var $div = $(".layer_content .content-container > div");
                    $div.children().remove();
                    const addrNum = $("#selectedAddr").data('addrnum');

                    response.data.forEach(function (addr) {
                        var addressHtml =
                            '<div class="address-container" data-addrnum="'+ addr.shippingAddrNum + '">' +
                              '<div class="address-left">' +
                                '<div class="name-container">' +
                                  '<span class="name">' + addr.recipientName + '</span>';

                        if (addr.isDefault === 'Y') {
                            addressHtml +=
                              '<span class="default-address">기본 배송지</span>';
                        }

                        addressHtml +=
                                '</div>' +
                                '<div class="address">' +
                                  '<span>(' + addr.shippingAddrZipcode + ')</span>' +
                                  ' <span>' + addr.shippingAddrLine1 + ' ' + addr.shippingAddrLine2 + '</span>' +
                                '</div>' +
                                '<div class="phone">' + formatPhoneNumber(addr.recipientTel) + '</div>' +
                              '</div>';  

                        if (addr.shippingAddrNum === addrNum) {
                            addressHtml +=
                                '<div class="address-right">' +
                                  '<svg class="ico-check-s icon sprite-icons" xmlns="http://www.w3.org/2000/svg" fill="none" viewBox="0 0 24 24">' +
                                    '<path fill="#222" d="M9 18l-5-5 1.4-1.4L9 15.2l9.6-9.6 1.4 1.4z"/>' +
                                  '</svg>' +
                                '</div>';
                        }

                        addressHtml +=
                            '</div>'; 

                        $div.append(addressHtml);
                    });

                } else if (response.code === 500) {
                    alert("DB 정합성 오류 입니다.");
                } else {
                    alert("서버 응답 오류로 배송지 등록에 실패하였습니다.");
                }
            },
            error: function (error) {
                alert("서버 응답 오류로 배송지 등록에 실패하였습니다.");
                icia.common.error(error);
            }
        });
    });
    
    $("#modal-layer").on("click", "#closeModal", function () {
        $(this).closest('.vue-portal-target').remove();
    });
    
    $("#modal-layer").on("click", "#backModal", function () {
        $('.layer_delivery').remove();  
    });
    
    $(document).on("click", "#btn-select-memo", function() {
        $("#modal-layer").append(
            '<div class="vue-portal-target">' +
              '<div class="layer_shipping_memo layer lg">' +
                '<div class="layer-background"></div>' +
                '<div class="layer_container">' +
                  '<a href="#" class="btn_layer_close">' +
                      '<svg xmlns="http://www.w3.org/2000/svg" class="icon sprite-icons ico-close">' +
                          '<path fill="#222" fill-rule="evenodd" d="M11.293 12l-7.647 7.646.708.707L12 12.707l7.646 7.646.708-.707L12.707 12l7.647-7.646-.708-.708L12 11.293 4.354 3.646l-.708.708L11.293 12z" clip-rule="evenodd"/>' +
                      '</svg>' +
                  '</a>' +
                  '<div class="layer_header">' +
                      '<p class="title">배송 요청사항</p>' +
                  '</div>' +
                  '<div class="layer_content">' +
                    '<div class="button_shipping_memo_wrap selectable">' +
                      '<p>요청사항 없음</p>' +
                    '</div>' +
                    '<div class="button_shipping_memo_wrap selectable">' +
                      '<p>문 앞에 놓아주세요.</p>' +
                    '</div>' +
                    '<div class="button_shipping_memo_wrap selectable">' +
                      '<p>경비실에 맡겨 주세요.</p>' +
                    '</div>' +
                    '<div class="button_shipping_memo_wrap selectable">' +
                      '<p>파손 위험 상품입니다. 배송 시 주의해주세요.</p>' +
                    '</div>' +
                    '<div class="shipping_memo">' +
                      '<div class="button_shipping_memo_wrap direct_input">' +
                        '<p>직접 입력</p>' +
                      '</div>' +
                    '</div>' +
                    '<div class="shipping_memo_buttons">' +
                      '<button type="button" class="btn d-inline-flex align-items-center justify-content-center text-center align-middle outlinegrey large"> 취소 </button>' +
                      '<a href="#" class="btn d-inline-flex align-items-center justify-content-center text-center align-middle solid large"> 적용하기 </a>' +
                    '</div>' +
                  '</div>' +
                '</div>' +
              '</div>' +
            '</div>'
        );

        var pText = $("#btn-select-memo").find('.control_data_box__text').find('p').text();
        var svg = '<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-checked" viewBox="0 0 20 20" fill="none" class="ico-checked icon sprite-icons">' +
                    '<path d="M3.5 9.675L8.28 15.5 16.5 3" stroke="#222" stroke-width="2" stroke-linejoin="round"/>' +
                  '</svg>';
        
        var flag = true;
        
        $(".layer_content .button_shipping_memo_wrap.selectable").each(function() {
            var $this = $(this);
            var currentText = $this.find('p').text();

            if (currentText === pText) {
                $this.addClass('checked');
                $this.find('.ico-checked').remove(); 
                $this.append(svg); 
                flag = false; 
                return false; 
            } 
        });
        
        if (flag) {
            $shippingMemo = $(".shipping_memo");
            
            $shippingMemo.find('div').addClass('checked');
            $shippingMemo.find('div').append(svg);
            
            var textarea = '<div>' + 
                              '<textarea id="textarea_shipping_memo" placeholder="내용을 입력해주세요.(최대 40자)" maxlength="40" class="textarea_shipping_memo">' +
                                 pText +
                              '</textarea>' +
                            '</div>';
            $shippingMemo.append(textarea);
        }
    });

    $("#modal-layer").on('click', '.button_shipping_memo_wrap.selectable', function() {
        var $this = $(this);  

        $('.button_shipping_memo_wrap.checked').each(function() {
            var $checkedItem = $(this);
            if ($checkedItem[0] !== $this[0]) {  
                $checkedItem.removeClass('checked');
                $checkedItem.find('.ico-checked').remove(); 
            }
            
            if ($checkedItem.parent().hasClass('shipping_memo')) {
                $checkedItem.siblings().remove();
                
                var $aTag = $('.shipping_memo_buttons a');
                $aTag.removeClass("disabled");
                $aTag.css("cursor", "pointer");
            }
        });
        
        if (!$this.hasClass('checked')) {
            $this.addClass('checked');  
            var svg = '<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-checked" viewBox="0 0 20 20" fill="none" class="ico-checked icon sprite-icons">' +
                        '<path d="M3.5 9.675L8.28 15.5 16.5 3" stroke="#222" stroke-width="2" stroke-linejoin="round"/>' +
                      '</svg>';
            $this.append(svg);
        }
    });

    $("#modal-layer").on('click', '.button_shipping_memo_wrap.direct_input', function() {
        var $this = $(this);  

        $('.button_shipping_memo_wrap.selectable.checked').each(function() {
            var $checkedItem = $(this);
            
            if ($checkedItem[0] !== $this[0]) {  
                $checkedItem.removeClass('checked');
                $checkedItem.find('.ico-checked').remove();
            }
        });
        
        if (!$this.hasClass('checked')) {
            $this.addClass('checked');  
            var svg = '<svg xmlns="http://www.w3.org/2000/svg" id="i-ico-checked" viewBox="0 0 20 20" fill="none" class="ico-checked icon sprite-icons">' +
                        '<path d="M3.5 9.675L8.28 15.5 16.5 3" stroke="#222" stroke-width="2" stroke-linejoin="round"/>' +
                      '</svg>';
            $this.append(svg);
            var textarea = '<div>' + 
                             '<textarea id="textarea_shipping_memo" placeholder="내용을 입력해주세요.(최대 40자)" maxlength="40" class="textarea_shipping_memo"></textarea>' +
                           '</div>';
            $this.closest('.shipping_memo').append(textarea);
        }
        
        var $aTag = $this.closest('.layer_content').find('.shipping_memo_buttons a');
        $aTag.addClass("disabled");
        $aTag.css("cursor", "not-allowed");
    });
    
    $("#modal-layer").on("input", ".textarea_shipping_memo", function() {
        var $textarea = $(this);
        var $aTag = $('.shipping_memo_buttons a');
        
        if ($.trim($textarea.val()).length !== 0) {
            $aTag.removeClass("disabled");
            $aTag.css("cursor", "pointer");
            
        } else {
            $aTag.addClass("disabled");
            $aTag.css("cursor", "not-allowed");
        }
    });
    
    $("#modal-layer").on("click", ".btn_layer_close, .shipping_memo_buttons button", function() { 
        $(this).closest('.vue-portal-target').remove();
    });
    
    $("#modal-layer").on("click", ".shipping_memo_buttons a", function() {
        var pText;

        if ($(".textarea_shipping_memo").length) {
            pText = $(".textarea_shipping_memo")[0].value; 
        } else {
            pText = $('.button_shipping_memo_wrap.selectable.checked').find('p').text();
        }

        var $pTag = $("#btn-select-memo").find('.control_data_box__text').find('p');
        $pTag.text(pText);
        
        $(this).closest('.vue-portal-target').remove();
    });

    $("#pay-btn").on("click", function (e) {
        e.preventDefault();
        var selectedId = $(".select_option_picker.selected").attr('id');
        var shippingMemo = $("#btn-select-memo").find('.control_data_box__text').find('p').text();
        
        $.ajax({
            type: "POST",
            url: "/shop/orderInsert",
            data: {
                prodIds: $("#prodIds").val(),
                combIds: $("#combIds").val(),
                shippingAddrNum: $("#selectedAddr").data('addrnum'),
                paymentType: selectedId,
                shippingMemo: shippingMemo
            },
            dataType: "JSON",
            beforeSend: function(xhr) {
                xhr.setRequestHeader("AJAX", "true");
            },
            success: function(response) {
                if (response.code === 200) {
                    const order = response.data;

                    if (selectedId === "NAVER_PAY") {
                        const cartList = ${cartListJson}; 
                        const productCount = cartList.reduce((total, cart) => total + cart.cartQuantity, 0);
                        const productName = cartList[0].prodName;

                        var productItems = cartList.map(cart => ({
                            "categoryType": "PRODUCT",
                            "categoryId": "GENERAL",
                            "uid": cart.prodId,
                            "name": cart.prodName,
                            "count": cart.cartQuantity
                        }));

                        var oPay = Naver.Pay.create({
                            "clientId": "${X_NAVER_CLIENT_ID}",
                            "chainId": "${X_NAVERPAY_CHAIN_ID}",
                            "mode": "development",
                            "openType": "popup",
                            "onAuthorize": function (oData) {
                                if (oData.resultCode === "Success") {
                                    $.ajax({
                                        url: "/shop/order/naverPay/success",
                                        type: "POST",
                                        data: {
                                            orderId: order.orderId,
                                            paymentId: oData.paymentId
                                        },
                                        dataType: "JSON",
                                        beforeSend: function(xhr) {
                                            xhr.setRequestHeader("AJAX", "true");
                                        },
                                        success: function(naverResponse) {
                                            if (naverResponse.code === 200) {
                                                alert("결제가 완료되었습니다.");
                                                const orderIdParam = encodeURIComponent(order.orderId);
                                                location.href = "/shop/payOk?orderId=" + orderIdParam;
                                                
                                            } else if (naverResponse.code === 400) {
                                                alert(naverResponse.msg);
                                                location.href = "/user/buy?tab=inProgressing";
                                                
                                            } else if (naverResponse.code === 500) {
                                                alert("네이버 페이 결제 처리중 오류가 발생하였습니다.");
                                                location.href = "/user/buy?tab=inProgressing";
                                                
                                            } else if (naverResponse.code === 601) {
                                                alert("DB 정합성 오류가 발생하였습니다.");
                                                location.href = "/user/buy?tab=inProgressing";
                                                
                                            } else {
                                                alert("DB 정합성 오류가 발생하였습니다.");
                                                location.href = "/user/buy?tab=inProgressing";
                                            }
                                        },
                                        error: function(error) {
                                            alert("네이버 페이 서버 오류로 결제에 실패하였습니다.");
                                            icia.common.error(error);
                                            location.href = "/user/buy?tab=inProgressing";
                                        }
                                    });
                                    
                                } else {
                                    alert(oData.resultMessage);
                                    location.href = "/user/buy?tab=inProgressing";
                                }
                            }
                        });
                                        
                        oPay.open({
                            "merchantPayKey": "20241209vUhybA",
                            "productName": productName, 
                            "productCount": productCount, 
                            "totalPayAmount": order.orderTotalPrice, 
                            "taxScopeAmount": order.orderTotalPrice, 
                            "taxExScopeAmount": "0", 
                            "returnUrl": "https://developers.pay.naver.com/user/sand-box/payment",
                            "productItems": productItems 
                        });
                        
                    } else if (selectedId === "KAKAO_PAY") {
                          $.ajax({
                              type: "POST",
                              url: "/shop/order/kakaoPay/ready",
                              data: {
                                  orderId: order.orderId,
                              },
                              dataType: "JSON",
                              beforeSend: function(xhr) {
                                  xhr.setRequestHeader("AJAX", "true");
                              },
                              success: function(kakaoResponse) {
                                  if (kakaoResponse.code === 200) {
                                      let _width = 500;
                                      let _height = 550;
                                      
                                      let _left = Math.ceil((window.screen.width - _width) / 2);
                                      let _top = Math.ceil((window.screen.height - _height) / 2);
                                      
                                      kakaoPayPopup = window.open(kakaoResponse.data.next_redirect_pc_url, "카카오페이 결제", "width="+_width+", height="+_height+", left="+_left+", top="+_top+", resizable=false, scrollbars=false, status=false, titlebar=false, toolbar=false, menubar=false");

                                  } else {
                                      alert(kakaoResponse.msg);
                                      location.href = "/user/buy?tab=inProgressing";
                                  }
                                  
                                  var checkPopupClosedInterval = setInterval(function() {
                                      if (kakaoPayPopup.closed) {
                                          clearInterval(checkPopupClosedInterval);
                                          alert("결제가 취소되었습니다.");
                                          location.href = "/user/buy?tab=inProgressing";  
                                      }
                                  }, 1000);
                                  
                              },
                              error: function(error) {
                                  alert("카카오 페이 서버 오류로 결제에 실패하였습니다.");
                                  icia.common.error(error);
                              }
                          });
                          
                      
                      } else if (selectedId === "TOSS_PAY") {
                          
                          const cartList = ${cartListJson}; 
                          const productCount = cartList.length; 
                          const productName = cartList[0].prodName;
                          
                          let orderName;
                          
                          if (productCount > 1) {
                              orderName = productName + " 외 " + (productCount - 1) + "건";
                          
                          } else {
                              orderName = productName;
                          }
                          
                          const clientKey = "${TOSSPAY_CLIENT_KEY}";
                          const customerKey = "${customerKey}";
                          const tossPayments = TossPayments(clientKey);
                          const payment = tossPayments.payment({customerKey});
                          
                          payment.requestPayment({
                                method: "CARD", 
                                amount: {
                                    currency: "KRW",
                                    value: order.orderTotalPrice,
                                },
                                orderId: order.orderId, 
                                orderName: orderName,
                                customerEmail: "${user.userEmail}",
                                customerName: "${user.userName}",
                                windowTarget: "iframe",
                                card: {
                                    useEscrow: false,
                                    flowMode: "DEFAULT", 
                                    useCardPoint: false,
                                    useAppCardOnly: false,
                                },
                            }).then(function (data) {
                        
                                $.ajax({
                                    type: "POST",
                                    url: "/shop/order/tossPay/success",
                                    data: {
                                        paymentKey: data.paymentKey, 
                                        orderId: data.orderId,     
                                        amount: data.amount.value       
                                    },
                                    dataType: "JSON",
                                    beforeSend: function(xhr) {
                                        xhr.setRequestHeader("AJAX", "true");
                                    },
                                    success: function(tossResponse) {
                                        if (tossResponse.code === 200) {
                                            alert("결제가 완료되었습니다.");
                                            const orderIdParam = encodeURIComponent(order.orderId);
                                            location.href = "/shop/payOk?orderId=" + orderIdParam;
                                            
                                        } else if (tossResponse.code === 400) {
                                            alert(tossResponse.msg);
                                            location.href = "/user/buy?tab=inProgressing";
                                            
                                        } else if (tossResponse.code === 500) {
                                            alert("토스 페이 결제 처리중 오류가 발생하였습니다.");
                                            location.href = "/user/buy?tab=inProgressing";
                                            
                                        } else if (tossResponse.code === 601) {
                                            alert("DB 정합성 오류가 발생하였습니다.");
                                            location.href = "/user/buy?tab=inProgressing";
                                            
                                        } else if (tossResponse.code === 404) {
                                            alert("파라미터가 올바르지 않습니다.");
                                            location.href = "/user/buy?tab=inProgressing";
                                            
                                        } else {
                                            alert("DB 정합성 오류가 발생하였습니다.");
                                            location.href = "/user/buy?tab=inProgressing";
                                        }
                                    },
                                    error: function(error) {
                                        alert("토스 페이 서버 오류로 결제에 실패하였습니다.");
                                        icia.common.error(error);
                                        location.href = "/user/buy?tab=inProgressing";
                                    }
                                });
                                
                            }).catch(function (error) {
                                alert("토스 페이 결제 오류: " + error.message);
                                location.href = "/user/buy?tab=inProgressing";
                            });
                          
                      } else {
                          alert("결제 수단을 선택하세요.");
                      }
                    
                } else if (response.code === 502) {
                    alert("데이터 정합성 오류로 주문 데이터 생성에 실패하였습니다.");
                    
                } else if (response.code === 406) {
                    alert("재고가 부족한 제품이 있습니다. 장바구니로 이동합니다.");
                    location.href = "/shop/cart";
                    
                } else if (response.code === 503) {
                    alert("재고가 부족한 제품이 있습니다. 장바구니로 이동합니다.");
                    location.href = "/shop/cart";
                    
                } else if (response.code === 520) {
                    alert("DB 정합성 오류로 주문 데이터 생성에 실패하였습니다.");
                
                } else {
                    alert("서버 응답오류로 주문 데이터 생성에 실패하였습니다.");
                }
            },
            error: function(error) {
                alert("서버 응답오류로 주문 데이터 생성에 실패하였습니다.");
                icia.common.error(error);
            }
        });
    });
    
    $(".layout-grid-horizontal-equal .select_option_picker").on("click", function () {
        $(".select_option_picker").removeClass("selected");
        $(this).addClass("selected");
        $("#pay-btn").prop("disabled", false);     
        $("#pay-btn").removeClass("disabled");        
        $("#pay-btn").css("background-color", "#ef6253");  
    });
});

function formatPhoneNumber(phoneNumber) {
    var telRegex = /^(01[0-9])(\d{3,4})(\d{4})$/;
    return phoneNumber.replace(telRegex, '$1-$2-$3');
}

function fn_kakaoPayResult(code, msg, orderId) {
    if (kakaoPayPopup !== null) {
        if (icia.common.type(kakaoPayPopup) === "object" && !kakaoPayPopup.closed) {
            kakaoPayPopup.close();
        }
       
        kakaoPayPopup = null;
    }
    
    if (code === 200) {
        alert(msg);
        location.href = "/shop/payOk?orderId=" + encodeURIComponent(orderId);
    
    } else {
        alert(msg);
        location.href = "/user/buy?tab=inProgressing";
    }
}
</c:otherwise>
</c:choose>

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
<c:if test="${cartList.size() > 0}">
<%@ include file="/WEB-INF/views/include/shopCate.jsp" %>
<div class="wrap-content d-flex flex-column flex-grow-1" style="background-color: #f4f4f4;">
  <div class="container-lg buy step-2">
    <div class="content content-step-2">
      <div class="container content-step-2-cart-buy-immediate-container">
      <div class="order-content">
        <div class="order-content-wrapper bg-white rounded p-3 shadow-sm">
        <h2 class="title_txt mx-auto" style="text-align:center;">배송/결제</h2>
        </div>
      </div>
      <div class="order-content">
          <div class="order-content-wrapper">
            <div class="divider_horizontal" style="height: 8px;">
              <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
            </div>
          </div>
        </div>
        <div class="order-content">
          <div id="address-content-wrapper" class="order-content-wrapper bg-white rounded p-3 shadow-sm flex-column align-items-start d-flex" style="width: -webkit-fill-available;">
            <div class="text-header-checkout d-flex align-items-center mb-2" style="gap: 8px;">
              <div class="flex-grow-1">
                <div class="text-body title-item d-flex align-items-center" style="gap: 0px 2px;">
                  <p class="text-lookup semibold text-truncate m-0" style="color: #222; font-size: 16px;">배송 주소</p>
                </div>
              </div>
              <div class="d-flex align-items-center gap-2">
                <c:choose>
                  <c:when test="${defaultAddr eq null}">
                    <button id="btn-add-addr" class="btn btn-dark btn-sm rounded-pill" style="padding: 2px 10px; min-height: 24px; min-width: 60px;">
                      <span class="text-white text-truncate" style="max-width: 100%; font-size: 12px;">새 주소 추가</span>
                    </button>
                  </c:when>
                  <c:otherwise>
                    <button id="btn-add-addr" class="btn btn-outline-secondary btn-sm rounded-pill" style="padding: 2px 10px; min-height: 24px; min-width: 60px;">
                      <span class="text-black text-truncate" style="max-width: 100%; font-size: 12px;">주소 변경</span>
                    </button>
                  </c:otherwise>
                </c:choose>
              </div>
            </div>

            <c:choose>
              <c:when test="${defaultAddr eq null}">
                <div class="my-2"></div>
                <div class="text-body d-flex align-items-center gap-2 px-3">
                  <p class="text-lookup semibold text-danger m-0" style="font-size: 14px;">
                    등록된 기본 배송지가 없습니다.<br>
                    새 주소를 추가해주세요!
                  </p>
                </div>
                <div class="my-3"></div>
              </c:when>
              <c:otherwise>
                <div id="selectedAddr" data-addrnum="${defaultAddr.shippingAddrNum}">
                  <div style="height: 8px;"></div>
                  <div class="text_table_left_align" style="padding: 3px 16px;">
                    <div>
                      <div class="text_body title">
                        <p class="text-lookup text-element line_break_by_truncating_tail">받는 분</p>
                      </div>
                    </div>
                    <div class="labels-description">
                      <div class="text_table_labels">
                        <div class="labels">
                          <div class="text-body labels__label1">
                            <p id="name" class="text-lookup display_paragraph">${defaultAddr.recipientName}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div style="height: 4px;"></div>
                  <div class="text_table_left_align px-3">
                    <div>
                      <div class="text_body title">
                        <p class="text-lookup text-element line_break_by_truncating_tail">연락처</p>
                      </div>
                    </div>
                    <div class="labels-description">
                      <div class="text_table_labels labels">
                        <div class="labels">
                          <div class="text_body labels__label1">
                            <p id="phone" class="text-lookup display_paragraph">${defaultAddr.recipientTel}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div style="height: 4px;"></div>
                  <div class="text_table_left_align px-3">
                    <div>
                      <div class="text_body title">
                        <p class="text-lookup text-element line_break_by_truncating_tail">주소</p>
                      </div>
                    </div>
                    <div class="labels-description">
                      <div class="text_table_labels labels">
                        <div class="labels">
                          <div class="text_body labels__label1">
                            <p id="addressLine" class="text-lookup display_paragraph">[${defaultAddr.shippingAddrZipcode}] ${defaultAddr.shippingAddrLine1} ${defaultAddr.shippingAddrLine2}</p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div id="btn-select-memo" class="control_data_box d-flex p-3 rounded-3 bg-white cursor-pointer">
                  <div class="control_data_box__text d-flex align-items-center flex-grow-1 gap-1">
                    <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-muted" style="font-size: 14px;">요청사항 없음</p>
                  </div>
                  <div class="d-flex align-items-center">
                    <div class="control_data_box__action content_image" style="color: #6c6c6c;">
                      <div class="content_image" style="width: 7px; height: 14px; cursor: pointer;">
                        <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                          <source type="image/webp" srcset="/resources/shop/img/arrow_right.png">
                          <source srcset="/resources/shop/img/arrow_right.png">
                          <img src="/resources/shop/img/arrow_right.png" width="7px" height="14px" class="image">
                        </picture>
                      </div>
                    </div>
                  </div>
                </div>
              </c:otherwise>
            </c:choose>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper">
            <div class="divider_horizontal" style="height: 8px;">
              <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper bg-white rounded p-3 shadow-sm">
            <div class="text-header-checkout d-flex align-items-center mb-2" style="gap: 8px;">
              <div class="flex-grow-1">
                <div class="text-body title-item d-flex align-items-center" style="gap: 0px 2px;">
                  <p class="text-lookup text-element semibold display_paragraph">
                    주문 상품
                  </p>
                </div>
              </div>
              <div class="d-flex align-items-center gap-1">
                <div class="text_body description_item" style="gap: 4px;">
                  <p class="text-lookup semibold text-truncate m-0" style="color: #222; font-size: 16px;">
                    총 <c:out value="${cartList.size()}" />건
                  </p>
                </div>
              </div>
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper">
            <div class="divider_horizontal" style="height: 2px;">
              <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 2px;"></div>
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper bg-white rounded shadow-sm flex-column align-items-start d-flex" style="border-radius: 0px 0px 10px 10px; width: -webkit-fill-available;">
            <div style="height: 20px;"></div>
            <div class="product-list-info-default" style="padding: 0px 16px;">
              <c:forEach var="cart" items="${cartList}" varStatus="status">
                <div class="product d-flex">
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
                        <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-start" style="color: #a7a7a7; font-size: 13px;">
                          제품 코드 : <c:out value="${cart.prodId}" />
                        </p>
                      </div>
                      <div class="text_body" style="gap: 0px 2px;">
                        <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-start" style="color: #a7a7a7; font-size: 12px;">
                          옵션 : <c:out value="${cart.variantsOptionValueCombText}" />
                        </p>
                      </div>
                    </div>
                    <div class="bottom">
                      <div class="text-table-options text-table-options--default" style="margin: 0px 0px 2px;">
                        <div class="text_body option option1_item" style="gap: 0px 3px;">
                          <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail" style="color: #222; font-size: 14px">
                            주문 수량 : 
                          </p>
                        </div>
                        <div class="option-right-text">
                          <div class="text_body option option2_item" style="gap: 0px 3px;">
                            <p class="text-lookup text-element display_paragraph" style="color: #222; font-size: 14px">
                              <c:out value="${cart.cartQuantity}" />
                            </p>
                          </div>
                        </div>
                      </div>
                      <div class="text_table_labels label-item flex-shrink-0" style="margin: 0px 0px 2px;">
                        <div class="labels">
                          <div class="text_body labels__label1" style="gap: 0px 2px;">
                            <p class="text-lookup text-element semibold display_paragraph d-flex justify-content-end text-start" style="color: #222; font-size: 16px; white-space: nowrap;">
                              <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${cart.discountedProdPrice * cart.cartQuantity}" />원
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
                <div style="height: 10px;"></div>

                <div class="divider_horizontal" style="height: 2px;">
                  <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 2px;"></div>
                </div>
                
                <div style="height: 10px;"></div>

              </c:forEach>
            </div>

            <div style="height: 20px;"></div>
            <div class="text-header-checkout" style="height: 20px; padding: 0px 16px;">
              <div class="left">
                <div class="text_body title_item" style="gap: 0px 2px;">
                  <p class="text-lookup text-element display_paragraph text-truncate" style="color: #222; text-align: left;">
                    배송방법
                  </p>
                </div>
              </div>
              <div class="right"></div>
            </div>

            <div style="height: 8px;"></div>
            <div class="d-flex flex-column align-items-start" style="gap: 6px 0px; padding: 0px 16px;">
              <div class="d-flex">
                <div class="radio-element cursor-pointer">
                  <svg viewBox="0 0 24 24" fill="#222222" xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                    <path d="M17.753 12.003a5.75 5.75 0 11-11.5 0 5.75 5.75 0 0111.5 0z" fill="inheirt"></path>
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M12 20.5a8.5 8.5 0 100-17 8.5 8.5 0 000 17zm0 1.2c5.357 0 9.7-4.343 9.7-9.7 0-5.357-4.343-9.7-9.7-9.7-5.357 0-9.7 4.343-9.7 9.7 0 5.357 4.343 9.7 9.7 9.7z" fill="inheirt"></path>
                  </svg>
                </div>
                <div class="text_body cursor-pointer title-item" for="normal" style="gap: 0px 2px; margin-right: 8px;">
                  <p class="text-lookup text-element display_paragraph" sstyle="color: #222; text-align: left; width: inherit; font-size: 14px;">일반 배송</p>
                </div>
                <div class="text_body label-item" style="gap: 0px 2px;">
                  <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail" style="color: #909090; text-align: left; width: inherit; font-size: 13px;">
                    검수 후 배송 · 5-7일 내 도착 예정
                  </p>
                </div>
              </div>
              <div class="d-flex">
                <div class="cursor-pointer radio-element">
                  <svg viewBox="0 0 24 24" fill="#22222233" xmlns="http://www.w3.org/2000/svg" width="24" height="24">
                    <path d="M21.7 12c0 5.357-4.343 9.7-9.7 9.7-5.357 0-9.7-4.343-9.7-9.7 0-5.357 4.343-9.7 9.7-9.7 5.357 0 9.7 4.343 9.7 9.7z" fill="inherit"></path>
                  </svg>
                </div>
                <div class="text_body cursor-pointer title-item" for="inventory_unavailable" style="gap: 0px 2px;">
                  <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 14px;">
                    창고보관 불가</p>
                </div>
              </div>
            </div>
            <div style="height: 20px;"></div>
            <div class="text_collapse" style="padding: 16px; background-color: #fafafa;">
              <div class="d-flex justify-content-between position-relative">
                <div class="text_body" style="gap: 0px 2px;">
                  <p class="text-lookup text-element display_paragraph" style="color: #222; text-align: left; width: inherit; font-size: 14px;">
                    결제금액
                  </p>
                </div>
                <div id="toggle-icon" class="d-flex align-items-center cursor-pointer">
                  <div class="text_body" style="gap: 0px 2px;">
                    <p class="text-lookup text-element semibold display_paragraph" style="color: #222; text-align: right; width: inherit; font-size: 14px;">
                      <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${orderTotalPrice}" />원
                    </p>
                  </div>
                  <svg id="arrow-down" style="margin-left: 4px;" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg" width="12" height="12">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M1.375 3.956l.53-.53L6 7.52l4.095-4.094.53.53L6 8.581 1.375 3.956z" fill="#4E4E4E"></path>
                  </svg>
                  <svg id="arrow-up" style="margin-left: 4px; display: none;" viewBox="0 0 12 12" fill="none" xmlns="http://www.w3.org/2000/svg" width="12" height="12">
                    <path fill-rule="evenodd" clip-rule="evenodd" d="M6 4.48L1.906 8.574l-.53-.53L6 3.419l4.625 4.625-.53.53L6 4.48z" fill="#4E4E4E"></path>
                  </svg>
                </div>
              </div>
              
              
              <!-- 접었다가 펼치는 부분 -->
              <div class="toggle-section" style="display: none;">
                <div class="content">
                  <div class="divider_horizontal" style="height: 2px; margin: 16px 0px 12px;">
                    <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 2px;"></div>
                  </div>
                  <div class="text_table_right_align" style="margin: 4px 0px 0px; padding: 3px 0px;">
                    <div class="title-labels">
                      <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                        <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 14px;">
                          상품금액
                        </p>
                      </div>
                      <div class="text_table_labels labels" style="align-items: flex-end; float: right;">
                        <div class="labels">
                          <div class="text_body labels__label1" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph" style="color: #222; text-align: right; width: inherit; font-size: 14px;">
                              <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${totalProdPrice}"/>원
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  <div class="text_table_right_align" style="margin: 4px 0px 0px; padding: 3px 0px;">
                    <div class="title-labels">
                      <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                        <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 14px;">
                          할인 금액
                        </p>
                        <div class="content_image" style="border-radius: 50%; width: 16px; height: 16px; margin: 0px 0px 0px 2px; cursor: pointer;">
                          <picture style="object-fit: none; aspect-ratio: auto;">
                            <source type="image/webp" srcset="/resources/shop/img/help.png">
                            <source srcset="/resources/shop/img/help.png">
                            <img src="/resources/shop/img/help.png" style="width: 100%; height: 100%; object-fit: contain;" class="image">
                          </picture>
                        </div>
                      </div>
                      <div class="text_table_labels labels" style="align-items: flex-end; float: right;">
                        <div class="labels">
                          <div class="text_body labels__label1" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph" style="color: #222; text-align: right; width: inherit; font-size: 14px;">
                              <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${totalDiscountPrice}" />원
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
                          수수료
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
                            <p class="text-lookup text-element display_paragraph" style="color: #222222; text-align: right; width: inherit; --font-size-sub: 14px; --text-color-sub: #222222;">
                              무료
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                  
                  <div class="text_table_right_align" style="margin: 4px 0px 0px; padding: 3px 0px;">
                    <div class="title-labels">
                      <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                        <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 14px;">
                          배송비
                        </p>
                        <div class="content_image" style="border-radius: 50%; width: 16px; height: 16px; margin: 0px 0px 0px 2px; cursor: pointer;">
                          <picture style="object-fit: none; aspect-ratio: auto;">
                            <source type="image/webp" srcset="/resources/shop/img/help.png">
                            <source srcset="/resources/shop/img/help.png">
                            <img src="/resources/shop/img/help.png" style="width: 100%; height: 100%; object-fit: contain;" class="image">
                          </picture>
                        </div>
                      </div>
                      <div class="text_table_labels labels" style="align-items: flex-end; float: right;">
                        <div class="labels">
                          <div class="text_body labels__label1" style="gap: 0px 2px;">
                            <p class="text-lookup text-element display_paragraph" style="color: #222; text-align: right; width: inherit; font-size: 14px;">
                              <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${orderShippingCost}" />원
                            </p>
                          </div>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <!-- 접었다가 펼치는 부분 종료 -->
              
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper">
            <div class="divider_horizontal" style="height: 8px;">
              <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper">
            <div class="text_body" style="border-radius: 10px; gap: 0px 2px; padding: 16px; background-color: #fff;">
              <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 13px;">
                상품은 Runfluence 또는 제휴 업체가 판매하며 각 거래 조건 등은 <span class="text-lookup underline has_action">판매자 정보</span>에서 확인해주시기 바랍니다.
              </p>
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper">
            <div class="divider_horizontal" style="height: 8px;">
              <div class="divider" style="background-color: #f4f4f4; width: 100%; height: 8px;"></div>
            </div>
          </div>
        </div>

        <div class="order-content">
          <div class="order-content-wrapper">
            <div class="layout_list_vertical" style="border-radius: 10px; background-color: #fff">
              <div style="height: 20px;"></div>
              <div class="text-header-checkout" style="height: 24px; padding: 0px 16px;">
                <div class="left">
                  <div class="text_body title_item" style="gap: 0px 2px;">
                    <p class="text-lookup text-element semibold display_paragraph text-truncate" style="color: #222; text-align: left; width: inherit; font-size: 16px;">
                      결제 방법
                    </p>
                  </div>
                </div>
                <div class="right">
                </div>
              </div>
              <div style="height: 20px;"></div>
              <div class="text-header-checkout" style="height: 20px; margin: 0px 16px 10px;">
                <div class="left">
                  <div class="text_body title_item" style="gap: 0px 2px;">
                    <p class="text-lookup text-element display_paragraph" style="color: #222; text-align: left; width: inherit; font-size: 14px;">
                      계좌 간편결제
                    </p>
                  </div>
                  <div class="tag_body subtitle_item tag_body" style="border-radius: 2px; height: 18px; padding: 0px 3px; background-color: #f1f0ff">
                    <div class="tag_element" style="font-size: 11px; color: #7c72ee">
                      <div class="text-lookup semibold" style="font-size: 11px">결제 시 회원 등급 누적</div>
                    </div>
                  </div>
                </div>
                <div class="right">
                </div>
              </div>
              <div class="select_option_picker select_option_picker_justified" style="border-radius: 10px; margin: 0px 16px; padding: 9px 16px; background-color: #fff; box-shadow: #ebebeb 0px 0px 0px 1px inset; cursor: pointer;">
                <div class="justified">
                  <div class="justified__text">
                    <div>
                      <div class="flex-align-center">
                        <div class="text_body title-item" style="gap: 0px 4px;">
                          <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail" style="color: rgb(34, 34, 34); text-align: left; width: inherit;">
                            계좌를 등록하세요
                          </p>
                        </div>
                      </div>
                    </div>
                    <div>
                    </div>
                  </div>
                  <div class="flex-align-center justified__right">
                    <div class="justified__action-image">
                      <div class="content_image" style="width: 7px; height: 14px; cursor: pointer;">
                        <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                          <source type="image/webp" srcset="/resources/shop/img/arrow_right.png">
                          <source srcset="/resources/shop/img/arrow_right.png">
                          <img src="/resources/shop/img/arrow_right.png" width="7px" height="14px" class="image">
                        </picture>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div style="height: 20px;"></div>
              <div class="text-header-checkout" style="height: 20px; margin: 0px 16px 10px;">
                <div class="left">
                  <div class="text_body title_item" style="gap: 0px 2px;">
                    <p class="text-lookup text-element display_paragraph text-truncate" style="color: #222; text-align: left; width: inherit; font-size: 14px;">
                      카드 간편결제
                    </p>
                  </div>
                  <div class="text_body subtitle_item text_body" style="gap: 0px 2px;">
                    <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-truncate" style="color: #909090; text-align: left; width: inherit; font-size: 12px;">
                      일시불
                    </p>
                  </div>
                </div>
                <div class="right">
                </div>
              </div>
              
              <div class="cart-option-picker">
                <div class="clickable-area"></div>
                <div class="select_option_picker select_option_picker_justified" style="border-radius: 10px; margin: 0px 16px; padding: 9px 16px; background-color: #fff; box-shadow: #ebebeb 0px 0px 0px 1px inset; cursor: pointer;">
                  <div class="justified">
                    <div class="justified__text">
                      <div>
                        <div class="flex-align-center">
                          <div class="text_body title-item" style="gap: 0px 4px;">
                            <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail" style="color: #222; text-align: left; width: inherit;  font-size: 14px;">
                              카드를 등록하세요
                            </p>
                          </div>
                        </div>
                      </div>
                      <div>

                      </div>
                    </div>
                    <div class="flex-align-center justified__right">
                      <div class="justified__action-image">
                        <div class="content_image" style="width: 7px; height: 14px; cursor: pointer;">
                          <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                            <source type="image/webp" srcset="/resources/shop/img/arrow_right.png">
                            <source srcset="/resources/shop/img/arrow_right.png">
                            <img src="/resources/shop/img/arrow_right.png" width="7px" height="14px" class="image">
                          </picture>
                        </div>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              
              <div style="height: 24px;"></div>
              <div class="text-header-checkout" style="height: 20px; padding: 0px 16px;">
                <div class="left">
                  <div class="text_body title_item" style="gap: 0px 2px;">
                    <p class="text-lookup text-element display_paragraph text-truncate" style="color: #222; text-align: left; width: inherit; font-size: 14px;">
                      일반 결제
                    </p>
                  </div>
                  <div class="text_body subtitle_item text_body" style="gap: 0px 2px;">
                    <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-truncate" style="color: #909090; text-align: left; width: inherit;  font-size: 12px;">
                      일시불 · 할부
                    </p>
                  </div>
                </div>
                <div class="right">
                </div>
              </div>
              <div style="height: 8px;"></div>
              <div class="layout-grid-horizontal-equal" style="gap: 8px; padding: 0px 16px;">
                <div id="TOSS_PAY" class="select_option_picker select_option_picker_text" style="border-radius: 10px; padding: 2px 10px; cursor: pointer;">
                  <div>
                    <div class="content_image" style="width: 48px; height: 48px;">
                      <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                        <source type="image/webp" srcset="/resources/shop/img/toss_pay.png">
                        <source srcset="/resources/shop/img/toss_pay.png">
                        <img src="/resources/shop/img/toss_pay.png" width="48" height="48" class="image">
                      </picture>
                    </div>
                  </div>
                </div>
                <div id="NAVER_PAY" class="select_option_picker select_option_picker_image" style="border-radius: 10px; padding: 2px 10px; cursor: pointer;">
                  <div>
                    <div class="content_image" style="width: 48px; height: 48px;">
                      <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                        <source type="image/webp" srcset="/resources/shop/img/naver_pay.png">
                        <source srcset="/resources/shop/img/naver_pay.png">
                        <img src="/resources/shop/img/naver_pay.png" width="48" height="48" class="image">
                      </picture>
                    </div>
                  </div>
                </div>
                <div id="KAKAO_PAY" class="select_option_picker select_option_picker_image" style="border-radius: 10px; padding: 2px 10px; cursor: pointer;">
                  <div>
                    <div class="content_image" style="width: 48px; height: 48px;">
                      <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                        <source type="image/webp" srcset="/resources/shop/img/kakao_pay.png">
                        <source srcset="/resources/shop/img/kakao_pay.png">
                        <img src="/resources/shop/img/kakao_pay.png" width="48" height="48" class="image">
                      </picture>
                    </div>
                  </div>
                </div>
              </div>
              <div style="height: 20px;"></div>
              <div class="text_body text-footer-section" style="gap: 0px 2px; padding: 0px 16px;">
                <p class="text-lookup text-element display_paragraph" style="color: #909090; text-align: left; width: inherit; font-size: 13px;">
                  체결 후 결제 정보 변경은 불가하며 분할 납부 변경은 카드사 문의 바랍니다.<br>
                  단, 카드사별 정책에 따라 분할 납부 변경 시 수수료가 발생할 수 있습니다.
                </p>
              </div>
              <div style="height: 20px;"></div>
            </div>
          </div>
        </div>
        
        <div class="cart-buy-footer">
          <div class="layout_list_horizontal_equal" style="margin: 8px; gap: 16px; padding-top: 8px;">
            <button id="pay-btn" class="button button_xlarge disabled" style="border-radius: 10px; padding: 10px 16px; background-color: #d3d3d3; cursor: pointer; flex-grow:1; border: none;" disabled>
              <div class="button__text">
                <div class="text_body title_item" style="gap: 0px 4px;">
                  <p class="text-lookup text-element display_paragraph line_break_by_truncating_tail text-truncate" style="color: #fff; text-align: left; width: inherit; font-size: 16px; white-space: nowrap;">
                    <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${orderTotalPrice}" />원
                    <em class="text-lookup bold" style="color: #fff; opacity: 0.65;">·</em> 
                    결제하기
                  </p>
                </div>
              </div>
            </button>
          </div>
        </div>
        
      </div>
    </div>
  </div>
</div>
<div id="modal-layer"></div>
<%@ include file="/WEB-INF/views/include/shopFooter.jsp" %>
<form id="orderForm" name="orderForm" action="" method="post">
  <input type="hidden" id="prodIds" name="prodIds" value="${prodIds}">
  <input type="hidden" id="combIds" name="combIds" value="${combIds}">
</form>
</c:if>
</body>
</html>