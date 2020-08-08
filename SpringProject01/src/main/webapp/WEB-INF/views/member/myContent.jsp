<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html>
<head>
<%-- <%@ include file="script_tags.jsp"%> --%>
	<%@ include file="/WEB-INF/views/include/script_tags.jsp"%>
	
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>myContent</title>
<script type="text/javascript">


	
</script>
<style type="text/css">
.table {
	width: 100%;
	text-align: center;
}

.btn-info {
	font-weight: bold;
}

.btn-info:hover {
	color: #FFE659;
	text-decoration: none;
}

.list_td {
	border-top: 1px soild #eee;
	vertical-align: middle;
	text-align: center;
	color: #333;
}

div.relative {
    position:   relative;
    top:        100px;
}
</style>

</head>
<body>

	<%@ include file="/WEB-INF/views/include/banner_context.jsp"%>
	<div class="container" style="position:relative; top: 15px">
			<h1>MyContent ${SessionVO.NICKNAME }</h1>
		<table class="table table-board">
			<thead style="border-bottom: 1px solid;">
				<tr>
					<th style="width: 10%">번호</th>
					<th style="width: 54%">제목</th>
					<th style="width: 10%">글쓴이</th>
					<th style="width: 10%">작성일</th>
					<th style="width: 8%">조회수</th>
					<th style="width: 8%">추천</th>
				</tr>
			</thead>
			<tbody>

			<c:choose>
					<c:when test="${fn:length(fbContent) > 0 }">

						<c:forEach items="${fbContent }" var="fb_boardVO">
							<tr>
								<td class="list_td">${fb_boardVO.fb_no }</td>
								<td class="list_td"><a
									href="${pageContext.request.contextPath }/fb_board/fbContent?fb_no=${fb_boardVO.fb_no}">${fb_boardVO.fb_title }
									<c:if test="${fb_boardVO.fb_likeCnt > 0 }">
										<span style="color : red; font-size: 8pt;">[${fb_boardVO.fb_likeCnt}]
										</span>
									</c:if>
									</a></td>
								<td class="list_td">${fb_boardVO.fb_userID }</td>
								<td class="list_td">${fb_boardVO.fb_date }</td>
								<td class="list_td"><span> ${fb_boardVO.fb_count }</span></td>
								<td class="list_td"><span> ${fb_boardVO.fb_likeCnt }</span></td>
							</tr>
						</c:forEach>
					</c:when>
					<c:otherwise>
						<tr>
							<td colspan="5">조회된 결과가 없습니다.</td>
						</tr>
					</c:otherwise>
				</c:choose>
			</tbody>
		</table>
		


	<!-- pagination{e} -->
		<a href="${pageContext.request.contextPath }/fb_board/write"
			role="button" class="btn btn-info">글쓰기</a>
		
		
	
	</div>

</body>
</html>