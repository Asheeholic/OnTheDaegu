<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
<!-- bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
 <!-- Main Stylesheet -->
 <link rel="stylesheet" href="css/style.css">
 <!-- Icon Font Css -->
 <link rel="stylesheet" href="css/icofont.min.css">
 <style>
.logoimg {
	width: 300px;
	height: 232px;
 		
}
.signUp{
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
.btn-idCheck{
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

	
function check_pw(){
		  
	if(document.getElementById('password').value !='' && document.getElementById('passcheck').value!=''){
	    if(document.getElementById('password').value == document.getElementById('passcheck').value){
	       alert("비밀번호가 일치합니다.");
	    }
	    else{
	       alert("비밀번호가 일치하지가 않습니다. 다시 확인해주세요.");
	    }
	}
}

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
<body class="signUp">
 	<div class="container d-flex justify-content-center align-items-center">
		<div class="card">
			<div class="row">
				<div class="shadow p-3 rounded">
					<div class="justify-content-center">
						<p><img src="img/OTD.png" alt="OTD사진" class="rounded mx-auto d-block logoimg"/></p>
					</div>
					<div class="p-2 border-top d-flex align-items-center justify-content-center">
	            		<h4>회원 가입</h4>
	        		</div>
					
	        		<div class="px-4 ">
	        			<form id="frm" name="frm" action="memberInsert.do" method="post" onsubmit="SignUp();" >
	        				<!-- 이메일 입력 시작 -->
	        				<div class="form-group">
			        					<label for="InputEmail">Email address</label>
	        					<div class="row">
		        					<div class="col-9">
			        					<input class="form-control mb-2" onchange="EmailCheck()" type="email" id="email" name="email"
											placeholder="이메일 형식으로 입력해주세요" required="required" size="25" >
		        					</div>
		        					<div class="col-3	 d-grid gap-2 d-md-block">
										<input class="btn btn-idCheck" type="button" value="중복확인" id="loginCheck" name="loginCheck">	
		        					</div>
	        					</div>			
	        				</div>
	        				<!-- 이메일 입력 끝 -->
	        				
	        				<!-- 비밀번호 start -->
	        				<div class="form-group">
	        					<label for="InputPassword">비밀번호</label>
	        					<input class="form-control mb-2" type="password" id="password" name="password" required="required" placeholder="비밀번호 입력">
	        				</div>
	        				<!-- 비밀번호 end -->
	        				
	        				<!-- 비밀번호확인 start -->
	        				<div class="form-group">
	        					<label for="InputPassword">비밀번호 확인</label>
	        					<input class="form-control mb-2" onchange="check_pw()"  type="password" id="passcheck" name="passcheck" placeholder="비밀번호확인 입력" required="required" size="25" >
	        				</div>
	        				<!-- 비밀번호확인 end -->
	        				
	        				<!-- 이름 start -->
	        				<div class="form-group">
	        					<label for="InputPassword">이름</label>
	        					<input class="form-control mb-2" type="text" id="name" name="name" placeholder="이름 입력" size="25">
	        				</div>
	        				<!-- 이름 end -->
	        				
	        				<!-- 전화번호 start -->
	        				<div class="form-group">
	        					<label for="InputPassword">전화번호</label>
	        					<input class="form-control mb-2" type="text" id="phone" name="phone" placeholder="'-없이 입력해주세요" size="25">
	        				</div>
	        				<!-- 전화번호 start -->
	        				
		        			 <div class="d-flex justify-content-center align-items-center mt-3"> 
		        			 	<span class="line"></span> 
		        			 		<small class="px-2 line-text">OTD</small> 
		        			 	<span class="line"></span> 
		        			 </div>
		        			 <div class="form-group">
		        			 	<div class="row align-items-center">
		        			 		<div class="col-6 d-flex justify-content-center">
		        			 			<input class="btn btn-idCheck" type="submit" value="회원가입">
		        			 		</div>
		        			 		<div class="col-6 d-flex justify-content-center">
		        			 			<input class="btn btn-idCheck" type="button" value="로그인" onclick="location.href='loginForm.do'">        			 		
		        			 		</div>
		        			 	</div>
		        			 </div>	
        				</form>
        			</div>	
				</div>
			</div>
		</div>
	</div>

<script type="text/javascript">
	function SignUp() {
		alert("회원가입이 완료 되었습니다.");
		frm.submit();
	}
</script>
					

					
	
<script src="js/bootstrap.bundle.min.js"></script>
</body>
</html>