<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.header-top-bar {
  background: #00B6BC;
  font-size: 14px;
  padding: 10px 0px;
  box-shadow: 0 1px 2px rgba(0, 0, 0, 0.05);
  color: #fff;
}
</style>
</head>
<body>		
	<div class="header-top-bar">
		<div class="container">
			<div class="d-flex">
				<div class="col-lg-6"></div>
				<div class="col-lg-6 d-flex justify-content-end">
					<div class="text-lg-right top-right-bar mt-2 mt-lg-0 ">
						<span class="text-white">(주)급발진</span>
						<span class="h4 text-white">On The Daegu</span>					
					</div>
					
				</div>
			</div>
		</div>
	</div>
	
	<nav class="navbar navbar-expand-lg navigation" id="navbar">
		<div class="container d-flex">

			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarmain" aria-controls="navbarmain" aria-expanded="false" aria-label="Toggle navigation">
				<span class="icofont-navigation-menu"></span>
		 	 </button>
		 	 	
			<div class="col-lg-2 d-flex justify-content-evenly">
			 <!-- 로고 사진  -->
				<a class="navbar-brand" href="home.do">
					<img src="img/OTDLogo1.png" alt="otd로고사진" class="img-fluid">
				</a>
			</div>  	
			<div class="col-lg-7">
		  		<div class="col-ms-auto collapse navbar-collapse justify-content-evenly" id="navbarmain">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active h4 mx-1">
							<a class="flex-sm-fill text-lg-center nav-link active" href="home.do">홈</a>
						  </li>
						  <li class="nav-item dropdown h4">
							<a class="nav-link dropdown-toggle mx-1" href="buyTicketForm.do" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이용권</a>
							<ul class="dropdown-menu" aria-labelledby="dropdown02">
								<li><a class="dropdown-item" href="buyTicketForm.do">이용권 구매</a></li>
								<li><a class="dropdown-item" href="getPayHistory.do">이용권 환불</a></li>
							</ul>
			  			  </li>
					    <!-- 공지 및 리뷰 페이징처리로 인해 pageNum 및 amount값 넘겨줘야 합니다. /김주영 -->
					    <li class="nav-item h4 mx-1"><a class="nav-link" href="noticeList.do?pageNum=1&amount=10">공지사항</a></li>
					    <li class="nav-item h4 mx-1"><a class="nav-link" href="eventList.do">이벤트</a></li>
						<li class="nav-item h4 mx-1"><a class="nav-link" href="reviewList.do?pageNum=1&amount=5">리뷰게시판</a></li>
						<li class="nav-item h4 mx-1"><a class="nav-link" href="faqHome.do">문의/FAQ</a></li>
					</ul>	
				</div>
			</div>
			<div class="col-lg-3">
				<div class="col-ms-auto mb-2 collapse navbar-collapse d-flex justify-content-center " id="navbarmain"> 	
					<c:if test="${not empty sessionEmail }">
						<div class="dropdown ">
					      <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle d-flex justify-content-center" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
					        <img src="img/profile.png" alt="" width="40" height="40" class="rounded-circle me-2">
					        <strong>${sessionName }님 (${sessionEmail })</strong>
					      </a>
					      <ul class="dropdown-menu" aria-labelledby="dropdown02">
					        <li><a class="dropdown-item" href="memberSelect.do">마이페이지</a></li>
					        <li><a class="dropdown-item" href="logout.do">로그아웃</a></li>
					      </ul>
			    		</div>
			    	</c:if>	
			    	<c:if test="${empty sessionEmail }">
			    		<ul class="navbar-nav mr-auto">
			    			<li class="nav-item active">
			    				<a class="nav-link" href="loginForm.do">로그인</a>
			    			</li>
							<li class="nav-item active"><a class="nav-link" href="signUpForm.do">회원가입</a></li>
						</ul>	
			    	</c:if>
				</div>
			</div>
		</div>
	</nav>
</body>
</html>