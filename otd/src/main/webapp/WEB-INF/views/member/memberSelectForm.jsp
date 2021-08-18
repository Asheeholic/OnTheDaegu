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
		<form name="frm" action="memberUpdate.do" method="post" onsubmit="memberUpdate();">
			<table border="1">
				<tr>
					<th width="100">아이디</th>
					<td align="center">${otd.email }</td>
				</tr>
				<tr>
					<th width="100">비밀번호</th>
					<td align="center">
						<input type="button" id="password" name="button" value="비밀번호 변경" onclick="">			
					</td>
				</tr>
				<tr>
					<th width="100">이름</th>
					<td align="center">${otd.name }
					</td>
				</tr>
				<tr>
					<th width="100">전화번호</th>
					<td align="center">${otd.phone}
					</td>
				</tr>
			</table>
			<br/>
			<div>
				<input  type="submit" value="회원 수정" >
			</div>
		</form>
	</div>
	<script type="text/javascript">
		function memberUpdate(){
			alert("수정이 완료되었습니다.");
			frm.submit();
		}
	</script>	
</body>
</html>