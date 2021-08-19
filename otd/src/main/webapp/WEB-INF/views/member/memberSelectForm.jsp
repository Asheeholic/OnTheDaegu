<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<style>
	dl, dt { margin:0; }
	dd { margin:0; display:inline; }
</style>
</head>
<body>
${otd} 
<!-- 회원 한건 조회 and 수정폼 -->
	<div>
		<h1>개인정보수정</h1>
	</div>
	<div align="center">
		<dl>
			<dd style="width:25%">
				<a href="javascript:memberDelete();">회원탈퇴</a>
			</dd>
		</dl>
		
		
	</div>
	<div align="center">
		<form name="updatefrm" action="memberUpdate.do" method="post" onsubmit="memberUpdate();">
			<table border="1">
				<tr>
					<th width="150">아이디</th>
					<td align="center" width="200">${otd.email }</td>
				</tr>
				<tr>
					<th width="150">비밀번호</th>
					<td align="center" width="200">
						<input type="button" id="password" name="button" value="비밀번호 변경" onclick="memberPswdUpdateForm();">			
					</td>
				</tr>
				<tr>
					<th width="150">이름</th>
					<td align="center" width="200">${otd.name }
					</td>
				</tr>
				<tr>
					<th width="150">전화번호</th>
					<td align="center" width="200">
						<input class="form-control" type="text" id="phone" name="phone" value='${otd.phone}'>
					</td>
				</tr>
			</table>
			<br/>
			<div>
				<input type="submit" value="회원 수정" >
				<input type="hidden" id ="email" name ="email" value='${otd.email}'>
				<input type="hidden" id ="password" name ="password" value='${otd.password}'>
			</div>
		</form>
	</div>
 	<div><!--비밀번호 변경폼 가기 -->
 		<form name="pswdfrm" action="memberPswdUpdateForm.do" method="post">
 			<input type="hidden" id ="email" name ="email" value='${otd.email}'>
 			<input type="hidden" id ="password" name ="password" value='${otd.password}'>
 		</form>
 	</div>
 	<!-- 삭제폼으로 가기 -->
 	<div>
 		<form name="deletefrm" action="deleteForm.do" method="post">
			<input type="hidden" id="email" name="email" value="${otd.email}">
			<input type="hidden" id="state" name="state" value="${otd.state}">
			 		
 		</form>
 	</div>
  	<script type="text/javascript">
		function memberUpdate(){
			if(confirm("정말로 수정하시겠습니까?")){
			alert("수정이 완료되었습니다.");
			updatefrm.submit();
			} else {
				location.reload();
			}
		}
		function memberPswdUpdateForm(){
			pswdfrm.submit();
		}
		function memberDelete(){
			deletefrm.submit();
		}
	</script>	
</body>
</html>