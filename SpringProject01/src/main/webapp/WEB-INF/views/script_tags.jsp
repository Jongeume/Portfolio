<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
	
  <!-- Bootstrap core CSS -->
  <link href="${pageContext.request.contextPath }/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

  <!-- Custom styles for this template -->
  <link href="${pageContext.request.contextPath }/resources/css/small-business.css" rel="stylesheet">
	
  <!-- Bootstrap core JavaScript -->
  <script src="${pageContext.request.contextPath }/resources/vendor/jquery/jquery.min.js"></script>
  <script src="${pageContext.request.contextPath }/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>	
	
    
  <!-- 부트스트랩 CDN(Context Delively Network) 추가 -->
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css">
  <script src="https://code.jquery.com/jquery-3.4.1.slim.min.js" ></script>
  <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js" ></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js" ></script>


  <!-- ==========================================login & join==================================================== -->
  
  	<!-- Font Icon -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/fonts/material-icon/css/material-design-iconic-font.min.css">
    <!-- Main css -->
    <link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/style.css">
    
 
  <!-- ===============================================join=============================================== -->    
	
	<!-- dateRangePicker - JavaScrips & CSS -->
	<script type="text/javascript" src="https://cdn.jsdelivr.net/jquery/latest/jquery.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/momentjs/latest/moment.min.js"></script>
	<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.min.js"></script>
	<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/daterangepicker/daterangepicker.css" />
	
	<!--dateRangePicker - jQuery, Function -->
	<script type="text/javascript">
		$(function() {
		  $('input[name="BIRTH"]').daterangepicker({
		    locale: {
			      format: 'YYYY-MM-DD',
			      daysOfWeek: ['월', '화', '수', '목', '금', '토', '일'],
			      monthNames: ['1월', '2월', '3월', '4월', '5월', '6월',
		                '7월', '8월', '9월', '10월', '11월',
		                '12월']
			},
		    singleDatePicker: true,
		    showDropdowns: true,
		    // === initial empty (생년월일 초기값 삭제) ===
		    autoUpdateInput: false, 
		  }, function(chosen_date) {
		    $('input[name="BIRTH"]').val(chosen_date.format('YYYY-MM-DD'));
		  });
		});
	</script>
	
	
	<!-- 다음 우편번호 API -->
    <script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
    <!-- postcode - javaScript -->
    <script src="${pageContext.request.contextPath }/resources/js/post-code.js"></script>
    
    
    <!--  폼검증(이메일,전화번호 형식) - javaScript -->
   	<script src="${pageContext.request.contextPath }/resources/js/validate.js"></script>
    <!--  폼검증,중복확인 - jQuery -->
    <script type="text/javascript">
    	// 폼검증 함수
    	function formCheck(){
    		var data = $("#NAME").val();
    		if(!data || data.trim().length==0){
    			$("#NAME").val("");
    			$("#NAME").focus();
				return false;
    		}
    		if($("#idCheck").css('color')=='rgb(255, 0, 0)'){
    			alert('가입이 불가능한 아이디입니다.');
    			$("ID").val("");
    			$("ID").focus();
    			return false;
    		}
    		var data = $("#ID").val();
    		if(!data || data.trim().length==0){
    			//alert('아이디는 반드시 입력해야합니다.');
    			$("#ID").val("");
    			$("#ID").focus();
    			return false;
    		}
    		if(!validateEmail(data)){
    			alert('아이디가 이메일 형식이 아닙니다.');
    			$("#ID").val("");
    			$("#idCheck").html("아이디가 이메일 형식이 아닙니다!");
    			$("#ID").focus();
    			return false;
    		}
    		var data = $("#NICKNAME").val();
    		if(!data || data.trim().length==0){
    			//alert('닉네임은 반드시 입력해야 합니다!');
    			$("#NICKNAME").val("");
    			$("#NICKNAME").focus();
    			return false;
    		}
    		var data = $("#BIRTH").val();
    		if(!data || data.trim().length==0){
    			//alert('생년월일은 반드시 입력해야 합니다!');
    			$("#BIRTH").val("");
    			$("#BIRTH").focus();
    			return false;
    		}
    		var data = $("#PHONE").val();
    		if(!data || data.trim().length==0){
    			//alert('전화번호는 반드시 입력해야 합니다!')
    			$("#PHONE").val("");
    			$("#PHONE").focus();
    			return false;
    		}
    		if(!validatePhone(data)){
    			alert('전화번호 형식은 000-0000-0000입니다.')
    			$("#PHONE").val("");
    			$("#PHONE").focus();
    			return false;
    		}
    		
    		var data = $("#PASSWORD").val();
    		if(!data || data.trim().length==0){
    			//alert('비밀번호는 반드시 입력해야 돼!!!!');
    			$("#PASSWORD").val("");
    			$("#PASSWORD").focus();
    			return false;
    		}
    		var data = $("#RE_PASS").val();
    		if(!data || data.trim().length==0){
    			//alert('비밀번호 확인는 반드시 입력해야 돼!!!!');
    			$("#RE_PASS").val("");
    			$("#RE_PASS").focus();
    			return false;
    		}
 			if($("#PASSWORD").val() != $("#RE_PASS").val()){
 				alert('비밀번호가 일치하지 않습니다.');
    			$("#PASSWORD").val("");
    			$("#RE_PASS").val("");
    			$("#PASSWORD").focus();
    			return false;
 			}  		
 			var data = $("#ZIPCODE").val();
 			if(!data || data.trim().length==0){
				execDaumPostcode();
 				return false;
 			}
 			var data = $("#ADDR2").val();
 			if(!data || data.trim().length==0){
 				alert('주소!');
 				$("#ADDR2").val("");
 				$("#ADDR2").focus();
 				return false;
 			} 		
 			
 			
 			// 회원가입 약관 체크 attr
 			var data = $("#agree-term").prop("checked");
 			if(data == false){
 				alert('회원가입 약관 동의해')
 				return false;
 			}
 			
 			alert('회원가입 되었습니다! 인증메일을 확인해주세요!')
    		return true;
    	}
    	
    	// 아이디중복 함수
    	function idCheck(){
    		var value = $("#ID").val();
    		if(value.length > 10){
    			$.ajax('idCheck',{
    				type:'GET',
    				data:{'ID' : value},
    				dataType:'json',
    				error : function(){
    					alert('실패');
    				},
    				success : function(data){
						if(data==1)
						$('#idCheck').css('color','red').html("사용 불가능한 아이디 입니다.");
						else
						$('#idCheck').css('color','green').html("사용 가능한 아이디 입니다.");							
    				}
    			});
    		}else{
    			$('#idCheck').html("");
    		}
    	}
	
    	
    	
    	
    	
    	
	</script>
	
