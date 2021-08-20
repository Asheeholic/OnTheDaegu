<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>		
	<nav class="navbar navbar-expand-lg navigation" id="navbar">
		<div class="container">

			<button class="navbar-toggler collapsed" type="button" data-toggle="collapse" data-target="#navbarmain" aria-controls="navbarmain" aria-expanded="false" aria-label="Toggle navigation">
				<span class="icofont-navigation-menu"></span>
		 	 </button>
		 	 	
			<div class="col-lg-3">
			 <!-- 로고 사진  -->
				<a class="navbar-brand" href="home.do">
					<img src="img/OTDLogo.png" alt="otd로고사진" class="img-fluid">
				</a>
			</div>  	
			<div class="col-lg-6">
		  		<div class="col-ms-auto collapse navbar-collapse justify-content-end" id="navbarmain">
					<ul class="navbar-nav mr-auto">
						<li class="nav-item active">
							<a class="flex-sm-fill text-sm-center nav-link active" href="home.do">홈</a>
						  </li>
						  <li class="nav-item dropdown">
							<a class="nav-link dropdown-toggle" href="" id="dropdown02" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">이용권<i class="icofont-thin-down"></i></a>
							<ul class="dropdown-menu" aria-labelledby="dropdown02">
								<li><a class="dropdown-item" href="doctor.html">이용권 구매</a></li>
								<li><a class="dropdown-item" href="doctor-single.html">이용권 환불</a></li>
							</ul>
			  			  </li>
					    
					    <li class="nav-item"><a class="nav-link" href="noticeList.do">공지사항</a></li>
						<li class="nav-item"><a class="nav-link" href="noticeList.do">리뷰게시판</a></li>
						<li class="nav-item"><a class="nav-link" href="noticeList.do">문의/FAQ</a></li>
					</ul>	
				</div>
			</div>
			<div class="col-lg-3"> 	
				<div class="dropdown">
			      <a href="#" class="d-flex align-items-center text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
			        <img src="https://github.com/mdo.png" alt="" width="40" height="40" class="rounded-circle me-2">
			        <strong>${sessionName }님 (${sessionId })</strong>
			      </a>
			      <ul class="dropdown-menu" aria-labelledby="dropdown02">
			        <li><a class="dropdown-item" href="memberSelect.do">마이페이지</a></li>
			        <li><a class="dropdown-item" href="logout.do">Log out</a></li>
			      </ul>
	    		</div>
			</div>
		</div>
	</nav>
</body>
</html>