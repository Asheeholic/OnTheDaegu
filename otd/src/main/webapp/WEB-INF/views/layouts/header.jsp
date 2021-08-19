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
	헤더
	<header>
		<c:if test="${not empty sessionEmail }">
			 <div>
			 	<button type="button" class="btn btn-warning" onclick="location.href='logout.do'">로그아웃</button>
			 </div>
		 </c:if>
	 </header>
</body>
</html>