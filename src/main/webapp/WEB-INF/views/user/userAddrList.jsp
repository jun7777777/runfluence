<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@include file="/WEB-INF/views/include/taglib.jsp" %>   
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>주소록</title>

    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <!-- Bootstrap Icons -->
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.min.css">
    <%@include file="/WEB-INF/views/include/shopHead.jsp" %>
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <style>
    .address_title_text {
    	font-size: 24px;
    	font-weight: 700;
    	letter-spacing: -0.36px;
    }
    
    .btn_add_addr {
    	border: 1px solid #222;
    	border-radius: 10px;
    	font-size: 12px;
    	line-height: 32px;
    	height: 34px;
    	color: inherit;
    }
    
    .addr_list {
    	padding: 30px 0 29px;
    }
    
    .address_info {
    	line-height: 17px;
    }
    
    .address_info .phone {	    
	    font-size: 15px;
	    padding-top: 5px;
	   
    }
    
    .address_box {
    	font-size: 14px;
	    letter-spacing: -.21px;
	    padding-top: 4px;
    }
    
    .name_text {
    	letter-spacing: -.15px;
    }
    
    .bind_text {
    	background-color: #f4f4f4;
	    border-radius: 10px;
	    font-size: 12px;
	    letter-spacing: -0.06px;
	    line-height: 14px;
	    padding: 3px 6px;
    }
    
    .btn_bind_text {
    	height: 34px;
	    padding: 0 14px;
	    border: 1px solid #d3d3d3;
	    border-radius: 10px;
	    color: rgba(34, 34, 34, 0.8);
	    font-size: 12px;
	    letter-spacing: -0.06px;
	    line-height: 14px;
    }
    
    .addr-modal-content {
    	background-color: #fff;
  		border-radius: 16px;
  		box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.1);
  		width:100%;
  		max-width: 520px;
    }
    
    .addr-modal-content .input-box{
    	padding: 10px 0 14px;
    	position: relative;
    }
    
    .addr-modal-content .input-title {
	    font-size: 13px;
	    letter-spacing: -.07px;
	    line-height: 18px;
	    font-weight: 600;
    }
    
    .addr-modal-title {
    	font-size: 18px;
	    letter-spacing: -0.15px;
	    line-height: 22px;
	    min-height: 44px;
	    padding: 18px 50px;
    }
    
    .container2 {
    	margin-left: auto;
	    margin-right: auto;
	    max-width: 1280px;
	    padding-top: 40px;
	    padding-right: 40px;
	    padding-bottom: clamp(340px, 15%, 480px);
	    padding-left: 40px
}
    
    
    </style>
    
    
<script>
document.addEventListener('DOMContentLoaded',function(){
	const addressForm = document.getElementById('addressForm');
	const saveButton = document.getElementById('saveButton');
	
	
  	const recipientName = document.getElementById('recipientName');
  	const recipientTel = document.getElementById('recipientTel');
  	const zipcode = document.getElementById('zipcode');
  	const addrLine1 = document.getElementById('addrLine1');
  	const addrLine2 = document.getElementById('addrLine2');

  	const recipientNameFeedback = document.getElementById('recipientNameFeedback');
  	const recipientTelFeedback = document.getElementById('recipientTelFeedback');
  	
  	const addrLine2Feedback = document.getElementById('addrLine2Feedback');
  	
  	const patterns = {
	    recipientName: /^.{2,50}$/,
	    recipientTel: /^\d{10,11}$/,
	    addrLine2: /^.{1,}$/, 
	  };
  	
  	const validationState = {
	    recipientName: false,
	    recipientTel: false,
	    addrLine2: false,
	    zipcode: false,
	    addrLine1: false,
	  };
  	
  	function validateField(field, pattern, feedback) {
  	    const value = field.value.trim();
  	    if (pattern.test(value)) {
  	      field.classList.remove('is-invalid');
  	      field.classList.add('is-valid');
  	      feedback.style.display = 'none';
  	      return true;
  	    } else {
  	      field.classList.remove('is-valid');
  	      field.classList.add('is-invalid');
  	      feedback.style.display = 'block';
  	      return false;
  	    }
  	  }
  	
  	recipientName.addEventListener('input', function () {
  	    validationState.recipientName = validateField(recipientName, patterns.recipientName, recipientNameFeedback);
  	    toggleSaveButton();
  	  });

  	  recipientTel.addEventListener('input', function () {
  	    validationState.recipientTel = validateField(recipientTel, patterns.recipientTel, recipientTelFeedback);
  	    toggleSaveButton();
  	  });

  	  addrLine2.addEventListener('input', function () {
  	    validationState.addrLine2 = validateField(addrLine2, patterns.addrLine2, addrLine2Feedback);
  	    toggleSaveButton();
  	  });
  	  
  	function toggleSaveButton() {
  	    const allValid = Object.values(validationState).every(Boolean);
  	    saveButton.disabled = !allValid;
  	  }
  	
  	
  	const zipButton = document.getElementById('btn-zip');
    zipButton.addEventListener('click', function() {
        new daum.Postcode({
          oncomplete: function(data) {
            var addr = ''; 
            var extraAddr = ''; 

            if (data.userSelectedType === 'R') { 
              addr = data.roadAddress;
            } else { 
              addr = data.jibunAddress;
            }

            if (data.userSelectedType === 'R') {
              if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                extraAddr += data.bname;
              }
              if (data.buildingName !== '' && data.apartment === 'Y') {
                extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
              }
              if (extraAddr !== '') {
                extraAddr = ' (' + extraAddr + ')';
              }
              document.getElementById("addrLine2").value = extraAddr;

            } else {
              document.getElementById("addrLine2").value = '';
            }

            document.getElementById('zipcode').value = data.zonecode;
            document.getElementById("addrLine1").value = addr;

            validationState.zipcode = data.zonecode !== "";
            validationState.addrLine1 = addr !== "";

            document.getElementById("addrLine2").focus();

            toggleSaveButton();
          }
        }).open();
      });
  	
    function getDefaultValue(isChecked) {
        return isChecked ? 'Y' : 'N';
    }
  	
  	addressForm.addEventListener('submit',function(event){
  		event.preventDefault();
  		
  		const formData = {
	        recipientName: recipientName.value.trim(),
	        recipientTel: recipientTel.value.trim(),
	        zipcode: zipcode.value.trim(),
	        addrLine1: addrLine1.value.trim(),
	        addrLine2: addrLine2.value.trim(),
	        isDefault: getDefaultValue(defaultAddress.checked),
	      };
  		
  		$.ajax({
  			url:"/user/addrInsert",
  			type:"post",
            data:formData,
            success: function(response) {
            	if(response.code == 200) {
            		Swal.fire({
            		    title: '성공',
            		    text: '배송지가 추가되었습니다.',
            		    icon: 'success',
            		    confirmButtonText: '확인'
            		}).then(() => {
            		    location.reload(true);
            		});
            	}
            	else {
            		Swal.fire({
            		    title: '오류',
            		    text: '배송지 추가 중 오류가 발생하였습니다.',
            		    icon: 'error',
            		    confirmButtonText: '확인'
            		});
            	}
            }
  		});

  	});
  	
  	document.querySelectorAll('.btn_edit').forEach(function(button){
  		button.addEventListener('click',function(event){
  			event.preventDefault();
  			
  			// 데이터 속성에서 주소 정보 가져오기
            const addrNum = this.getAttribute('data-addr-num');
            const recipientName = this.getAttribute('data-recipient-name');
            const recipientTel = this.getAttribute('data-recipient-tel');
            const zipcode = this.getAttribute('data-zipcode');
            const addrLine1 = this.getAttribute('data-addr-line1');
            const addrLine2 = this.getAttribute('data-addr-line2');
            const isDefault = this.getAttribute('data-is-default') === 'Y';

            // 수정 모달의 입력 필드에 데이터 설정
            document.getElementById('editShippingAddrNum').value = addrNum;
            document.getElementById('editRecipientName').value = recipientName;
            document.getElementById('editRecipientTel').value = recipientTel;
            document.getElementById('editZipcode').value = zipcode;
            document.getElementById('editAddrLine1').value = addrLine1;
            document.getElementById('editAddrLine2').value = addrLine2;
            document.getElementById('editDefaultAddress').checked = isDefault;

            // 유효성 검사 상태 초기화
            validationState.recipientName = true;
            validationState.recipientTel = true;
            validationState.addrLine2 = true;
            validationState.zipcode = true;
            validationState.addrLine1 = true;
            toggleSaveButton();

            // 수정 모달 열기
            const editModal = new bootstrap.Modal(document.getElementById('editAddressModal'));
            editModal.show();
  			
  		});
  	});
  	
 // 주소 수정 폼 유효성 검사 및 AJAX 처리
    const editAddressForm = document.getElementById('editAddressForm');
    const editSaveButton = document.getElementById('editSaveButton');

    const editRecipientName = document.getElementById('editRecipientName');
    const editRecipientTel = document.getElementById('editRecipientTel');
    const editAddrLine2 = document.getElementById('editAddrLine2');

    const editRecipientNameFeedback = document.getElementById('editRecipientNameFeedback');
    const editRecipientTelFeedback = document.getElementById('editRecipientTelFeedback');
    const editAddrLine2Feedback = document.getElementById('editAddrLine2Feedback');

    const editPatterns = {
        recipientName: /^.{2,50}$/,
        recipientTel: /^\d{10,11}$/,
        addrLine2: /^.{1,}$/,
    };

    const editValidationState = {
        recipientName: true,
        recipientTel: true,
        addrLine2: true,
        zipcode: true,
        addrLine1: true,
    };

    function editValidateField(field, pattern, feedback) {
        const value = field.value.trim();
        if (pattern.test(value)) {
            field.classList.remove('is-invalid');
            field.classList.add('is-valid');
            feedback.style.display = 'none';
            return true;
        } else {
            field.classList.remove('is-valid');
            field.classList.add('is-invalid');
            feedback.style.display = 'block';
            return false;
        }
    }

    editRecipientName.addEventListener('input', function () {
        editValidationState.recipientName = editValidateField(editRecipientName, editPatterns.recipientName, editRecipientNameFeedback);
        editToggleSaveButton();
    });

    editRecipientTel.addEventListener('input', function () {
        editValidationState.recipientTel = editValidateField(editRecipientTel, editPatterns.recipientTel, editRecipientTelFeedback);
        editToggleSaveButton();
    });

    editAddrLine2.addEventListener('input', function () {
        editValidationState.addrLine2 = editValidateField(editAddrLine2, editPatterns.addrLine2, editAddrLine2Feedback);
        editToggleSaveButton();
    });

    function editToggleSaveButton() {
        const allValid = Object.values(editValidationState).every(Boolean);
        editSaveButton.disabled = !allValid;
    }
    
    // 우편번호 검색 버튼 (수정 모달)
    const editZipButton = document.getElementById('editBtn-zip');
    editZipButton.addEventListener('click', function() {
        new daum.Postcode({
            oncomplete: function(data) {
                var addr = ''; 
                var extraAddr = ''; 

                if (data.userSelectedType === 'R') { 
                    addr = data.roadAddress;
                } else { 
                    addr = data.jibunAddress;
                }

                if (data.userSelectedType === 'R') {
                    if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                        extraAddr += data.bname;
                    }
                    if (data.buildingName !== '' && data.apartment === 'Y') {
                        extraAddr += (extraAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                    }
                    if (extraAddr !== '') {
                        extraAddr = ' (' + extraAddr + ')';
                    }
                    document.getElementById("editAddrLine2").value = extraAddr;
                } else {
                    document.getElementById("editAddrLine2").value = '';
                }

                document.getElementById('editZipcode').value = data.zonecode;
                document.getElementById("editAddrLine1").value = addr;

                editValidationState.zipcode = data.zonecode !== "";
                editValidationState.addrLine1 = addr !== "";

                document.getElementById("editAddrLine2").focus();

                editToggleSaveButton();
            }
        }).open();
    });
    
    
    editAddressForm.addEventListener('submit',function(event){
    	
    	event.preventDefault();
    	
    	const formData = {
                shippingAddrNum: document.getElementById('editShippingAddrNum').value.trim(),
                recipientName: editRecipientName.value.trim(),
                recipientTel: editRecipientTel.value.trim(),
                zipcode: document.getElementById('editZipcode').value.trim(),
                addrLine1: document.getElementById('editAddrLine1').value.trim(),
                addrLine2: editAddrLine2.value.trim(),
                isDefault: document.getElementById('editDefaultAddress').checked ? 'Y' : 'N',
  		};
    	
    	$.ajax({
    		url:"/user/addrUpdate",
  			type:"post",
            data:formData,
            success:function(response) {
            	if(response.code == 0) {
            		Swal.fire({
            		    title: '성공',
            		    text: '주소가 수정되었습니다.',
            		    icon: 'success',
            		    confirmButtonText: '확인'
            		}).then(() => {
            		    location.reload(true);
            		});
            	}
            	else {
            		Swal.fire({
            		    title: '서버 오류',
            		    text: '주소 수정 중 오류가 발생하였습니다.',
            		    icon: 'error',
            		    confirmButtonText: '확인'
            		});
            	}
            }
    	});
    	
    });
    
    document.querySelectorAll('.btn_delete').forEach(function(button){
        button.addEventListener('click', function(event){
            event.preventDefault();

            
            const addrNum = this.getAttribute('data-addr-num');

            if(confirm('정말로 이 주소를 삭제하시겠습니까?')) {
                $.ajax({
                    url: "/user/addrDelete",
                    type: "POST",
                    data: { shippingAddrNum: addrNum },
                    success: function(response) {
                        if(response.code == 0){
                        	Swal.fire({
                        	    title: '성공',
                        	    text: '주소가 성공적으로 삭제되었습니다.',
                        	    icon: 'success',
                        	    confirmButtonText: '확인'
                        	}).then(() => {
                        	    location.reload(true);
                        	});
                        }
                        else if(response.code == 400) {
                        	Swal.fire({
                        	    title: '오류',
                        	    text: '클라이언트 오류 발생',
                        	    icon: 'error',
                        	    confirmButtonText: '확인'
                        	});
                        }
                        else if(response.code == 404) {
                        	Swal.fire({
                        	    title: '오류',
                        	    text: '주소가 존재하지 않습니다',
                        	    icon: 'error',
                        	    confirmButtonText: '확인'
                        	});
                        }
                        else{
                        	Swal.fire({
                        	    title: '오류',
                        	    text: '주소 삭제 중 오류가 발생했습니다.',
                        	    icon: 'error',
                        	    confirmButtonText: '확인'
                        	});
                        }
                    }
                    
                });
            }
        });
    });
  	
  	
});
    
</script>
</head>
<body>
<%@include file="/WEB-INF/views/include/shopCate.jsp" %>
	<div class="container2 address_container">
		<div class="row">
			<%@include file="/WEB-INF/views/include/mypageSideBar.jsp"%>
			<main class="col-md-9">
				<div class="myaddress_title d-flex justify-content-between align-items-center">
                    <div class="address_title_text">주소록</div>
                    <div class="btn_box">
                        <a href="#" class="btn_add_addr me-0 px-3 py-0 d-inline-block text-decoration-none" data-bs-toggle="modal" data-bs-target="#addressModal">
                            <span class="btn_add_text">+새 배송지 추가</span>
                        </a>
                    </div>
                </div>
                <div class="myaddress_list">
                <c:if test="${not empty addrList}">
                	<c:forEach var="addr" items="${addrList}">
	                    <div class="basic_address addr_list border-bottom border-bottom-2 border-dark">
	                        <div class="my_address d-flex align-items-center align-items-center">
	                            <div class="info_bind me-auto">
	                                <div class="address_info">
	                                    <div class="name_box">
	                                        <span class="name_text d-inline-block fw-bold lh-sm align-top">${addr.recipientName}</span>
	                                        <c:if test="${addr.isDefault == 'Y'}">
	                                        	<span class="bind_text box-border d-inline-block ms-1 mt-0 align-top">기본 배송지</span>
	                                        </c:if>
	                                    </div>
	                                    <p class="phone d-flex align-items-center flex-wrap mb-0">
	                                    	${addr.recipientTel.substring(0, 3)}
                                            <span class="hyphen">-</span>
                                            ${addr.recipientTel.substring(3, 7)}
                                            <span class="hyphen">-</span>
                                            ${addr.recipientTel.substring(7)}
	                                    </p>
	                                    <div class="address_box">
	                                        <span class="zipcode">${addr.shippingAddrZipcode}</span>
	                                        <span class="address">${addr.shippingAddrLine1} ${addr.shippingAddrLine2}</span>
	                                    </div>
	                                </div>
	                            </div>
	                            <div class="btn_bind ms-auto">
	                                <a href="#" class="btn_bind_text btn_edit d-inline-flex align-items-center justify-content-center ms-auto mt-0 mb-0 pt-0 text-decoration-none" 
	                                style="padding-right: 12px; padding-left: 11px;"
	                                data-addr-num="${addr.shippingAddrNum}"
									data-recipient-name="${addr.recipientName}"
                                    data-recipient-tel="${addr.recipientTel}"
                                    data-zipcode="${addr.shippingAddrZipcode}"
                                    data-addr-line1="${addr.shippingAddrLine1}"
                                    data-addr-line2="${addr.shippingAddrLine2}"
                                    data-is-default="${addr.isDefault}"
	                                >수정</a>
	                                
	                                <a href="#" class="btn_bind_text btn_delete d-inline-flex align-items-center justify-content-center ms-auto mt-0 mb-0 pt-0 text-decoration-none" 
	                                style="margin-left: 8px;"
	                                data-addr-num="${addr.shippingAddrNum}">삭제</a>
	                            </div>
	                        </div>
	                    </div>
	                  </c:forEach>
                   </c:if>
                   <c:if test="${empty addrList}">
                        <p>등록된 주소가 없습니다.</p>
                    </c:if>
                </div>				
			</main>
		</div>	
	</div>
	
	<!-- 주소 추가 모달 -->
    <div class="modal" id="addressModal" tabindex="-1" aria-labelledby="addressModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-dialog-centered">
        <div class="modal-content addr-modal-content">
          <!-- 모달 헤더 -->
          <div class="modal-header justify-content-center d-flex align-items-center" style="border-bottom: none;">
            <h5 class="modal-title addr-modal-title w-100 text-center bg-white text-black fw-bold" id="addressModalLabel">주소 추가하기</h5>
            <button type="button" class="btn-close position-absolute end-0 me-3" data-bs-dismiss="modal" aria-label="닫기"></button>
          </div>
          <!-- 모달 바디 -->
          <div class="modal-body">
            <form id="addressForm" novalidate>
              <!-- 이름 입력 -->
              <div class="input-box">
                <label for="recipientName" class="form-label input-title">이름</label>
                <input type="text" class="form-control" id="recipientName" name="recipientName" placeholder="수령인의 이름" required minlength="2" maxlength="50">
                <div class="invalid-feedback" id="recipientNameFeedback">
                  올바른 이름을 입력해주세요. (2 - 50자)
                </div>
              </div>
              <!-- 휴대폰 번호 입력 -->
              <div class="input-box">
                <label for="recipientTel" class="form-label input-title">휴대폰 번호</label>
                <input type="tel" class="form-control" id="recipientTel" name="recipientTel" placeholder="- 없이 입력" required pattern="\d{10,11}">
                <div class="invalid-feedback" id="recipientTelFeedback">
                  정확한 휴대폰 번호를 입력해주세요.
                </div>
              </div>
              <!-- 우편번호 입력 -->
              <div class="input-box">
                <label for="zipcode" class="form-label input-title">우편번호</label>
                <div class="input-group">
                  <input type="text" class="form-control" id="zipcode" name="zipcode" placeholder="우편 번호를 검색하세요" readonly required>
                  <button class="btn btn-outline-secondary" type="button" id="btn-zip">우편번호</button>
                </div>
              </div>
              <!-- 주소 입력 -->
              <div class="input-box">
                <label for="addrLine1" class="form-label input-title">주소</label>
                <input type="text" class="form-control" id="addrLine1" name="addrLine1" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly required>
              </div>
              <!-- 상세 주소 입력 -->
              <div class="input-box">
                <label for="addrLine2" class="form-label input-title">상세 주소</label>
                <input type="text" class="form-control" id="addrLine2" name="addrLine2" placeholder="건물, 아파트, 동/호수 입력" required>
                <div class="invalid-feedback" id="addrLine2Feedback">
                  상세 주소를 입력해주세요.
                </div>
              </div>
              <!-- 기본 배송지 설정 체크박스 -->
              <div class="form-check mb-3">
                <input class="form-check-input" type="checkbox" value="true" id="defaultAddress" name="defaultAddress">
                <label class="form-check-label" for="defaultAddress">
                  기본 배송지로 설정
                </label>
              </div>
              <!-- 저장 버튼 -->
              <div class="d-flex justify-content-end">
              	<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                <button type="submit" class="btn btn-primary" id="saveButton" disabled>저장하기</button>
              </div>
            </form>
          </div>
        </div>
      </div>
    </div>
    
    <!-- 주소 수정 모달 -->
    <div class="modal" id="editAddressModal" tabindex="-1" aria-labelledby="editAddressModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
            <div class="modal-content addr-modal-content">
                <!-- 모달 헤더 -->
                <div class="modal-header justify-content-center d-flex align-items-center" style="border-bottom: none;">
                    <h5 class="modal-title addr-modal-title w-100 text-center bg-white text-black fw-bold" id="editAddressModalLabel">주소 수정하기</h5>
                    <button type="button" class="btn-close position-absolute end-0 me-3" data-bs-dismiss="modal" aria-label="닫기"></button>
                </div>
                <!-- 모달 바디 -->
                <div class="modal-body">
                    <form id="editAddressForm" novalidate>
                        <!-- 주소 번호 (숨김 필드) -->
                        <input type="hidden" id="editShippingAddrNum" name="shippingAddrNum">
                        <!-- 이름 입력 -->
                        <div class="input-box">
                            <label for="editRecipientName" class="form-label input-title">이름</label>
                            <input type="text" class="form-control" id="editRecipientName" name="recipientName" placeholder="수령인의 이름" required minlength="2" maxlength="50">
                            <div class="invalid-feedback" id="editRecipientNameFeedback">
                                올바른 이름을 입력해주세요. (2 - 50자)
                            </div>
                        </div>
                        <!-- 휴대폰 번호 입력 -->
                        <div class="input-box">
                            <label for="editRecipientTel" class="form-label input-title">휴대폰 번호</label>
                            <input type="tel" class="form-control" id="editRecipientTel" name="recipientTel" placeholder="- 없이 입력" required pattern="\d{10,11}">
                            <div class="invalid-feedback" id="editRecipientTelFeedback">
                                정확한 휴대폰 번호를 입력해주세요.
                            </div>
                        </div>
                        <!-- 우편번호 입력 -->
                        <div class="input-box">
                            <label for="editZipcode" class="form-label input-title">우편번호</label>
                            <div class="input-group">
                                <input type="text" class="form-control" id="editZipcode" name="zipcode" placeholder="우편 번호를 검색하세요" readonly required>
                                <button class="btn btn-outline-secondary" type="button" id="editBtn-zip">우편번호</button>
                            </div>
                        </div>
                        <!-- 주소 입력 -->
                        <div class="input-box">
                            <label for="editAddrLine1" class="form-label input-title">주소</label>
                            <input type="text" class="form-control" id="editAddrLine1" name="addrLine1" placeholder="우편 번호 검색 후, 자동입력 됩니다" readonly required>
                        </div>
                        <!-- 상세 주소 입력 -->
                        <div class="input-box">
                            <label for="editAddrLine2" class="form-label input-title">상세 주소</label>
                            <input type="text" class="form-control" id="editAddrLine2" name="addrLine2" placeholder="건물, 아파트, 동/호수 입력" required>
                            <div class="invalid-feedback" id="editAddrLine2Feedback">
                                상세 주소를 입력해주세요.
                            </div>
                        </div>
                        <!-- 기본 배송지 설정 체크박스 -->
                        <div class="form-check mb-3">
                            <input class="form-check-input" type="checkbox" value="true" id="editDefaultAddress" name="defaultAddress">
                            <label class="form-check-label" for="editDefaultAddress">
                                기본 배송지로 설정
                            </label>
                        </div>
                        <!-- 저장 버튼 -->
                        <div class="d-flex justify-content-end">
                            <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소</button>
                            <button type="submit" class="btn btn-primary" id="editSaveButton" disabled>저장하기</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
	
	
<%@include file="/WEB-INF/views/include/shopFooter.jsp" %>

<!-- Bootstrap JS 번들 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    

</body>
</html>