<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>    

<html lang="ko" style="--vh: 7.37px; --global-header-height: 91px;">
<head>
<%@include file="/WEB-INF/views/include/shopHead.jsp" %>
 	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_STYLE</title>
    <!-- 부트스트랩 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
   
    <!-- Optional Bootstrap JS and dependencies (jQuery and Popper.js) -->
    <script src="https://code.jquery.com/jquery-3.5.1.slim.min.js"></script>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
    <!-- <script src="/static/js/main.min.js"></script> -->
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
    <!-- 부트스트랩 아이콘 -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">

<style>
@media (max-width: 768px) {
    .image {
        width: 100%; /* 모바일에서는 이미지 너비를 화면에 맞게 설정 */
    }
}
	
:root {
    --sat: env(safe-area-inset-top);
    --sab: env(safe-area-inset-bottom);
    --sar: env(safe-area-inset-right);
    --sal: env(safe-area-inset-left);
    --Greyscale-Dark-100: #000;
    --greyscale-dark-90-dark: #222;
    --greyscale-dark-80-grey-dark: #333;
    --Greyscale-Dark-75: #404040;
    --greyscale-dark-70-dark-80: #4e4e4e;
    --Greyscale-Dark-60: #616161;
    --Greyscale-Dark-50: #787878;
    --greyscale-dark-40-dark-50: #909090;
    --greyscale-dark-35-dark-40: #a7a7a7;
    --greyscale-dark-30-dark-30-grey-medium: #bbb;
    --greyscale-dark-20-border-medium-grey: #d3d3d3;
    --Greyscale-Dark-10: #e6e6e6;
    --greyscale-dark-8-border-light-grey: #ebebeb;
    --greyscale-dark-6-border-extra-light-grey: #f0f0f0;
    --greyscale-dark-4-dark-5-fill-light-grey-grey-light-brand-ect: #f4f4f4;
    --greyscale-dark-2-grey-extra-light: #fafafa;
    --greyscale-dark-0-white: #fff;
    --greyscale-dark-alpha-90-a-dark: rgba(0, 0, 0, .87);
    --greyscale-dark-alpha-80-grey-dark: rgba(0, 0, 0, .8);
    --greyscale-dark-alpha-75: rgba(0, 0, 0, .75);
    --greyscale-dark-alpha-70-dark-80: rgba(0, 0, 0, .69);
    --greyscale-dark-alpha-60: rgba(0, 0, 0, .62);
    --greyscale-dark-alpha-50: rgba(0, 0, 0, .53);
    --greyscale-dark-alpha-40-dark-50: rgba(0, 0, 0, .44);
    --greyscale-dark-alpha-35-dark-40: rgba(0, 0, 0, .34);
    --greyscale-dark-alpha-30-dark-30-grey-medium: rgba(0, 0, 0, .27);
    --greyscale-dark-alpha-20-border-medium-grey: rgba(0, 0, 0, .17);
    --greyscale-dark-alpha-10: rgba(0, 0, 0, .1);
    --greyscale-dark-alpha-8-border-light-grey: rgba(0, 0, 0, .08);
    --greyscale-dark-alpha-6-border-extra-light-grey: rgba(0, 0, 0, .06);
    --greyscale-dark-alpha-2-grey-extra-light: rgba(0, 0, 0, .02);
    --greyscale-white-alpha-90-white: hsla(0, 0%, 100%, .87);
    --greyscale-white-alpha-80-white-80: hsla(0, 0%, 100%, .8);
    --greyscale-white-alpha-75: hsla(0, 0%, 100%, .75);
    --greyscale-white-alpha-70: hsla(0, 0%, 100%, .69);
    --greyscale-white-alpha-60-white-65: hsla(0, 0%, 100%, .62);
    --greyscale-white-alpha-50-white-50: hsla(0, 0%, 100%, .53);
    --greyscale-white-alpha-40: hsla(0, 0%, 100%, .44);
    --greyscale-white-alpha-35: hsla(0, 0%, 100%, .34);
    --greyscale-white-alpha-30-white-30: hsla(0, 0%, 100%, .27);
    --greyscale-white-alpha-20: hsla(0, 0%, 100%, .17);
    --greyscale-white-alpha-10: hsla(0, 0%, 100%, .1);
    --greyscale-white-alpha-8: hsla(0, 0%, 100%, .08);
    --greyscale-white-alpha-6: hsla(0, 0%, 100%, .06);
    --greyscale-white-alpha-4-white-5: hsla(0, 0%, 100%, .04);
    --greyscale-white-alpha-2: hsla(0, 0%, 100%, .02);
}
body, html {
    -ms-text-size-adjust: none;
    -moz-text-size-adjust: none;
    -webkit-text-size-adjust: none;
    -moz-osx-font-smoothing: grayscale;
    -webkit-font-smoothing: antialiased;
    -webkit-overflow-scrolling: touch;
    font-feature-settings: "frac" 0, "numr" 0;
    height: 100%;
    touch-action: manipulation;
    word-break: break-all;
}

*, :after, :before {
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    box-sizing: border-box;
}

body, button, input, select, table, textarea {
    font-feature-settings: "frac" 0, "numr" 0;
    color: #222;
    font-family: "JejuGothic", "Poppins", sans-serif;
}

body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}

body {
    display: block;
    margin: 8px;
}

p {
	font-family: "JejuGothic", "Poppins", sans-serif !important;
}

.wrap[data-v-7abc50c0] {
    padding-top: 86px;
    position: relative;
}

.lg[data-v-4d6a945a] .layout__main {
    min-height: calc(100vh - 340px);
}

[data-v-4d6a945a] .layout__main {
    min-height: calc(100vh - 265px);
}

article {
    /*display: block;*/
    unicode-bidi: isolate;
}

.lg .container[data-v-7d55de73] {
    padding-left: 40px;
    padding-right: 40px;
}
.container[data-v-7d55de73] {
    background-color: #fff;
    margin-left: auto;
    margin-right: auto;
    max-width: 720px;
}

.social_user_state[data-v-f7de12cc] {
    padding: 12px 0;
}

.user_state_box[data-v-f7de12cc] {
    align-items: center;
    display: flex;
}

.profile_img_box[data-v-f7de12cc] {
    border-radius: 100%;
    flex-shrink: 0;
    height: 44px;
    overflow: hidden;
    position: relative;
    width: 44px;
}

a, a:active, a:focus, a:hover {
    -webkit-text-decoration: none;
    text-decoration: none;
}
a {
    -webkit-tap-highlight-color: rgba(0, 0, 0, .1);
    color: inherit;
}

a:-webkit-any-link {
    cursor: pointer;
}

img, video {
    -webkit-user-drag: none;
    -webkit-touch-callout: none;
    border: 0;
    -moz-user-select: none !important;
    user-select: none !important;
    -webkit-user-select: none;
    vertical-align: top;
}

img {
    overflow-clip-margin: content-box;
    overflow: clip;
}

.profile_img_box[data-v-f7de12cc]:after {
    border: 1px solid rgba(34, 34, 34, .1);
    border-radius: inherit;
    bottom: 0;
    content: "";
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
}

.profile_info[data-v-f7de12cc] {
    margin-left: 12px;
}

.user_name[data-v-f7de12cc] {
    align-items: center;
    display: inline-flex;
    font-size: 16px;
    font-weight: 600;
    letter-spacing: -.33px;
}

.user_name[data-v-442f04f8] {
    align-items: center;
    display: flex;
}

.upload_time[data-v-f7de12cc] {
    color: rgba(34, 34, 34, .5);
    font-size: 14px;
    letter-spacing: -.33px;
    line-height: 17px;
    margin-top: 4px;
}

.user_buttons[data-v-f7de12cc] {
    margin-left: auto;
}

[data-v-f7de12cc] .btn.btn_follow {
    flex-shrink: 0;
    margin-left: auto;
    padding: 0 24px;
}
.solid[data-v-dd412274] {
    background-color: #343a40;
    color: #fff;
    font-weight: 700;
}

.small[data-v-dd412274] {
    border-radius: 10px;
    font-size: 12px;
    height: 34px;
    letter-spacing: -.06px;
    padding: 0 14px;
}

.btn[data-v-dd412274] {
    align-items: center;
    background-color: #fff;
    color: rgba(34, 34, 34, .8);
    cursor: pointer;
    display: inline-flex
;
    justify-content: center;
    text-align: center;
    vertical-align: middle;
}
button {
    -webkit-appearance: none;
    -moz-appearance: none;
    appearance: none;
    background: none;
    background-color: transparent;
    border: 0;
    border-radius: 0;
    outline: none;
    padding: 0;
}

button {
    text-rendering: auto;
    color: buttontext;
    letter-spacing: normal;
    word-spacing: normal;
    line-height: normal;
    text-transform: none;
    text-indent: 0px;
    text-shadow: none;
    display: inline-block;
    text-align: center;
    align-items: flex-start;
    cursor: default;
    box-sizing: border-box;
    background-color: buttonface;
    margin: 0em;
    padding-block: 1px;
    padding-inline: 6px;
    border-width: 2px;
    border-style: outset;
    border-color: buttonborder;
    border-image: initial;
}

/* 게시글 사진 */
.social_image_box[data-v-96e0b446] {
    position: relative;
}

.flicking-viewport[data-v-96e0b446] {
    padding-bottom: 22px;
}
.flicking-viewport {
    overflow: hidden;
    position: relative;
}

.flicking-camera {
    -webkit-box-orient: horizontal;
    -webkit-box-direction: normal;
    display: -webkit-box;
    display: -ms-flexbox;
    display: flex;
    -ms-flex-direction: row;
    flex-direction: row;
    height: 100%;
    position: relative;
    width: 100%;
    will-change: transform;
    z-index: 1;
    transition: transform 0.5s ease; /* 부드러운 이동을 위한 transition */

}

.aspect-ratio[data-v-2d3b4836] {
    height: 0;
    overflow: hidden;
    position: relative;
    width: 100%;
}

.slide_content[data-v-96e0b446] {
    width: 100%;
}

.flicking-camera>* {
    -ms-flex-negative: 0;
    flex-shrink: 0;
}

.aspect-ratio[data-v-2d3b4836]>* {
    height: 100% !important;
    left: 0;
    position: absolute;
    top: 0;
    width: 100% !important;
}

.social_img[data-v-96e0b446] {
    height: auto;
    width: 100%;
}

.picture[data-v-42c6ced2] {
    border: none;
    /*display: flex;*/ 
}

.image.full_width[data-v-42c6ced2] {
    height: 100%;
    width: 100%;
}

.image[data-v-42c6ced2] {
    image-rendering: auto;
    -o-object-fit: cover;
    object-fit: cover;
}



.flicking-arrow-disabled[data-v-96e0b446] {
    cursor: default;
}

.flicking-pagination[data-v-96e0b446] {
    bottom: 0;
}

.flicking-pagination-bullets[data-v-96e0b446], .flicking-pagination-scroll[data-v-96e0b446] {
    font-size: 0;
}
.flicking-pagination[data-v-96e0b446] {
    bottom: 10px;
    left: 0;
    position: absolute;
    text-align: center;
    width: 100%;
    z-index: 2;
}

.flicking-pagination[data-v-96e0b446] .flicking-pagination-bullet-active {
    opacity: 1;
}
.flicking-pagination[data-v-96e0b446] .flicking-pagination-bullet {
    background-color: #000;
    border-radius: 50%;
    display: inline-block;
    height: 6px;
    margin: 0 4px;
    opacity: .1;
    width: 6px;
}

.social_slide:hover .flicking-arrow[data-v-96e0b446] {
    display: block;
}


[data-v-f7de12cc] .btn.btn_follow {
    flex-shrink: 0;
    margin-left: auto;
    padding: 0 24px;
}

.solid[data-v-dd412274] {
    background-color: #343a40;
    color: #fff;
    font-weight: 700;
}

.solid[data-v-dd412274]:hover {
	background-color: #000;
    color: #fff;
}

.small[data-v-dd412274] {
    border-radius: 10px;
    font-size: 12px;
    height: 34px;
    letter-spacing: -.06px;
    padding: 0 14px;
}

.social_product[data-v-20cdd51a] {
    background-color: #fff;
}

.product_title[data-v-20cdd51a] {
    align-items: center;
    display: flex;
    padding-bottom: 8px;
    padding-top: 12px;
}

.title_txt[data-v-20cdd51a] {
    font-size: 15px;
    letter-spacing: -.15px;
    letter-spacing: -.23px;
    min-height: 24px;
}

.num[data-v-20cdd51a] {
    display: inline-flex;
    margin-left: 2px;
}

.product_list_area[data-v-20cdd51a] {
    overflow: hidden;
}   

.product_list[data-v-20cdd51a] {
    margin: 0 -10px;
    white-space: nowrap;
}
li, ol, ul {
    list-style: none;
}

.product_item[data-v-20cdd51a] {
    display: inline-block;
    padding: 0 10px;
    vertical-align: top;
    width: 20%;
}

.product_link[data-v-20cdd51a] {
    display: block;
}

a, a:active, a:focus, a:hover {
    -webkit-text-decoration: none;
    text-decoration: none;
}

.product[data-v-20cdd51a] {
    flex-shrink: 0;
    margin-right: 0;
}
.product[data-v-77f325c0] {
    border-radius: 8px;
    overflow: hidden;
    padding-top: 100%;
    position: relative;
}

.display_tag_item.product_inner_tag.tag--default[data-v-77f325c0] {
    border-radius: 6px;
    height: 26px;
    left: 8px;
    line-height: 17px;
    padding: 0;
    top: 8px;
    width: 26px;
}
.display_tag_item.product_inner_tag[data-v-77f325c0] {
    display: flex
;
    flex-direction: column;
    font-size: 13px;
    font-weight: 600;
    justify-content: center;
    position: absolute;
    text-align: center;
    z-index: 1;
}
.display_tag_item[data-v-17ca498c] {
    border-radius: 2px;
    display: inline-flex
;
    font-size: 11px;
    height: 20px;
    margin-right: 4px;
    padding: 4px;
    position: relative;
    width: -webkit-fit-content;
    width: -moz-fit-content;
    width: fit-content;
}

.display_tag_item .tag_text[data-v-17ca498c] {
    white-space: nowrap;
}

.detail_stock .product_img[data-v-77f325c0], .is_exclusive .product_img[data-v-77f325c0], .lucky_draw_column .product_img[data-v-77f325c0], .other_stock .product_img[data-v-77f325c0], .product_img[data-v-77f325c0], .stock .product_img[data-v-77f325c0] {
    height: auto;
    width: 100%;
}
.product_img[data-v-77f325c0] {
    left: 50%;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
}

.image.full_width[data-v-42c6ced2] {
    height: 100%;
    width: 100%;
}
.image[data-v-42c6ced2] {
    image-rendering: auto;
    -o-object-fit: cover;
    object-fit: cover;
}

.product_desc[data-v-20cdd51a] {
    white-space: normal;
}

.product_name[data-v-20cdd51a] {
    -webkit-line-clamp: 2;
    -webkit-box-orient: vertical;
    display: -webkit-box;
    max-height: 38px;
    overflow: hidden;
    text-overflow: ellipsis;
}
.price_box[data-v-20cdd51a], .product_name[data-v-20cdd51a] {
    font-size: 13px;
    letter-spacing: -.33px;
    line-height: 16px;
    padding-top: 6px;
}

.price_box[data-v-20cdd51a] {
    font-weight: 700;
}
.price_box[data-v-20cdd51a], .product_name[data-v-20cdd51a] {
    font-size: 13px;
    letter-spacing: -.33px;
    line-height: 16px;
    padding-top: 6px;
}

.display_paragraph[data-v-47238b0d].line_break_by_truncating_tail {
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis;
}

.text-lookup.bold[data-v-15b0d9ed] {
    font-weight: 700;
}
.display_paragraph[data-v-47238b0d] {
    white-space: pre-wrap;
}

.social_contents[data-v-3472a2f8] {
    background-color: #fff;
    padding-top: 12px;
}

.btn[data-v-1a2f236e], .social_btn[data-v-1a2f236e] {
    align-items: center;
}
.social_btn[data-v-1a2f236e] {
    display: flex ;
    gap: 12px;
}

.share[data-v-1a2f236e] {
    margin-right: auto;
}
.btn[data-v-1a2f236e] {
    display: inline-flex;
}
.btn[data-v-1a2f236e], .social_btn[data-v-1a2f236e] {
    align-items: center;
}

.btn[data-v-1a2f236e] {
    display: inline-flex
;
}
.btn[data-v-1a2f236e], .social_btn[data-v-1a2f236e] {
    align-items: center;
}
a, a:active, a:focus, a:hover {
    -webkit-text-decoration: none;
    text-decoration: none;
}

.svg-icon.fill-current-color[data-v-cd8c6c40] path[fill]:not([fill=none]) {
    fill: currentColor;
}

path {
    fill-rule: evenodd;
    clip-rule: evenodd;
    d: path("M 18.022 3.341 l -0.055 -0.021 l -0.057 -0.017 c -2.016 -0.603 -3.662 -0.156 -4.869 0.684 a 6.21 6.21 0 0 0 -1.042 0.92 a 6.21 6.21 0 0 0 -1.041 -0.92 C 9.75 3.147 8.106 2.7 6.09 3.303 l -0.057 0.017 l -0.055 0.021 a 6.448 6.448 0 0 0 -3.255 2.903 c -0.878 1.639 -1.066 3.781 0.019 6.327 c 1.07 2.51 3.261 4.725 5.04 6.245 a 33.702 33.702 0 0 0 3.128 2.365 c 0.09 0.06 0.162 0.106 0.212 0.138 l 0.666 0.416 a 0.4 0.4 0 0 0 0.424 0 l 0.666 -0.416 l 0.212 -0.138 a 33.712 33.712 0 0 0 3.127 -2.365 c 1.779 -1.52 3.97 -3.735 5.04 -6.245 c 1.084 -2.546 0.897 -4.688 0.02 -6.326 a 6.446 6.446 0 0 0 -3.255 -2.904 Z m 1.855 8.642 C 18.02 16.34 12 20.1 12 20.1 s -6.022 -3.76 -7.878 -8.117 C 2.266 7.627 4.972 5.34 6.52 4.74 c 2.268 -0.679 3.731 0.377 4.57 1.41 l 0.03 0.037 a 6.11 6.11 0 0 1 0.65 1.003 c 0.086 0.166 0.371 0.166 0.458 0 a 6.343 6.343 0 0 1 0.65 -1.003 l 0.03 -0.038 c 0.84 -1.032 2.303 -2.088 4.572 -1.41 c 1.547 0.6 4.253 2.888 2.397 7.244 Z");
    fill: rgb(34, 34, 34);
}

.btn>span[data-v-1a2f236e] {
    font-feature-settings: "tnum";
    font-size: 13px;
    font-variant-numeric: tabular-nums;
    font-weight: 600;
    letter-spacing: -.07px;
    margin-left: 6px;
}

.lg .social_text[data-v-614e86a1], .md .social_text[data-v-614e86a1] {
    padding-top: 24px;
}

.social_text[data-v-614e86a1] {
    padding-top: 18px;
}

.lg .text_title[data-v-614e86a1], .md .text_title[data-v-614e86a1] {
    font-size: 20px;
    letter-spacing: -.3px;
}

.lg .text_title+.text_link[data-v-614e86a1], .md .text_title+.text_link[data-v-614e86a1] {
    margin-top: 2px;
}
.lg .social_text .text_link[data-v-614e86a1], .md .social_text .text_link[data-v-614e86a1] {
    font-size: 16px;
    letter-spacing: -.16px;
    line-height: 24px;
}
.text_title+.text_link[data-v-614e86a1] {
    margin-top: 6px;
}
.social_text .text_link[data-v-614e86a1] {
    display: inline-block;
    font-size: 14px;
    letter-spacing: -.21px;
    letter-spacing: -.24px;
    line-height: 20px;
}

.social_text .text[data-v-614e86a1] {
    display: inline;
}

.lg .container.social+.container[data-v-7d55de73]:before, .md .container.social+.container[data-v-7d55de73]:before {
    height: 0;
    margin-top: 30px;
}
.container.social+.container[data-v-7d55de73]:before {
    background: #f4f4f4;
    content: "";
    display: block;
    height: 8px;
    margin-top: 8px;
    width: 100%;
}

.lg .follow-list[data-v-7d55de73], .lg .title[data-v-7d55de73], .md .follow-list[data-v-7d55de73], .md .title[data-v-7d55de73] {
    margin-bottom: 24px;
    padding-left: 0;
    padding-right: 0;
}
.lg .title[data-v-7d55de73], .md .title[data-v-7d55de73] {
    border-color: #ebebeb;
    padding-top: 40px;
}

.title[data-v-7d55de73] {
    border-top: 1px solid transparent;
    margin-bottom: 16px;
}
.container_title[data-v-064dee92] {
    align-items: flex-end;
    display: flex;
    justify-content: space-between;
    margin-bottom: 16px;
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
}

.container_title>.title_wrap[data-v-064dee92] {
    flex: 1;
}

.container_title .sub_title[data-v-064dee92], .container_title .title[data-v-064dee92] {
    -webkit-line-clamp: 1;
    -webkit-box-orient: vertical;
    display: -webkit-box;
    overflow: hidden;
    text-overflow: ellipsis;
}
.container_title .title[data-v-064dee92] {
    color: #000;
    font-size: 17px;
    font-weight: 700;
}

.container_title .container_destination_url[data-v-064dee92] {
    color: rgba(34, 34, 34, .5);
    font-size: 13px;
    letter-spacing: -.07px;
}
a, a:active, a:focus, a:hover {
    -webkit-text-decoration: none;
    text-decoration: none;
}

.lg .social_feed_users[data-v-1d30a488]:not(.is_empty) {
    grid-gap: 40px 32px;
    display: grid;
    gap: 40px 32px;
    grid-template-columns: repeat(2, minmax(0, 1fr));
    grid-template-columns: repeat(var(--social-feed-users-cols, 2), minmax(0, 1fr));
    margin-left: 0;
    margin-right: 0;
}

.lg .feeds[data-v-1a7ad377] .social-feeds, .md .feeds[data-v-1a7ad377] .social-feeds {
    margin-bottom: 56px !important;
}

.feeds[data-v-1a7ad377] .social-feeds:first-child {
    margin-bottom: 0 !important;
}

.feeds[data-v-1a7ad377] .social-feeds {
    margin-bottom: 28px !important;
}

.social_feed_users[data-v-1d30a488] {
    display: flex;
    flex-direction: column;
    margin-bottom: 40px;
    margin-top: 16px;
}

.lg .social_feed_user_posts[data-v-0a485b9f] {
    grid-column-gap: 8px;
    -moz-column-gap: 8px;
    column-gap: 8px;
    display: grid;
    grid-template-columns: repeat(var(--746daf96), minmax(0, 1fr));
}

.card-link[data-v-68abab4b] {
    border-radius: 10px;
    display: block;
    outline-width: 0;
    outline: none;
    overflow: hidden;
    padding-top: 132.6530612245%;
    position: relative;
}

.lg .img-card[data-v-68abab4b] {
    border-radius: 10px;
    padding: 1px;
}

.img-card[data-v-68abab4b] {
    height: 100%;
    left: 50%;
    -o-object-fit: cover;
    object-fit: cover;
    position: absolute;
    top: 50%;
    transform: translate(-50%, -50%);
    width: 100%;
}

.bottom-left[data-v-68abab4b] {
    bottom: 8px;
    color: #fff;
    display: flex;
    font-size: 13px;
    left: 8px;
    overflow: hidden;
    position: absolute;
    right: 8px;
    text-overflow: ellipsis;
    white-space: nowrap;
    z-index: 1;
}

.lg .card-link[data-v-68abab4b]:after {
    border: 1px solid #f0f0f0;
}

.feeds[data-v-1a7ad377] .social-feeds:first-child {
    margin-bottom: 0 !important;
}
.feeds[data-v-1a7ad377] .social-feeds {
    margin-bottom: 28px !important;
}
.social_feed_users[data-v-1d30a488] {
    display: flex
;
    flex-direction: column;
    margin-bottom: 40px;
    margin-top: 16px;
}

.like_count>.like_icon[data-v-0a485b9f] {
    margin-right: 2px;
}

.icon-post-type[data-v-0a485b9f] {
    position: absolute;
    right: 8px;
    top: 8px;
}

.card-link[data-v-68abab4b]:after {
    background-image: linear-gradient(0deg, rgba(0, 0, 0, .5), transparent 30%);
    border-radius: inherit;
    bottom: 0;
    content: "";
    left: 0;
    position: absolute;
    right: 0;
    top: 0;
}

/* 우측 좌측 화살표 */
flicking-arrow-next[data-v-96e0b446] {
    background: url(/_nuxt/assets/arr-right-circle.c60e7e23.svg) no-repeat;
    right: 0;
}
.flicking-arrow[data-v-96e0b446] {
    display: block;
    height: 84px;
    width: 67px;
}
.flicking-arrow-next[data-v-96e0b446] {
    right: 10px;
}
.flicking-arrow-next[data-v-96e0b446], .flicking-arrow-prev[data-v-96e0b446] {
    cursor: pointer;
    height: 64px;
    position: absolute;
    top: 50%;
    transform: translateY(-50%);
    width: 64px;
    z-index: 2;
}

.flicking-arrow-prev[data-v-96e0b446] {
    background: url("./style/left.png") no-repeat; /* 상대 경로로 변경 */
    background-size: contain;
    background-position: center;
    width: 64px;
    height: 64px;
}

.flicking-arrow-prev[data-v-96e0b446] {
    left: 10px;
}

*, :after, :before {
    -webkit-tap-highlight-color: rgba(0, 0, 0, 0);
    box-sizing: border-box;
}

.image {
    width: 640px; /* 각 이미지의 고정 너비 설정 */
    height: auto;
}
.img-fluid.rounded-circle
{
	width: 100px;
	height: 100px;
}
.card-footer{
	background-color: transparent !important;
	border-top: 0px !important;
	align-items: center;
	gap: 5px;
}
.social_btn {
	justify-content: end;
}
</style>

<script>
    $(document).ready(function () {
        // 초기 변수 설정
        let currentTranslateX = 0; // 현재 translateX 값 (px)
        const slideWidth = 640; // 슬라이드 하나의 너비
        const $flickingCamera = $(".flicking-camera"); // 슬라이드 컨테이너

        // prev 버튼 클릭 이벤트(이전화면으로 가기)
        $(".flicking-arrow-prev").on("click", function () {
            if(currentTranslateX < 0)
            {
                currentTranslateX += slideWidth; // +640px로 이동
                updateTransform();
            }
        });
       
        //목록버튼 
        $("#btnList").on("click", function () {
        	document.detailForm.action="/style/styleIndex";
        	document.detailForm.submit();
        });
        
        //글쓰기 버튼 클릭시
         $("#btnWrite").on("click", function () {
        	document.detailForm.action="/style/styleWrite";
         	document.detailForm.submit();
         });
        
        //수정버튼 클릭시
     <c:if test="${boardMe eq 'Y'}">    
        $("#btnUpdate").on("click", function() {
        	document.detailForm.action="/style/updateForm";
        	document.detailForm.submit();
        });
        
        
        //삭제버튼
        $("#btnDelete").on("click", function () {
       	 if(confirm("게시물을 삭제하시겠습니까?") == true)
          {
       		 var form = $("#detailForm")[0];
             var formData = new FormData(form);   
             
      	 	$.ajax({
        		type:"POST",	
                enctype:"multipart/form-data",
        		url:"/style/delete",
        		data:formData,
        		processData: false, 
                contentType: false, 
       			dataType:"JSON",
       			beforeSend:function(xhr)
       			{
       				xhr.setRequestHeader("AJAX","true");
       			},
       			success:function(response)
       			{
       				if(response.code == 0)
       				{
       					alert("게시물이 삭제되었습니다.");
       					location.href = "/style/styleIndex";
       				}
       				else if(response.code == 400)
       				{
       					alert("파라미터 값이 올바르지 않습니다.");	
       				}
       				else if(response.code == 403)
       				{
       					alert("본인글이 아니므로 삭제할 수 없습니다.");
       				}
       				else if(response.code == 404)
       				{
       					alert("게시물을 찾을 수 없습니다.");
       					location.href = "/style/styleIndex";
       				}
       				else
   					{
   						alert("게시물 삭제시 오류가 발생했습니다.");
   					}
       			},
       			error:function(xhr,status,error)
       			{
       				icia.common.error(error);
       			}
       			
       		});	
          }
        });
     </c:if>  
     
/////////////////// 위시리스트 ajax //////////////
$(document).on('click', '.card-footer .heart', function () {
        const heartIcon = $(this); // 클릭된 하트 아이콘만 선택
        const bbsSeq = $(this).closest('.card-footer').data('prod-id'); 
	
	    // 아이콘 상태에 따라 동작 결정
	    if (heartIcon.hasClass('bi-heart')) {
	        // 위시리스트에 추가 요청
			$.ajax({
	            url: '/styleWishlist/add',
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
	            	else if(res.code==400)
            		{
            			alert('위시리스트에 존재합니다.');
            		}
	            			                
	                else
	                {
	                	alert('위시리스트 추가 중 오류가 발생했습니다.1');
	                }
	            },
	            error: function(error){
					icia.common.error(error);
					alert('위시리스트 추가 중 오류가 발생했습니다.2');
				}
	        });
	    }
	     
	    else {
	        // 위시리스트에서 삭제 요청
	        $.ajax({
	            url: '/styleWishlist/del',
	            method: 'POST',
	            data: {bbsSeq: bbsSeq },
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
		                alert('위시리스트 제거 중 오류가 발생했습니다.11');
		            }
	            },
	            error: function(error){
					icia.common.error(error);
					alert('위시리스트 제거 중 오류가 발생했습니다.22');
				}

	        });
	    }
	});


//////////////////////////////////////////////

// 슬라이드 업데이트 함수
function updateSlidePosition() {
    const newTranslateX = -currentSlideIndex * slideWidth; // 이동할 위치 계산
    $flickingCamera.css("transform", `translateX(${newTranslateX}px)`);
    updatePagination();
}

// 페이지네이션 업데이트
//function updatePagination() {
//    $(".flicking-pagination-bullet").removeClass("flicking-pagination-bullet-active");
//    $(".flicking-pagination-bullet").eq(currentSlideIndex).addClass("flicking-pagination-bullet-active");
//}

// 이전 버튼 클릭 이벤트
//$(".flicking-arrow-prev").on("click", function () {
//    if (currentSlideIndex > 0) {
//        currentSlideIndex--; // 이전 슬라이드로 이동
//        updateSlidePosition();
 //   } else {
 //       console.log("첫 번째 슬라이드입니다.");
 //   }
//});

// 다음 버튼 클릭 이벤트
//$(".flicking-arrow-next").on("click", function () {
//    if (currentSlideIndex < totalSlides - 1) {
 //       currentSlideIndex++; // 다음 슬라이드로 이동
//        updateSlidePosition();
//    } else {
//        console.log("마지막 슬라이드입니다.");
//    }
//});

// 페이지네이션 클릭 이벤트
//$(".flicking-pagination-bullet").on("click", function () {
//    currentSlideIndex = $(this).index(); // 클릭한 페이지네이션에 해당하는 슬라이드로 이동
//    updateSlidePosition();
//});

// 초기 상태 설정
//updateSlidePosition();
     
 });
    
function fn_myPage(userEmail) {
	document.detailForm.userEmail.value = userEmail;
	document.detailForm.action = "/user/myPage";
	document.detailForm.submit();
}
</script>
</head>
<body>
<%@include file="/WEB-INF/views/include/navigation.jsp" %>
<form name="detailForm" id="detailForm" method="post" enctype="multipart/form-data">
    <div id="__nuxt"><!---->
      <div id="__layout">
          <div tabindex="0" class="layout_base lg wrap win_os lg" data-v-4d6a945a="" data-v-7abc50c0="">
              <div class="layout__main" data-v-7d55de73="" data-v-7abc50c0="" data-v-4d6a945a="">
                  <article data-v-7d55de73="">
                      <div class="v-portal" style="display:none;" data-v-7d55de73=""></div>
                      <section class="container social" data-v-7d55de73="">
                          <div id="p1425883" data-post-id="1425883" data-post-type="image" class="social_post_detail" data-v-7d55de73="">
                              <div class="social_user_state" data-v-f7de12cc="">
                                  <div class="user_state_box" data-v-f7de12cc="">
                                         <a href="javascript:void(0)" onclick="fn_myPage('${style.userEmail}')" class="profile_info" data-v-f7de12cc="" style="width:15%;"> <!-- 유저 프로필 이미지 경로 추후 수정 예정 -->
                                         	<img src="/resources/profile/${style.userProfileImg}" class="img-fluid rounded-circle" alt="프로필" id="profile-image">
										  </a>
										<!-- 프로필사진 -->
                                          <a href="javascript:void(0)" onclick="fn_myPage('${style.userEmail}')" class="profile_info" data-v-f7de12cc="">
                                              <p class="user_name" data-v-f7de12cc="">
                                                  <span class="user_name" data-v-442f04f8="" data-v-f7de12cc="">
                                                      <span data-v-442f04f8=""> <c:out value="${style.userName}"></c:out></span>
                                                      <!---->
                                                  </span>
                                              </p>
                                              <p class="upload_time" data-v-f7de12cc=""> <c:out value="${style.regDate}"></c:out></p>
                                          </a>
                                      <div class="user_buttons" data-v-f7de12cc="">
                                          <button type="button" id="btnList" class="btn btn_follow solid small" data-v-dd412274="" data-v-f7de12cc=""> 목록 </button>
                                          <button type="button" id="btnWrite" class="btn btn_follow solid small" data-v-dd412274="" data-v-f7de12cc=""> 글쓰기 </button>
                                         <c:if test="${boardMe eq 'Y'}"> 
                                         	 <button type="button" id="btnUpdate" class="btn btn_follow solid small" data-v-dd412274="" data-v-f7de12cc=""> 수정 </button>
                                          	 <button type="button" id="btnDelete" class="btn btn_follow solid small" data-v-dd412274="" data-v-f7de12cc=""> 삭제 </button>
                                         </c:if> 
                                      </div>
                                  </div>
                              </div><!--  메인화면 이미지 출력 -->
                              <div data-v-96e0b446="" class="social_image_box" style="height:70%;">
                                  <div data-v-96e0b446="" class="social_slide">
                                      <div data-v-96e0b446="" class="flicking-viewport" style="user-select: none; -webkit-user-drag: none; touch-action: pan-y;">
                                          <div class="flicking-camera" style="transform: translate(0px);">
                                              <div data-v-2d3b4836="" data-v-96e0b446="" class="aspect-ratio slide_content" style="height:100%;">
                                               		<div id="style-carousel" class="carousel slide" data-ride="carousel">
                                                      	<div class="carousel-item" style="display:block;">
                                                      		<c:forEach var="item" items="${bbsImg}" varStatus="status" >
	                                                       		<div class="carousel-item active ">
				                                                     
														    			<img src="/resources/style/${item.bbsImgName}" onclick="fn_view('${item.bbsSeq}')" style="width:100%;" class="card-image" />
														            
													        	</div> 
										          			</c:forEach>   
										            	</div>
                                      				</div>
                                              </div>
                                          </div>
                                          
                                          <!-- 사진 넘기는 화살표 -->
                                          <span data-v-96e0b446="" class="flicking-arrow flicking-arrow-prev"></span>
                                          <span data-v-96e0b446="" class="flicking-arrow flicking-arrow-next"></span>
                                          <div data-v-96e0b446="" class="flicking-pagination flicking-pagination-bullets">
                                              <span class="flicking-pagination-bullet flicking-pagination-bullet-active"></span>
                                              <span class="flicking-pagination-bullet"></span>
                                              <span class="flicking-pagination-bullet"></span>
                                          </div>
                                      </div>
                                  </div>
                              </div><!-- 상품태그 -->
                              
                              <!-- 하단 설명 -->
                              <div class="social_contents" data-v-3472a2f8="">
                                  <div class="social_btn" data-v-1a2f236e="" data-v-3472a2f8="">
                                      <!-- 공유 
                                      <a href="#" aria-label="게시물 공유" class="btn share" data-v-1a2f236e="">
                                          <svg data-v-cd8c6c40="" data-v-1a2f236e="" viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg" class="svg-icon" width="26" height="26">
                                              <g fill="#222">
                                                  <path d="M13 2.145L4.597 9.898l1.102 1.195 6.489-5.988v12.118h1.624V5.105l6.49 5.988 1.101-1.195L13 2.145z"></path>
                                                  <path d="M3.25 21.667v-5.309h1.625v4.767h16.25v-4.767h1.625v5.309c0 .598-.485 1.083-1.083 1.083H4.333a1.083 1.083 0 01-1.083-1.083z"></path>
                                              </g>
                                          </svg>
                                      </a>-->
									 
                                     <div class="card-footer d-flex justify-content-between " data-prod-id="${style.bbsSeq}" data-v-1a2f236e="" data-v-3472a2f8="" >
									    좋아요 <i class="heart <c:if test='${style.wishlistChk != "Y"}'>bi-heart</c:if> <c:if test='${style.wishlistChk == "Y"}'>bi-heart-fill</c:if>" id="heart-icon" style="font-size:25px; color: red; cursor: pointer;"></i>
									 </div>
	                                      <!-- <a href="#" aria-label="댓글" class="btn comment" data-v-1a2f236e="">
                                          <svg viewBox="0 0 26 26" fill="none" xmlns="http://www.w3.org/2000/svg" width="26"
                                              height="26" class="svg-icon" data-v-cd8c6c40="" data-v-1a2f236e="">
                                              <path fill-rule="evenodd" clip-rule="evenodd"
                                                  d="M20.581 18.273l.351-.592A9.158 9.158 0 0022.208 13 9.208 9.208 0 1013 22.207a9.158 9.158 0 004.664-1.266l.592-.349 3.202.878-.877-3.198zm2.997 4.786a.433.433 0 01-.533.532l-4.556-1.249A10.784 10.784 0 0113 23.833c-5.983 0-10.833-4.85-10.833-10.833C2.167 7.017 7.017 2.167 13 2.167c5.983 0 10.833 4.85 10.833 10.833 0 2.011-.548 3.894-1.502 5.508l1.247 4.55z"
                                                  fill="#222"></path>
                                          </svg>
                                          <span data-v-1a2f236e="">15</span>
                                      </a>-->
                                      
                                  </div>
                                  <div class="social_text" data-v-614e86a1="" data-v-3472a2f8="">
                                      <h3 class="text_title" data-v-614e86a1=""> 내용: <c:out value="${style.bbsTitle}"></c:out></h3>
                                      
                                  </div>
                                  <div data-v-3472a2f8="" class="v-portal" style="display: none;"></div>
                                  <div data-v-3472a2f8="" class="v-portal" style="display: none;"></div>
                              </div>
                          </div>
                      </section>
                      
                      <!-- 하단 다른스타일 시작 -->
						<section class="container" data-v-7d55de73="">
						    <div class="container_title title" data-v-064dee92="">
						        <div class="title_wrap">
						            <div class="title" id="otherStyle">${style.userName}님의 다른 스타일</div>
						        </div>
						        <c:if test="${otherList.size() > 4}">
						            <div>
						                <a href="/style/otherStyle.jsp?userEmail=${style.userEmail}" class="container_destination_url">더보기</a>
						            </div>
						        </c:if>
						    </div>
						    <div class="feeds" data-v-1a7ad377="">
						        <article class="social_feed_users social-feeds">
						            <div class="social_feed_user_posts user_post" style="display: flex; ">
					                   <c:if test='${!empty otherList}'> 
						                    <c:forEach var="item" items="${otherList}" varStatus="status">
						                        
						                           <img src="/resources/style/${item.bbsImgName}" onclick="fn_view('${item.bbsSeq}')" alt="Style Image" class="card-image" style="height: 150px; padding-right: 5px; padding-bottom: 15px;"/>
						                       
						                    </c:forEach>
					                   </c:if> 
						            </div>
						        </article>
						    </div>
						</section>
  
					
                  </article>
              </div>
          </div>
      </div>
  </div>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
    
		<input type="hidden" name="curPage" value="${curPage}" />
        <input type="hidden" name="userEmail" id="userEmail" value="${style.userEmail }">
		<input type="hidden" name="bbsSeq" id="bbsSeq" value="${style.bbsSeq}">
		<input type="hidden" name="bbsImg" id="bbsImg" value="${style.bbsImg}">

		<input type="hidden" name="bbsImgName" id="bbsImgName" value="${style.bbsImgName}">
        <input type="hidden" name="bbsSubCateCombinedId" id="bbsSubCateCombinedId" value="${bbsSubCateCombinedId }">
        
    </form>
     <!-- 부트스트랩 JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

   <script>
        function fn_view(bbsSeq) {
            document.detailForm.bbsSeq.value = bbsSeq;
            document.detailForm.action = "/style/detail";
            document.detailForm.submit();
        }
    </script>
</body>
</html>