<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!doctype html>
<html lang="ko">
<head>
<meta charset="UTF-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>Home</title>

<%@ include file="/WEB-INF/views/include/script_tags.jsp"%>

<style type="text/css">
/* .btn4 {
	display: inline-block;
	font-weight: 400;
	color: #d4e2ef;
	text-align: center;
	vertical-align: middle;
	cursor: pointer;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #0a4d8d;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-weight: bold;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
}

.btn4:hover {
	color: #FFE659;
	text-decoration: none;
} */

.btn-info{
	font-weight: bold;
}

.btn-info:hover {
	color: #FFE659;
	text-decoration: none;
}
</style>
</head>
<body>
	<%@ include file="/WEB-INF/views/include/banner_context.jsp"%>

	<!-- Page Content -->
	<div class="container">
	
	
		<!-- Heading Row -->
		<div class="row align-items-center my-5">
			<div class="col-lg-7">
				<img class="img-fluid rounded mb-4 mb-lg-0"  style="max-width: 400px"
					src="${pageContext.request.contextPath }/resources/images/dog.jpg" width="900" height="400" alt=""/>
			</div>
<!-- 			http://placehold.it/900x400 -->
			<!-- /.col-lg-8 -->
			<div class="col-lg-5">
				<c:if test="${sessionVO==null }">
				<h1 class="font-weight" style="font-weight: bold">사이트소개</h1>
				<p>이 사이트는 포트폴리오 목적으로 만들어졌습니다! 자세한 내용은 사이트소개 탭을 이용해주세요! </p>
				<a class="btn btn-info" href="">확인하기</a>
				</c:if>
				<c:if test="${sessionVO!=null }">
				<h2 class="font-weight" style="font-weight: bold">${sessionVO.NICKNAME }님 환영합니다!  </h2>
				<a class="btn btn-info" href="${pageContext.request.contextPath}/L_member/myContent?fb_userID=${sessionVO.NICKNAME }">내 게시물 확인하기</a>
				</c:if>
			</div>
			<!-- /.col-md-4 -->
		</div>
		<!-- /.row -->

	
		<!-- 내용단 -->
		<div class="row">

			<div class="col-md-4 mb-5" >
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">인기글</h2>
<!-- 						<p class="card-text"> -->
						<table class="table table-board">
			<thead style="border-bottom: 1px solid;">
				<tr>
					<th style="width: 54%">제목</th>
					<th style="width: 20%">추천</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${fn:length(popuarList) > 0 }">

						<c:forEach items="${popuarList }" var="popuarList">
							<tr>
								<td class="list_td"><a
									href="${pageContext.request.contextPath }/fb_board/fbContent?fb_no=${popuarList.fb_no}">${popuarList.fb_title }
										<c:if test="${popuarList.fb_likeCnt > 0 }">
										<span style="color : red; font-size: 8pt;">[${popuarList.fb_likeCnt}]
										</span>
									</c:if>
									
									</a></td>
								<td class="list_td"><span> ${popuarList.fb_likeCnt }</span></td>
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
						
						
<!-- 						</p> -->
					</div>
					<div class="card-footer">
<%-- 						<a href="${pageContext.request.contextPath }/fb_board/listAll" class="btn btn-info">1번 들어가기</a> --%>
					</div>
				</div>
			</div>
			<!-- /1번 내용 -->
			<div class="col-md-4 mb-5 " >
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">최신글</h2>
							
								<table class="table table-board">
			<thead style="border-bottom: 1px solid;">
				<tr>
					<th style="width: 54%">제목</th>
					<th style="width: 20%">등록일</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${fn:length(latestList) > 0 }">

						<c:forEach items="${latestList }" var="latestList">
							<tr>
								<td class="list_td"><a
									href="${pageContext.request.contextPath }/fb_board/fbContent?fb_no=${latestList.fb_no}">${latestList.fb_title }
										<c:if test="${latestList.fb_likeCnt > 0 }">
										<span style="color : red; font-size: 8pt;">[${latestList.fb_likeCnt}]
										</span>
									</c:if>
									</a></td>
								<td class="list_td"><span> ${latestList.fb_date }
								</span></td>
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
			
					
					</div>
					<div class="card-footer">
<!-- 						<a href="#" class="btn btn-info">2번 들어가기</a> -->
					</div>
				</div>
			</div>
			<!-- /2번 내용 -->
		<div class="col-md-4 mb-5">
				<div class="card h-100">
					<div class="card-body">
						<h2 class="card-title">Top views</h2>
						
													<table class="table table-board">
			<thead style="border-bottom: 1px solid;">
				<tr>
					<th style="width: 54%">제목</th>
					<th style="width: 30%">조회수</th>
				</tr>
			</thead>
			<tbody>

				<c:choose>
					<c:when test="${fn:length(hotest) > 0 }">

						<c:forEach items="${hotest }" var="hotest">
							<tr>
								<td class="list_td"><a
									href="${pageContext.request.contextPath }/fb_board/fbContent?fb_no=${hotest.fb_no}">${hotest.fb_title }
									<c:if test="${hotest.fb_likeCnt > 0 }">
										<span style="color : red; font-size: 8pt;">[${hotest.fb_likeCnt}]
										</span>
									</c:if>	
									</a></td>
								<td class="list_td"><span> ${hotest.fb_count }
								</span></td>
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
						
						
					</div>
					<div class="card-footer">
<!-- 						<a href="#" class="btn btn-info">3번 들어가기</a> -->
					</div>
				</div>
			</div> 
			<!-- /3번 내용 -->

		</div>
		<!-- /.row -->

		<!--  끝마디  -->
		<div class="card text-white bg-secondary my-5 py-4 text-center"
			style="background: #f5f5f5; /* fallback for old browsers */ background: -webkit-linear-gradient(to bottom, #f5f5f5, #f5f5f5); /* Chrome 10-25, Safari 5.1-6 */ background: linear-gradient(to right, #f5f5f5, #f5f5f5);">
			<div class="card-body">
				<p class=" m-0"> 연락처 : 010 - 8254 - 0551 </p>
				<p class=" m-0"> Email : casta10@naver.com</p>
				<p class=" m-0"> GitHub : https://github.com/Jongeume/Portfolio.git </p>
			</div>
		</div>


	</div>
	<!-- /.container -->


</body>

</html>