<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<link rel="stylesheet" href="/resources/index/css/bootstrap.min.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/font-awesome.min.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/elegant-icons.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/nice-select.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/owl.carousel.min.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/magnific-popup.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/slicknav.min.css" type="text/css">
<link rel="stylesheet" href="/resources/index/css/style.css" type="text/css">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<style>

@font-face {
    font-family: 'JejuGothic';
   src: url('/resources/shop/fonts/JejuGothic.ttf') format('truetype');
}

.nav-menu .mainmenu ul li a {
   color: black;
}

.nav-menu .mainmenu ul li.active a {
   color: black;
}

.nav-menu .mainmenu ul li:hover>a {
   color: black;
}

.header-section {
   position: relative;
}

body {
   font-family: 'JejuGothic', sans-serif !important;
}
.nav-menu .mainmenu ul li .dropdown {
	background: transparent !important;
}
.nav-menu .mainmenu ul li .dropdown li a:hover {
	color: black ;
}
.nav-menu .mainmenu ul li .dropdown li a {
	color: black ;
}
</style>
<header class="header-section">
    <div class="container-fluid" style="display: flex; align-items: center;">
        <div class="logo">
            <a href="/index">
                <img src="/resources/index/img/logo.png" alt="">
            </a>
        </div>
        <div class="container">
            <div class="nav-menu">
                <nav class="mainmenu mobile-menu">
                    <ul class="menu align-center expanded text-center SMN_effect-36">
                        <li class="active"><a href="/index">Home</a></li>
                        <!-- <li><a href="./about-us">About us</a></li> -->
                        <li><a href="/shop/shopIndex">Shop</a></li>
                        <li><a href="/community/freeBoard">Community</a>
                            <ul class="dropdown">
                                <li><a href="/community/freeBoard">Forum</a></li>
                                <li><a href="/style/styleIndex">STYLE</a></li>
                            </ul>
                        </li>
                       <!-- <li><a href="./marathon">EVENT</a></li> --> 
                        <li><a href="/notice/notice">Assistance</a></li>
                    </ul>
                </nav>
            </div>
        </div>
        <div class="top-social">
            <a href="javascript:void(0)">
              <i id="shop-menuButton"><p style="font-size:1.3rem; margin:0;">&#128095;</p></i>
            </a>
        </div>
        <div id="mobile-menu-wrap"></div>
    </div>
</header>