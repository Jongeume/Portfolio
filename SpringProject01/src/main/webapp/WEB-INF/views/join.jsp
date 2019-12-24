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
	<title>회원가입</title>
	
	<%@ include file="script_tags.jsp" %>

	
</head>
<body>

	<%@ include file="banner_context.jsp" %>
	
	
    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form">
                        <h2 class="form-title">회원 가입</h2>
                        <form method="POST" class="register-form" name="register-form" id="register-form"  action="${pageContext.request.contextPath }/L_member/joinOk" onsubmit="return formCheck()">
                        
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="NAME" id="NAME" placeholder="이름"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="ID" id="ID" placeholder="아이디(이메일형식)" onkeyup="idCheck()"/>
                                <span id="idCheck"></span>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-face"></i></label>
                                <input type="text" name="NICKNAME" id="NICKNAME" placeholder="닉네임"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-calendar"></i></label>
                                <input type="text" name="BIRTH" id="BIRTH" readonly="readonly"  placeholder="생년월일"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-smartphone"></i></label>
                                <input type="text" name="PHONE" id="PHONE" placeholder="전화번호"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-smartphone"></i></label>
                                <input type="text" name="GENDER" id="GENDER" placeholder="성별"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호"/>
                            </div>
                            <div class="form-group">
                                <label for="password"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="RE_PASS" id="RE_PASS" placeholder="비밀번호 재입력"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" readonly="readonly" name="ZIPCODE" id="ZIPCODE" onclick="execDaumPostcode()" placeholder="우편번호"/>
                                <input type="text" readonly="readonly" name="ADDR1" id="ADDR1" placeholder="주소"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-home"></i></label>
                                <input type="text" name="ADDR2" id="ADDR2" placeholder="상세주소"/>
                            </div>
                            
                          
                             <div class="form-group">
                                <input type="checkbox" name="agree-term" id="agree-term" class="agree-term"  />
                                <label for="agree-term" class="label-agree-term"><span><span></span></span> 모든 <a href="${pageContext.request.contextPath }/L_member/fregister" class="term-service">회원가입 약관</a>에 동의합니다.</label>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" id="signup" class="form-submit" value="가입하기"/>
                            </div>
                        </form>
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="${pageContext.request.contextPath }/resources/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="${pageContext.request.contextPath }/L_member/login" class="signup-image-link">이미 계정이 있습니다.</a>
                    </div>
                </div>
            </div>
        </section>
        
        
    </div>

</body>
</html>