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
	<title>회원탈퇴</title>
	
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
                    	<h2 class="form-title">회원탈퇴</h2>
                        <form method="POST" class="register-form" name="register-form" id="register-form"  action="${pageContext.request.contextPath }/L_member/deleteMemberOk" onsubmit="return deleteMember()" >
                        	
                             <input type="hidden" name="ID" id="ID" value="${sessionVO.ID }"/>
                                
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="password"><i class="zmdi zmdi-lock"></i></label>
                                <input type="password" name="PASSWORD" id="PASSWORD" placeholder="비밀번호 입력"/>
                            </div>
                            
                            <div class="form-group form-button">
                                <input type="submit" id="signup" class="form-submit" value="회원탈퇴" style="font-size: 13pt"/>
                            </div>
                        </form>
                    </div>
                    
                </div>
            </div>
        </section>
        
        
    </div>

</body>
</html>