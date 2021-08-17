<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
 여기가 홈이야
	 <div id="notice" align="center">
	 	공지 테스트 좀 하겠습니다 <br>
	 	<a href="noticeList.do">공지목록</a>
	 </div>
	 <div id="review" align="center">
	 	리뷰 테스트 좀 하겠습니다 <br>
	 	<a href="reviewList.do">리뷰목록</a>
	 </div>
	 <div id="event" align="center">
	 	이벤트 테스트 좀 하겠습니다 <br>
	 	<a href="eventList.do">이벤트목록</a>
	 </div>	 
	 <div id="faq" align="center">
	 	FAQ 테스트 좀 하겠습니다 <br>
	 	<a href="faqSelectListHome.do">FAQ목록</a>
	 </div>	 

 <div>
 	${sessionName }님 환영합니다.
 </div>
 	<div>
 		<a href="signUpForm.do">Test 회원가입영역폼</a><br/>
 		<a href="loginForm.do">Test 로그인</a>
 	</div>
</body>
</html>