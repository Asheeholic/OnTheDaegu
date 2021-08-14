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
		<div><h3>공지조회</h3></div>
		<div>
			<table border="1">
				<tr>
					<th width="100">No.</th>
					<td width="70" align="center">${notice.noticeNo}</td>
					<th width="100">작성자</th>
					<td width="150" align="center">관리자</td>
					<th width="100">작성일자</th>
					<td width="150" align="center">${notice.noticeDate}</td>
					<th width="100">조회수</th>
					<td width="70" align="center">${notice.noticeHit}</td>
				</tr>
				<tr>
					<th width="100">제목</th>
					<td colspan="7">${notice.noticeTitle}</td>
				</tr>
				<tr>
					<th width="100">내용</th>
					<td colspan="7"><textarea rows="10" cols="100">${notice.noticeContent}</textarea></td>
				</tr>						
			</table>
		</div>
		<div>
			<button type="button" onclick="location.href='noticeList.do'">목록</button>
			&nbsp;&nbsp;&nbsp;
			<button type="submit" onclick="location.href='noticeUpdateForm.do?noticeNo=${notice.noticeNo}'">수정</button>
			&nbsp;&nbsp;&nbsp;
			<button type="submit" onclick="location.href='noticeDelete.do?noticeNo=${notice.noticeNo}'">삭제</button>
		</div>		
	</div>
</body>
</html>