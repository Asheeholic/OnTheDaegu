<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<!-- bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
 <!-- Main Stylesheet -->
 <link rel="stylesheet" href="css/style.css">
<!-- icon -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
<style>
	dl, dt { margin:0; }
	dd { margin:0; display:inline; }

.page-title {
  padding: 1px;
  position: relative;
  color : #e4f4f3ff;
}	
</style>
</head>
<body>
${otd} 
<!-- 회원 한건 조회 and 수정폼 -->
	<section class="page-title bg-1"> 
	 <div class="overlay"></div>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <div class="block text-center">
          <span class="text-white">Book your Seat</span>
          <h1 class="text-capitalize mb-5 text-lg">Appoinment</h1>

          <!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Book your Seat</a></li>
          </ul> -->
        </div>
      </div>
    </div>
  </div>
</section>	
	
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
	<script src="js/bootstrap.bundle.min.js"></script>	
</body>
</html>