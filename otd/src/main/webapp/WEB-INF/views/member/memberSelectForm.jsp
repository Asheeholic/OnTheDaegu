<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>개인정보수정</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style>
	dl, dt { margin:0; }
	dd { margin:0; display:inline; }
	
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
	border: 1px solid transparent;
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
 #btnpass {
 	 width: 100%;
  	 height: 100%;
 }

table, th, td {
	border: solid 1px lightGray;
	border-collapse: collapse;
	padding: 1px;
	
}
.btn-gopass{
	display: inline-block;
	font-size: 20px;
	font-size: 0.8125rem;
	font-weight: 1000;
	letter-spacing: .5px;
	padding: .30rem rem;
	font-family: "Exo", sans-serif;
	text-transform: uppercase;
	border: 0px solid transparent;
	border-radius: 5px;
	transition: all .35s ease;
}
table {
	margin: auto;
}

th {
	text-align: center;
	
}

td {
	padding-left: 10px;
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

</style>
</head>
<body class="body" >

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
						<h2 class="mb-2">마이 페이지</h2>
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
				<ul class="navbar-nav mr-auto">
					<li class="nav-item active h4 mx-2">
						<a href="reviewList.do?pageNum=1&amount=5" class="btn btn-main btn-round-full">리뷰게시판</a>
					</li>
				</ul>
			</div>
			
			<div class="row">
				<div class="col-2"></div>
				<div class="col-8">
					<div class="card shadow mb-4 memberCard">
						<form name="updatefrm" action="memberUpdate.do" method="post">
	            			<div class="card-body my-3">
	            				<div class="card-header py-3 tableHeader">
	            					<h6 class="m-0 font-weight-bold"></h6>
	            				</div>
	            				<div class="d-flex justify-content-end">
	            					<span class="h3 text-warning" id="time">남은시간:</span>
	            				</div>
					            	
									<table class="table table-bordered ">
										<tr class="">
											<th class="">아이디</th>
											<td>${otd.email }</td>
										</tr>
										<tr>
											<th class="">비밀번호</th>
											<td>
												<input class="btn-gopass btn-main" type="button" id="password" name="button" value="비밀번호 변경" onclick="memberPswdUpdateForm();">			
											</td>
										</tr>
										<tr>
											<th class="">이름</th>
											<td>${otd.name }
											</td>
										</tr>
										<tr>
											<th class="">전화번호</th>
											<td>
												<input class="form-control" type="text" id="phone" name="phone" value='${otd.phone}'>
											</td>
										</tr>
									</table>
									<div class="d-flex justify-content-center">
										<input class="btn btn-main" type="button" value="회원 수정" onclick='memberUpdate()'>
										<input type="hidden" id ="email" name ="email" value='${otd.email}'>
										<input type="hidden" id ="password" name ="password" value='${otd.password}'>
									</div>
								</div>	
								</form>
								</div>
							</div>
								<div class="col-2"></div>
						</div>
			<!-- card end -->
			
		 	<div><!--비밀번호 변경폼 가기 -->
		 		<form name="pswdfrm" action="memberPswdUpdateForm.do" method="post">
		 			<input type="hidden" id ="email" name ="email" value='${otd.email}'>
		 			<input type="hidden" id ="password" name ="password" value='${otd.password}'>
		 		</form>
		 	</div>
	 	</div>
 	</section>
 	<!-- 삭제폼으로 가기 -->
 	<div>
 		<form name="deletefrm" action="deleteForm.do" method="post">
			<input type="hidden" id="email" name="email" value="${otd.email}">
			<input type="hidden" id="state" name="state" value="${otd.state}">
			 		
 		</form>
 	</div>
  	<script type="text/javascript">
		function memberUpdate(){
			let result = confirm("정말로 수정 하시겠습니까??");
			if(result){
				
			alert("수정이 완료되었습니다.");
			updatefrm.submit();
			
			} else {
				//NO!
				return;
			}
		}
		function memberPswdUpdateForm(){
			pswdfrm.submit();
		}
		function memberDelete(){
			deletefrm.submit();
		}
		
		$(window).on('load', function() {
			
			// 시간 보여주는 메소드 (제발 재사용 많이 해주세요)
			$.ajax({
				url:"LeftTimeShowServlet",
				type:'get',
				data:{
					email: "${session.email}"
				},
				dataType: 'json',
				success: function(result) {
					console.log(result);
					calculrateTime(result);
				},
				error: function(e) {
					console.error(e);
				}
			})
			
			function calculrateTime(result) {
				let now = new Date();
				let boughtTime = new Date(result.dateBought);
				
				console.log(boughtTime);
				if(result.ticketTime == "30분") {
					boughtTime.setMinutes(boughtTime.getMinutes() + 30);
				} else if (result.ticketTime == "1시간"){
					boughtTime.setHours(boughtTime.getHours() + 1);
				} else if (result.ticketTime == "2시간"){
					boughtTime.setHours(boughtTime.getHours() + 2);
				} else if (result.ticketTime == "4시간"){
					boughtTime.setHours(boughtTime.getHours() + 4);
				} else if (result.ticketTime == "8시간"){
					boughtTime.setHours(boughtTime.getHours() + 8);
				} else if (result.ticketTime == "12시간"){
					boughtTime.setHours(boughtTime.getHours() + 12);
				} else if (result.ticketTime == "24시간"){
					boughtTime.setHours(boughtTime.getHours() + 24);
				}
				
				console.log(boughtTime);
				if(boughtTime - now > 0) {
					let i = 0;
					let start = setInterval(function() {
						// 시간 대충 2시간이라 하면
						let time = Math.floor((boughtTime.getTime()-now.getTime())/1000) - i;
						// 1초 마다 까지고 초기화 하면됨.
						time = Math.floor((time/60)/60) + "시간" 
								+ Math.floor((time/60)%60) + "분"
								+ Math.floor(time%60) + "초";
						$("#time").text(time);
						i += 1;
					}, 1000)
				} 
			}
		});
		
	</script>
</body>
</html>