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
	<div align="center">
		<div><h3>리뷰조회</h3></div>
		<div>
			<table border="1">
				<tr>
					<th width="90">작성자</th>
					<td width="200" align="center">${review.email}</td>
					<th width="90">별점</th>
					<td width="160" align="center">${review.reviewLike}</td>
				</tr>
				<tr>
					<th width="90">작성일자</th>
					<td colspan="4">${review.reviewDate}</td>
				</tr>
				<tr>
					<td colspan="6" height="150">${review.reviewContent}</td>
				</tr>
			</table><br>
			<div>
				<button type="button" onclick="location.href='reviewList.do'">목록</button>
				<c:if test="${review.email == sessionEmail}">
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='reviewUpdateForm.do?reviewNo=' + ${review.reviewNo}">수정</button>
					&nbsp;&nbsp;&nbsp;
					<button type="button" onclick="location.href='reviewDelete.do?reviewNo=' + ${review.reviewNo}">삭제</button>
				</c:if>
			</div>
		</div>
	</div>
</body>
</html>