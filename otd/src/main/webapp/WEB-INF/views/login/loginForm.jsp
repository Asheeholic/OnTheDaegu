<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTD 로그인</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
/* 	function idCheck(){
		let EmailObj = $("input[name=email]");
		let PasswordObj = $("input[name=password]");
		
		if(EmailObj.val().length < 4){	
			alert("이메일 형식으로 입력해주세요");
			EmailObj.focus();
			return false;
		}	
		return ture;
	}
	
	function init(){
		//dom트리에서 id속성값이 EmailObj인 객체찾기
		var btLoginObj = $("#btnLogin");
		var formObj = $("form");	
		formObj.submit(function(){
			if(idCheck()){
				let requestURL = "login.do";
				this.action= requestURL;
				this.method='post';
				this.submit();
			
			}
		});
	}
$(init);
console.log(init); */
$(document).ready(function(){
	$('#btnLogin').click(function(){
		//let Info = new Object();
		email = $('#email').val();
		password = $('#password').val();
		let param = {"email":email, "password":password}
		if(!email || !password) {
			alert("회원 정보를 모두 입력하세요.");
		} else {
			$.ajax({
				url:"LoginServlet",
				type:"POST",
				data: param, //서블릿을 호출하면서 파라미터로 넘겨 줄 data. Object타입인 uInfo를 제이슨 문자열 형태로 바꾸어 전송.
				dataType : 'json',
				success:function(data) {
					console.log(data);
					 if(data.result = "true") {
						console.log(data);
						loginFrm.submit();
					} else{
						alert("회원정보 불일치")
					}
				},
				error: function(e){
					alert("로그인 시도 중 오류 발생");
					console.log(e);
				}
			})
		}	
	});
});
/* $(document).ready(function(){
	$('#btnLogin').click(function() {
		let email = "email=" + $('input[name=email]').val()
		let password = "password="+$('input[name=password]').val()
		$.ajax({
			type : "post",
			url : "login.do",
			data : "email" + email + "password=" +password,
			dataType : "text",
			success : function(data) { 
				if (data == 'loginFail') 
				{ alert('로그인에 실패하였습니다.') 
				} else { 
				window.location.href = 'home.do'; 
				} 
			},
			error : function(request, status, error) { 
				alert("code:" + request.status + "\n" + "error:" + error);
			}
		});
	});
}); */
</script>
</head>
<body>
	<div align="center">
		<p><img src="img/OTD.png" alt="OTD사진"/>
		<div>
			<h1>OTD 로그인</h1>
			<form id="loginFrm" method="post" action="memberCheckIdAndPassword.do">
				<table border="1">
					<tr>
						<th  width="140">로그인</th>
						<td>
							<input type="text" id="email" name="email" required="required">
						</td>
					</tr>
					
					<tr>
						<th  width="140">비밀번호</th>
						<td>
							<input type="password" id="password" name="password" required="required">
						</td>
					</tr>
				</table>
				<div>
					<button id="btnLogin">로그인</button>
				</div>
			</form>
			<br/>
			 <div class="text-center">
             	<button type="button" onclick="location.href='signUpForm.do'">회원가입</button>
             </div>
			<hr>
			<div>
				<p>API 작업 할것들</p>
			</div>
		</div>
	</div>
	
</body>

</html>