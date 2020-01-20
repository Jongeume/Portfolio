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
	
	<!-- join tab css -->
	<link rel="stylesheet" href="${pageContext.request.contextPath }/resources/css/joinForm.css" />
	
	
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
   	<script src="${pageContext.request.contextPath }/resources/js/validate.js?version=2"></script>
    <!--  폼검증,중복확인 - jQuery -->
	<script src="${pageContext.request.contextPath }/resources/js/formCheck.js?version=11"></script>	



	<!-- 로그인정보오류(아이디 또는 비밀번호 오류) -->
	<script type="text/javascript">
			var result = '${msg}';
			
			switch(result) {
			
				case '비번찾기실패-아이디'  : alert("아이디가 존재하지 않습니다!");
						break;
						
				case '비번찾기실패-이름' : alert("이름이 일치하지 않습니다!");
						break;
						
				case '비번찾기실패-둘다' : alert("이름과 아이디 둘다 일치하지 않습니다.");
						break;
						
				case '로그인성공' : alert("로그인 성공!!!");
						break;
						
				case '비번틀림' : alert("비밀번호를 잘못 입력하셨습니다.");
						break;
						
				case '아이디없음' : alert("등록된 아이디가 없습니다");
						break;
					
				case '인증성공' : alert("회원 인증 완료!");
						break;
						
				case '미인증' : alert("미인증 계정입니다!");
						break;
						
				case '아이디찾기실패' : alert("이름과 전화번호가 일치하지 않습니다.");
						break;
						
				case '비번찾기성공' : alert("임시 비밀번호가 발급되었습니다!\n메일을 확인해주세요!");
						break;
				
				case '비번변경-성공' : alert("비밀번호가 성공적으로 변경 되었습니다!");
						break;
				
				case '비번변경-실패' : alert("기존 비밀번호가 틀립니다!");
						break;
			
				case '회원탈퇴성공' : alert("회원탈퇴 성공");
						break;
				
						
			}
		
	</script>
	





	