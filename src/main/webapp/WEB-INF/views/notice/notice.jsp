<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %> 
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>RunFluence_공지사항</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <!-- Bootstrap CSS -->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">

<!-- Bootstrap JS -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <style>
   /* 검색창 스타일 */
   .my-component > input[type=text] {
       width: 130px; /* 기본 너비 */
       padding: 10px; /* 내부 여백 */
       font-size: 14px; /* 글자 크기 */
       border: 1px solid #dee2e6; /* 테두리 */
       border-radius: 15px 0 0 15px; /* 왼쪽 끝만 둥글게 */
       outline: none; /* 포커스 시 기본 outline 제거 */
       -webkit-transition: width 0.4s ease-in-out; /* 너비 애니메이션 */
       transition: width 0.4s ease-in-out;
       background-color: #f4f4f4; /* 배경색 */
       margin-right: -1px; /* 버튼과 경계 맞춤 */
   }
   
   /* 포커스 시 검색창 너비 변경 */
   .my-component > input[type=text]:focus {
       width: 100%;
   }
   
   
   /* 검색 버튼 스타일 */
   .my-component > button.search-button {
       display: flex; /* 아이콘 중앙 정렬을 위해 flexbox 사용 */
       align-items: center; /* 세로 정렬 */
       justify-content: center; /* 가로 정렬 */
       padding: 10px 15px; /* 버튼 패딩 */
       font-size: 14px; /* 글자 크기 */
       border: 1px solid #dee2e6; /* 테두리 */
       background-color: #f4f4f4; /* 버튼 배경색 */
       color: #6c757d; /* 버튼 글자 색상 */
       border-radius: 0 15px 15px 0; /* 오른쪽 끝만 둥글게 */
   }
   
   /* 버튼 호버 효과 */
   button.search-button:hover {
       background-color: none; /* 호버 시 배경색 */
   }
   
   /* 아이콘 스타일 */
   .my-component > button.search-button i {
       font-size: 21.2px; /* 아이콘 크기 */
   }


    /* 페이징 스타일 */
      .pagination .page-item.active .page-link {
       background-color: #fff; /* 활성화된 페이지 배경 */
       color: #000; /* 활성화된 페이지 글자 색 */
          border-color: #000; /* 활성화된 페이지 테두리 */
      }
      
      .pagination .page-link {
          color: #000; /* 기본 페이지 번호 색상 */
      }
      
      .pagination .page-link:hover {
          color: #000; /* 호버 시 글자 색상 */
          background-color:#c6cbce ;
          text-decoration: none;
      }

       /*footer 하단고정 */
        /* body와 html에 높이를 설정 */
       html, body {
           height: 100%; /* 화면 전체 높이를 사용 */
           margin: 0; /* 기본 마진 제거 */
           display: flex;
           flex-direction: column; /* 세로 정렬 */
       }
   
       /* 메인 컨텐츠를 flex-grow로 확장 */
       .container {
           flex: 1; /* 남은 공간을 채우도록 설정 */
       }
   
       /* footer 스타일 */
       footer {
           background-color: #f8f9fa;
           text-align: center;
           padding: 10px 0;
       }
       /*footer 하단고정 끝*/
    
        body {
            font-family: "JejuGothic", "Poppins", sans-serif;
            background-color: #fff;
        }
        .sidebar {
            min-width: 180px;
        }
        .mypage-title h2 {
            font-size: 32px;
            text-transform: uppercase;
        }
        .main-content .myprofile_title {
            font-size: 24px;
            font-weight: 700;
            border-bottom: 3px solid #222;
            padding-bottom: 16px;
            margin-bottom: 20px;
        }
        .input_search_bar {
            background-color: #f4f4f4;
            border-radius: 8px;
            font-size: 15px;
            padding: 15px 43px 15px 12px;
            width: 100%;
        }
        /* 공지사항 테이블 스타일 */
        .category_list_items {
            width: 100%;
            border-collapse: collapse;
        }
        .category_list_items th, .category_list_items td {
            border: 1px solid #e2e6ea;
            padding: 12px;
            text-align: center;
        }
        .category_list_items th {
            background-color: #f8f9fa;
            font-weight: 600;
        }
        .category_list_items td a {
            color: #007bff;
            text-decoration: none;
        }
        .category_list_items td a:hover {
            text-decoration: underline;
        }
        .announcement-content-section {
            margin-top: 20px;
        }
    </style>
    <script>
    
    function searchFunction() {
       const searchTerm = document.getElementById('search_input').value.trim();
        let url = '/notice/notice';
        if (searchTerm) {
            url += '?searchValue=' + encodeURIComponent(searchTerm);
        }
        window.location.href = url;
    }
    
        document.addEventListener('DOMContentLoaded', function() {
            
            // 엔터키를 눌렀을 때 검색 실행
            document.getElementById('search_input').addEventListener('keypress', function(event) {
                if (event.key === 'Enter') {
                    event.preventDefault();
                    searchFunction();
                }
            });
            
            window.fn_list = function(pageNumber) {
                var form = document.forms['noticeListform'];
                form.elements['curPage'].value = pageNumber;
                form.submit();
            };
         
            window.fn_view = function(bbsSeq) {
                var form = document.forms['noticeListform'];
                form.bbsSeq.value = bbsSeq;
                form.action = "/notice/noticeview";
                form.curPage.value = '${curPage}'; 
                form.searchValue.value = '${searchValue}'; 
                form.submit();
            };
            
        });
    
    </script>
</head>
<body>
    <%@include file="/WEB-INF/views/include/shopCate.jsp" %>
    <!-- 메인 컨텐츠 -->
    <div class="container py-4 buying_container">
        <div class="row">
            
         <nav class="col-md-3 mb-4 mb-md-0 mysidebar" style="flex-shrink: 0; flex:none; width:180px;">
   
         
             <!-- 고객 지원 섹션 -->
             <div class="mb-4">
                 <h5 class="border-bottom pb-2 mb-3" style="font-weight: 600; font-size: 16px;">
                     고객 지원
                 </h5>
                 <ul class="nav flex-column" style="padding-left: 0;">
                     <li class="nav-item">
                         <a href="/notice/notice" class="nav-link" style="color: inherit; padding: 8px 0">
                             공지사항
                         </a>
                     </li>
                     <li class="nav-item">
                         <a href="/notice/qna" class="nav-link" style="color: inherit; padding: 8px 0">
                             자주 물어보는 질문
                         </a>
                     </li>
                 </ul>
             </div>
         </nav>

            <!-- 메인 컨텐츠 -->
            <main class="col-md-9 main-content">
                <div class="myprofile_title mb-4" style="margin-bottom: 15px !important;" >
                    공지사항
                </div>
                
                <div class="my-component" style="display: flex; align-items: center; ">
                <!-- 검색창 -->
                <input type="text" id="search_input" placeholder="검색하세요.."/>
                <!-- 검색 버튼 (아이콘 포함) -->
                <button class="search-button" onclick="searchFunction()">
                    <i class="fa fa-search"></i>
                </button>
            </div>

                
                <!-- 검색 바 
                <div class="mb-4">
                    <div class="input-group">
                        <input type="text" id="search_input" name="search" placeholder="검색" title="검색창" class="form-control input_search_bar" value="${param.search}">
                        <button class="btn btn-outline-secondary" type="button" onclick="searchFunction()" style="color: #6F6F6F;"><i class="fa fa-search"></i></button>
                    </div>
                </div> -->
                
                
                <!-- 공지사항 목록 (게시판 테이블 형태) -->
                <div class="announcement-content-section">
                    <table class="category_list_items">
                        <thead>
                            <tr>
                                <th style="width: 10%; color: #000">번호</th>
                         <th style="width: 40%; color: #000">제목</th>
                         <th style="width: 20%; color: #000">작성자</th>
                         <th style="width: 15%; color: #000">등록일</th>
                         <th style="width: 15%; color: #000">조회수</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:if test='${not empty list}'>
                            <c:forEach var="bbs" items="${list}" varStatus="status">
                                <tr class="text-center-view" onclick="fn_view(${bbs.bbsSeq})">
                                    <td class="text-center">
                                       ${totalCount - ((curPage - 1) * listCount + status.index)}
                                    </td>
                                    <td class="text-center-title"><a href="javascript:void(0)" class="text-decoration-none text-body">${bbs.bbsTitle}</a></td>
                                    <td class="text-center">관리자</td>
                                    <c:choose>
                                       <c:when test="${not empty bbs.updateDate}">
                                          <td class="text-center">${bbs.updateDate}</td>
                                       </c:when>
                                       <c:otherwise>
                                          <td class="text-center">${bbs.regDate}</td>
                                       </c:otherwise>
                                    </c:choose>
                                    <td class="text-center">${bbs.bbsReadCnt}</td>
                                </tr>
                            </c:forEach>
                            </c:if>
                            <c:if test="${empty list}">
                                <tr>
                                    <td colspan="5">등록된 공지사항이 없습니다.</td>
                                </tr>
                            </c:if>
                        </tbody>
                    </table>
                    <c:if test="${totalCount > 0}">
                  <ul class="pagination justify-content-center mt-3">
                      <!-- 이전 페이지 -->
                      <c:if test="${paging.prevBlockPage gt 0}">
                          <li class="page-item">
                              <a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.prevBlockPage})">
                                  이전
                              </a>
                          </li>
                      </c:if>
                  
                      <!-- 페이지 번호 -->
                      <c:forEach var="i" begin="${paging.startPage}" end="${paging.endPage}">
                          <c:choose>
                              <c:when test="${i eq curPage}">
                                  <li class="page-item active">
                                      <a class="page-link" href="javascript:void(0)">${i}</a>
                                  </li>
                              </c:when>
                              <c:otherwise>
                                  <li class="page-item">
                                      <a class="page-link" href="javascript:void(0)" onclick="fn_list(${i})">${i}</a>
                                  </li>
                              </c:otherwise>
                          </c:choose>
                      </c:forEach>
                  
                      <c:if test="${paging.nextBlockPage gt 0}">
                          <li class="page-item">
                              <a class="page-link" href="javascript:void(0)" onclick="fn_list(${paging.nextBlockPage})">
                                  다음
                              </a>
                          </li>
                      </c:if>
                  </ul>
               </c:if>
                </div>
            </main>
        </div>
    </div>
    
    <form name="noticeListform">
       <input type="hidden" name="searchValue" value="${searchValue}">
       <input type="hidden" name="curPage" value="">
      <input type="hidden" name="bbsSeq" value="${bbsSeq}">
    </form>
    
    <!-- Bootstrap 5 JS Bundle (includes Popper) -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <%@include file="/WEB-INF/views/include/shopFooter.jsp" %>
</body>
</html>
