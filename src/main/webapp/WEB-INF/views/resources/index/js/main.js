/*  ---------------------------------------------------
  Template Name: Activitar
  Description:  Activitar Fitness HTML Template
  Author: Colorlib
  Author URI: https://colorlib.com
  Version: 1.0
  Created: Colorlib
---------------------------------------------------------  */

'use strict';

(function ($) {

    /*------------------
        Preloader
    --------------------*/
    $(window).on('load', function () {
        $(".loader").fadeOut();
        $("#preloder").delay(200).fadeOut("slow");

        /*------------------
            Gallery filter
        --------------------*/
        $('.gallery-controls ul li').on('click', function() {
            $('.gallery-controls ul li').removeClass('active');
            $(this).addClass('active');
        });
        if($('.gallery-filter').length > 0 ) {
            var containerEl = document.querySelector('.gallery-filter');
            var mixer = mixitup(containerEl);
        }

        $('.blog-gird').masonry({
            itemSelector: '.grid-item',
            columnWidth: '.grid-sizer',
        });

    });

    /*------------------
        Background Set
    --------------------*/
    $('.set-bg').each(function () {
        var bg = $(this).data('setbg');
        $(this).css('background-image', 'url(' + bg + ')');
    });

    /*------------------
        Navigation
    --------------------*/
    $(".mobile-menu").slicknav({
        prependTo: '#mobile-menu-wrap',
        allowParentLinks: true
    });

    /*------------------
        Menu Hover
    --------------------*/
    $(".header-section .nav-menu .mainmenu ul li").on('mousehover', function() {
        $(this).addClass('active');
    });
    $(".header-section .nav-menu .mainmenu ul li").on('mouseleave', function() {
        $('.header-section .nav-menu .mainmenu ul li').removeClass('active');
    });

    /*------------------
        Carousel Slider
    --------------------*/
    $(".hero-items").owlCarousel({
        loop: true,
        margin: 0,
        nav: true,
        items: 1,
        dots: true,
        animateOut: 'fadeOut',
        animateIn: 'fadeIn',
        navText: ['<i class="arrow_carrot-left"></i>', '<i class="arrow_carrot-right"></i>'],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
        autoplayTimeout : 3000, // 자동 슬라이드 시간 (예제는 3초)
        loop : true // 무한 반복 여부
    });

    /*------------------
        Testimonial Slider
    --------------------*/
   $(".testimonial-slider").owlCarousel({
        loop: true,
        margin: 0,
        nav: false,
        items: 1,
        dots: true,
        navText: ['<i class="arrow_carrot-left"></i>', '<i class="arrow_carrot-right"></i>'],
        smartSpeed: 1200,
        autoHeight: false,
        autoplay: true,
    });

    /*------------------
        Magnific Popup
    --------------------*/
    $('.video-popup').magnificPopup({
        type: 'iframe'
    });

    $('.image-popup').magnificPopup({
        type: 'image'
    });

    /*------------------
        Magnific Popup
    --------------------*/
    $('.show-result-select').niceSelect();

    /*------------------
        Carousel Slider
    --------------------*/
    // $(".event-items").owlCarousel({
    //     items: 3, // 한 화면에 보여줄 슬라이드 개수
    //     loop: true, // 무한 반복
    //     margin: 10, // 슬라이드 간 간격
    //     center: true, // 중앙 정렬 활성화
    //     autoplay: true, // 자동 재생
    //     autoplayTimeout: 3000, // 자동 재생 간격
    //     responsive: {
    //         0: { items: 1 },
    //         600: { items: 2 },
    //         //1000: { items: 5 }
    //     }
    // });

    $(".event-items").each(function () {
        $(this).owlCarousel({
            items: 3, // 한 화면에 보이는 슬라이드 개수
            loop: true, // 무한 반복
            margin: 20, // 슬라이드 간격
            center: true, // 중앙 정렬 활성화
            autoplay: true, // 자동 재생
            autoplayTimeout: 3000, // 자동 재생 간격
            smartSpeed: 600, // 전환 속도
            responsive: {
                0: { items: 1 },
                600: { items: 3 },
            },
            onChanged: function (event) {
                updateClasses($(event.target)); // 슬라이드 전환 후 클래스 업데이트
            },
        });
    });
    
    // 중앙 이미지를 업데이트하는 함수
    function updateClasses(carousel) {
        const items = carousel.find(".owl-item");
        items.removeClass("center"); // 모든 항목에서 center 클래스 제거
        const currentIndex = Math.floor(items.length / 2); // 중앙 항목 인덱스 계산
        items.eq(currentIndex).addClass("center"); // 중앙 항목에 center 클래스 추가
    }
    

    /*------------------
   Timetable Filter
--------------------*/
$('.event-items').hide(); // 모든 hero-items 숨기기
$('#all-class').fadeIn(400); // all-class 부드럽게 표시

// 클릭 이벤트 처리
$('.timetable-controls ul li').on('click', function () {
    var tsfilter = $(this).data('tsfilter'); // 클릭한 버튼의 data-tsfilter 값
    $('.timetable-controls ul li').removeClass('active');
    $(this).addClass('active');

    // 부드럽게 전환
    $('.event-items').stop(true, true).fadeOut(400, function () {
        if (tsfilter === 'all') {
            $('#all-class').stop(true, true).fadeIn(400); // all-class 출력
        } else {
            $('.event-items').each(function () {
                if ($(this).data('tsmeta') === tsfilter) {
                    $(this).stop(true, true).fadeIn(400); // 해당 tsmeta와 일치하는 항목 출력
                }
            });
        }
    });
});

   /*------------------
        스타일-모션적용
    --------------------*/
    document.addEventListener("DOMContentLoaded", function () {
        const feedItems = document.querySelectorAll(".feed-item");
    
        // 카드마다 겹쳐진 상태에서 순차적으로 딜레이 설정
        feedItems.forEach((item, index) => {
            item.style.setProperty("--delay", `${index * 200}ms`); // 각 카드에 딜레이 추가
        });
    
        // Intersection Observer 설정
        const observer = new IntersectionObserver(
            (entries, observer) => {
                entries.forEach((entry) => {
                    if (entry.isIntersecting) {
                        entry.target.classList.add("show"); // 화면에 보이면 'show' 클래스 추가
                        observer.unobserve(entry.target); // 관찰 중지
                    }
                });
            },
            {
                threshold: 0.1, // 요소가 10% 이상 보일 때 실행
            }
        );
    
        // 각 feed-item 요소를 관찰
        feedItems.forEach((item) => observer.observe(item));
    });
    
    
    

    /*------------------
        Like Button Functionality
    --------------------*/
    function toggleLike(element) {
        const likeCountSpan = element.nextElementSibling;
        let likeCount = parseInt(likeCountSpan.textContent, 10);

        if ($(element).hasClass('liked')) {
            // 이미 좋아요를 누른 상태면 취소
            $(element).removeClass('liked');
            likeCount--;
        } else {
            // 좋아요를 누르지 않은 상태면 좋아요 추가
            $(element).addClass('liked');
            likeCount++;
        }

        likeCountSpan.textContent = likeCount;
    }

    // 전역에 공개
    window.toggleLike = toggleLike;
    
    
})(jQuery);

function fn_modal() {
    const menuButton = document.getElementById("menuButton");
    const menuModal = document.getElementById("menuModal");
    const closeButton = document.querySelector(".close-btn");
  
    // 모달 표시
    menuModal.style.display = "block";
  
    // 닫기 버튼 클릭 시 모달 숨김
    closeButton.addEventListener("click", () => {
      menuModal.style.display = "none";
    });
  
    // 모달 외부 클릭 시 모달 숨김
    window.addEventListener("click", (event) => {
      if (event.target === menuModal) {
        menuModal.style.display = "none";
      }
    });
  }
  
  // 버튼 클릭 시 fn_test 실행
  document.getElementById("menuButton").addEventListener("click", fn_modal);
