<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<style>
.bg-1 {
	background: url("img/payForm.png") no-repeat 50% 50%;
	background-size: 100%;
	height: 370px;
	position: relative;
	z-index: -50;
}

body {
	line-height: 1.6;
	font-family: "Roboto", sans-serif;
	-webkit-font-smoothing: antialiased;
	font-size: 16px;
	color: #000000;
	font-weight: 400;
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
	border-radius: 5px;
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

.card-header {
 	background: #00b6bc;
}

.section-title h2 { 
color : #000000;
}
</style>

<title>buy ticket</title>
<script>
$(document).ready(function(){
	
	// 폼전송 버튼 누르면 실행할 이벤트, 기능 정의
	$('.btn').on('click', function(event){
		event.preventDefault();
		paymentFnc();
	})
	function paymentFnc() {

	let ticketSelect = $('#ticket').val();
	let payment = document.querySelector('input[name="pay"]:checked').value;
	data.payment_price.value = ticketSelect;
	data.payment_method.value = payment;
	
	IMP.init('imp24006420');
	
	IMP.request_pay({
		pg : 'inicis', // version 1.1.0부터 지원.
		pay_method : payment,
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '${sessionName}',
		amount : ticketSelect, //판매 가격
		buyer_email : '${sessionEmail}',
		buyer_name : '${sessionName}',
		buyer_tel : '${sessionPhone}',
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
			alert(msg);
			// 그 다음 실행
			data.submit();
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}

	});
	}
	});
	
/* function selectAll(selectAll)  {
	  const checkboxes = document.getElementsByName('agreement');
	  	checkboxes.forEach((checkbox) => {
	    	checkbox.checked = selectAll.checked;
	  })
	} */
//체크박스 전체 선택

</script>
</head>
<body>
	<section class="page-title bg-1">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
						<h1 class="text-capitalize mb-5 text-lg">OTD와 함께하는 건강한 일상</h1>
						<span class="text-white">OTD는 대구도시지하철도공사와 함께 합니다.</span>

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
						<h2 class="mb-2">이용권 구매</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
			
			 <div class="card shadow p-3 mb-5 rounded">
             	<div class="card-header py-3">
                	<h6 class="m-0 font-weight-bold text-white">OTD를 통해 일상 속의 힐링을 만나보세요.</h6>
                </div>
                <div class="card-body">
                	<div class="table-responsive">
                    	<form class="contact__form" id="frm" name="frm" action="payment.do" method="post">
							<input type="hidden" id="pays" name="pays">
                            	<table width="100%" cellspacing="0">
									<tr>
										<th width="200">성 명</th><td colspan="4">${sessionName}</td>
									</tr>
									<tr>
										<th width="200">휴대폰 번호</th><td colspan="2">${sessionPhone}</td>
										<th width="200">이메일</th><td colspan="2">${sessionEmail}</td>
									</tr>
									<tr>
										<th width="200">이용권</th><td colspan="2"><select id="ticket" name="ticket">
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
						<div class="checkbox_group">
							<br>
							<label><input type="checkbox" id="check_all" name="agreement" value="selectAll">전체동의</label><br>
							<label><input type="checkbox" id="check" name="agreement" value="addPay" required="required">추가요금 자동 결제 동의</label><br>
							<label><input type="checkbox" id="check" name="agreement" value="refund" required>환불 규정 동의</label><br>
							<label><input type="checkbox" id="check" name="agreement" value="service" required>서비스 이용약관 동의</label><br>
							<label><input type="checkbox" id="check" name="agreement" value="personal" required>개인정보 수집 및 이용 동의</label><br>
							<label><input type="checkbox" id="check" name="agreement" value="personal2" required>수집한 개인정보의 제 3자 정보제공 동의</label><br>
							<label><input type="checkbox" id="check" name="agreement" value="location" required>위치기반 서비스 이용 약관 동의</label><br>
						</div>
						<div class="text-center">
							<input class="btn btn-main btn-round-full" type="button" value="결 제 하 기">
							<i class="icofont-simple-right ml-2"></i>
						</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form name="data" action="insertDB.do" method="post">
		<!-- payment table -->
		<input type="hidden" id="email" name="email" value="${sessionEmail}">
		<input type="hidden" id="payment_price" name="payment_price" value="">
		<input type="hidden" id="payment_method" name="payment_method" value="">
		<!-- history table -->
		<input type="hidden" id="ticket_no" name="ticket_no" value="">
		<input type="hidden" id="history_date" name="history_date" value="">
	</form>
	<script>
	let merchant_uid = 'merchant_' + new Date().getTime();
	data.ticket_no.value = merchant_uid; //21/08/18
	
	</script>
	
	<script type="text/javascript">
	$(".checkbox_group").on("click", "#check_all", function () {
		console.log(this);
	  var checked = $(this).is(":checked");

	  if(checked){
	  	$(this).parents(".checkbox_group").find('input').prop("checked", true);
	  } else {
	  	$(this).parents(".checkbox_group").find('input').prop("checked", false);
	  }
	});
	
	$(".checkbox_group").on("click", "#check", function() {
	    var is_checked = true;

	    $(".checkbox_group #check").each(function(){
	        is_checked = is_checked && $(this).is(":checked");
	    });

	    $("#check_all").prop("checked", is_checked);
	});
	</script>
</body>
</html>