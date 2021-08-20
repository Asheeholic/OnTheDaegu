<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리내역</title>
</head>
<body>

	<h1>사용 내역</h1>
	<div align="center">
		<table border="1">
		<tr>
			<th width="150">결제상품</th>
			<th width="200">이용권개시일</th>
			<th width="150">결제금액</th>
		</tr>
			<c:forEach var="history" items="${history}">
		<tr>
			<td align="center">${history.TICKET_CODE}</td>
			<td align="center">${history.HISTORY_DATE}</td>
			<td align="center">${history.TICKET_PRICE}원</td>
		</tr>
			</c:forEach>
		</table>
	</div>
</body>
</html>