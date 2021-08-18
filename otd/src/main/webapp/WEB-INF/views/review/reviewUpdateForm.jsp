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
		<div><h3>리뷰수정폼</h3></div>
		<div>
			<form id="frm" name="frm" action="reviewUpdate.do" method="post">
			<table border="1">
				<tr>
					<th width="90">작성자</th>
					<td width="200" align="center">${review.email}</td>
					<th width="90">별점</th>
					<td width="160" align="center">
						<input type="text" id="reviewLike" name="reviewLike" value="${review.reviewLike}" required="required">
					</td>
				</tr>
				<tr>
					<th width="90">작성일자</th>
					<td colspan="4">${review.reviewDate}</td>
				</tr>
				<tr>
					<td colspan="6" height="150">
						<textarea rows="10" cols="80" id="reviewContent" name="reviewContent">${review.reviewContent}</textarea>
					</td>
				</tr>
			</table><br>
			<input type="hidden" id="reviewNo" name="reviewNo" value="${review.reviewNo}">
			<div>
				<button type="submit">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='reviewSelect.do?reviewNo=' + ${review.reviewNo}">돌아가기</button>
			</div>
			</form>
		</div>
	</div>
</body>
</html>