<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>   
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자 전용 회원 리스트</title>
<script>
function idSend(n){
	idFrm.id.value = n;
	idFrm.submit();
}
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
			</tr>
			<c:forEach var="otdList" items="${otdMemberList}">
			<tr onclick="idSend('${otdList.email}')">	
				<td>${otdList.email}</td>
				<td>${otdList.name}</td>
			</tr>	
			</c:forEach>
		</table>
	</div>
	<br/>
	<div>
		<form id="idFrm" name="idFrm" action="memberSelect.do" method="post">
			<input type="hidden" id="id" name="id">
		</form>
	</div>
</body>
</html>