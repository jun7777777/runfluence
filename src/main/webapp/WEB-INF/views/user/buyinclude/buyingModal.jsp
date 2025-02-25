<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>
<head>
	<style type="text/css">
			<style type="text/css">
		/* 모달 스타일 */
        .buying_progress_modal .modal-content {
            border-radius: 16px;
            border: none;
        }

        .buying_progress_modal .modal-header {
            padding: 18px 20px;
            position: relative;
        }

        .buying_progress_modal .modal-header-content {
            width: 100%;
            position: relative;
            display: flex;
            justify-content: center;  /* 가로 중앙 정렬 */
            align-items: center;      /* 세로 중앙 정렬 */
        }

        .buying_progress_modal .modal-title {
            font-size: 18px;
            font-weight: bold;
            margin: 0;
            line-height: 24px;
        }

        .buying_progress_modal .modal-header .btn-close {
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
        .buying_progress_modal .modal-header .btn-close {
            margin: 0;  /* 기본 마진 제거 */
            padding: 18px;  /* 클릭 영역 확보 */
        }

        /* 모달 크기 조정 */
        .buying_progress_modal .modal-dialog {
            max-width: 480px;  /* 모달 너비 조정 */
        }

        .buying_progress_modal .button-list {
            padding: 0;
            margin: 0;
            width: 100%;
            display: flex;
            flex-wrap: wrap;
            gap: 8px;
            list-style: none;
            background-color: #fff;
        }

        .buying_progress_modal .button-item {
            flex: 0 0 calc(33.333% - 8px);
        }

        .buying_progress_modal .modal-body .button {
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

        .buying_progress_modal .modal-body .button:hover {
            background-color: #f8f8f8;
        }

        .buying_progress_modal .modal-body .button.expired span {
            color: #f15746;
        }

        /* 모달 바디 패딩 조정 */
        .buying_progress_modal .modal-body {
            padding: 20px;
        }
	</style>
</head>

<body>
	<!-- 모달 추가 -->
    <div class="modal buying_progress_modal" id="statusModal" tabindex="-1" aria-labelledby="statusModalLabel" aria-hidden="true">
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
                    <ul class="button-list d-flex flex-wrap gap-2">
                        <li class="button-item" style="flex: 0 0 calc(33.333% - 8px);">
                            <a href="#" class="button">
                                <span>전체</span>
                            </a>
                        </li>
                        <li class="button-item" style="flex: 0 0 calc(33.333% - 8px);">
                            <a href="#" class="button">
                                <span>배송 중</span>
                            </a>
                        </li>
                        <li class="button-item" style="flex: 0 0 calc(33.333% - 8px);">
                            <a href="#" class="button">
                                <span>반품신청</span>
                            </a>
                        </li>
                        <li class="button-item" style="flex: 0 0 calc(33.333% - 8px);">
                            <a href="#" class="button">
                                <span>교환신청</span>
                            </a>
                        </li>
                        <li class="button-item" style="flex: 0 0 calc(33.333% - 8px);">
                            <a href="#" class="button">
                                <span>교환 중</span>
                            </a>
                        </li>
                        <li class="button-item" style="flex: 0 0 calc(33.333% - 8px);">
                            <a href="#" class="button">
                                <span>반품 중</span>
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
	
</body>