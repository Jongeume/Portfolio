<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-dark bg-dark fixed-top">
    <div class="container">
      <a class="navbar-brand" href="#">인강사이투</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto">
          <li class="nav-item active">
            <a class="nav-link" href="">Home
              <span class="sr-only">(current)</span>
            </a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">학원소개</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">강의</a>
          </li>
          <li class="nav-item">
            <a class="nav-link" href="">질문게시판</a>
          </li>
          <% if(session.getAttribute("sessionVO")==null) { %>
          <li class="nav-item">
            <a class="nav-link" href="${pageContext.request.contextPath }/L_member/login">로그인</a>
          </li>
          <% } else { %>
          <li class="nav-item">
          	<a class="nav-link" href="${pageContext.request.contextPath }/L_member/logOut">로그아웃</a>
          </li>
          <li class="nav-item">
          	<a class="nav-link" href="${pageContext.request.contextPath }/L_member/myPage">내정보</a>
          </li>
          <% } %>
        </ul>
      </div>
    </div>
  </nav>
  
