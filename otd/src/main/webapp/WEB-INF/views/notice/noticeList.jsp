<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
</head>
<body>
	<div align="center">
		<div><h3>공지목록</h3></div>
		<div>
			<c:forEach var="notice" items="${list}">
				${notice.noticeNo}, ${notice.noticeTitle}, 
				${notice.noticeContent}, ${notice.noticeDate}, ${notice.noticeHit}
			</c:forEach>
		</div>
	</div>
</body>
</html>