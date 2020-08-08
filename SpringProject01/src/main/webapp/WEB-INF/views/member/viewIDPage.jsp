<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원관리-아이디찾기 성공</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/WEB-INF/views/include/script_tags.jsp" %>
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp" %>
	
	 <!-- Sing in  Form -->
	 <br />
        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    <div class="signin-image">
                        <figure><img src="${pageContext.request.contextPath }/resources/images/signin-image.jpg" alt="sing up image"></figure>
                    </div>
                    
                    <div class="signin-form">
                        <form method="POST" class="register-form" id="login-form" action="${pageContext.request.contextPath }/L_member/login" >
                            
                            <div class="form-group" style="font-size: 20pt">
                            	${NAME }님의 아이디는 ${ID }입니다.
                            </div>
                            
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="로그인 하러가기"/>
                            </div>
                        </form>
                        
                        <div class="social-login">
                            <ul class="socials">
            					<li><a href="${pageContext.request.contextPath }/L_member/join" class="signup-image-link" style="font-size: 10pt; ">회원가입</a></li>
	                			<li><a href="${pageContext.request.contextPath }/L_member/join" class="signup-image-link" style="font-size: 10pt; ">비밀번호찾기</a></li>
            		         </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</body>
</html>