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
	<style type="text/css">
	.btn3 {
	    width:180px;
	    background-color: #FFFFFF;
	    border: 0.7px solid #dadada;
	    color:#000000;
	    padding: 4px 0;
	    text-align: center;
	    text-decoration: none;
	    display: inline-block;
	    font-size: 20px;
	    font-weight:bold;
	    margin: 2px;
	    cursor: pointer;
	    border-radius:2px;
	}
	
	.btn3:hover {
	    background-color: #827ffe;
	    border: 1.7px solid #827ffe;
	    color: #FFF;
	}
	</style>
	
	
</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp" %>
	
	
    <div class="main" style="padding: 60px">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form" >
                        <div class="form-title" style="font-weight: bold; font-size: 26pt">"${sessionVO.NICKNAME }"님의 마이페이지</div>
                        <form method="POST" class="register-form" name="register-form" id="register-form" >

                            <div class="form-group form-button">
                                <input type="button" id="signup" class="btn3" value="프로필 수정" style=" font-size: 13pt;" onclick="location.href='${pageContext.request.contextPath}/L_member/profile'">
                            </div>

                            <div class="form-group form-button">
                                <input type="button" id="signup" class="btn3" value="비밀번호 변경" style=" font-size: 13pt;" onclick="location.href='${pageContext.request.contextPath}/L_member/pwUpdate'" >
                            </div>

                            <div class="form-group form-button">
                                <input type="button" id="signup" class="btn3" value="내 게시물 보기" style=" font-size: 13pt;" onclick="location.href='${pageContext.request.contextPath}/L_member/myContent?fb_userID=${sessionVO.NICKNAME } '"/>
                            </div>

                            <div class="form-group form-button">
                                <input type="button" id="signup" class="btn3" value="회원탈퇴" style=" font-size: 13pt;" onclick="location.href='${pageContext.request.contextPath}/L_member/deleteMember'"/>
                            </div>
                        </form>
                    
                    </div>
                    
                </div>
            </div>
        </section>
        
        
    </div>

</body>
</html>