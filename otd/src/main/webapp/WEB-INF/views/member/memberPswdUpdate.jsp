<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>비밀번호 변경</title>
</head>
<body>
<div>
	<h1>비밀번호 변경</h1>
</div>
	<div align="center">
		<form id="passfrm" name="passfrm" action="memberPswdUpdate.do" method="post" onsubmit="memberPassUpdate();">
			<table border="1">
				<tr>
					<th>현재비밀번호</th>
					<td align="center">${password}
						<input type="hidden" name="password" id="password" value="${password }">
					</td>	
					
				</tr>
				<tr>
					<th>새 비밀번호 </th>
					<td align="center">
						<input type="password" name="newPass" id="newPass">
					</td>
				</tr>
					<tr>
					<th>새 비밀번호 확인</th>
					<td align="center">
						<input type="password" name="newPassCkeck" id="newPassCkeck">
					</td>
				</tr>		
			</table>
			<div>
			<input type="submit" value="비밀번호 변경" >
				<input type="text" name="email" id="email" value="${email}">
			</div>
		</form>
	</div>
<script type="text/javascript">
function memberPassUpdate(){
	if(document.getElementById('newPass').value !='' && document.getElementById('newPassCkeck').value!=''){
        if(document.getElementById('newPass').value != document.getElementById('newPassCkeck').value){
        	 alert("비밀번호가 일치하지않습니다 다시 확인해주세요");
        	 return false;
        } else {
        	location.reload();
              alert("비밀번호 변경 완료");
             return true; 
        }
    }
	
}
</script>
</body>
</html>