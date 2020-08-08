<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>게시글삭제</title>

<%@ include file="/WEB-INF/views/include/script_tags.jsp"%>

<script type="text/javascript">
	/* function deleteContent(){
	
	 var data = $("#fb_pwd").val();
	 if(!data || data.trim().length==0){
	 alert('비밀번호는 반드시 입력하셔야 합니다.');
	 $("#fb_pwd").val("");
	 $("#fb_pwd").focus();
	 return false;
	
	 }
	 } */
</script>
</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp"%>

	<div class="container col-md-6" style="height: 500px">
		<br />
		<h1>게시글 삭제하기</h1>
		<form
			action="${pageContext.request.contextPath }/fb_board/deleteContentOk"
			method="post" onsubmit="return deleteContent()">

			<input type="hidden" name="fb_no" id="fb_no"
				value="${fbContent.fb_no}" />
				
			<div class="form-group" style="padding: 15%; text-align: right;">
				<input type="password" class="form-control" name="fb_pwd"
					id="fb_pwd" placeholder="비밀번호를 입력해주세요.">
				<button type="submit" class="btn btn-info">삭제하기</button>
			</div>
			
			<div >
			<br />
				<a href="${pageContext.request.contextPath }/fb_board/listAll"
					class="btn btn-secondary">목록으로</a>
			</div>
		</form>


	</div>


</body>
</html>