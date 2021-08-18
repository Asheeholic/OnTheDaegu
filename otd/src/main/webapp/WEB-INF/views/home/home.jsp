<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function buyTicket(n) {
	frm.ticket.value=n;
	frm.submit();
}

function returnTicket(n) {
	rtf.refund.value=n;
	rtf.submit();
}
</script>
</head>
<body>
	여기가 홈이야
	<!-- 로그인 했을때만 이용권 구매 가능 -->
	<c:if test="${not empty sessionName}">
		<input type="button" value="이용권 구매" onclick="buyTicket('${session}')">
		<input type="button" value="이용권 환불" onclick="returnTicket('${session}')">

	</c:if>

	<div>${sessionName }님환영합니다.</div>

	<div>
		<a href="signUpForm.do">Test 회원가입영역폼</a><br /> 
		<a href="loginForm.do">Test 로그인</a>
	</div>
	<div id="notice" align="center">
		공지 테스트 좀 하겠습니다 <br> <a href="noticeList.do">공지목록</a>
	</div>

	<!-- 이용권 구매 세션 넘기기 -->
	<form id="frm" action="buyTicketForm.do" method="post">
		<input type="hidden" id="ticket" name="ticket">
	</form>
	
	<!-- 이용권 환불 세션 넘기기 -->
	<form id="rtf" action="returnTicketForm.do" method="post">
		<input type="hidden" id="refund" name="refund">
	</form>

</body>
</html>