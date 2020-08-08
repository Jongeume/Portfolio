<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html; charset=UTF-8" %>
<!doctype html>
<html lang="ko">
<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1">
	<title>Document</title>
	<style type="text/css">

html,body {
	margin: 0px; <!-- 언제나 전체 body에는 margin 값을 0으로 세팅해준다-->
	font-size: 18px;
	height: 100%;
	color: #FFF;
	overflow: hidden;
}

.top, .left, .main-content {
	width: 100%;
}

.top {
	background-color: #FFFFFF;
	border-bottom: solid 2px #a0a0a0;
	height: 15%;
}
.left {
	background-color: #FFFFFF;
	border-right: 0;
  	border-bottom: solid 2px #a0a0a0;
	float: left;
	height: 25%;
}
.main-content {
	background-color: #FFFFFF;
	float: left;
	height: 60%;
}

 .container{
	display: -webkit-flex;
	display: flex;
	-webkit-flex-flow: row wrap;
	flex-flow: row wrap;
 	margin-left:auto;
 	margin-right:auto;
	position: relative;
 	height: 100%;
 }


@media (min-width: 900px) {
  .left{
  	width: 25%;
  	height: 85%;
  	border-right: solid 2px #a0a0a0;
  	border-bottom: 0;
  	
  }
  
  .main-content{
  	width: 75%;
  	height: 85%;
  	
  }
}
</style>

	<%@ include file="/WEB-INF/views/include/script_tags.jsp" %>
	
</head>
<body>
	
	<%@ include file="/WEB-INF/views/include/banner_context.jsp" %>
	        <section class="sign-in">
            <div class="container">
                <div class="signin-content">
                    
                    
                    <div class="signin-form">
                        <h2 class="form-title">FAQ 카테고리 추가</h2>
                        <form method="POST" class="register-form" id="login-form" action="${pageContext.request.contextPath }/L_board/categoryInsertOk" >
                        
                            <div class="form-group" >
                                <input type="text" name="FAQ_TYPE" id="FAQ_TYPE" placeholder="FAQ 카테고리 이름"/>
                            </div>
             
                            <div class="form-group form-button">
                                <input type="submit" name="signin" id="signin" class="form-submit" value="FAQ 카테고리 추가"/>
                            </div>
                        </form>
                       
                    </div>
                </div>
            </div>
        </section>
	
</body>
</html>