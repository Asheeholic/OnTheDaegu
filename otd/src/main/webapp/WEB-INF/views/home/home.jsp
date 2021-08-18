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

 <a href="mapDeliverySystem.do">맵 링크</a>
 <a href="mapChoiceForm.do">대여 선택 창</a>
 <a href="mapDaoTest.do">대여 dao test창</a>
 <div>
 	${sessionName }님 환영합니다.
 </div>
 	<div>
 		<a href="signUpForm.do">Test 회원가입영역폼</a><br/>
 		<a href="loginForm.do">Test 로그인</a>
 		
 	</div>

 <div id="notice" align="center">
 	공지 테스트 좀 하겠습니다 <br>
 	<a href="noticeList.do">공지목록</a>
 </div>

</body>
</html>