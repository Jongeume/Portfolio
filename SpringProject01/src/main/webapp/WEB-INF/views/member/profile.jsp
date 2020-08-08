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
		.extext{
			background: #CEF6EC;
		}
		.extext:focus {
				background-color: #FBF6B9;
		}
	</style>	
	
	<!-- <script type="text/javascript">
		$(function(){
			 var data = $("#GENDER").val();
			alert(data);
			if(data=="M"){
				$("#GENDER").val("남자");
			}else if(data=="F"){
				$("#GENDER").val("여자");
			} 
		});
	</script>
	 -->
</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp" %>
	
	
    <div class="main" style="padding: 40px;">

        <!-- Sign up form -->
        <section class="signup">
            <div class="container">
                <div class="signup-content">
                    <div class="signup-form" >
                        <h2 class="form-title">"${sessionVO.NICKNAME}"님의 프로필</h2>
                        <form method="POST" class="register-form" name="register-form" id="register-form"  action="${pageContext.request.contextPath }/L_member/profileOk" onsubmit="return updateMemberForm()">
                        
                        
                            <div class="form-group" style=" font-size: 13pt;">
                                <label for="name"><i class="zmdi zmdi-account material-icons-name"></i></label>
                                <input type="text" name="NAME" id="NAME" value="${sessionVO.NAME }" readonly="readonly" style="cursor:default;"/>
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" name="ID" id="ID" value="${sessionVO.ID }" readonly="readonly" style="cursor:default;" />
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name" style="top: 35%"><i class="zmdi zmdi-face"></i></label>
                                <input type="text" class="extext" name="NICKNAME" id="NICKNAME" value="${sessionVO.NICKNAME }" required="required" onkeyup="nicknameCheck()" />
                           		<b id="nicknameCheck"></b>
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name" ><i class="zmdi zmdi-calendar"></i></label>
                                <input type="text" class="extext" name="BIRTH" id="BIRTH" value=<fmt:formatDate value="${sessionVO.BIRTH }" pattern='YYYY-MM-DD'/> readonly="readonly"/>
                            </div>
                            
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name" style="top: 35%"><i class="zmdi zmdi-smartphone"></i></label>
                                <input type="text" class="extext" name="PHONE" id="PHONE" value="${sessionVO.PHONE }" required="required" onkeyup="phoneCheck()"/>
                           		<b id="phoneCheck"></b>
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name"><i class="zmdi zmdi-smartphone"></i></label>
                                <input type="text" name="GENDER" id="GENDER" value="${gender == 'M' ? '남자' : '여자'}" readonly="readonly" style="cursor:default;"/>
                            </div>
                            
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name" style="top: 25%"><i class="zmdi zmdi-email"></i></label>
                                <input type="text" class="extext" readonly="readonly" name="ZIPCODE" id="ZIPCODE" onclick="execDaumPostcode()" value="${sessionVO.ZIPCODE }"/>
                                <input type="text"  readonly="readonly" name="ADDR1" id="ADDR1" value="${sessionVO.ADDR1 }" style=" background-color: #CEF6EC;"/>
                            </div>
                            <div class="form-group" style=" font-size: 15pt;">
                                <label for="name" ><i class="zmdi zmdi-home"></i></label>
                                <input type="text" class="extext" name="ADDR2" id="ADDR2" value="${sessionVO.ADDR2 }"/>
                            </div>
                            <div class="form-group form-button">
                                <input type="submit" id="signup" class="form-submit" value="수정하기" style=" font-size: 13pt; font-weight: bold;"/>
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