<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
</head>
<body>
<!-- 회원 한건 조회 and 수정폼 -->
	<div>
		<h1>개인정보수정</h1>
	</div>
	<div align="center">
		<form name="frm" action="memberUpdate.do" method="post">
			<table border="1">
				<tr>
					<th width="100">아이디</th>
					<td align="center">${email }
						<input type="hidden" id="email" name="email" value='${email }'>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>