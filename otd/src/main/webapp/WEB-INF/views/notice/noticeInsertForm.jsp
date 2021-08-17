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
		<form id="frm" name="frm" action="noticeInsert.do" method="post">
			<!-- DataTales Example -->

			<table border="1">
				<tr>
					<th>작성자</th>
					<td>관리자</td>
				</tr>

				<tr>
					<th>글 제목</th>
					<td><input type="text" id="noticeTitle" name="noticeTitle" size="100" required="required"></td>
				</tr>
				<tr>
					<th>글 내용</th>
					<td><textarea rows="10" cols="100" id="noticeContent" name="noticeContent" required="required" placeholder="내용을 입력하세요."></textarea></td>
				</tr>
			</table>
			<br>
			<div>
				<button type="submit">등록</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" onclick="location.href='noticeList.do'">목록</button>
			</div>
		</form>
	</div>
</body>
</html>