<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTD 회원탈퇴</title>
</head>
<body>
	<div>
		<h1>회원 탈퇴</h1>
	</div>
	
	<div align="center">
		<h1>회원 탈퇴를 신청합니다.</h1><br/>
			<p>그동안 On the Daegu를 이용해 주셔서 감사합니다.</p>
	
		<div align="center">
			<table border="1">
				<tr>
				<td>
					<ul>
						<li>
							탈퇴 신청 즉시 회원탈퇴 처리되며, 해당 아이디의 및 회원정보는 삭제처리되며, 
							복원할 수 없습니다
						</li>
						<li>
							회원탈퇴 이후 같은 아이디로는 재가입이 불가능 합니다.
						</li>
						<li>
							이용권 기간이 남아있는 경우 즉시 탈퇴가 불가능 하오니 고객센터에 문의 바랍니다.
						</li>
					</ul>
				</td>
				</tr>
			</table>
			<br/><br/><br/>
			<hr>
			<div>
				<button class="btn btn-outline-danger" onclick="memberDeleteSend()">회원탈퇴</button>
			</div>
		</div>
	</div>
	<form name="deletefrm" action="memberDelete.do" method="post">
		<input type="hidden" id="email" name="email" value="${email}">
		<input type="hidden" id="state" name="state" value="${state}">
	</form>
<script type="text/javascript">
function memberDeleteSend(){
	
	let result = confirm("정말 삭제하시겠습니까??");
	if(result){
		//yes
	alert("회원 탈퇴가 완료 되었습니다.");	
	deletefrm.submit();		
	} else{
		//no
	}
}

</script>	
</body>
</html>