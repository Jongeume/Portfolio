<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@page contentType="text/html; charset=UTF-8"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Document</title>
<style type="text/css">
html, body {
	margin: 0px; <!-- 언제나 전체 body에는 margin 값을 0으로 세팅해준다 --> font-size : 18px;
	height: 100%;
	color: #FFF;
	overflow: hidden;
}

.top, .left, .main-content {
	width: 100%;
}

.top {
	border-bottom: solid 2px #a0a0a0;
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

.container {
	display: -webkit-flex;
	display: flex;
	-webkit-flex-flow: row wrap;
	flex-flow: row wrap;
	margin-left: auto;
	margin-right: auto;
	position: relative;
	height: 100%;
}

@media ( min-width : 900px) {
	.left {
		width: 25%;
		height: 85%;
		border-right: solid 2px #a0a0a0;
		border-bottom: 0;
	}
	.main-content {
		width: 75%;
		height: 85%;
	}
	. btn-info:hover{
		color: #FFE659;
		text-decoration: none;
	}
	
	 .btn-info {
		width: 180px;
/* 		background-color: #f8f8f8; */
		border: 0.7px solid #dadada;
/* 		color: #000000; */
		padding: 4px 0;
		text-align: center;
		text-decoration: none;
/* 		display: inline-block; */
		font-size: 20px;
 		font-weight: bold; 
		margin: 2px;
		cursor: pointer;
		border-radius: 2px;
	} 
	/* .btn3:hover {
		background-color: #827ffe;
		border: 1.7px solid #827ffe;
		color: #FFF;
	} */
	.show {
		background-color: #FFFFFF;
		border: 0;
		outline: 0;
	}
	.show:hover {
		background-color: #FFFFFF;
		border: 0;
		outline: 0;
	}
}

table{
	 border-color: #a0a0a0;
} 
.faqText{
	color: black;
}
.faqText:hover{
	
	color: #FFE659;
	text-decoration: none;
}

.faqViews:hover{
	background: #17a2b8;
}

</style>

<script type="text/javascript">
	var articleNo = ${list.FAQ_TYPE};
	
	getReplies("/replies/" + articleNo+ "/" + replyPageNum);
	
	function getReplies(repliesUri){
		$.getJson(repliesUri, function (data){
			printReplies(data.replies, $(".repliesDiv"), $("#replyTemplate"));
		});
	}
	
	function printReplies(replyArr, targetArea, templateObj){
		
		var html = replyTemplate(replyArr);
		$(".replyDiv").remove();
		targetArea.html(html);
	}
</script>



<%@ include file="/WEB-INF/views/include/script_tags.jsp"%>

</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp"%>
	<div class="container">
		<div class="top"></div>

		<!-- left -->
		<div class="left">
			<h2 style="text-align: center;">FAQ 유형</h2>
			<div style="text-align: center;">
				<c:if test="${sessionVO.USE == 2 }">
					<button class="btn btn-info" onclick="location.href='categoryInsert'">추가</button>
				</c:if>
			</div>
			<table style="margin: auto; font-size: 18pt;">
				<c:forEach items="${faqList }" var="list">
					<tr align="center" >
						<td class="faqViews"><a class="faqText"
							href="${pageContext.request.contextPath }/L_board/faqListView?TYPE_NO=${list.TYPE_NO}"
							style="font-weight: bold;"><c:out value="${list.FAQ_TYPE}" /></a></td>
					</tr>
				</c:forEach>
			</table>
		</div>

		<!--  main -->
		<%-- 		<div class="main-content" >
			<div id="dis">
				<table id="faqCategory"></table>

				<table  border="1" style="width: 650px; " >
					<tr>
						<th style="text-align: center;">제목</th>
						<th style="width: 150px; text-align: center;">등록일</th>
					</tr>

					<c:forEach items="${faqList2 }" var="list2" varStatus="vs">
						<tr>
							<td style="text-align: center;"><c:out
									value="${list2.FAQ_NAME }" /></td>
							<td><fmt:formatDate value="${list2.REGDATE}"
									pattern="yyyy-MM-dd HH:mm:ss" /></td>
						</tr>
					</c:forEach>
				</table>

			</div>
		</div> --%>
		<!-- / main  -->
		
		<div class="main-content">
			<div id="dis">
					<table class="table table-board"  border="1" style="width: 650px;">
						<thead  style="border-bottom: 1px solid;">
<!-- 							<tr>
								<th style="width: 80%; text-align: center;">제목</th>
								<th style="width: 20%; text-align: center;">등록일</th>

							</tr> -->
						</thead>
						<tbody>

							<c:choose>
								<c:when test="${fn:length(faqList2) > 0 }">

									<c:forEach items="${faqList2 }" var="list2">
										<tr>
											<td class="list_td" style="text-align: center; width: 90%;">${list2.FAQ_NAME }</td>
											<td class="list_td" style="text-align: center; width: 10%;">${list2.REGDATE}</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<tr>
										<td colspan="5" style="text-align: center;">조회된 결과가 없습니다.</td>
									</tr>
								</c:otherwise>
							</c:choose>
						</tbody>
					</table>


				</div>
			</div>











	</div>
</body>
</html>