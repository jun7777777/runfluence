<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<head>
	<style type="text/css">
		/* 모달 스타일 */
        .buying_modal .modal-content {
            border-radius: 16px;
            border: none;
        }

        .buying_modal .modal-header {
            padding: 18px 20px;
            position: relative;
        }

        .buying_modal .modal-header-content {
            width: 100%;
            position: relative;
            display: flex;
            justify-content: center;  /* 가로 중앙 정렬 */
            align-items: center;      /* 세로 중앙 정렬 */
        }

        .buying_modal .modal-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
            line-height: 24px;
        }

        .buying_modal .modal-header .btn-close {
            position: absolute;
            right: 0;
            top: 50%;
            transform: translateY(-50%);
            padding: 0;
            margin: 0;
            width: 24px;
            height: 24px;
        }

        /* 닫기 버튼 위치 조정 */
        .buying_modal .modal-header .btn-close {
            margin: 0;  /* 기본 마진 제거 */
            padding: 18px;  /* 클릭 영역 확보 */
        }

        /* 모달 크기 조정 */
        .buying_modal .modal-dialog {
            max-width: 480px;  /* 모달 너비 조정 */
        }

        .buying_modal .button-list {
            padding: 0;
            margin: 0;
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            gap: 8px;  /* 버튼 사이 간격 */
            list-style: none;
            background-color: #fff;  /* 배경색을 흰색으로 변경 */
        }

        .buying_modal .button-item {
            flex: 0 0 calc(33.333% - 8px);
        }

        .buying_modal .modal-body .button {
            background-color: #fff;
            border: 1px solid #ebebeb;
            border-radius: 12px;
            display: block;
            font-size: 14px;
            line-height: 20px;
            padding: 15px 14px;
            text-align: center;
            white-space: nowrap;
            text-decoration: none;
            color: #222;
            width: 100%;
            height: 100%;
        }

        .buying_modal .modal-body .button:hover {
            background-color: #f8f8f8;
        }

        .buying_modal .modal-body .button.expired span {
            color: #f15746;
        }

        /* 모달 바디 패딩 조정 */
        .buying_modal .modal-body {
            padding: 20px;
        }
	</style>
</head>

<body>
	<!-- 모달 추가 -->
    <div class="modal buying_modal" id="statusModal" tabindex="-1" aria-labelledby="statusModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content">
                <!-- 모달 헤더 -->
                <div class="modal-header border-bottom-0">
                    <div class="modal-header-content">
                        <h5 class="modal-title" id="statusModalLabel">선택한 상태 보기</h5>
                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                </div>
                <!-- 모달 바디 -->
                <div class="modal-body">
                    <ul class="button-list d-flex justify-content-between">
                        <li class="button-item flex-1">
                            <a href="javascript:void(0)" onclick="fn_searchList('')" class="button">
                                <span>전체</span>
                            </a>
                        </li>
                        <li class="button-item flex-1">
                            <a href="javascript:void(0)" onclick="fn_searchList('결제 대기')" class="button">
                                <span>결제 대기</span>
                            </a>
                        </li>
                        <li class="button-item flex-1">
                            <a href="javascript:void(0)" onclick="fn_searchList('주문 취소')" class="button">
                                <span>주문 취소</span>
                            </a>
                        </li>
                        <li class="button-item flex-1">
                            <a href="javascript:void(0)" onclick="fn_searchList('결제 완료')" class="button expired">
                                <span>결제 완료</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
    
    <form name="modalForm" method="post">
    	<input type="hidden" name="searchValue" value="">
    </form>
    
</body>

<script>
	function fn_searchList(searchValue) {
		document.modalForm.searchValue.value = searchValue;
		document.modalForm.action = "/user/buy";
		document.modalForm.submit();
	}
</script>
    