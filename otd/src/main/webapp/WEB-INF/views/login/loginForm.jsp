<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTD 로그인</title>
<!-- bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
 <!-- Main Stylesheet -->
 <link rel="stylesheet" href="css/style.css">
 <!-- Icon Font Css -->
 <link rel="stylesheet" href="css/icofont.min.css">
 <script src="js/bootstrap.bundle.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
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

</script>
</head>
<body>
	<div class="container">
		<div class="row d-flex justify-content-center">
			<div class="shadow-sm p-3 mb-5 rounded">
				<div>
					<a>dddd</a>
				</div>
			</div>
		</div>
	</div>
		<p><img src="img/OTD.png" alt="OTD사진"/></p>
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
	<!-- 네이버 로그인 -->
<%
    String clientId = "XjyzBLVySugG2fqLKRlQ";//애플리케이션 클라이언트 아이디값";
    String redirectURI = URLEncoder.encode("http://localhost/otd/naverLoginCallback.do", "UTF-8");
    SecureRandom random = new SecureRandom();
    String state = new BigInteger(130, random).toString();
    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code"; //네이버 아이디로 로그인 인증을 요청합니다.
    apiURL += "&client_id=" + clientId;
    apiURL += "&redirect_uri=" + redirectURI;
    apiURL += "&state=" + state;
    session.setAttribute("state", state);
 %>
 <div align="center">
  <a href="<%=apiURL%>"><img height="50" src="img/btnGNaver.png"/></a>
 </div>
</body>

</html>