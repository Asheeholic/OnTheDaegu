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
	 	<a href="faqHome.do">FAQ목록</a>
	 </div>	 
	<!-- 로그인 했을때만 이용권 구매 가능 -->
	<c:if test="${not empty sessionName}">
		<input type="button" value="이용권 구매" onclick="buyTicket('${session}')">
		<input type="button" value="이용권 환불" onclick="returnTicket('${session}')">
	
		<div>
		 	${sessionName }님 환영합니다.
		</div>
	 	<div>	 		
	 		<a href="getPayHistory.do">Test 히스토리영역</a>
	 		<a href="memberSelect.do">Test 마이페이지 개인정보</a>
	 	</div>
	</c:if>

	<div>
		<a href="mapDeliverySystem.do">맵 링크</a>
		<a href="mapChoiceForm.do">대여 선택 창</a>
		<a href="mapDaoTest.do">대여 dao test창</a>
	</div>
 
 	<div>
 		<a href="signUpForm.do">Test 회원가입영역폼</a><br/>
 		<a href="loginForm.do">Test 로그인</a>
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