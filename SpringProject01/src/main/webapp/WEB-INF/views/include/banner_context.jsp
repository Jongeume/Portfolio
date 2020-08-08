<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark fixed-top" style="background: #f5f5f5;" >
    <div class="container" style="background: #348F50;  /* fallback for old browsers */
background: -webkit-linear-gradient(to right, #56B4D3, #348F50);  /* Chrome 10-25, Safari 5.1-6 */
background: linear-gradient(to right, #56B4D3, #348F50); /* W3C, IE 10+/ Edge, Firefox 16+, Chrome 26+, Opera 12+, Safari 7+ */
  ">
      <a class="navbar-brand" href="${pageContext.request.contextPath }">커뮤니티 사이트</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="${pageContext.request.contextPath }">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
		  <!-- l 표시  -->
          <li class="nav-item">
            <a class="nav-link" style="color: rgba(255, 255, 255, 0.5);">l</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="">사이트소개</a>
          </li>
          <!-- l 표시  -->
          <li class="nav-item">
            <a class="nav-link" style="color: rgba(255, 255, 255, 0.5);">l</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/fb_board/listAll">자유게시판</a>
          </li>
          <!-- l 표시  -->
          <li class="nav-item">
            <a class="nav-link" style="color: rgba(255, 255, 255, 0.5);">l</a>
          </li>
          
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/L_board/serviceCenter">질문게시판</a>
          </li>
          <!-- l 표시  -->
          <li class="nav-item">
            <a class="nav-link" style="color: rgba(255, 255, 255, 0.5);">l</a>
          </li>
          
          <% if(session.getAttribute("sessionVO")==null) { %>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/L_member/login">로그인</a>
          </li>
          <% } else { %>
			 
          <li class="nav-item">
          	<a class="nav-link" href="${pageContext.request.contextPath }/L_member/myPage">"${sessionVO.NICKNAME}" 님</a>
          </li>
          <!-- l 표시  -->
          <li class="nav-item">
            <a class="nav-link" style="color: rgba(255, 255, 255, 0.5);">l</a>
          </li>
          
          <li class="nav-item">
          	<a class="nav-link" href="${pageContext.request.contextPath }/L_member/logOut">로그아웃</a>
          </li>
          
          <% } %>
        </ul>
      </div>
    </div>
  </nav>
  
