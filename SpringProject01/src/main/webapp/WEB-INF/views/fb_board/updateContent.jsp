<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<html>
<head>
<title>글 수정하기</title>
<%-- <%@ include file="script_tags.jsp"%> --%>
<%@ include file="/WEB-INF/views/include/script_tags.jsp"%>
<style type="text/css">
.label {
	position: relative;
	top: 15px;
}

.col-md-6 {
	position: relative;
	top: 15px;
}

.box1 {
	float: left;
}
</style>
</head>
<body>


	<%@ include file="/WEB-INF/views/include/banner_context.jsp"%>
	<!-- Page Content -->
	<div class="container col-md-6">

		<h1>글 수정</h1>
		<form action="${pageContext.request.contextPath }/fb_board/updateOk"
			method="post">
			
			<input type="hidden" name="fb_no" value="${fbContent.fb_no }"/>			
			<%
				if (session.getAttribute("sessionVO") == null) {
			%>
			<div class="form-group">
				<div class="box1">
					<label class="label">작성자</label> <input type="text" readonly="readonly"
						class="form-control" name="fb_userID" value="${fbContent.fb_userID }" style="width: 170px;">
				</div>	

				<div class="box1">
					<label class="label">비번</label> <input type="password"
						class="form-control" name="fb_pwd" placeholder="비번을 적어주세요." style="width: 170px">
				</div>
			</div>
			<%
				} else {
			%>

			<%-- 			<div class="form-group">
				<label class="label">작성자</label> <input
					value="${sessionVO.NICKNAME }" readonly="readonly">
			</div> --%>
			<div class="form-group">
				<div class="box1">
					<label class="label">작성자</label> <input
						value="${sessionVO.NICKNAME }" name="fb_userID" readonly="readonly" style="width: 100px; font-weight: bold;">
				</div>
				<div class="box1">
					<input type="hidden" name="fb_pwd" value="${sessionVO.PASSWORD }"
						readonly="readonly">
				</div>
			</div>
			<%
				}
			%>
			<div class="form-group">
				<label class="label">제목</label> <input type="text"
					class="form-control" name="fb_title" value="${fbContent.fb_title }" >
			</div>
			<div class="form-group">
				<label class="label"> 내용</label>
				<textarea class="form-control" name="fb_content"
					 rows="10">${fbContent.fb_content }</textarea>
			</div>
			<button type="submit" class="btn btn-info">등록하기</button>
			<a href="${pageContext.request.contextPath }/fb_board/listAll"
				class="btn btn-secondary">목록으로</a>
		</form>


	</div>

</body>
</html>


