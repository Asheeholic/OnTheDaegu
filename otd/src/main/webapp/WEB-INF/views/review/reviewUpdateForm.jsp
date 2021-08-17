<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>입력</h3>
	<div id="insert">
		<form id="frm" action="reviewUpdate.do" method="post">
			<table border="1">
				<tr>
					<th width="90">작성자</th>
					<td width="200"><input type="text" id ="email" name ="email" value="세션활용이메일"></td>
					<th width="90">별점</th>
					<td width="130"><input type="text" id ="reviewLike" name ="reviewLike" required="required"></td>
				</tr>
				<tr>
					<td colspan="4" height="150">
						<textarea rows="9" cols="70" id = "reviewContent" name ="reviewContent" required="required"></textarea>
					</td>
				</tr>
			</table>
		   <br>
		   <input type="submit" value="수정">&nbsp;&nbsp;&nbsp;<input type="reset" value="취소">
		</form>	
	</div>
</body>
</html>