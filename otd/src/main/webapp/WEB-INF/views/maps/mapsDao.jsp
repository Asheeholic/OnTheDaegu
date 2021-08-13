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
	<h1>test</h1>
	<h3>${list[0].parkLocation }</h3>
	<c:forEach var="zone" items="${list }">
		${zone.parkLocation }<br>
	</c:forEach>
</body>
</html>