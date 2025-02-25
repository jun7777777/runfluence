<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>      
<html lang="ko" style="--vh: 7.41px; --global-header-height: 91px;">
<head>
<%@include file="/WEB-INF/views/include/shopHead.jsp" %>
<meta data-n-head="ssr" charset="utf-8">
<style>
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
    font-family: Pretendard Variable, Pretendard, -apple-system, BlinkMacSystemFont, system-ui, Segoe UI, Roboto, Ubuntu, Cantarell, Noto Sans, sans-serif, Helvetica Neue, Apple SD Gothic Neo, Noto Sans KR, Malgun Gothic, Apple Color Emoji, Segoe UI Emoji, Segoe UI Symbol;
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
body, button, dd, div, dl, dt, fieldset, figcaption, figure, form, h1, h2, h3, h4, h5, h6, input, legend, li, ol, p, select, table, td, textarea, th, ul {
    margin: 0;
    padding: 0;
}

#__layout {
    opacity: 1;
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

.lg .content[data-v-b21d0158], .md .content[data-v-b21d0158] {
    margin-top: 55px;
    padding-bottom: 200px;
}
.content[data-v-b21d0158] {
    margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    padding-bottom: 40px;
}

.lg .social_user_area[data-v-ed317aa0], .md .social_user_area[data-v-ed317aa0] {
padding-bottom: 0;
padding-top: 0;
}
.lg .social_user_area[data-v-ed317aa0] {
padding-left: 40px;
padding-right: 40px;
}
.social_user_area[data-v-ed317aa0] {
padding: 20px 16px;
}

.lg .user_top[data-v-ed317aa0], .md .user_top[data-v-ed317aa0] {
-moz-column-gap: 60px;
column-gap: 60px;
}

.user_top[data-v-ed317aa0] {
align-items: center;
-moz-column-gap: 16px;
column-gap: 16px;
display: flex
;
}

.lg .profile_img_box[data-v-ed317aa0], .md .profile_img_box[data-v-ed317aa0] {
height: 150px;
width: 150px;
}

.profile_img_box[data-v-ed317aa0] {
border-radius: 50%;
height: 88px;
overflow: hidden;
position: relative;
width: 88px;
}
.profile_img[data-v-ed317aa0] {
height: 100%;
-o-object-fit: cover;
object-fit: cover;
width: 100%;
}

.picture[data-v-42c6ced2] {
border: none;
display: flex
;
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
img, video {
-webkit-user-drag: none;
-webkit-touch-callout: none;
border: 0;
-moz-user-select: none !important;
user-select: none !important;
-webkit-user-select: none;
vertical-align: top;
}

.profile_img_box[data-v-ed317aa0]:after {
border: 1px solid rgba(34, 34, 34, .1);
border-radius: inherit;
bottom: 0;
content: "";
left: 0;
position: absolute;
right: 0;
top: 0;
}

.user_top>.profile_info_box[data-v-ed317aa0] {
flex: 1;
min-width: 0;
overflow: hidden;
text-overflow: ellipsis;
}

.lg .user_name_area[data-v-ed317aa0], .md .user_name_area[data-v-ed317aa0] {
-moz-column-gap: 18px;
column-gap: 18px;
}

.user_name_area[data-v-ed317aa0] {
align-items: center;
display: flex
;
font-size: 20px;
letter-spacing: -.1px;
}

.lg .user_name_area>.user_name[data-v-ed317aa0], .md .user_name_area>.user_name[data-v-ed317aa0] {
font-size: 28px;
letter-spacing: -.12px;
}

.user_name_area>.user_name[data-v-ed317aa0] {
font-size: 20px;
letter-spacing: -.1px;
}
.user_name[data-v-442f04f8] {
align-items: center;
display: flex
;
}

.social_user_buttons[data-v-594b12ad] {
-moz-column-gap: 8px;
column-gap: 8px;
display: flex
;
}

.solid[data-v-dd412274] {
background-color: #222;
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

.btn_social_more[data-v-594b12ad] {
width: 34px;
}

.btn_social_more[data-v-594b12ad]>button {
padding: 0;
width: 100%;
}
.outline_greylight[data-v-dd412274] {
border: 1px solid #ebebeb;
color: #222;
}

.lg .profile_info_list[data-v-ed317aa0], .md .profile_info_list[data-v-ed317aa0] {
margin-top: 20px;
}
.profile_info_list[data-v-ed317aa0] {
align-items: center;
display: flex
;
margin-top: 6px;
}
li, ol, ul {
list-style: none;
}

.profile_info_list>li[data-v-ed317aa0] {
align-items: center;
display: inline-flex
;
font-size: 14px;
letter-spacing: -.21px;
}

a, a:active, a:focus, a:hover {
-webkit-text-decoration: none;
text-decoration: none;
}
a {
-webkit-tap-highlight-color: rgba(0, 0, 0, .1);
color: inherit;
}

strong {
font-weight: bold;
}

.lg .profile_info_list>li+li[data-v-ed317aa0]:before, .md .profile_info_list>li+li[data-v-ed317aa0]:before {
margin-left: 12px;
margin-right: 12px;
}

.profile_info_list>li+li[data-v-ed317aa0]:before {
background: #ebebeb;
content: "";
height: 13px;
margin-left: 8px;
margin-right: 8px;
width: 1px;
}

.lg .profile_description[data-v-ed317aa0], .md .profile_description[data-v-ed317aa0] {
margin-top: 20px;
padding-left: 0;
padding-right: 0;
}
.profile_description[data-v-ed317aa0] {
display: flex
;
flex-direction: column;
gap: 4px;
margin-top: 16px;
padding-left: 8px;
padding-right: 8px;
}
.profile_description>.main_txt[data-v-ed317aa0], .profile_description>.sub_txt[data-v-ed317aa0] {
font-size: 14px;
letter-spacing: -.21px;
}

.profile_description>.main_txt[data-v-ed317aa0] {
font-weight: 600;
}

.lg .social_tab[data-v-c7616146], .md .social_tab[data-v-c7616146] {
margin-top: 32px;
padding-left: 40px;
padding-right: 40px;
}


.ul_tab.no-padding[data-v-8651b654] {
    padding-left: 0;
    padding-right: 0;
}


.ul_tab.justified[data-v-8651b654], .ul_tab.no-padding[data-v-8651b654] {
padding-left: 0;
padding-right: 0;
}

.ul_tab.inline[data-v-8651b654] {
    padding-left: 40px;
    padding-right: 40px;
}

.ul_tab.inline[data-v-8651b654] {
-webkit-overflow-scrolling: touch;
-ms-overflow-style: none;
display: flex
;
flex-wrap: nowrap;
height: 45px;
overflow-x: auto;
overflow-y: hidden;
padding-left: 16px;
padding-right: 16px;
scrollbar-width: none;
width: 100%;
}
.social_tab_desktop[data-v-c7616146] {
border-bottom: 1px solid #f0f0f0;
}

.ul_tab.inline .li_tab[data-v-1eabaa8a] {
display: inline-flex
;
}

.ul_tab.inline>[data-v-8651b654] {
flex: 0 0 auto;
}

.ul_tab.inline .tab[data-v-995f66a6] {
display: inline-flex
;
height: 100%;
padding-bottom: 6px;
padding-top: 15px;
}
.tab.active[data-v-995f66a6] {
font-weight: 700;
}
.tab[data-v-995f66a6] {
border-bottom: 2px solid #222;
color: #222;
cursor: pointer;
position: relative;
}


.ul_tab.inline .tab_name[data-v-995f66a6] {
    font-size: 16px;
    line-height: 1.25;
}


.ul_tab.inline .tab_name[data-v-995f66a6] {
font-size: 15px;
line-height: 1.3333333333;
}
.tab_name[data-v-995f66a6] {
background-color: #fff;
line-height: 20px;
position: relative;
}

.social_tab_desktop[data-v-c7616146].inline .li_tab+.li_tab {
margin-left: 49px;
}

.tab[data-v-995f66a6]:not(.active) {
border-bottom-color: transparent !important;
}

.social_feeds[data-v-aacef2de] {
padding: 30px 40px 0;
}

.gutter_item[data-v-aacef2de], .md .gutter_item[data-v-aacef2de] {
width: 16px;
}

.feed_card[data-v-aacef2de] {
width: 260px; /* 고정된 너비 */
}

.feed_card>a[data-v-811ecb58] {
display: block;
position: relative;
}

.social_image_box.vertical[data-v-811ecb58] {
padding-top: 134.77%;
}
.social_image_box[data-v-811ecb58] {
border-radius: 10px;
overflow: hidden;
padding-top: 100%;
position: relative;
}

.social_img[data-v-811ecb58] {
height: 100%;
left: 50%;
-o-object-fit: cover;
object-fit: cover;
position: absolute;
top: 50%;
transform: translate(-50%, -50%);
width: 100%;
}
.video-wrapper[data-v-1e1c8466] {
background-color: #000;
background-position: 50%;
background-repeat: no-repeat;
background-size: cover;
-webkit-user-select: none;
-moz-user-select: none;
user-select: none;
}

.video-wrapper>.poster[data-v-1e1c8466] {
left: 50%;
position: absolute;
top: 50%;
transform: translate(-50%, -50%);
width: 100%;
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

.impression_count[data-v-811ecb58] {
align-items: center;
bottom: 0;
display: inline-flex
;
font-size: 13px;
font-weight: 600;
letter-spacing: -.07px;
padding: 8px;
}

.human_tag[data-v-811ecb58], .impression_count[data-v-811ecb58] {
color: #fff;
left: 0;
position: absolute;
}

.impression_count>.icon[data-v-811ecb58] {
filter: drop-shadow(0 0 1px rgba(0, 0, 0, .4));
}

.svg-icon.fill-current-color[data-v-cd8c6c40] path[fill]:not([fill=none]) {
fill: currentColor;
}

.svg-icon.fill-current-color[data-v-cd8c6c40] path[fill]:not([fill=none]) {
fill: currentColor;
}

.impression_count>.count[data-v-811ecb58] {
padding-left: 3px;
text-shadow: 0 0 2px rgba(0, 0, 0, .5);
}

.card_detail[data-v-811ecb58] {
padding: 8px 4px 0;
}

.user_box[data-v-811ecb58] {
align-items: center;
display: flex
;
}

.img_profile[data-v-811ecb58] {
border: 1px solid rgba(34, 34, 34, .1);
border-radius: 50%;
height: 28px;
-o-object-fit: cover;
object-fit: cover;
overflow: hidden;
width: 28px;
}

.picture[data-v-42c6ced2] {
border: none;
display: flex
;
}

.user_name[data-v-811ecb58] {
-webkit-line-clamp: 1;
color: rgba(34, 34, 34, .8);
flex: 1;
font-size: 15px;
letter-spacing: -.15px;
padding-left: 4px;
padding-right: 6px;
}

.user_name[data-v-442f04f8] {
align-items: center;
display: flex
;
}

.like[data-v-811ecb58] {
position: relative;
}
.btn[data-v-811ecb58] {
align-items: center;
color: rgba(34, 34, 34, .5);
display: flex
;
font-size: 15px;
}
[role=button] {
cursor: pointer;
}

[class*=ico-social-like-][data-v-811ecb58] {
height: 20px;
width: 20px;
}

[class*=ico-] {
height: 24px;
width: 24px;
}

.like_count[data-v-811ecb58] {
padding-left: 3px;
}

.card_detail[data-v-811ecb58] {
padding: 8px 4px 0;
}

.lg .thumbnail-icon[data-v-811ecb58], .md .thumbnail-icon[data-v-811ecb58] {
right: 12px;
top: 12px;
}

.thumbnail-icon[data-v-811ecb58] {
position: absolute;
right: 8px;
top: 8px;
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

.feed_card>a[data-v-811ecb58] {
display: block;
position: relative;
}
a, a:active, a:focus, a:hover {
-webkit-text-decoration: none;
text-decoration: none;
}
a {
-webkit-tap-highlight-color: rgba(0, 0, 0, .1);
color: inherit;
}

.lg .feed_card[data-v-aacef2de]:nth-child(n+6), .md .feed_card[data-v-aacef2de]:nth-child(n+6) {
padding-top: 44px;
}

.social_feeds[data-v-aacef2de] {
padding: 30px 40px 0;
}

.masonry_feed {
position: relative; /* 기존 설정 유지 */
height: auto; /* 고정 높이 제거 및 콘텐츠 기반 높이 설정 */
}

.solid[data-v-dd412274] {
background-color: #222;
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
</style>
</head>

<script>
    $(document).ready(function(){
        $(".feed_card").on("click",function(){
            fn_userStyle_detail(this);
        });

        function fn_style_detail(element){
            var bbsSeq = $(element).data("feed-card");

            document.bbsDetailForm.bbsSeq.value = bbsSeq;
            document.bbsDetailForm.action = "/shop/style_detail";
            document.bbsDetailForm.submit();
        }
    });

        
</script>
<body class="">
    <div id="__nuxt">
        <div id="__layout">
            <div data-v-4d6a945a="" data-v-7abc50c0="" class="layout_base lg wrap win_os lg" tabindex="0">
                <div data-v-b21d0158="" data-v-31adb346="" data-v-7abc50c0="" class="container social layout__main">
                    <div data-v-b21d0158="" class="content">
                        <div data-v-ed317aa0="" data-v-b21d0158="" class="social_user_area">
                            <div data-v-ed317aa0="" class="user_top">
                                <div data-v-ed317aa0="" class="profile_img_box">
                                    <picture data-v-42c6ced2="" data-v-ed317aa0="" class="picture profile_img">
                                        <source data-v-42c6ced2="" type="image/webp"
                                            srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=sl_webp">
                                        <source data-v-42c6ced2=""
                                            srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=sl">
                                        <img data-v-42c6ced2="" alt="KREAM 프로필 이미지"
                                            src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=sl"
                                            loading="lazy" class="image full_width">
                                    </picture>
                                </div>
                                <div data-v-ed317aa0="" class="profile_info_box">
                                    <div data-v-ed317aa0="" class="user_name_area">
                                        <span data-v-442f04f8="" data-v-ed317aa0="" class="user_name">
                                            <span data-v-442f04f8="">ssuny_ji</span><!----></span>
                                        <div data-v-ed317aa0="" class="vue-portal-target">
                                            <div data-v-594b12ad="" data-v-ed317aa0="" class="social_user_buttons">
                                                <button data-v-dd412274="" data-v-594b12ad="" type="button"
                                                    class="btn btn_follow solid small"> 팔로우 </button>
                                                <span data-v-594b12ad="" class="btn_social_more"><button
                                                        data-v-dd412274="" type="button"
                                                        class="btn outline_greylight small">
                                                        <svg width="24" height="24" xmlns="http://www.w3.org/2000/svg"
                                                            class="social-more icon sprite-icons">
                                                            <use href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-3dot-grey"
                                                                xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-3dot-grey">
                                                            </use>
                                                        </svg>
                                                    </button>
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                    <ul data-v-ed317aa0="" class="profile_info_list">
                                        <li data-v-ed317aa0="">
                                            <a data-v-ed317aa0="" href="/social/users/@ssuny_ji/follower" class=""> 팔로워
                                                <strong data-v-ed317aa0="">1,909</strong></a>
                                        </li>
                                        <li data-v-ed317aa0="">
                                            <a data-v-ed317aa0="" href="/social/users/@ssuny_ji/following" class=""> 팔로잉
                                                <strong data-v-ed317aa0="">1</strong> </a>
                                        </li>
                                    </ul>
                                    <div data-v-ed317aa0="" class="vue-portal-target">
                                        <div data-v-ed317aa0="" class="profile_description">
                                            <p data-v-ed317aa0="" class="main_txt"> ssuny_ji </p>
                                            <p data-v-ed317aa0="" class="sub_txt"> Insta : ssuny_ji </p>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <div data-v-ed317aa0="" class="v-portal" style="display: none;"></div>
                            <div data-v-ed317aa0="" class="v-portal" style="display: none;"></div>
                        </div>
                        <div data-v-c7616146="" data-v-b21d0158="" class="social_tab">
                            <ul data-v-8651b654="" data-v-c7616146=""
                                class="ul_tab social_tab_desktop inline no-padding">
                                <li data-v-1eabaa8a="" data-v-c7616146="" class="li_tab" data-v-8651b654="">
                                    <a data-v-995f66a6="" data-v-c7616146="" href="/social/users/@ssuny_ji"
                                        aria-current="page" class="tab active nuxt-link-active active"
                                        data-v-1eabaa8a=""><span data-v-995f66a6="" class="tab_name"> 게시물 318
                                        </span></a>
                                </li>
                            </ul>
                        </div>
                        <div data-v-31adb346="" data-v-b21d0158="">
                            <div data-v-aacef2de="" class="social_feed_mansory social-feeds social_feeds grid_4">
                                <div transition-duration="0" item-selector=".item" gutter=".gutter_item"
                                    horizontal-order="true" class="masonry_feed" style="position: relative;">
                                    <div data-v-aacef2de="" class="gutter_item"></div>
                                    <!-- 여기부터가 게시글 하나씩 -->
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1432851" style="position: absolute; left: 0px; top: 0px;">
                                        <a data-v-811ecb58="" href="" class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay">
                                                        <img data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241208_13/1733666978526YzkaW_JPEG/VIf6lXsEFz_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;"><!---->
                                                    </div><!---->
                                                    <span data-v-811ecb58="" class="impression_count">
                                                        <svg data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg>
                                                        <span data-v-811ecb58="" class="count">7,697</span>
                                                    </span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail" dat-select-image="">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture>
                                                        <span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name">
                                                            <span data-v-442f04f8="">ssuny_ji</span>
                                                        </span>
                                                        <span data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like">
                                                            <svg data-v-811ecb58="" xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg>
                                                            <span data-v-811ecb58="" class="like_count">50</span>
                                                        </span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> Palace = 🖤❤️ </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <!-- 여기까지 -->
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1432556" style="position: absolute; left: 276.5px; top: 0px;">
                                        <a data-v-811ecb58="" href="" class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay">
                                                        <img data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241208_128/1733651459902NIKkt_JPEG/HREVUZrQJR_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;">
                                                    </div>
                                                    <span data-v-811ecb58="" class="impression_count">
                                                        <svg data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg>
                                                        <span data-v-811ecb58="" class="count">8,190</span>
                                                    </span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture>
                                                        <span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name">
                                                            <span data-v-442f04f8="">ssuny_ji</span>
                                                        </span>
                                                        <span data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like">
                                                            <svg data-v-811ecb58="" xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg>
                                                            <span data-v-811ecb58="" class="like_count">38</span>
                                                        </span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 귀여운 연말룩 🐻 </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1425902" style="position: absolute; left: 553px; top: 0px;">
                                        <a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1425902"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay">
                                                        <img data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241201_21/1733056758385jMPEl_JPEG/MCIMPLiI3G_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;">
                                                    </div>
                                                    <span data-v-811ecb58="" class="impression_count">
                                                        <svg data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg>
                                                        <span data-v-811ecb58="" class="count">2.6만</span>
                                                    </span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture>
                                                        <span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name">
                                                            <span data-v-442f04f8="">ssuny_ji</span><!---->
                                                        </span>
                                                        <span data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like">
                                                            <svg data-v-811ecb58="" xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg>
                                                            <span data-v-811ecb58="" class="like_count">75</span>
                                                        </span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 핫템으로 겨울나기 🔥🤎 </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1425661" style="position: absolute; left: 829.5px; top: 0px;">
                                        <a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1425661"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay">
                                                        <img data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241201_218/1733036277879D8wOm_JPEG/Mx6PpjLYtS_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;">
                                                    </div><!---->
                                                    <span data-v-811ecb58="" class="impression_count">
                                                        <svg data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg>
                                                        <span data-v-811ecb58="" class="count">8,862</span></span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture>
                                                        <span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name">
                                                            <span data-v-442f04f8="">ssuny_ji</span><!----></span>
                                                        <span data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like">
                                                            <svg data-v-811ecb58="" xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg>
                                                            <span data-v-811ecb58="" class="like_count">43</span>
                                                        </span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 🎄 </p>
                                                </div>
                                            </div>
                                    </div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1420564" style="position: absolute; left: 0px; top: 413.062px;">
                                        <a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1420564"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay"><img
                                                            data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241124_233/1732448490537oAhXI_JPEG/kYNfoTzL9n_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;"><!----></div>
                                                    <!----><span data-v-811ecb58="" class="impression_count"><svg
                                                            data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg>
                                                        <span data-v-811ecb58="" class="count">1만</span></span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture><span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name"><span
                                                                data-v-442f04f8="">ssuny_ji</span><!----></span><span
                                                            data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like"><svg data-v-811ecb58=""
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg><span data-v-811ecb58=""
                                                                class="like_count">43</span></span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> OOTD 🫶🏻 </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1419933"
                                        style="position: absolute; left: 276.5px; top: 413.062px;">
                                        <a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1419933"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay"><img
                                                            data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241123_185/1732363153616E5I5a_JPEG/QLvpTOh1OB_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;"><!----></div>
                                                    <!----><span data-v-811ecb58="" class="impression_count"><svg
                                                            data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg><span data-v-811ecb58="" class="count">2.3만</span></span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture><span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name"><span
                                                                data-v-442f04f8="">ssuny_ji</span><!----></span><span
                                                            data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like"><svg data-v-811ecb58=""
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg><span data-v-811ecb58=""
                                                                class="like_count">41</span></span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 일주일 출근 데일리룩 ♥️ </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1414453"
                                        style="position: absolute; left: 553px; top: 413.062px;"><a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1414453"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay"><img
                                                            data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241117_100/1731855404725fgPz4_JPEG/D5JRqooI7R_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;"><!----></div>
                                                    <!----><span data-v-811ecb58="" class="impression_count"><svg
                                                            data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg><span data-v-811ecb58="" class="count">3.5만</span></span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture><span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name"><span
                                                                data-v-442f04f8="">ssuny_ji</span><!----></span><span
                                                            data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like"><svg data-v-811ecb58=""
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg><span data-v-811ecb58=""
                                                                class="like_count">65</span></span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 쌀쌀하지만 좋은 날씨 ❄️ </p>
                                                </div>
                                            </div>
                                        </a></div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1414442"
                                        style="position: absolute; left: 829.5px; top: 413.062px;">
                                        <a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1414442"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay"><img
                                                            data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241117_226/17318548592417H89O_JPEG/mgO9gits4d_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;"><!----></div>
                                                    <!----><span data-v-811ecb58="" class="impression_count"><svg
                                                            data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg><span data-v-811ecb58="" class="count">4.5만</span></span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture><span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name"><span
                                                                data-v-442f04f8="">ssuny_ji</span><!----></span><span
                                                            data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like"><svg data-v-811ecb58=""
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg><span data-v-811ecb58=""
                                                                class="like_count">94</span></span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 최애 아이템들 조합 🖤 </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                    <div data-v-811ecb58="" data-v-aacef2de="" class="feed_card item vertical"
                                        data-feed-card="1406946" style="position: absolute; left: 0px; top: 870.124px;">
                                        <a data-v-811ecb58=""
                                            href="/social/users/@ssuny_ji?only_video=true&amp;type=video&amp;target_post_id=1406946"
                                            class="">
                                            <div data-v-811ecb58="" class="card_box">
                                                <div data-v-811ecb58="" class="social_image_box vertical">
                                                    <div data-v-1e1c8466="" data-v-811ecb58=""
                                                        class="video-wrapper social_img showVideoWhenCanPlay"><img
                                                            data-v-1e1c8466=""
                                                            src="https://video-phinf.pstatic.net/20241110_144/17312474134263egqv_JPEG/GhXDQyA2Y2_01.jpg"
                                                            loading="lazy" class="poster"
                                                            style="width: 261px; height: 464px;"><!----></div>
                                                    <!----><span data-v-811ecb58="" class="impression_count"><svg
                                                            data-v-cd8c6c40="" data-v-811ecb58="" viewBox="0 0 24 24"
                                                            fill="#fff" xmlns="http://www.w3.org/2000/svg"
                                                            class="svg-icon icon fill-current-color" width="16"
                                                            height="16">
                                                            <path
                                                                d="M15.45 12a3.45 3.45 0 11-6.9 0 3.45 3.45 0 016.9 0z"
                                                                fill="#000"></path>
                                                            <path fill-rule="evenodd" clip-rule="evenodd"
                                                                d="M12 19.8c7.523 0 11-6.277 11-7.8 0-1.523-3.477-7.8-11-7.8S1 10.477 1 12c0 1.523 3.477 7.8 11 7.8zm5.25-7.8a5.25 5.25 0 11-10.5 0 5.25 5.25 0 0110.5 0z"
                                                                fill="#000"></path>
                                                        </svg><span data-v-811ecb58="" class="count">2.4만</span></span>
                                                </div>
                                                <div data-v-811ecb58="" class="card_detail">
                                                    <div data-v-811ecb58="" class="user_box">
                                                        <picture data-v-42c6ced2="" data-v-811ecb58=""
                                                            class="picture img_profile">
                                                            <source data-v-42c6ced2="" type="image/webp"
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s_webp">
                                                            <source data-v-42c6ced2=""
                                                                srcset="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s">
                                                            <img data-v-42c6ced2="" alt="사용자 프로필 이미지"
                                                                src="https://kream-phinf.pstatic.net/MjAyNDA0MjlfMTk5/MDAxNzE0Mzk2MDUyOTMw.pFfLZzpvsyiIngEHr7QtoZ1uIK8jlOWnnJ3igcyZrTMg.u5kvnPAgcgUnBy1YbzKcC_ZEUzPzlZcP8s12xDXgN8Yg.JPEG/p_6aa2c45fa333425fa8c54e69279247bc.jpeg?type=s"
                                                                loading="lazy" class="image full_width">
                                                        </picture><span data-v-442f04f8="" data-v-811ecb58=""
                                                            class="user_name user_name"><span
                                                                data-v-442f04f8="">ssuny_ji</span><!----></span><span
                                                            data-v-811ecb58="" aria-label="좋아요" role="button"
                                                            class="btn like"><svg data-v-811ecb58=""
                                                                xmlns="http://www.w3.org/2000/svg"
                                                                class="icon sprite-icons ico-social-like-m-off">
                                                                <use data-v-811ecb58=""
                                                                    href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off"
                                                                    xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-social-like-m-off">
                                                                </use>
                                                            </svg><span data-v-811ecb58=""
                                                                class="like_count">48</span></span>
                                                    </div>
                                                    <p data-v-811ecb58="" class="text_box"> 주말 나들이 🍭 </p>
                                                </div>
                                            </div>
                                        </a>
                                    </div>
                                </div>
                                <div data-v-45a47e8d="" data-v-aacef2de="" class="list_loading" style="display: none;">
                                    <img data-v-45a47e8d="" src="/_nuxt/img/loading.66860f7.gif" loading="lazy"
                                        alt="리스트 로딩중입니다." class="loading_img">
                                </div>
                            </div>
                        </div>
                        <div data-v-644ea9c9="" data-v-31adb346="" class="infinite-loading-container"
                            data-v-b21d0158="">
                            <div data-v-644ea9c9="" class="infinite-status-prompt" style="display: none;">
                                <div data-v-45a47e8d="" data-v-31adb346="" class="list_loading" data-v-644ea9c9="">
                                    <img data-v-45a47e8d="" src="/_nuxt/img/loading.66860f7.gif" loading="lazy"
                                        alt="리스트 로딩중입니다." class="loading_img">
                                </div>
                            </div>
                            <div data-v-644ea9c9="" class="infinite-status-prompt"
                                style="color: rgb(102, 102, 102); font-size: 14px; padding: 10px 0px; display: none;">
                            </div>
                            <div data-v-644ea9c9="" class="infinite-status-prompt"
                                style="color: rgb(102, 102, 102); font-size: 14px; padding: 10px 0px; display: none;">
                            </div>
                            <div data-v-644ea9c9="" class="infinite-status-prompt"
                                style="color: rgb(102, 102, 102); font-size: 14px; padding: 10px 0px; display: none;">
                                <br data-v-644ea9c9="">
                                <button data-v-644ea9c9="" class="btn-try-infinite"></button>
                            </div>
                        </div>
                    </div>
                    <div data-v-b21d0158="" class="v-portal" style="display: none;"></div>
                </div>
            </div>
            <div data-v-5312fe5a="" data-v-4d6a945a=""></div>
            <div data-v-4d6a945a="" id="floating-layer">
                <button data-v-30a36b2c="" data-v-4d6a945a="" class="btn_top lg" style="display: none;">
                    <svg data-v-30a36b2c="" xmlns="http://www.w3.org/2000/svg" class="ico-top icon sprite-icons">
                        <use data-v-30a36b2c="" href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-top"
                            xlink:href="/_nuxt/f9460320f4cf99db6c0f74164f350b2e.svg#i-ico-top"></use>
                    </svg>
                </button>
            </div>
            <div data-v-4d6a945a="" id="modal-layer"><!----><!----><!----><!----><!---->
                <div class="vue-portal-target"></div>
                <div class="vue-portal-target"></div>
            </div>

            <div data-v-4d6a945a="" class="vue-portal-target"></div>
        </div>
    </div>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
    <form name="bbsDetailForm" id="bbsDetailForm" method="post">
        <input type="hidden" name="curPage" id="curPage" value="">
        <input type="hidden" name="prodId" id="prodId" value="">
        <input type="hidden" name="userEmail" id="userEmail" value="">
        <input type="hidden" name="bbsSeq" id="bbsSeq" value="">
    </form>
</body>
</html>