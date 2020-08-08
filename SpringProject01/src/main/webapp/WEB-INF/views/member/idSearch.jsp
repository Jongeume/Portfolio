<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="ko">
<head>
	<title>회원관리-아이디찾기</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<%@ include file="/WEB-INF/views/include/script_tags.jsp" %>
	
	<style type="text/css">
		.btn-info {
			font-weight: bold;
		}
		
		.btn-info:hover {
			color: #FFE659;
			text-decoration: none;
		}
		
	</style>
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
                        <h2 class="form-title">아이디찾기</h2>
                        <form method="POST" class="register-form" id="login-form" action="${pageContext.request.contextPath }/L_member/idSearchOk" onsubmit="return idSearchCheckForm()">
                        
                            <div class="form-group" >
                                <label for="your_name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="NAME" id="NAME" placeholder="이름"/>
                            </div>
                        
                            <div class="form-group" >
                                <label for="your_name"><i class="zmdi zmdi-smartphone"></i></label>
                                <input type="text" name="PHONE" id="PHONE" placeholder="전화번호"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="btn btn-info" value="아이디 찾기"/>
                            </div>
                        </form>
                        <div class="social-login">
                            <ul class="socials">
            					<li><a href="${pageContext.request.contextPath }/L_member/fregister" class="signup-image-link" style="font-size: 10pt; ">회원가입</a></li>
	        	     	      	<li><a href="${pageContext.request.contextPath }/L_member/login" class="signup-image-link" style="font-size: 10pt; "> 로그인</a></li>
	                			<li><a href="${pageContext.request.contextPath }/L_member/pwSearch" class="signup-image-link" style="font-size: 10pt; ">비밀번호찾기</a></li>
            		         </ul>
                        </div>
                    </div>
                </div>
            </div>
        </section>

</body>
</html>