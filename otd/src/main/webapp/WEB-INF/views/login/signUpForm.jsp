<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
/* 	function onlyNumber() {
		if ((event.keyCode < 48) || (event.keyCode > 57))
			event.returnValue = false;
	}

	function CheckForm() {
		if (document.getElementById("txtMobile1").value == "") {
			window.alert("휴대폰 번호를 선택하시오.");
			return false;
		}
		if (document.getElementById("txtMobile2").value.length != 4) {
			window.alert("가운데 번호는 4자리로 입력하세요");
		}
	} */
 $(document).ready(function(){
	$('#loginCheck').click(function(){
		let sendData = "email="+$('input[name=email]').val()
		$.ajax({
			type:'post',
			url:'idCheck.do', //데이터를 주고받을 파일 주소 입력,
			data: sendData, //보내는 데이터
			dataType: 'text',
			success: function(data){   //데이터 주고받기 성공했을 경우 실행할 결과
	            //function(data)를 쓰게 되면 전달받은 데이터가 data안에 담아서 들어오게 된다. 
				alert(data);   
				console.log(data);
			},
			error:function(){   //데이터 주고받기가 실패했을 경우 실행할 결과
				alert('실패');
			}

		});
	});
});


	
</script>
</head>
<body>
	<!-- 회원가입 폼 영역 -->
	<div align="center">
		<h1>회원가입</h1>
		<div>
			<form id="frm" name="frm" action="memberInsert.do" method="post">
				<table border="1">

					<tr>
						<th width="140">아이디</th>
						<td>
							<input type="text" id="email" name="email"
								placeholder="이메일 형식으로 입력해주세요" required="required" size="25">
							<input type="button" value="중복확인" id="loginCheck" name="loginCheck">	
						</td>
					</tr>

					<tr>
						<th width="140">비밀번호</th>
						<td>
							<input type="password" id="password" name="password"
								placeholder="비밀번호 입력" required="required" size="25">
						</td>
					</tr>

					<tr>
						<th width="140">비밀번호 확인</th>
						<td>
							<input type="password" id="passcheck" name="passcheck"
								placeholder="비밀번호확인 입력" required="required" size="25">
						</td>
					</tr>

					<tr>
						<th width="140">이름</th>
						<td><input type="text" id="name" name="name" placeholder="이름 입력" size="25"></td>
							
					</tr>

					<tr>
						<th width="140">전화번호</th>
						<td>
							<input type="text" id="phone" name="phone" placeholder="'-없이 입력해주세요" size="25">
						</td>
					</tr>
				</table>
				<br />
				<div>
					<input type="submit" value="회원가입">&nbsp;&nbsp;&nbsp;&nbsp;
					<input type="reset" value="취소">
				</div>
			</form>
		</div>
	</div>
</body>
</html>