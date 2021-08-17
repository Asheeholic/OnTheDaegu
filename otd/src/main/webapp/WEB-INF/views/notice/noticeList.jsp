<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
	<script type="text/javascript">
		function getRecord(n) {
			frm.noticeNo.value = n;
			frm.submit();
		}
	</script>
</head>
<body>
	<div align="center">
		<div><h3>공지목록</h3></div>
		<div>
			<table border="1">
				<tr>
					<th width="70">No.</th>
					<th width="250">제목</th>
					<th width="90">작성자</th>
					<th width="90">작성일자</th>
					<th width="90">조회수</th>
				</tr>
			<c:forEach var="notice" items="${list}">
				<tr onclick="getRecord(${notice.noticeNo})">
					<td align="center">${notice.noticeNo}</td>
					<td>${notice.noticeTitle}</td>
					<td align="center">관리자</td>
					<td align="center">${notice.noticeDate}</td>
					<td align="center">${notice.noticeHit}</td>
				</tr>
			</c:forEach>				
			</table>		
		</div>
		<div>
			<button type="button" onclick="location.href='home.do'">HOME</button>
			&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
		</div>
		<form id="frm" name="frm" action="noticeSelect.do" method="post">
			<input type="hidden" id="noticeNo" name="noticeNo">
		</form>	
	</div>
</body>
</html>