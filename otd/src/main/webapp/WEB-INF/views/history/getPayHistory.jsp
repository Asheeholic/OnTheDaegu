<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리내역</title>
</head>
<body>
${history }
	<h1>사용 내역</h1>
	<div align="center">
		<table border="1">
		<tr>
			<th width="150">결제상품</th>
			<th width="150">이용권개시일</th>
			<th width="150">결제금액</th>
		</tr>
		
		<tr>
			<td align="center">${history.TICKET_CODE}</td>
			<td align="center">${history.TICKET_PRICE}</td>
			<td align="center">${history.TICKET_PRICE}원</td>
		</tr>
		</table>
	</div>
</body>
</html>