<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<!-- 메타 정보 -->
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- Bootstrap CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">
<!-- Bootstrap Icons CSS -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.7.2/font/bootstrap-icons.css">
<%@include file="/WEB-INF/views/include/shopHead.jsp"%>
<title>사용자 프로필</title>
<style>
.profile_container {
 	margin-left: auto;
    margin-right: auto;
    max-width: 1280px;
    padding-top: 40px;
    padding-right: 40px;
    padding-bottom: clamp(340px, 15%, 480px);
    padding-left: 40px
}

.userprofile {
    display: flex;
    justify-content: center;  /* 자식 요소를 수평 중앙으로 정렬 */
    align-items: center;      /* 자식 요소를 수직 중앙으로 정렬 */
    width: 100%;              /* 부모 요소가 화면 크기만큼 차지하도록 설정 */
    gap: 30px;                /* 자식 요소 간의 위아래 및 좌우 간격 설정 */
    flex-direction: column;   /* 자식 요소를 세로 방향으로 정렬 */
}
.userprofile_detail {
    margin: 0 auto; /* 좌우 여백을 자동으로 설정하여 가운데 정렬 */
    text-align: center; /* 내부 텍스트를 가운데 정렬 */
    display: block; /* 블록 요소로 설정 (필요한 경우) */
}

.useremail_text {
	font-size: 18px;
	letter-spacing: -.27px;
	line-height: 2;
}

.userProfile_btn_box {
	margin-top: 12px;
	font-size: 0px;
}

.btn_small {
	padding: 0px 14px;
	font-size: 12px;
	border-radius: 10px;
	height: 34px;
	letter-spacing: -0.06px;
	color: rgba(34, 34, 34, 0.8);
	border: 1px solid #d3d3d3;
	outline: none;
	flex-direction: row;
}

.btn_large {
    padding: 16px 42px;       /* 위아래 16px, 좌우 24px */
    font-size: 16px;          /* 텍스트 크기 증가 */
    border-radius: 12px;      /* 둥근 모서리 유지 */
    height: auto;             /* 높이를 패딩에 따라 자동 조정 */
    width: auto;              /* 너비도 텍스트 크기에 따라 자동 조정 */
    border: 1px solid #d3d3d3; /* .btn_small의 테두리 색 유지 */
    color: rgba(34, 34, 34, 0.8); /* .btn_small의 텍스트 색 유지 */
    outline: none;            /* 포커스 시 외곽선 제거 */
    flex-direction: row;      /* 플렉스 방향 유지 */
}

.profile_container .profile_info {
	padding-top: 38px;
	max-width: 480px;
	margin: 0 auto;  /* 수평 중앙 정렬 */
}

.group_title {
	font-size: 18px;
}

.profile_unit {
	padding: 20px 0 20px;
}

.profile_unit_title {
	color: rgba(34, 34, 34, .5);
	font-size: 13px;
	letter-spacing: -0.07px;
}

.desc {
	letter-spacing: -0.16px;
	margin-bottom: 0px;
}

.modify_btn_box .btn_cancel {
	padding: 0 38px;
	color: rgba(34, 34, 34, 0.8);
	height: 42px;
	letter-spacing: -0.14px;
	border-radius: 12px;
}

.modify_btn_box .btn_save {
	background-color: #222;
	padding: 0 38px;
	height: 42px;
	letter-spacing: -0.14px;
	border-radius: 12px;
}

.btn_change_custom {
	padding: 0px 14px;
	font-size: 12px;
	border-radius: 10px;
	height: 34px;
	letter-spacing: -0.06px;
	color: rgba(34, 34, 34, 0.8);
	border: 1px solid #d3d3d3;
	outline: none;
	right: 0;
}

.preview-image {
	width: 150px; /* 원하는 크기로 조절 가능 */
	height: 150px; /* 원하는 크기로 조절 가능 */
	object-fit: cover;
	border: 2px solid #ddd; /* 선택 사항: 이미지 테두리 추가 */
}

.thumbnail {
	width: 300px;
	height: 300px;
	object-fit: cover;
	border: 2px solid #ddd;
	border-radius: 50%;
}

.text-profile-info {
	font-size: 15px;
	letter-spacing: -0.15px;
	outline: 0;
	resize: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	line-height: 22px;
}
</style>


</head>
<body>
	<%@include file="/WEB-INF/views/include/shopCate.jsp"%>

	<div class="container profile_container">
		<div class="row 9-3 ">

			<%@include file="/WEB-INF/views/include/mypageSideBar.jsp"%>

			<main class="col-md-9">
				<div class="myprofile_title border-bottom border-3 border-dark pb-3">
					<h3 class="title fw-bold fs-4">프로필 관리</h3>
				</div>
				<div class="userprofile d-flex align-items-center bg-white py-4">
					<input type="file" accept="image/*" hidden="hidden"
						id="profileImageInput">
					<div class="userprofile_img">
						<c:choose>
							<c:when test="${not empty user.userProfileImg}">
								<img src="/resources/profile/${user.userProfileImg}"
									alt="프로필 사진" class="thumbnail">
							</c:when>
							<c:otherwise>
								<img src="/resources/profile/default_profile.png"
									alt="프로필 기본 사진" class="thumbnail">
							</c:otherwise>
						</c:choose>
					</div>
					
				</div>
				
				<div class="userprofile_detail">
					<div class="profile_btn_box">
						<button type="button"
							class="btn_large d-inline-flex align-items-center bg-white justify-content-center text-center align-middle"
							id="imageChangeBtn">이미지 변경</button>
						<button type="button"
							class="btn_large d-inline-flex align-items-center bg-white justify-content-center text-center align-middle"
							style="margin-left: 8px;" id="imageDeleteBtn">삭제</button>
					</div>
				</div>
				
				<div class="profile_info">
					<div class="profile_group">
						<h4 class="group_title fw-semibold">프로필 정보</h4>
						
						<div
							class="profile_unit border-bottom d-flex flex-column position-relative">
							<h5 class="profile_unit_title fw-nomal">이름</h5>
								<div
									class="unit_content d-flex align-items-center justify-content-between w-100">
									<c:choose>
										<c:when test="${not empty user.userName}">
											<p class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">${user.userName}</p>
										</c:when>
										<c:otherwise>
											<p class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">나를 소개하세요</p>
										</c:otherwise>
									</c:choose>
								</div>
						</div>
						
						<div
							class="profile_unit border-bottom d-flex flex-column position-relative">
							
							<h5 class="profile_unit_title fw-nomal">소개</h5>
							<div
								class="unit_content d-flex align-items-center justify-content-between w-100">
								<c:choose>
									<c:when test="${not empty user.userProfileIntro}">
										<p class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">${user.userProfileIntro}</p>
									</c:when>
									<c:otherwise>
										<p class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">나를 소개하세요</p>
									</c:otherwise>
								</c:choose>
								<button type="button"
									class="btn_change_custom d-inline-flex align-items-center justify-content-center bg-white cursor-pointer text-center align-middle position-absolute right-0">변경</button>
							</div>
							<div class="edit-form pt-2 d-none">
								<input type="text"
									class="form-control d-block bg-transparent rounded-0 w-100 py-2 text-profile-info"
									autocomplete="off" maxlength="50" value="" />
								<div class="modify_btn_box text-center pt-4">
									<button type="button"
										class="btn btn_cancel border-secondary align-items-center bg-white d-inline-flex justify-content-center text-center">취소</button>
									<button type="button"
										class="btn btn_save ms-2 text-white fw-bold align-items-center d-inline-flex justify-content-center text-center">저장</button>
								</div>
							</div>
						</div>
					</div>
					
					
					
				</div>
			</main>
		</div>
	</div>


	<!-- 프로필 이미지 수정 모달 -->
	<div class="modal fade" id="profileImageModal" tabindex="-1"
		aria-labelledby="profileImageModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="profileImageModalLabel">프로필 이미지 변경</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<div class="d-flex justify-content-center">
						<img id="profileImagePreview" src="" alt="이미지 미리보기"
							class="img-fluid mb-3 rounded-circle preview-image">
					</div>
					<div>
						<button type="button" class="btn btn-primary" id="confirmImageBtn">확인</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>

	<div class="modal fade" id="profileDeleteModal" tabindex="-1"
		aria-labelledby="profileDeleteModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="profileDeleteModalLabel">프로필 이미지
						삭제</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body text-center">
					<p>정말 프로필 이미지를 삭제하시겠습니까?</p>
					<div>
						<button type="button" class="btn btn-danger" id="confirmDeleteBtn">삭제</button>
						<button type="button" class="btn btn-secondary"
							data-bs-dismiss="modal">취소</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<%@include file="/WEB-INF/views/include/shopFooter.jsp"%>

	<!-- Bootstrap JS 번들 -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>

	<script>
		document.addEventListener('DOMContentLoaded', function() {
			const imageChangeBtn = document.getElementById('imageChangeBtn');
			const profileImageInput = document
					.getElementById('profileImageInput');
			const profileImageModal = new bootstrap.Modal(document
					.getElementById('profileImageModal'), {});
			const profileImagePreview = document
					.getElementById('profileImagePreview');
			const confirmImageBtn = document.getElementById('confirmImageBtn');
			const currentProfileImage = document
					.getElementById('currentProfileImage');
			const imageDeleteBtn = document.getElementById('imageDeleteBtn');
			const profileDeleteModal = new bootstrap.Modal(document
					.getElementById('profileDeleteModal'), {});
			const confirmDeleteBtn = document
					.getElementById('confirmDeleteBtn');
			const profileImgElement = document
					.querySelector('.userprofile_img img'); // 프로필 이미지 요소

			let selectedFile = null;

			imageChangeBtn.addEventListener('click', function() {
				profileImageInput.click();
			});

			profileImageInput.addEventListener('change', function(e) {
				const file = e.target.files[0];
				if (file) {
					const maxsize = 5 * 1024 * 1024;
					const allowedTypes = [ 'image/jpeg', 'image/png',
							'image/gif', 'image/jpg' ];

					if (!allowedTypes.includes(file.type)) {
						Swal.fire({
	            		    title: '실패',
	            		    text: 'JPEG, PNG, GIF, jpg 형식의 이미지만 업로드 가능합니다.',
	            		    icon: 'error',
	            		});
						profileImageInput.value = '';
						return;
					}

					if (file.size > maxsize) {
						Swal.fire({
	            		    title: '실패',
	            		    text: '5mb 이하의 이미지 파일만 사용해주세요.',
	            		    icon: 'error',
	            		});
						profileImageInput.value = "";
						return;
					}

					selectedFile = file;
					const reader = new FileReader();
					reader.onload = function(e) {
						profileImagePreview.src = e.target.result;
						profileImageModal.show();
					};
					reader.readAsDataURL(file);
				}
			});

			confirmImageBtn.addEventListener('click', function() {
				if (!selectedFile) {
					Swal.fire({
            		    title: '실패',
            		    text: '이미지를 선택하세요.',
            		    icon: 'error',
            		});
					return;
				} else {

					const formData = new FormData();
					formData.append('profileImage', selectedFile);

					$.ajax({
						type : "post",
						url : "/user/profileImgCh",
						data : formData,
						processData : false,
						contentType : false,
						success : function(response) {
							if (response.code == 0) {
					            Swal.fire({
					                title: '성공',
					                text: '이미지 등록이 완료되었습니다.',
					                icon: 'success',
					                confirmButtonText: '확인'
					            }).then(() => location.reload(true));
							} else if (response.code == 400) {
								Swal.fire({
					                title: '오류',
					                text: '클라이언트 오류가 발생했습니다.',
					                icon: 'error',
					                confirmButtonText: '확인'
					            });
							} else if (response.code == 404) {
								Swal.fire({
					                title: '오류',
					                text: '로그인 후 이용해주세요',
					                icon: 'error',
					                confirmButtonText: '확인'
					            });
							} else if (response.code == -1) {
								Swal.fire({
					                title: '오류',
					                text: '이미지 등록중 오류 발생',
					                icon: 'error',
					                confirmButtonText: '확인'
					            });
							} else {
								Swal.fire({
					                title: '오류',
					                text: '이미지 등록중 서버 오류',
					                icon: 'error',
					                confirmButtonText: '확인'
					            });
							}
						}
					});

				}
			});

			imageDeleteBtn.addEventListener('click', function() {
				profileDeleteModal.show();
			});

			confirmDeleteBtn.addEventListener('click', function() {
				$.ajax({
					type : "post",
					url : "/user/profileImgdel",
					success : function(response) {
						if (response.code == 0) {
							Swal.fire({
			                    title: '성공',
			                    text: '이미지가 삭제되었습니다.',
			                    icon: 'success',
			                    confirmButtonText: '확인'
			                }).then(() => location.reload(true));
						} else if (response.code == 400) {
			                Swal.fire({
			                    title: '오류',
			                    text: '로그인 후 이용해주세요.',
			                    icon: 'error',
			                    confirmButtonText: '확인'
			                });
			            } else if (response.code == 404) {
			                Swal.fire({
			                    title: '오류',
			                    text: '이미지가 존재하지 않습니다.',
			                    icon: 'warning',
			                    confirmButtonText: '확인'
			                });
			            } else {
			                Swal.fire({
			                    title: '서버 오류',
			                    text: '이미지 삭제 중 문제가 발생했습니다.',
			                    icon: 'error',
			                    confirmButtonText: '확인'
			                });
			            }
					}
				})
			})

			const profileConBtn = document.querySelectorAll('.profile_unit .btn_change_custom');  // '변경' 버튼 (두 번째 부분)
			const editForm = document.querySelector('.edit-form');  // 프로필 편집 폼
			const cancelBtn = editForm.querySelector('.btn_cancel');  // '취소' 버튼
			const unitContent = document.querySelectorAll('.profile_unit .unit_content')[1];  // 두 번째 'unit_content'
			const saveBtn = editForm.querySelector('.btn_save');  // '저장' 버튼
			const inputField = editForm.querySelector('input[type="text"]');  // 입력 필드
			
			// '변경' 버튼 클릭 시
			profileConBtn.forEach(button => {
			    button.addEventListener('click', function() {
			        // 'unit_content' 숨기고, 'editForm' 보이기
			        unitContent.classList.add('d-none');
			        unitContent.classList.remove('d-flex');
			        editForm.classList.remove('d-none');
			    });
			});
			
			// '취소' 버튼 클릭 시
			cancelBtn.addEventListener('click', function() {
			    // 'editForm' 숨기고, 'unit_content' 보이기
			    editForm.classList.add('d-none');
			    unitContent.classList.remove('d-none');
			    unitContent.classList.add('d-flex');
			});
			
			// '저장' 버튼 클릭 시
			saveBtn.addEventListener('click', function() {
			    const intro = inputField.value.trim();
			
			    $.ajax({
			        type: "post",
			        url: "/user/profileInfoCh",
			        data: { userProfileIntro: intro },
			        dataType: "json",
			        success: function(response) {
			            if (response.code == 0) {
			                Swal.fire({
			                    title: '성공',
			                    text: '프로필 소개가 저장되었습니다.',
			                    icon: 'success',
			                    confirmButtonText: '확인'
			                }).then(() => {
			                    // 'unit_content'의 내용 업데이트
			                    unitContent.querySelector('.desc').textContent = intro;
			                    // 'editForm' 숨기기
			                    editForm.classList.add('d-none');
			                    // 'unit_content' 다시 보이기
			                    unitContent.classList.remove('d-none');
			                    unitContent.classList.add('d-flex');
			                });
			            } else {
			                Swal.fire({
			                    title: '서버 오류',
			                    text: '소개 저장 중 문제가 발생했습니다.',
			                    icon: 'error',
			                    confirmButtonText: '확인'
			                });
			            }
			        }
			    });
			});
		});
	</script>


</body>
</html>