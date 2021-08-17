<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용 회원 리스트</title>
<script>

</script>
</head>
<body>
	<div align="left">
		<h1>회원리스트</h1>
	</div>
	<hr>	
	<div align="center">
		<table border="1">
			<tr>
				<th>아이디</th>
				<th>이름</th>
				<th>회원정보</th>			
			</tr>
			<c:forEach var="otd" items="${otdMemberList}">
			<tr onclick="memberInfoSend('${otd.email}')">	
				<td>${otd.email}</td>
				<td>${otd.name}</td>
				<td>${otd.author}</td>
			</tr>	
			</c:forEach>
		</table>
	</div>
	<br/>
	<div>
		<!-- 수정폼으로 -->
		<form id="selectFrm" name="selectFrm" action="memberSelectForm.do" method="post">
			<input type="hidden" id ="email" name ="email" value='${otd.email }'>
			<input type="hidden" id ="password" name="password" value='${otd.password }'>
			<input type="hidden" id = "name"  name="name" value='${otd.name }' >
			<input type="hidden" id ="phone" name ="phone" value='${otd.phone }'>
		</form>
	</div>
<script type="text/javascript">
function memberInfoSend(n){
	selectFrm.email.value = n;
	selectFrm.submit();
}
</script>
</body>
</html>