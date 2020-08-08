
function formCheck() {
	var data = $("#NAME").val();
	if (!data || data.trim().length == 0) {
		$("#NAME").val("");
		$("#NAME").focus();
		return false;
	}
	if (!validateName(data)) {
		alert('이름은 2자리이상, 5자리이하 입력해야하며,\n자음,모음 단독입력은 불가합니다.');
		$("#NAME").val("");
		$("#nameCheck").css('color', 'red').html("이름 형식이 옳지 않습니다.");
		$("#NAME").focus();
		return false;
	}
	if ($("#idCheck").css('color') == 'rgb(255, 0, 0)') {
		alert('가입이 불가능한 아이디입니다.');
		$("#ID").val("");
		$("#ID").focus();
		return false;
	}
	var data = $("#ID").val();
	if (!data || data.trim().length == 0) {
		// alert('아이디는 반드시 입력해야합니다.');
		$("#ID").val("");
		$("#ID").focus();
		return false;
	}
	if (!validateEmail(data)) {
		alert('아이디가 이메일 형식이 아닙니다.');
		$("#ID").val("");
		// $("#idCheck").css('color','red').html("이메일 형식이 옳지 않습니다.");
		$("#ID").focus();
		return false;
	}
	if ($("#nicknameCheck").css('color') == 'rgb(255, 0, 0)') {
		alert('가입이 불가능한 닉네임입니다.');
		$("#NICKNAME").val("");
		$("#NICKNAME").focus();
		return false;
	}
	var data = $("#NICKNAME").val();
	if (!data || data.trim().length == 0) {
		// alert('닉네임은 반드시 입력해야 합니다!');
		$("#NICKNAME").val("");
		$("#NICKNAME").focus();
		return false;
	}
	if (!validateNickname(data)) {
		alert('닉네임 형식이 잘못되었습니다.');
		$("#NICKNAME").val("");
		$("#NICKNAME").focus();
		return false;
	}
	var data = $("#BIRTH").val();
	if (!data || data.trim().length == 0) {
		// alert('생년월일은 반드시 입력해야 합니다!');
		$("#BIRTH").val("");
		$("#BIRTH").focus();
		return false;
	}
	var data = $("#PHONE").val();
	if (!data || data.trim().length == 0) {
		// alert('전화번호는 반드시 입력해야 합니다!')
		$("#PHONE").val("");
		$("#PHONE").focus();
		return false;
	}
	if (!validatePhone(data)) {
		alert('전화번호 형식은 000-0000-0000입니다.')
		$("#PHONE").val("");
		$("#PHONE").focus();
		return false;
	}

	var data = $("#PASSWORD").val();
	if (!data || data.trim().length == 0) {
		// alert('비밀번호는 반드시 입력해야 돼!!!!');
		$("#PASSWORD").val("");
		$("#PASSWORD").focus();
		return false;
	}
	var data = $("#RE_PASS").val();
	if (!data || data.trim().length == 0) {
		// alert('비밀번호 확인는 반드시 입력해야 돼!!!!');
		$("#RE_PASS").val("");
		$("#RE_PASS").focus();
		return false;
	}
	if ($("#PASSWORD").val() != $("#RE_PASS").val()) {
		alert('비밀번호가 일치하지 않습니다.');
		$("#PASSWORD").val("");
		$("#RE_PASS").val("");
		$("#PASSWORD").focus();
		return false;
	}
	var data = $("#ZIPCODE").val();
	if (!data || data.trim().length == 0) {
		execDaumPostcode();
		return false;
	}
	var data = $("#ADDR2").val();
	if (!data || data.trim().length == 0) {
		alert('주소!');
		$("#ADDR2").val("");
		$("#ADDR2").focus();
		return false;
	}

	alert('회원가입 되었습니다! 인증메일을 확인해주세요!')
	return true;
}
// =====================================================================================

function nameCheck() {
	var value = $("#NAME").val();
	if (value.length >= 2) {
		if (!validateName(value)) {
			$("#nameCheck").css('color', 'red').html("이름 형식이 옳지 않습니다.");
			$("#NAME").focus();
		} else {
			$("#nameCheck").css('color', 'green').html("OK");
		}
	} else {
		$("#nameCheck").css('color', 'red').html("이름은 최소 2자리 이상입니다.")
	}
}
// =====================================================================================
function pwCheck() {
	var value = $("#PASSWORD").val();
	if (value.length >= 8) {
		if (!validatePassword(value)) {
			$("#pwCheck").css('color', 'red').html("비밀번호 형식이 옳지 않습니다.");
			$("#PASSWORD").focus();
		} else {
			$("#pwCheck").css('color', 'green').html("OK");
		}
	} else {
		$("#pwCheck").css('color', 'red').html("비밀번호는 최소 8자리 이상입니다.")
	}
}
// ========================================================================================
$(function() {
	$("#RE_PASS").keyup(function() {
		if ($("#PASSWORD").val() != $("#RE_PASS").val()) {
			$("#pwCheck2").css('color', 'red').html("비밀번호가 일치하지 않습니다.");
		} else {
			$("#pwCheck2").css('color', 'green').html("비밀번호가 일치합니다.");
		}
	})
});

// =======================================================================================
// 아이디중복 함수
function idCheck() {
	var value = $("#ID").val();
	if (value.length > 6) {
		if (!validateEmail(value)) {
			$("#idCheck").css('color', 'red').html("이메일 형식이 아닙니다.");
			$("#ID").focus();
		} else {
			$.ajax('idCheck', {
				type : 'GET',
				data : {
					'ID' : value
				},
				dataType : 'text',
				async : false,
				error : function() {
					// alert('실패');
				},
				success : function(data) {
					if (data == 1) {
						$('#idCheck').css('color', 'red').html(
								"사용 불가능한 아이디 입니다.");
					} else {
						$('#idCheck').css('color', 'green').html(
								"사용 가능한 아이디 입니다.");
					}
				}
			});
		}

	} else {
		$('#idCheck').css('color', 'red').html("아이디는 최소 8자리 이상입니다.");
	}
}

// =======================================================================================
// 전화번호중복 함수
function phoneCheck() {
	var value = $("#PHONE").val();
	if (value.length >= 11) {
		if (!validatePhone(value)) {
			$("#phoneCheck").css('color', 'red').html("전화번호 형식이 아닙니다.");
			$("#PHONE").focus();
		} else {
			$.ajax('phoneCheck', {
				type : 'GET',
				data : {
					'PHONE' : value
				},
				dataType : 'text',
				error : function() {
					// alert('실패');
				},
				success : function(data) {
					if (data == 1) {
						$('#phoneCheck').css('color', 'red').html(
								"사용 불가능한 전화번호입니다.");
					} else {
						$('#phoneCheck').css('color', 'green').html(
								"사용 가능한 전화번호입니다.");
					}
				}
			});
		}

	} else {
		$('#phoneCheck').css('color', 'red').html("전화번호는 최소 11자리 이상입니다.");
	}
}

// =======================================================================================
// 닉네임중복 함수
function nicknameCheck() {
	var value = $("#NICKNAME").val();
	if (value.length >= 2) {
		if (!validateNickname(value)) {
			$("#nicknameCheck").css('color', 'red').html("닉네임 형식이 아닙니다.");
			$("#nicknameCheck").focus();
		} else {
			$.ajax('nicknameCheck', {
				type : 'GET',
				data : {
					'NICKNAME' : value
				},
				dataType : 'text',
				error : function() {
					alert('실패');
				},
				success : function(data) {
					if (data == 1) {
						$('#nicknameCheck').css('color', 'red').html(
								"사용 불가능한 닉네임 입니다.");
					} else {
						$('#nicknameCheck').css('color', 'green').html(
								"사용 가능한 닉네임 입니다.");
					}
				}
			});
		}
	} else {
		$('#nicknameCheck').css('color', 'red').html("닉네임은 최소 2글자 이상입니다.");
	}
}

// ==========================================================================================
// 로그인폼체크
function loginFormCheck() {
	var data = $("#ID").val();
	if (!data || data.trim().length == 0) {
		alert('아이디를 입력하세요.');
		$("#ID").val("");
		$("#ID").focus();
		return false;
	}

	if (!validateEmail(data)) {
		alert('아이디가 이메일 형식이 아닙니다.');
		$("#ID").val("");
		$("#ID").focus();
		return false;
	}

	var data = $("#PASSWORD").val();
	if (!data || data.trim().length == 0) {
		alert('비밀번호를 입력하세요.')
		$("#PASSWORD").val("");
		$("#PASSWORD").focus();
		return false;
	}

	return true;
}

// ==========================================================================================
// 아이디찾기 폼체크
function idSearchCheckForm() {
	var data = $("#NAME").val();
	if (!data || data.trim().length == 0) {
		alert('이름을 입력하세요.');
		$("#NAME").val("");
		$("#NAME").focus();
		return false;
	}

	var data = $("#PHONE").val();
	if (!data || data.trim().length == 0) {
		alert('전화번호를 입력하세요.')
		$("#PHONE").val("");
		$("#PHONE").focus();
		return false;
	}
	if (!validatePhone(data)) {
		alert('전화번호 형식은 000-0000-0000입니다.')
		$("#PHONE").val("");
		$("#PHONE").focus();
		return false;
	}

	return true;
}

// ==========================================================================================
// 비번찾기 폼체크
function pwSearchCheckForm() {

	var data = $("#ID").val();
	if (!data || data.trim().length == 0) {
		alert('아이디를 입력하세요.');
		$("#ID").val("");
		$("#ID").focus();
		return false;
	}

	if (!validateEmail(data)) {
		alert('아이디가 이메일 형식이 아닙니다.');
		$("#ID").val("");
		$("#ID").focus();
		return false;
	}

	var data = $("#NAME").val();
	if (!data || data.trim().length == 0) {
		alert('이름을 입력하세요.');
		$("#NAME").val("");
		$("#NAME").focus();
		return false;
	}

	return true;
}
// ===========================================================================================
// 회원 정보 변경 폼체크
function updateMemberForm() {
	var data = $("#NICKNAME").val();
	if (!data || data.trim().length == 0) {
		alert('닉네임은 반드시 입력하셔야 합니다.');
		$("#NICKNAME").val("");
		$("#NICKNAME").focus();
		return false;
	}
	if ($("#nicknameCheck").css('color') == 'rgb(255, 0, 0)') {
		alert('수정이 불가능한 닉네임입니다.');
		$("#NICKNAME").val("");
		$("#NICKNAME").focus();
		return false;
	}
	var data = $("#BIRTH").val();
	if (!data || data.trim().length == 0) {
		alert('생년월일은 반드시 입력하셔야 합니다.');
		$("#BIRTH").val("");
		$("#BIRTH").focus();
		return false;
	}
	var data = $("#PHONE").val();
	if (!data || data.trim().length == 0) {
		alert('전화번호는 반드시 입력하셔야 합니다.');
		$("#PHONE").val("");
		$("#PHONE").focus();
		return false;
	}
	if ($("#phoneCheck").css('color') == 'rgb(255, 0, 0)') {
		alert('수정이 불가능한 전화번호입니다.');
		$("#PHONE").val("");
		$("#PHONE").focus();
		return false;
	}
	var data = $("#ZIPCODE").val();
	if (!data || data.trim().length == 0) {
		execDaumPostcode();
		alert('우편번호는 반드시 입력하셔야 합니다.');
		return false;
	}
	var data = $("#ADDR2").val();
	if (!data || data.trim().length == 0) {
		alert('상세주소는 반드시 입력하셔야 합니다.');
		$("#ADDR2").val("");
		$("#ADDR2").focus();
		return false;
	}
	/*
	 * var data = $("#GENDER").val(); if(data=="남자"){ $("#GENDER").val("M");
	 * }else if(data=="여자"){ $("#GENDER").val("F"); }
	 */

	return true;
}

// ===========================================================================================
// 비번 변경 폼체크
function updatePwForm() {
	var data = $("#oldPw").val();
	if (!data || data.trim().length == 0) {
		alert('기존 비밀번호는 반드시 입력하셔야 합니다.');
		$("#oldPw").val("");
		$("#oldPw").focus();
		return false;
	}
	var data = $("#PASSWORD").val();
	if (!data || data.trim().length == 0) {
		alert('새 비밀번호는 반드시 입력하셔야 합니다.');
		$("#PASSWORD").val("");
		$("#PASSWORD").focus();
		return false;
	}
	var data = $("#rePw").val();
	if (!data || data.trim().length == 0) {
		alert('새 비밀번호 확인은 반드시 입력하셔야 합니다.');
		$("#rePw").val("");
		$("#rePw").focus();
		return false;
	}
	if ($("#PASSWORD").val() != $("#rePw").val()) {
		alert('새 비밀번호 확인이 일치하지 않습니다.');
		$("#rePw").val("");
		$("#rePw").focus();
		return false;
	}
	if ($("#PASSWORD").val() == $("#oldPw").val()) {
		alert('기존 비밀번호와 같습니다.');
		$("#PASSWORD").val("");
		$("#PASSWORD").focus();
		return false;
	}
	if ($("#pwChk").css('color') == 'rgb(255, 0, 0)') {
		alert('수정이 불가능합니다. \n비밀번호를 다시 확인 해주세요!');
		$("#PASSWORD").val("");
		$("#PASSWORD").focus();
		return false;
	}
	if ($("#pwChk2").css('color') == 'rgb(255, 0, 0)') {
		alert('수정이 불가능합니다! \n비밀번호를 다시 확인 해주세요!');
		$("#rePw").val("");
		$("#rePW").focus();
		return false;
	}
	return true;
}
// =====================================================================================

$(function() {
	$("#PASSWORD").keyup(function() {
		if ($("#PASSWORD").val().length >= 8) {
			if (!validatePassword($("#PASSWORD").val())) {
				$("#pwChk").css('color', 'red').html("비밀번호 형식이 옳지 않습니다.");
				$("#PASSWORD").focus();
			} else if ($("#PASSWORD").val() == $("#oldPw").val()) {
				$("#pwChk").css('color', 'red').html("기존 비밀번호와 같습니다!");
			} else {
				$("#pwChk").css('color', 'green').html("OK");
			}
		} else {
			$("#pwChk").css('color', 'red').html("비밀번호는 최소 8자리 이상입니다.");
		}
	});

	$("#rePw").keyup(function() {
		if ($("#PASSWORD").val() != $("#rePw").val()) {
			$("#pwChk2").css('color', 'red').html("비밀번호가 일치하지 않습니다.");
		} else {
			$("#pwChk2").css('color', 'green').html("비밀번호가 일치합니다.");
		}
	});

});

// =====================================================================================

function deleteMember() {
	var data = $("#PASSWORD").val();
	if (!data || data.trim().length == 0) {
		alert('비밀번호는 반드시 입력하셔야 합니다.');
		$("#PASSWORD").val("");
		$("#PASSWORD").focus();
		return false;
	}
}

// =====================================================================================

function deleteContent() {

	var data = $("#fb_pwd").val();
	if (!data || data.trim().length == 0) {
		alert('비밀번호는 반드시 입력하셔야 합니다.');
		$("#fb_pwd").val("");
		$("#fb_pwd").focus();
		return false;

	}
}

// =====================================================================================

/*function updateLikeCnt() {
	if (!alreadyLikeClick) {
		lcnt2 = parseInt(lcnt)+1;
		alreadyLikeClick = true;
		alreadyHateClick = true;
		upcnt.innerHTML = "<i class=\"zmdi zmdi-thumb-up\"></i> 추천 &nbsp;"+lcnt2;
	} else {
		if(hcnt != hcnt2 ){
			alert("이미 비추천하신 글입니다.");
			return;
		}else{
			alert("이미 추천하신 글입니다.");
			return;
		}
	}

}*/

// =====================================================================================

