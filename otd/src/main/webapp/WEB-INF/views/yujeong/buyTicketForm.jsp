<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<style>
.bg-1 {
	background: url("img/payForm.png") no-repeat 50% 50%;
	background-size: 100%;
	height: 370px;
	position: relative;
}

body {
	line-height: 1.6;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	font-size: 16px;
	color: #6F8BA4;
	font-weight: 400;
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
	background: #223a66;
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
	background: #223a66;
	color: #fff;
	border-color: #223a66;
}

.btn-round-full {
	border-radius: 50px;
}

table, th, td {
	border: solid 1px #223a66;
	border-collapse: collapse;
	padding: 5px;
}
table {
margin : auto;
}
th {
	text-align: center;
}
td {
padding-left:10px;
}
.check {
margin-left:12%;
}
</style>

<title>buy ticket</title>
<script>
	function checkAll() {
		if (document.getElementById("chAll").checked == true) { //id 를 사용하여 하나의 객체만을 호출
			for (var i = 0; i < 3; i++)
				document.getElementsByName("checkBox")[i].checked = true; //name 을 사용하여 배열 형태로 담아 호출
		}
		if (document.getElementById("chAll").checked == false) {
			for (var i = 0; i < 3; i++)
				document.getElementsByName("checkBox")[i].checked = false;
		}
	}
</script>
</head>
<body>
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

	<section class="contact-form-wrap section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="text-md mb-2">이용권 구매</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5">OTD를 통해 일상 속의 힐링을 만나보세요.</p>
					</div>
				</div>
			</div>
			<div class="row">
				<div class="col-lg-12 col-md-12 col-sm-12">
					<form class="contact__form" id="frm" name="frm" action="payment.do" method="post">
						<input type="hidden" id="pays" name="pays">
						<div class="row">
							<div class="col-lg-12">
								<div class="form-group">
									<table>
										<tr>
											<th width="200">성 명</th><td colspan="4">${sessionName}</td>
										</tr>
										<tr>
											<th width="200">휴대폰 번호</th><td colspan="2">${sessionPhone}</td>
											<th width="200">이메일</th><td colspan="2">${sessionEmail}</td>
										</tr>
										<tr>
											<th width="200">이용권</th><td colspan="2"><select name="ticket">
												<option value="">선택</option>
												<option value="1000">30분(1,000원)</option>
												<option value="2000">1시간(2,000원)</option>
												<option value="3500">2시간(3,500원)</option>
												<option value="7000">4시간(7,000원)</option>
												<option value="10000">8시간(10,000원)</option>
												<option value="15000">12시간(15,000원)</option>
												<option value="25000">24시간(25,000원)</option>
											</select></td>
											<th width="200">결제수단</th>
											<td colspan="2">
											<label><input type="radio" name="pay" value="card">신용/체크카드</label>
												&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
											<label><input type="radio" name="pay" value="trans">자동이체</label></td>
										</tr>
										<tr>
											<th width="200">결제안내</th>
											<td colspan="5">신용/체크카드 결제 시, 카드사 혹은 해당 은행의 결제 이용 시간에 따라 결제가 지연되거나, 거부될 수 있습니다.<br>
											해당 정보는 각 카드사/은행 홈페이지에서 별도로 확인 부탁드립니다.<br>
											<p style="font-weight: bold">
											<font color="red">*</font>구매하신 이용권에 해당하는 사용시간 이후에 반납처리가 되면 추가결제가 발생할 수 있습니다.<br> 
											<font color="red">*</font>이용권 미이용에 의한 환불처리 시 결제하신 수단으로 환불됨을 알려드립니다.
												</p>
											</td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div class="check">
							<label><input type="checkbox" id="chAll" name="chAll" value="selectAll">전체동의</label><br>
							<label><input type="checkbox" name="agreement" value="addPay" required>추가요금 자동 결제 동의</label><br>
							<label><input type="checkbox" name="agreement" value="refund" required>환불 규정 동의</label><br>
							<label><input type="checkbox" name="agreement" value="service" required>서비스 이용약관 동의</label><br>
							<label><input type="checkbox" name="agreement" value="personal" required>개인정보 수집 및 이용 동의</label><br>
							<label><input type="checkbox" name="agreement" value="personal2" required>수집한 개인정보의 제 3자 정보제공 동의</label><br>
							<label><input type="checkbox" name="agreement" value="location" required>위치기반 서비스 이용 약관 동의</label><br>
						</div>
					</form>
					<div class="text-center">
						<input class="btn btn-main btn-round-full" type="submit"
							value="결 제 하 기"> <i class="icofont-simple-right ml-2"></i>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>