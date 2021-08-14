<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div align="center">
		<div><h3>공지목록</h3></div>
		<div>

				${notice.noticeNo}, ${notice.noticeTitle}, 
				${notice.noticeContent}, ${notice.noticeDate}, ${notice.noticeHit}
		</div>
	</div>
</body>
</html>