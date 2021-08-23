<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>OTD 회원탈퇴</title>
<style>
.bg-1 {
	background: url("img/payForm.png") no-repeat 50% 50%;
	background-size: 100%;
	height: 370px;
	position: relative;
	z-index: -50;
}
	
.btn {
	display: inline-block;
	font-size: 20px;
	font-size: 0.8125rem;
	font-weight: 1000;
	letter-spacing: .5px;
	padding: .75rem 2rem;
	font-family: "Exo", sans-serif;
	text-transform: uppercase;
	border-radius: 5px;
	border: 2px solid transparent;
	transition: all .35s ease;
}

.btn-main {
	background: #00B6BC;
	color: #fff;
	border-color: #00B6BC;
}

.btn-round-full {
	border-radius: 50px;
}

.overlay:before {
  content: "";
  position: absolute;
  left: 0;
  top: 0;
  bottom: 0;
  right: 0;
  width: 100%;
  height: 100%;
  opacity: 0.9;
  background: #00b6bc;
  z-index: -1;
}


table, th, td {
	border : solid 1px lightGray;
	border-collapse: collapse;
	padding: 5px;
}
table {
	margin : auto;
	padding: 0;
    width: 100%;
    border: 0 solid #00478f !important;
    border-radius: 40px !important;
    border-spacing: 0;
    border-collapse: separate;
}
th {
	
	text-align: center;
}
td {

	padding-left:10px;
}
.text-white {
	z-index: 10;
}

.section-title h2 { 
	color : #000000;
}

.tableHeader {
	background: #00B6BC;
	
}
.memberCard {
	padding: 0;
    width: 100%;
    border: 0px solid #00478f !important;
    border-radius: 40px !important;
    border-spacing: 0;
    border-collapse: separate;
}
.deleteText {
	color: red;
}
</style>
</head>
<!-- 회원 한건 조회 and 수정폼 -->
	<section class="page-title bg-1">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
						<h1 class="text-capitalize mb-5 text-lg">OTD와 함께하는 건강한 일상</h1>
						<span class="text-white">OTD는 대구도시지하철도공사와 함께 합니다.</span>
					</div>
				</div>
			</div>
		</div>
	</section>
	<section class="section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2 text-danger">회원탈퇴</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
			<div class="d-flex justify-content-center mb-4">
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active h4 mx-2">
						<a href="memberSelect.do" class="btn btn-main btn-round-full">마이페이지</a>
					</li>
				</ul>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active h4 mx-2">
						<a href="javascript:memberDelete();" class="btn btn-main btn-round-full">회원탈퇴</a>
					</li>
				</ul>
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active h4 mx-2">
						<a href="getPayHistory.do" class="btn btn-main btn-round-full">결제내역</a>
					</li>
				</ul>
			</div>
		
	
			
			<div class="d-flex justify-content-center py-3">
				<div class="row">
					<div class="h1"> 
						<a class="text-danger">회원 탈퇴</a>를 신청합니다.
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="row">
					<div class="h4">
						<p>그동안 On the Daegu를 이용해 주셔서 감사합니다.</p>
					</div>
				</div>
			</div>
			
			<div class="d-flex justify-content-center">
				<div class="card shadow mb-4">
	 				 <div class="card-body">
	   					 <ul class="list-group">
							<li class="list-group-item">
								탈퇴 신청 즉시 회원탈퇴 처리되며, 해당 아이디의 및 회원정보는 삭제처리되며, 
								복원할 수 없습니다
							</li>
							<li class="list-group-item">
								회원탈퇴 이후 같은 아이디로는 재가입이 불가능 합니다.
							</li>
							<li class="list-group-item">
								이용권 기간이 남아있는 경우 즉시 탈퇴가 불가능 하오니 고객센터에 문의 바랍니다.
							</li>
						</ul>
	  				</div>
				</div>
			</div>
			<div class="d-flex justify-content-center">
				<div class="d-grid gap-2 col-2	 mx-auto">
					<button class="btn btn-danger" onclick="memberDeleteSend()">회원탈퇴</button>
				</div>
			</div>
			<form name="deletefrm" action="memberDelete.do" method="post">
				<input type="hidden" id="email" name="email" value="${email}">
				<input type="hidden" id="state" name="state" value="${state}">
			</form>	
		</div>
	</section>	
		<!-- 컨테이너 종료 -->
		

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