<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원관리-로그인</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="script_tags.jsp" %>
		
	<script src="${pageContext.request.contextPath }/resources/js/cookie.js?ver=1"></script>	
	
</head>
<body>
	
	<%@ include file="banner_context.jsp" %>
	
	 <!-- Sing in  Form -->
	 <div class="main" style="padding: 70px">
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="${pageContext.request.contextPath }/resources/images/signin-image.jpg" alt="sing up image"></figure>
                    </div>
                    
                    <div class="signin-form">
                        <h2 class="form-title">로그인</h2>
                        <form method="POST" class="register-form" id="login-form" action="${pageContext.request.contextPath }/L_member/loginOk" onsubmit="return loginFormCheck()">
                            <div class="form-group">
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="ID" id="ID" placeholder="아이디"/>
                            </div>
                            <div class="form-group">
                                <label for="your_pass"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호"/>
                            </div>
                            <div class="form-group">
								<input type="checkbox" name="remember-me" id="remember-me" class="agree-term" />
                                <label for="remember-me" class="label-agree-term"><span><span></span></span>Remember me</label>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="로그인하기"/>
                            </div>
                        </form>
                        
                        <div class="social-login">
                            <ul class="socials">
            					<li><a href="${pageContext.request.contextPath }/L_member/fregister" class="signup-image-link" style="font-size: 10pt; ">회원가입</a></li>
	        	            	<li><a href="${pageContext.request.contextPath }/L_member/idSearch" class="signup-image-link" style="font-size: 10pt; ">아이디찾기</a></li>
	                			<li><a href="${pageContext.request.contextPath }/L_member/pwSearch" class="signup-image-link" style="font-size: 10pt; ">비밀번호찾기</a></li>
            		         </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>
       </div>

</body>
</html>