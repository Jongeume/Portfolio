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
	<title>마이페이지</title>
	
	<%@ include file="/WEB-INF/views/include/script_tags.jsp" %>
	
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp" %>
	
	
    <div class="main">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form" >
                    	<h2 class="form-title">비밀번호 변경</h2>
                        <form method="POST" class="register-form" name="register-form" id="register-form"  action="${pageContext.request.contextPath }/L_member/pwUpdateOk" onsubmit="return updatePwForm()" >
                        	
                             <input type="hidden" name="ID" id="ID" value="${sessionVO.ID }"/>
                                
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="oldPw" id="oldPw" placeholder="현재 비밀번호 입력"/>
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="password" style="top: 30%"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="PASSWORD" id="PASSWORD" placeholder="새비밀번호 입력"/>
                           		<b id="pwChk"></b>
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="password" style="top: 30%"><i class="zmdi zmdi-lock-outline"></i></label>
                                <input type="password" name="rePw" id="rePw" placeholder="새비밀번호 확인"/>
                         		<b id="pwChk2"></b>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" id="signup" class="form-submit" value="변경하기" style="font-size: 13pt"/>
                                <button type="button" class="cancelBtn1"  style=" font-size: 13pt; font-weight: bold;" onclick="location.href='myPage'">돌아가기</button>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
        
        
    </div>

</body>
</html>