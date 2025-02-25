<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- 부트스트랩 CSS -->
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet">


<!-- 부트스트랩 아이콘 -->
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
<%@include file="/WEB-INF/views/include/shopHead.jsp"%>
<title>회원정보 수정</title>

<style>
.userUpdate {
	margin-left: auto;
	margin-right: auto;
	max-width: 1280px;
	padding-top: 40px;
    padding-right: 40px;
    padding-bottom: clamp(240px, 15%, 480px);
    padding-left: 40px
}

.userUpdatetitle {
	letter-spacing: -0.15px;
}

.user_info {
	padding-top: 38px;
	max-width: 480px;
	margin: 0 auto;  /* 수평 중앙 정렬 */
}

.group_title {
	font-size: 18px;
	letter-spacing: -0.27px;
}

.user_unit {
	padding: 20px 0 20px;
}

.user_unit_title {
	color: rgba(34, 34, 34, .5);
	font-size: 13px;
	letter-spacing: -0.07px;
}

.desc {
	letter-spacing: -0.16px;
	margin-bottom: 0px;
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

.form_control {
	font-size: 15px;
	letter-spacing: -0.15px;
	outline: 0;
	resize: none;
	border: none;
	border-bottom: 1px solid #ebebeb;
	line-height: 22px;
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

.modify_btn_box .btn_confirm {
	background-color: #222;
	padding: 0 38px;
	height: 42px;
	letter-spacing: -0.14px;
	border-radius: 12px;
}

input[type="password"] {
	font-family: Arial, sans-serif;
}

.user_del {
    font-size: 13px;
    display: flex;
    align-items: center; /* 텍스트와 버튼을 세로로 맞추기 */
}

.btn-custom-size {
    width: auto; /* 너비 자동으로 설정 */
    height: auto; /* 높이 자동으로 설정 */
    font-size: 14px; /* 글꼴 크기 */
    padding: 5px 10px; /* 내부 여백 */
    border: none; /* 버튼 기본 테두리 제거 */
    background: none; /* 배경 제거 */
    text-decoration: underline; /* 텍스트처럼 보이도록 밑줄 추가 */
    color: inherit; /* 부모 텍스트 색상 상속 */
    cursor: pointer; /* 마우스를 올리면 클릭 가능한 포인터 모양 */
}

.btn-custom-size:hover {
    color: #dc3545; /* 호버 시 텍스트 색상 변경 (예: 빨간색) */
    text-decoration: none; /* 호버 시 밑줄 제거 */
}

.text-danger {
    color: #dc3545; /* 텍스트 색상 빨간색 */
}
</style>
</head>
<body>
	<%@include file="/WEB-INF/views/include/shopCate.jsp"%>
	<div class="container userUpdate">
		<div class="row 9-3">

			<%@include file="/WEB-INF/views/include/mypageSideBar.jsp"%>

			<main class="col-md-9">
				<div class="userupdate title border-bottom border-3 border-dark pb-3">
					<h3 class="userUpdatetitle title fw-bold fs-4">유저 정보 수정</h3>
				</div>
				<div class="user_info">
					<div class="user_info_group pt-0">
						<h4 class="group_title fw-semibold">유저 정보</h4>
						<div
							class="user_unit border-bottom d-flex flex-column position-relative">
							<h5 class="user_unit_title fw-nomal">유저 이메일</h5>
							<div
								class="unit_content d-flex align-items-center justify-content-between w-100">
								<p
									class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">${user.getUserEmail()}</p>
							</div>
						</div>
						<div
							class="user_unit border-bottom d-flex flex-column position-relative">
							<h5 class="user_unit_title fw-nomal">유저 비밀번호</h5>
							<div
								class="unit_content d-flex align-items-center justify-content-between w-100">
								<p
									class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">${user.getUserPwd()}</p>
								<button type="button"
									class="btn_change_custom d-inline-flex align-items-center justify-content-center bg-white cursor-pointer text-center align-middle position-absolute right-0">변경</button>
							</div>
							<div class="edit-form orgPwd-form pt-2 d-none">
								<input type="password" id="orgPwd"
									class="form_control d-block bg-transparent rounded-0 w-100 py-2 "
									placeholder="기존 비밀번호" autocomplete="off" maxlength="25"
									value="" data-validate="pwd" />
								<div class="invalid-feedback org-pwd-feedback"
									style="display: none;">비밀번호는 영문, 숫자, 특수문자를 포함하고 8자 이상 16자
									이하입니다.</div>
								<div class="modify_btn_box text-center pt-4">
									<button type="button"
										class="btn btn_cancel border-secondary align-items-center bg-white d-inline-flex justify-content-center text-center">
										취소</button>
									<button type="button"
										class="btn btn_confirm ms-2 text-white fw-bold align-items-center d-inline-flex justify-content-center text-center"
										disabled>확인</button>
								</div>

							</div>
							<div class="edit-form changePwd-form pt-2 d-none">
								<input type="password" id="Pwd1"
									class="form_control d-block bg-transparent rounded-0 w-100 py-2 "
									placeholder="변경 비밀번호 " autocomplete="off" maxlength="25"
									value="" data-validate="pwd" />
								<div class="invalid-feedback" style="display: none;">
									비밀번호는 영문, 숫자, 특수문자를 포함하고 8자 이상 16자 이하입니다.</div>
								<input type="password" id="Pwd2"
									class="form_control d-block bg-transparent rounded-0 w-100 py-2 "
									placeholder="비밀번호 확인" autocomplete="off" maxlength="25"
									value="" data-validate="pwd" />
								<div class="invalid-feedback" style="display: none;">
									비밀번호는 영문, 숫자, 특수문자를 포함하고 8자 이상 16자 이하입니다.</div>
								<div class="modify_btn_box text-center pt-4">
									<button type="button"
										class="btn btn_cancel border-secondary align-items-center bg-white d-inline-flex justify-content-center text-center">
										취소</button>
									<button type="button"
										class="btn btn_save ms-2 text-white fw-bold align-items-center d-inline-flex justify-content-center text-center"
										disabled>저장</button>
								</div>
							</div>
						</div>
						<div
							class="user_unit border-bottom d-flex flex-column position-relative">
							<h5 class="user_unit_title fw-nomal">이름</h5>
							<div
								class="unit_content d-flex align-items-center justify-content-between w-100">
								<p
									class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">${user.getUserName()}</p>
								<button type="button"
									class="btn_change_custom d-inline-flex align-items-center justify-content-center bg-white cursor-pointer text-center align-middle position-absolute right-0">변경</button>
							</div>
							<div class="edit-form pt-2 d-none">
								<input type="text"
									class="form_control nameinput d-block bg-transparent rounded-0 w-100 py-2 "
									placeholder="개명하셨다면 이름 변경이 가능합니다." autocomplete="off"
									maxlength="25" value="" data-validate="name" />
								<div class="invalid-feedback" style="display: none;">영문,
									숫자, 특수기호(_ .)만 사용 가능합니다. (5-25자)</div>
								<div class="modify_btn_box text-center pt-4">
									<button type="button"
										class="btn btn_cancel border-secondary align-items-center bg-white d-inline-flex justify-content-center text-center">
										취소</button>
									<button type="button"
										class="btn btn_save namebtn ms-2 text-white fw-bold align-items-center d-inline-flex justify-content-center text-center"
										disabled>저장</button>
								</div>
							</div>
						</div>
						<div
							class="user_unit border-bottom d-flex flex-column position-relative">
							<h5 class="user_unit_title fw-nomal">전화번호</h5>
							<div
								class="unit_content d-flex align-items-center justify-content-between w-100">
								<p
									class="desc desc_modify flex-grow-1 fs-6 overflow-hidden text-truncate w-100">${user.getUserTel()}</p>
								<button type="button"
									class="btn_change_custom d-inline-flex align-items-center justify-content-center bg-white cursor-pointer text-center align-middle position-absolute right-0">변경</button>
							</div>
							<div class="edit-form pt-2 d-none">
								<input type="text"
									class="form_control telinput d-block bg-transparent rounded-0 w-100 py-2 "
									placeholder="바꿀 전화번호 명을 입력하세요" autocomplete="off"
									maxlength="25" value="" data-validate="tel" />
								<div class="invalid-feedback" style="display: none;">영문,
									숫자, 특수기호(_ .)만 사용 가능합니다. (5-25자)</div>
								<div class="modify_btn_box text-center pt-4">
									<button type="button"
										class="btn btn_cancel border-secondary align-items-center bg-white d-inline-flex justify-content-center text-center">
										취소</button>
									<button type="button"
										class="btn btn_save telbtn ms-2 text-white fw-bold align-items-center d-inline-flex justify-content-center text-center"
										disabled>저장</button>
								</div>
							</div>
						</div>
						<div class="user_del mt-md-5 text-danger">
						    <button type="button" class="btn btn-custom-size btn-link text-decoration-none" data-bs-toggle="modal" data-bs-target="#withdrawalModal">탈퇴하기</button>
						</div>
					</div>
				</div>
			</main>
			
		</div>
	</div>
		
	<div class="modal fade" id="withdrawalModal" tabindex="-1" aria-labelledby="withdrawalModalLabel" aria-hidden="true">
	  <div class="modal-dialog modal-dialog-centered">
	    <div class="modal-content">
	      <form id="withdrawalForm">
	        <div class="modal-header">
	          <h5 class="modal-title" id="withdrawalModalLabel">회원 탈퇴 확인</h5>
	          <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="닫기"></button>
	        </div>
	        <div class="modal-body">
	          <p>탈퇴를 진행하려면 비밀번호를 입력해 주세요.</p>
	          <div class="mb-3">
	            <label for="withdrawalPassword" class="form-label">비밀번호</label>
	            <input type="password" class="form-control" id="withdrawalPassword" required>
	          </div>
	        </div>
	        <div class="modal-footer">
	          <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
	          <button type="submit" class="btn btn-danger">탈퇴하기</button>
	        </div>
	      </form>
	    </div>
	  </div>
	</div>

	<script>
    // 유저 정보 수정 관련기능
        document.addEventListener('DOMContentLoaded', function() {
        const modifyButtons = document.querySelectorAll(".btn_change_custom");

        modifyButtons.forEach(button => {
            button.addEventListener('click', function() {
                const unitElement = this.closest('.user_unit');
                const unitContent = unitElement.querySelector(".unit_content");
                const editForm = unitElement.querySelector('.edit-form');
                const saveButton = editForm.querySelector('.btn_save') || editForm.querySelector('.btn_confirm');
                const inputField = editForm.querySelector('.form_control');

                unitContent.classList.add('d-none');
                unitContent.classList.remove('d-flex');
                editForm.classList.remove('d-none');
                saveButton.disabled = true;

                inputField.addEventListener('input', function() {
                    const isValid = input_validate(inputField);
                    const feedback = inputField.nextElementSibling;
                    
                    if (isValid) {
                        feedback.style.display = 'none';
                        saveButton.disabled = false;
                    } else {
                        feedback.style.display = 'block';
                        saveButton.disabled = true;
                    }
                });

                editForm.querySelector('.btn_cancel').addEventListener('click', function() {
                    unitContent.classList.remove('d-none');
                    unitContent.classList.add('d-flex');
                    editForm.classList.add('d-none');
                });
            });
        });
        
        //기존 비밀번호 확인 폼
        
        const orgPwdForms = document.querySelectorAll('.orgPwd-form');
        
        orgPwdForms.forEach(form => {
            const inputField = form.querySelector('.form_control');
            const confirmButton = form.querySelector('.btn_confirm');
            const cancelButton = form.querySelector('.btn_cancel');
            const feedback = form.querySelector('.org-pwd-feedback');
            const unitElement = form.closest('.user_unit');
            const changePwdForm = unitElement.querySelector('.changePwd-form');

            
            inputField.addEventListener('input', function() {
                const isValid = input_validate(inputField);
                if (isValid) {
                    feedback.style.display = 'none';
                    confirmButton.disabled = false;
                } else {
                    feedback.style.display = 'block';
                    feedback.style.color = 'red';
                    confirmButton.disabled = true;
                }
            });
            
            cancelButton.addEventListener('click', function() {
                form.classList.add('d-none');
                unitElement.querySelector(".unit_content").classList.remove('d-none');
                unitElement.querySelector(".unit_content").classList.add('d-flex');
            });
            
            confirmButton.addEventListener('click',function(){
            	const orgPwd = inputField.value.trim();
            	
            	$.ajax({
            		type:"post",
            		url:"/user/orgPwdChk",
            		data:{
            			userPwd:orgPwd
            		},
            		dataType:"json",
            		success: function(response){
            			
            			if(response.code == 0)
            			{
            				feedback.textContent = "비밀번호가 일치합니다.";
                            feedback.style.color = 'green';
                            feedback.style.display = 'block';
							
                            setTimeout(() => {
                            	form.classList.add('d-none');
                                changePwdForm.classList.remove('d-none');
							}, 2000);
                            
            			}
            			else if(response.code == -1)
            			{
            				feedback.textContent = "비밀번호가 일치하지 않습니다.";
            				feedback.style.color = 'red';
                            feedback.style.display = 'block';
            			}
            		}
            	});
            	
            	
            });
            
   
        });
        
        const changePwdForms = document.querySelectorAll('.changePwd-form');
        changePwdForms.forEach(form =>{
        	const pwd1 = form.querySelector('#Pwd1');
            const pwd2 = form.querySelector('#Pwd2');
            const saveButton = form.querySelector('.btn_save');
            const feedback1 = pwd1.nextElementSibling;
            const feedback2 = pwd2.nextElementSibling;
            
            let isPwd1Valid = false;
            let isPwd2Valid = false;
            let eqPwd = false;
            
            pwd1.addEventListener('input',function(){
            	const isValid = input_validate(pwd1);
            	isPwd1Valid = isValid;
                if (isValid) {
                    feedback1.style.display = 'none';
                   
                } else {
                    feedback1.style.display = 'block';
                    feedback1.style.color = 'red';
                    
                }
                
                checkFormValidity();
            });
            
            pwd2.addEventListener('input',function(){
            	const isValid = input_validate(pwd2);
            	isPwd2Valid = isValid;
                if (isValid) {
                    feedback2.style.display = 'none';
                   
                } else {
                    feedback2.style.display = 'block';
                    feedback2.style.color = 'red';
                    
                }
                
                checkFormValidity();
            });
            
            function checkeqPwd() {
            	const val1 = pwd1.value.trim();
            	const val2 = pwd2.value.trim();
            	
            	if(val1 === val2 && val1 != "") 
            	{
            		eqPwd = true;
            		feedback2.style.display = 'none';
            	}
            	else
            	{
            		eqPwd = false;
            		
            		if(val2 != "")
            		{
            			feedback2.style.display = 'block';
                        feedback2.style.color = 'red';
            		}
            		
            	}
            }
            
            function checkFormValidity() 
            {
            	checkeqPwd();
                if (isPwd1Valid && isPwd2Valid && eqPwd) 
                {
                    saveButton.disabled = false;
                } 
                else 
                {
                    saveButton.disabled = true;
                }
            }
            
            
            pwd2.addEventListener('input', checkeqPwd);
            
            saveButton.addEventListener('click',function(){
            	
            	const newPwd = pwd1.value.trim();
            	
            	$.ajax({
            		type:"post",
            		url:"/user/userPwdchange",
            		data:{
            			userPwd:newPwd
            		},
            		dataType:"json",
            		success:function(response)
            		{
            			if(response.code == 0)
            			{
            				Swal.fire({
            				    title: '성공',
            				    text: '비밀번호 수정 완료',
            				    icon: 'success',
            				    confirmButtonText: '확인'
            				}).then(() => {
            				    location.reload(true);
            				});
            			}
            			else if(response.code == 400)
            			{
            				Swal.fire({
            				    title: '오류',
            				    text: '클라이언트 오류',
            				    icon: 'error',
            				    confirmButtonText: '확인'
            				});
            			}
            		},
            		error:function() {
            			Swal.fire({
            			    title: '서버 오류',
            			    text: '서버 오류 발생 나중에 다시 시도해주세요',
            			    icon: 'error',
            			    confirmButtonText: '확인'
            			});
            		}
            	});
            });
            
        })
        
		
        const nameVal = document.querySelector(".nameinput");
        const namebtn = document.querySelector(".namebtn");
        
        namebtn.addEventListener("click",function(){
        	const value = nameVal.value.trim();
        	
        	$.ajax({
        		type:"post",
        		url:"/user/userNamechange",
        		data:{
        			userName:value
        		},
        		success:function(response) {
        			if(response.code == 0) {
        				Swal.fire({
        				    title: '성공',
        				    text: '이름 수정 완료',
        				    icon: 'success',
        				    confirmButtonText: '확인'
        				}).then(() => {
        				    location.reload(true);
        				});
        				
        		/* 		const unitElement = namebtn.closest('.user_unit');
                        const nameDisplay = unitElement.querySelector('.desc_modify');
                        
                        
                        // 편집 폼 숨기기 및 기본 상태 복원
                        const editForm = unitElement.querySelector('.edit-form');
                        editForm.classList.add('d-none');
                        const unitContent = unitElement.querySelector('.unit_content');
                        unitContent.classList.remove('d-none');
                        unitContent.classList.add('d-flex');
                        
                        // 입력 필드 초기화
                        nameVal.value = '';
                        namebtn.disabled = true; */
        				
        			}
        			else if(response.code == 400){
        				Swal.fire({
        				    title: '오류',
        				    text: '클라이언트 오류',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
        			}
        			else {
        				Swal.fire({
        				    title: '오류',
        				    text: '이름변경 오류 발생',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
        			}
        		},
        		error:function() {
        			Swal.fire({
        			    title: '서버 오류',
        			    text: '서버 오류 발생. 나중에 다시 시도해주세요.',
        			    icon: 'error',
        			    confirmButtonText: '확인'
        			});
        		}
        	})
        
        });
        
        
        const telVal = document.querySelector(".telinput");
        const telbtn = document.querySelector(".telbtn");
        
        telbtn.addEventListener("click",function(){
        	const value = telVal.value.trim();
        	
        	$.ajax({
        		type:"post",
        		url:"/user/userTelchange",
        		data:{
        			userTel:value
        		},
        		success:function(response) {
        			if(response.code == 0) {
        				Swal.fire({
        				    title: '성공',
        				    text: '전화번호가 성공적으로 수정되었습니다.',
        				    icon: 'success',
        				    confirmButtonText: '확인'
        				}).then(() => {
        				    location.reload(true);
        				});      				
        			}
        			else if(response.code == 400){
        				Swal.fire({
        				    title: '오류',
        				    text: '클라이언트 오류가 발생했습니다.',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
        			}
        			else {
        				Swal.fire({
        				    title: '오류',
        				    text: '전화번호 변경 오류가 발생했습니다.',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
        			}
        		},
        		error:function() {
        			Swal.fire({
        			    title: '서버 오류',
        			    text: '서버 오류가 발생했습니다. 나중에 다시 시도해주세요.',
        			    icon: 'error',
        			    confirmButtonText: '확인'
        			});
        		}
        	})
        
        });
        
        
        const withdrawalForm = document.getElementById('withdrawalForm');
        const withdrawalPassword = document.getElementById('withdrawalPassword');
        
        withdrawalForm.addEventListener('submit',function(event){
        	event.preventDefault();
        	
        	const pwd = withdrawalPassword.value.trim();
        	
        	$.ajax({
        		type:"post",
        		url:"/user/userDel",
        		data: {
        			userPwd:pwd
        		},
        		success:function(response) {
        			if(response.code == 0) {
        				Swal.fire({
        				    title: '유저 탈퇴 완료',
        				    text: '탈퇴가 완료되었습니다.',
        				    icon: 'success',
        				    confirmButtonText: '확인'
        				}).then(() => {
        				    location.href = "/user/logout";
        				});
        			}
        			else if(response.code == 400){
        				Swal.fire({
        				    title: '클라이언트 오류',
        				    text: '클라이언트에서 오류가 발생했습니다.',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
        			}
        			else if(response.code == 404){
        				Swal.fire({
        				    title: '오류',
        				    text: '사용자가 존재하지 않습니다.',
        				    icon: 'error',
        				    confirmButtonText: '확인'
        				});
        			}
        		}
        	})
        	
        });
        
        
                  
        function input_validate(input) 
        {
        	const value = input.value.trim();
        	const validateType = input.getAttribute("data-validate");
        	
        	let isValid = false;
        	
        	 switch(validateType)
             {
             	case "tel" :
             		isValid = /^(01[016789]{1})-?[0-9]{3,4}-?[0-9]{4}$/.test(value);
             		break;
             	case "name" :
             		isValid = /^[가-힣]{2,4}$/.test(value);
             		break;
             	case "pwd" :
             		isValid = /^(?=.*[a-zA-Z])(?=.*\d)(?=.*[\W_]).{8,16}$/.test(value);
             		break;
             	default:
             		isValid = false;
             }
        	 
        	 return isValid;
        }  
	});  
</script>

	<!-- 부트스트랩 JS -->
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
	<%@include file="/WEB-INF/views/include/shopFooter.jsp"%>
</body>
</html>