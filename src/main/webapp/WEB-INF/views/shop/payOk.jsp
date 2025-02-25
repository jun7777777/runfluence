<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html lang="ko">
<head>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
<%@ include file="/WEB-INF/views/include/shopHead.jsp"%>
<style>
@font-face {
  font-family: 'JejuGothic';
  src: url('./JejuGothic.ttf') format('truetype');
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

.wrap>.wrap-content {
  flex: 1;
}

.container.buy, .container.sell {
  background-color: #f4f4f4;
}

.content:not(.content-step-2) {
  margin: 0 auto;
  max-width: 700px;
  padding: 20px 0 40px;
}

.lg .content {
  margin: 0 auto;
  padding: 20px 0;
}

.buy_complete {
  margin: 0 auto;
}

.complete_box {
  background-color: #fff;
  border-radius: 10px;
  padding: 32px 0;
}

.layout_list_vertical {
  align-items: flex-start;
  display: flex;
  flex-direction: column;
  width: -webkit-fill-available;
}

.text_body {
  align-items: center;
  display: flex;
}

.text-lookup.bold {
  font-weight: 700;
}

.text-element {
  color: #222;
  font-size: 13px;
  line-height: 1.2;
}

.lg .text-element {
  font-size: 13px;
}

.buy_complete .thumbnail {
  display: block;
  margin: 0 auto;
}

.thumbnail {
  display: inline-block;
  overflow: hidden;
  position: relative;
  width: fit-content;
}

.content_image {
  display: inline-block;
}

.content_image .image {
  height: 100%;
  width: 100%;
}

.image {
  image-rendering: auto;
  object-fit: cover;
}

.picture {
  border: none;
  display: flex;
}

img, video {
  -webkit-user-drag: none;
  -webkit-touch-callout: none;
  border: 0;
  user-select: none !important;
  vertical-align: top;
}

.layout_list_horizontal_equal {
  column-gap: 6px;
  display: flex;
  width: -webkit-fill-available;
}

.layout_list_horizontal_equal>* {
  flex: 1 1 0;
}

.button_large {
  min-height: 44px;
  min-width: 132px;
  padding: 6px 16px;
}

.button {
  background: #222;
  border-radius: 10px;
  color: #fff;
  cursor: pointer;
  max-width: 100%;
  position: relative;
  user-select: none;
}

.button_large .button__text, .button_medium .button__text,
  .button_xlarge .button__text {
  align-items: center;
  display: flex;
  flex-direction: column;
  justify-content: center;
  min-height: 32px;
}

.button_large .title_item {
  font-size: 13px;
}

.button .title_item {
  gap: 4px;
}

.text-element.ellipsis-1, .text-element.line_break_by_truncating_tail {
  -webkit-line-clamp: 1;
  -webkit-box-orient: vertical;
  display: -webkit-box;
  overflow: hidden;
  text-overflow: ellipsis;
}

.text-element.white-space-nowrap {
  white-space: nowrap;
}

.divider_horizontal {
  width: -webkit-fill-available;
}

.divider {
  background-color: #f4f4f4;
  height: 1px;
  width: 100%;
}

.text_table_emphasised {
  width: -webkit-fill-available;
}

.text_table_emphasised .title-description {
  display: flex;
  justify-content: space-between;
  margin-bottom: 8px;
}

.text_table_emphasised .title-description .title {
  flex: 0 0 auto;
}

.text-lookup.semibold {
  font-weight: 600;
}

.text_table_emphasised .title-description .description-wrap {
  display: flex;
  flex: 1 1 auto;
  justify-content: flex-end;
  width: -webkit-fill-available;
}

.text_table_labels {
  display: flex;
  flex-direction: column;
  gap: 2px;
}

.text_table_labels .labels {
  display: flex;
  justify-content: flex-end;
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

.text_table_right_align .description {
  display: flex;
  justify-content: flex-end;
}

.text_table_labels .labels .labels__label1 {
  min-width: fit-content;
}
</style>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
$(document).ready(function(){
   // 주문 상세로 이동 로직 작성
   
});
</script>
</head>
<body>
  <%@include file="/WEB-INF/views/include/shopCate.jsp"%>
  <div class="wrap-content" style="width: 100%">
    <div class="container buy lg step-3" style="width: 100%">
      <div class="content content-step-3">
        <div class="buy_complete lg" order-type="buy" order-step="complete">
          <div class="complete_box">
            <div class="layout_list_vertical" style="width: -webkit-fill-available; align-items: center;">
              <div style="height: 28px;"></div>
              <div class="text_body" style="gap: 0px 2px; padding: 0px 16px;">
                <p class="text-lookup text-element bold display_paragraph" style="color: #222222; text-align: center; width: 100%; font-size: 24px; line-height: 24px;">
                  구매가 완료되었습니다.
                </p>
              </div>
              <div style="height: 10px;"></div>
              <div class="text_body" style="gap: 0px 2px; padding: 0px 16px;">
                <p class="text-lookup text-element display_paragraph" style="text-align: center; width: inherit; color: #222222; font-size: 13px; line-height: 13px;">
                  <c:out value="${order.orderProdList[0].orderProdName}" />
                  <c:if test="${order.orderProdList.size() > 1}">
                    외 <c:out value="${order.orderProdList.size() - 1 }" />건
                  </c:if>
                </p>
              </div>
              <div style="height: 20px;"></div>
              <div class="thumbnail" style="border-radius: 10px; background-color: rgb(244, 244, 244); width: 152px; height: 152px;">
                <div class="content_image" style="width: 152px; height: 152px;">
                  <picture class="picture image" style="object-fit: none; aspect-ratio: auto;">
                    <source type="image/webp" srcset="/resources/prod-img/${fn:substring(order.orderProdList[0].prodId, 0, 2)}/mainImg/${order.orderProdList[0].prodId}.png">
                    <source srcset="/resources/prod-img/${fn:substring(order.orderProdList[0].prodId, 0, 2)}/mainImg/${order.orderProdList[0].prodId}.png">
                    <img src="/resources/prod-img/${fn:substring(order.orderProdList[0].prodId, 0, 2)}/mainImg/${order.orderProdList[0].prodId}.png" loading="lazy" width="152px" height="152px" class="image">
                  </picture>
                </div>
              </div>
              <div style="height: 20px;"></div>
              <div class="layout_list_horizontal_equal" style="display: flex; gap: 0px 6px; margin: 0px 16px; padding: 6px; border-width: 0px;">
                <button class="button button_large" onclick="location.href='/user/buy'" style="border-radius: 10px; padding: 0px 16px; background-color: rgb(255, 255, 255); box-shadow: rgb(235, 235, 235) 0px 0px 0px 1px inset; cursor: pointer;">
                  <div class="button__text">
                    <div class="text_body title_item" style="gap: 0px 2px;">
                      <p class="text-lookup text-element display_paragraph white-space-nowrap ellipsis-1"
                        style="text-align: center; width: inherit; color: #222222; font-size: 14px; - line-height: 14px;">
                        구매 내역 상세보기</p>
                    </div>
                  </div>
                </button>
              </div>
              <div style="height: 10px;"></div>
              <div class="text_body" style="gap: 0px 2px; padding: 0px 16px;">
                <p class="text-lookup text-element display_paragraph" style="text-align: center; width: inherit; color: #22222280; font-size: 12px; line-height: 12px;">
                  '구매 내역 &gt; 진행 중 에서 진행 상황을 확인할 수 있습니다.'
                </p>
              </div>
              <div style="height: 28px;"></div>
              <div class="divider_horizontal" style="height: 1px;">
                <div class="divider" style="color: #F4F4F4; width: 100%; font-size: 1px;"></div>
              </div>
              <div class="text_table_emphasised" style="padding: 20px 16px; background-color: rgb(250, 250, 250);">
                <div class="title-description">
                  <div class="text_body title" style="gap: 0px 2px;">
                    <p class="text-lookup text-element semibold display_paragraph" style="text-align: left; width: inherit; color: #222222; font-size: 16px; line-height: 16px;">
                      총 결제금액
                    </p>
                  </div>
                  <div class="description-wrap">

                  </div>
                </div>
                <div class="text_table_labels" style="justify-content: flex-end;">
                  <div class="labels">
                    <div class="text_body labels__label1" style="gap: 0px 2px;">
                      <p class="text-lookup text-element bold display_paragraph" style="text-align: left; width: inherit; color: #222222; font-size: 20px; line-height: 20px;">
                        <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${order.orderTotalPrice}" />원
                      </p>
                    </div>
                  </div>
                </div>
              </div>
              <div class="divider_horizontal" style="height: 1px;">
                <div class="divider" style="color: #F4F4F4; width: 100%; font-size: 1px;"></div>
              </div>
              <div style="height: 16px;"></div>
              <div class="text_table_right_align" style="padding: 2px 16px;">
                <div class="title-labels">
                  <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                    <p class="text-lookup text-element display_paragraph" style="text-align: left; width: inherit; color: #222222; font-size: 14px; - line-height: 14px;">
                      구매가
                    </p>
                  </div>
                  <div class="text_table_labels labels" style="justify-content: flex-end; text-align: right;">
                    <div class="labels">
                      <div class="text_body labels__label1" style="gap: 0px 2px;">
                        <p class="text-lookup text-element semibold display_paragraph" style="text-align: right; width: inherit; color: #222222; font-size: 14px; line-height: 14px;">
                          <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${order.orderSumPrice}" />원
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div style="height: 6px;"></div>
              <div class="text_table_right_align" style="padding: 2px 16px;">
                <div class="title-labels">
                  <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                    <p class="text-lookup text-element display_paragraph" style="text-align: left; width: inherit; color: #909090; font-size: 14px; line-height: 14px;">
                      배송비
                    </p>
                  </div>
                  <div class="text_table_labels labels" style="justify-content: flex-end; text-align: right;">
                    <div class="labels">
                      <div class="text_body labels__label1" style="gap: 0px 2px;">
                        <p class="text-lookup text-element display_paragraph" style="text-align: right; width: inherit; color: #222222; font-size: 14px; line-height: 14px;">
                          <fmt:formatNumber type="Number" maxFractionDigits="3" groupingUsed="true" value="${order.orderShippingCost}" />원
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div style="height: 6px;"></div>
              <div class="text_table_right_align" style="padding: 2px 16px;">
                <div class="title-labels">
                  <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                    <p class="text-lookup text-element display_paragraph" style="text-align: left; width: inherit; color: #909090; font-size: 14px; line-height: 14px;">
                      등급 할인
                    </p>
                  </div>
                  <div class="text_table_labels labels" style="justify-content: flex-end; text-align: right;">
                    <div class="labels">
                      <div class="text_body labels__label1" style="gap: 0px 2px;">
                        <p class="text-lookup text-element display_paragraph" style="text-align: right; width: inherit; color: #222222; font-size: 14px; line-height: 14px;">
                          <c:out value="${order.orderDiscountRate}" />%
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div style="height: 6px;"></div>
              <div class="text_table_right_align" style="padding: 2px 16px;">
                <div class="title-labels">
                  <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                    <p class="text-lookup text-element display_paragraph" style="text-align: left; width: inherit; color: #909090; font-size: 14px; line-height: 14px;">
                      현재 사용자 등급
                    </p>
                  </div>
                  <div class="text_table_labels labels" style="justify-content: flex-end; text-align: right;">
                    <div class="labels">
                      <div class="text_body labels__label1" style="gap: 0px 2px;">
                        <p class="text-lookup text-element display_paragraph" style="text-align: right; width: inherit; color: #222222; font-size: 14px; line-height: 14px;">
                          <c:out value="${user.userGrade}" />
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
              </div>
              <div style="height: 12px;"></div>
              <div class="divider_horizontal" style="height: 1px; padding: 0px 16px;">
                <div class="divider" style="color: #F4F4F4; width: 100%; font-size: 1px;"></div>
              </div>
              <div style="height: 12px;"></div>
              <div class="text_table_right_align" style="padding: 3px 16px;">
                <div class="title-labels">
                  <div class="text_body title" style="gap: 0px 2px; padding: 0px;">
                    <p class="text-lookup text-element display_paragraph" style="text-align: left; width: inherit; color: #222222; font-size: 14px; line-height: 14px;">
                      적립 예정 등급 포인트
                    </p>
                  </div>
                  <div class="text_table_labels labels" style="justify-content: flex-end; text-align: right;">
                    <div class="labels">
                      <div class="text_body labels__label1" style="gap: 0px 2px;">
                        <p class="text-lookup text-element display_paragraph" style="text-align: right; width: inherit; color: #222222; font-size: 14px; line-height: 14px;">
                          <fmt:formatNumber type="number" maxFractionDigits="0" groupingUsed="true" value="${(order.orderTotalPrice / 1000)}" />P
                        </p>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="text_body description" style="width: -webkit-fill-available; gap: 0px 2px; margin: 2px 0px 0px;">
                  <p class="text-lookup text-element display_paragraph" style="text-align: right; width: inherit; color: #909090; font-size: 13px; line-height: 13px; margin-top: 10px;">구매 확정 시 등급 포인트 누적</p>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>
  </div>
<div id="modal-layer"></div>
<%@ include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>