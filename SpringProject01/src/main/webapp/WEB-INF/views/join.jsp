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
	
	<style type="text/css">
		select {
			  width: 100%;
			  display: block;
			  border: none;
			  border-bottom: 1px solid #999;
			  padding: 6px 30px;
			  font-family: Poppins;
			  box-sizing: border-box; 
			}
			
	</style>
	
</head>
<body>

	<%@ include file="banner_context.jsp" %>
	
    <div class="main" style="padding: 70px">
     	            	
	<div class="centered">
		<button class='tab' >회원약관</button>
		<button class='tab-on'>회원가입</button>
		<button class='tab'>가입완료</button>
	</div>	
        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form" style="font-size: 12pt">
       
                        <h2 class="form-title">회원 가입</h2>
                        <form method="POST" class="register-form" name="register-form" id="register-form"  action="${pageContext.request.contextPath }/L_member/joinOk" onsubmit="return formCheck()">
                        
                            <div class="form-group">
                                <label for="name" style="top: 30%;"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="NAME" id="NAME" placeholder="이름" onkeyup="nameCheck()"/>
                                <b id="nameCheck"></b>
                            </div>
                            <div class="form-group">
                                <label for="name" style="top: 30%;"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="ID" id="ID" placeholder="아이디(이메일형식)" onkeyup="idCheck()"/>
								<b id="idCheck"></b>
                            </div>
                            <div class="form-group">
                                <label for="name" style="top: 30%;"><i class="zmdi zmdi-face"></i></label>
                                <input type="text" name="NICKNAME" id="NICKNAME" placeholder="닉네임" onkeyup="nicknameCheck()" />
                                <b id="nicknameCheck"></b>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-calendar"></i></label>
                                <input type="text" name="BIRTH" id="BIRTH" readonly="readonly"  placeholder="생년월일"/>
                            </div>
                            <div class="form-group" >
                                <label for="name" style="top: 30%;"><i class="zmdi zmdi-smartphone"></i></label>
                                <input type="text" name="PHONE" id="PHONE" placeholder="전화번호" onkeyup="phoneCheck()"/>
                                <b id="phoneCheck"></b>
                            </div>
                            
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-smartphone"></i></label>
								<select name="GENDER" id="GENDER" >
									<option value=""  selected hidden="">성별</option>
									<option value="F">여자</option>
									<option value="M">남자</option>
								</select>
                            </div>
                            <div class="form-group">
                                <label for="password" style="top: 30%;"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호" onkeyup="pwCheck()"/>
                                <b id="pwCheck"></b>
                            </div>
                            <div class="form-group">
                                <label for="password" style="top: 30%"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="RE_PASS" id="RE_PASS" placeholder="비밀번호 재입력" />
								<b id="pwCheck2"></b>                          
                            </div>
                            <div class="form-group">
                                <label for="name" style="top: 25%"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" readonly="readonly" name="ZIPCODE" id="ZIPCODE" onclick="execDaumPostcode()" placeholder="우편번호"/>
                                <input type="text" readonly="readonly" name="ADDR1" id="ADDR1" placeholder="주소"/>
                            </div>
                            <div class="form-group">
                                <label for="name"><i class="zmdi zmdi-home"></i></label>
                                <input type="text" name="ADDR2" id="ADDR2" placeholder="상세주소"/>
                            </div>
                          
                            <div class="form-group form-button">
                                <input type="submit" id="signup" class="form-submit" value="가입하기"/>
                            </div>
                        </form>
                    </div>
                    
                    <div class="signup-image">
                        <figure><img src="${pageContext.request.contextPath }/resources/images/signup-image.jpg" alt="sing up image"></figure>
                        <a href="${pageContext.request.contextPath }/L_member/login" class="signup-image-link" style="font-size: 12pt">이미 계정이 있습니다.</a>
                    </div>
                </div>
            </div>
        </section>
        
        
    </div>

</body>
</html>