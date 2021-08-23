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
 
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">

.logoimg {
	width: 300px;
	height: 232px;
 		
}
 .signIn{
   background: linear-gradient(rgba(246, 247, 249, 0.2), rgba(246, 247, 249, 0.2)), url("img/loginCheck.jpg")  center center fixed;
   background-size: cover;
   z-index: -100;
 }

.container {
    height: 100vh
}

.card {
    width: 400px;
    border: none
}
.form-control {
    border: 2px solid #bdc1d2;
    font-size: 13px;
    height: 48px
}

.form-control:focus {
    color: #495057;
    background-color: #fff;
    border-color: #f7bfd9;
    outline: 0;
    box-shadow: none
}

.form {
    position: relative;
    margin-bottom: 25px
}

.form a {
    position: absolute;
    right: 8px;
    bottom: 10px;
    color: #6ca0d6;
    font-size: 13px;
    text-decoration: none;
    z-index: 10;
    background-color: #fff;
    padding: 5px
}

.btn-main {
 	background: #00B6BC;
	color: #fff;
	border-color: #00B6BC;
}

.btn {
  font-size: 18px;
  font-size: 0.8125rem;
  font-weight: 700;
  letter-spacing: .5px;
  padding: .75rem ;
  font-family: "Exo", sans-serif;
  border-radius: 5px;
  
 
}
.line-text {
    color: #cecece
}

.line {
    background-color: #eeeff6;
    width: 166px;
    height: 2px
}




</style>

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
					} else {
						console.log(data);
						alert(data);
					}
				},
				error: function(e){
					alert("아이디 또는 비밀번호가 일치하지 않습니다.");
					console.log(e);
				}
			})
		}	
	});
});
//이메일이 잘못되었는지 확인하는 함수 

function CheckEmail(str)

{                                                 

     var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;

     if(!reg_email.test(str)) {                            

          return false;         

     }                            

     else {                       

          return true;         

     }                            

}                                

//이메일이 잘못되었는지 확인하는 함수 

function CheckEmail(str) {                                                 
    var reg_email = /^([0-9a-zA-Z_\.-]+)@([0-9a-zA-Z_-]+)(\.[0-9a-zA-Z_-]+){1,2}$/;
    if(!reg_email.test(str)) {                            
         return false;         
    } else {                       
         return true;         
    }                            
}                                

//로그인 버튼을 클릭했을 때 실행되는 함수                                 
function EmailCheck() {  
	
	var obEmail = document.getElementById("email");
	if (!obEmail.value) {             
		alert("이메일을 입력하세요!");
		obEmail.focus();	
		return;
	} else {          
		if(!CheckEmail(obEmail.value))	{
			alert("이메일 형식이 잘못되었습니다. 다시입력해주세요.");
			obEmail.focus();
			return;
		}                

	}                      

}                           
</script>
</head>
<body Class="signIn">
	<div class="container d-flex justify-content-center align-items-center">
		 <div class="card">
			<div class="row">
				<div class="shadow p-3 rounded">
					<div class="justify-content-center">
						<img src="img/OTD.png" alt="OTD사진" class="rounded mx-auto d-block logoimg"/>
					</div>
					<div class="p-2 border-top d-flex align-items-center justify-content-center">
	            		<h4>OTD 로그인</h4>
	        		</div>
					
	        		<div class="px-4 border-bottom">
	        			<form id="loginFrm" method="post" action="memberCheckIdAndPassword.do" >
	        				<div class="form-group">	
	        					<label for="InputEmail">Email address</label>
	        					<input class="form-control mb-2" type="email" id="email" name="email" required="required" placeholder="아이디">
	        				</div>
	        				<div class="form-group">
	        					<label for="InputPassword">Password</label>
	        					<input class="form-control mb-2" type="password" id="password" name="password" required="required" placeholder="비밀번호 입력">
	        				</div>
	        				
	        				<div class="form-group mb-2 d-grid gap-2 py-2">
	        					<button class="btn btn-main" type="button" id="btnLogin" onclick="javascript:EmailCheck()">로그인</button>
	        				</div>
	        				<div class="form-group mb-2 d-grid gap-2 py-2">
	        						<button class="btn btn-main" type="button" onclick="location.href='signUpForm.do'">회원가입</button>
	        				</div>
	        				<div class="form-group mb-2 d-grid gap-2">
	        						<button class="btn btn-main" type="button" onclick="location.href='home.do'">홈</button>
	        				</div>
	        			</form>
	        			 <div class="d-flex justify-content-center align-items-center mt-3 mb-3"> 
	        			 	<span class="line"></span> 
	        			 		<small class="px-2 line-text">SNS</small> 
	        			 	<span class="line"></span> 
	        			 </div>
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
	        			 	 <div class="form-group mb-2 d-grid gap-2">
	 					 	<a href="<%=apiURL%>"><img class="rounded mx-auto d-block " height="50" src="img/btnGNaver.png"/></a>
	 						</div>
	        		</div>	
				</div>
			</div>
		</div>
	</div>	
	<!-- end Container -->
		
	<!-- 네이버 로그인 -->

 
 <script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>