<%@ page contentType="text/html; charset=UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>

<%-- <%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %> --%>
<html>
<head>
<title>게시판</title>
<%@ include file="/WEB-INF/views/include/script_tags.jsp"%>
<style type="text/css">
.zmdi {
	font-size: small;
}

.btn-outline-secondary {
	font-weight: bold;
}

.btn-outline-secondary:hover {
	color: #FFE659;
	text-decoration: none;
}

.btn-success {
	font-weight: bold;
}

.btn-success:hover {
	color: #FFE659;
	text-decoration: none;
}

.btn-info {
	font-weight: bold;
}

.btn-info:hover {
	color: #FFE659;
	text-decoration: none;
}

.mb-4 {
	padding-bottom: 11px;
	border-bottom: 1px solid #eee;
}

.replyMore:hover, .replyClose:hover {
	cursor: pointer;
	text-decoration: underline ;		
}	

/* 댓글 삭제폼 */
.delReplyBox{
 	overflow: hidden;
 	postion:absoulte;
 	width:218px;
 	height:31px;
 	border:2px solid #3c4790;
}


</style>





<script src="${pageContext.request.contextPath }/resources/js/freeboard.js?vs=2"></script>

<script type="text/javascript">
var lcnt = '<c:out value="${fbContent.fb_likeCnt }" />';
var lcnt2 = '<c:out value="${fbContent.fb_likeCnt }" />';
var hcnt = '<c:out value="${fbContent.fb_hateCnt }" />';
var hcnt2 = '<c:out value="${fbContent.fb_hateCnt }" />';
var alreadyLikeClick = false;
var alreadyHateClick = false;



//댓글 삭제폼
function delReplyForm(br_no){
	
	alert("일단 성공");
	var htmls = "";
	
	htmls += '<div class="delReplyBox" id="'+br_no+'" >';
	
	htmls += '<input type="password" placeholder= "비밀번호" class="delReplyPwd" > ';

	htmls += '<button type="button">확인</button> ';
	
	htmls += '</div>';
	
}


</script>



</head>
<body>


	<%@ include file="/WEB-INF/views/include/banner_context.jsp"%>
	<input type="hidden" value="${fbContent.fb_no }" id="fno"/>
	<div class="container col-md-6">
		<div class="card">
			<div class="card-body" style="height: 400px">
				<h3 class="card-title mb-3">${fbContent.fb_title }</h3>
				<h6 class="card-subtitle text-muted mb-4">
					<i class="zmdi zmdi-face"></i> ${fbContent.fb_userID } · <i
						class="zmdi zmdi-time"></i> ${fbContent.fb_date } · <i
						class="zmdi zmdi-equalizer"></i> ${fbContent.fb_count }
				</h6>
				<p class="card-text">${fbContent.fb_content }</p>
			</div>

			<div class="card-body" style="text-align: center;">
				<button type="button" class="btn btn-info btn-sm" id="likeBtn"
					onclick="updateLikeCnt()" value="${fbContent.fb_no }">
					<i class="zmdi zmdi-thumb-up"></i> 추천
					<c:out value="${fbContent.fb_likeCnt }" />
				</button>
				<button type="button" class="btn btn-outline-secondary btn-sm"
					id="hateBtn" onclick="updateHateCnt()">
					<i class="zmdi zmdi-thumb-down"></i> 비추천
					<c:if test="${fbContent.fb_hateCnt>0}">-</c:if><c:out value="${fbContent.fb_hateCnt }" />
				</button>
			</div>

			<div class="card-body">
				<a href='${pageContext.request.contextPath }/fb_board/listAll'
					class="btn btn-info" role="button" style="text-align: left;">목록으로</a>
				<c:if test="${sessionVO.PASSWORD == fbContent.fb_pwd}">
				<c:if test="${sessionVO.NICKNAME == fbContent.fb_userID}">
					<!-- 회원 전용 -->
					<a
						href="${pageContext.request.contextPath }/fb_board/updateContent?fb_no=${fbContent.fb_no}"
						class="btn btn-success " role="button">수정</a>
					<a
						href="${pageContext.request.contextPath }/fb_board/delete?fb_no=${fbContent.fb_no}"
						class="btn btn-outline-secondary " role="button">삭제</a>
				</c:if>
				</c:if>
				<c:if test="${sessionVO==null}">
					<c:if test="${fbContent.fb_available==1 }">
						<!--  비회원 전용 -->
						<a
							href="${pageContext.request.contextPath }/fb_board/updateContent?fb_no=${fbContent.fb_no}"
							class="btn btn-success " role="button">수정</a>
						<a
							href="${pageContext.request.contextPath }/fb_board/deleteContent?fb_no=${fbContent.fb_no}"
							class="btn btn-outline-secondary " role="button">삭제</a>
					</c:if>
				</c:if>
			</div>

			<!-- Reply Form {s} -->

			<div class="my-3 p-3 bg-white rounded shadow-sm"
				style="padding-top: 10px">

				<form name="form" id="form" role="form"  onsubmit="return false" >

					<input type="hidden" id="fb_no" value="${fbContent.fb_no }" />

					<div class="row">

						<div class="col-sm-10">

							<textarea class="form-control" id="br_content" rows="3"
								placeholder="댓글을 입력해 주세요"></textarea>

						</div>

						<div class="col-sm-2">

							<input class="form-control" id="br_id" placeholder="댓글 작성자"  />

							<input type="button" class="btn btn-sm btn-info"  value="저장"
								id="btnReplyInsert" style="width: 100%; margin-top: 10px;"  /> 

						</div>

					</div>

				</form>

			</div>

			<!-- Reply Form {e} -->


			<!-- Reply List {s}-->

			<div class="my-3 p-3 bg-white rounded shadow-sm"
				style="padding-top: 10px">
				<h6 class="border-bottom pb-2 mb-0 replyMore">댓글 목록</h6>
				<!-- 					<span style="padding-left: 7pt;" class="more" >댓글불러오기 </span>					 -->
				<div id="replyList"></div>

			</div>

			<!-- Reply List {e}-->



		</div>
	</div>

</body>
</html>


