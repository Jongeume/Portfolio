<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
	<title>회원가입완료</title>
	
	<%@ include file="/WEB-INF/views/include/script_tags.jsp" %>
	
	
	
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp" %>
	
    <div class="main" style="padding: 70px">
     	            	
	<div class="centered">
			<button disabled="disabled" class='tab'>회원약관</button>
			<button disabled="disabled" class='tab'>회원가입</button>
			<button disabled="disabled" class='tab-on'>가입완료</button>
	</div>	
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
       
                        <h2 class="form-title">회원가입완료</h2>
                        <form class="register-form" name="register-form" id="register-form">
                        
                        	<div style="font-weight: bold; font-size: 15pt">인증메일이 발송되었습니다!<br> 인증을 완료해주세요.</div>
							<div style="margin-top: 134px"></div>                        	
                        	<button type="button" class='btn1' onclick="location.href='login'">로그인 하러가기</button>
                        	
                        </form>
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="${pageContext.request.contextPath }/resources/images/signup-image.jpg" alt="sing up image"></figure>
                    </div>
                </div>
            </div>
        </section>
        
        
    </div>

</body>
</html>