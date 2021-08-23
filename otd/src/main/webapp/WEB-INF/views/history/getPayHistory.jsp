<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>히스토리내역</title>
<style>
/* 공통 상단 바 */
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

table, th, td {
	text-align: center;
	border: solid 1px lightGray;
	border-collapse: collapse;
	padding: 5px;
}

table {
	margin: auto;
	width: 100%
	
}

td {
	padding-left: 10px;
}

.text-white {
	z-index: 10;
}

.card-header {
	background: #00b6bc;
}

.section-title h2 {
	color: #000000;
}

.card {
	left: 20%;
	width: 800px;
}
/* 공통상단바 */
</style>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
						<h2 class="mb-2">사용 내역</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>

			<div class="card shadow mb-5 rounded">
				<div class="card-body">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-white">OTD를 통해 일상 속의 힐링을
							만나보세요.</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<form class="history" id="frm" name="frm"
								action="returnTicket.do" method="post">
								<input type="hidden" id="history" name="history">
								<div align="center">
									<table width="100%" cellspacing="0">
										<tr>
											<th width="150">결제상품</th>
											<th width="200">이용권개시일</th>
											<th width="150">결제금액</th>
											<th width="150">환불/취소</th>
										</tr>
										<c:forEach var="history" items="${history}">
											<tr>
												<%-- <c:forEach var="payment" items="${payment}"> --%>
												<td>${history.TICKET_CODE}</td>
												<td>${history.HISTORY_DATE}</td>
												<td>${history.TICKET_PRICE}원</td>
												<td><input class="btn btn-main btn-round-full"
													type="button" id="refund" name="refund" value="환불"></td>
											</tr>
										</c:forEach>
										<%-- </c:forEach> --%>
									</table>
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<form name="data" action="updateDB.do" method="post">
		<!-- payment table -->
		<input type="hidden" id="email" name="email" value="${sessionEmail}">
		<!-- history table -->
		<input type="hidden" id="ticket_no" name="ticket_no" value="">
	</form>
<script>
	$(document).ready(function() {
		// 폼전송 버튼 누르면 실행할 이벤트, 기능 정의
		$('.btn').on('click', function() {
			console.log('클릭');
			if (confirm("정말 환불하시겠습니까?")) {		
				historyFnc();
			}
		});
		function historyFnc() {
			frm.submit();
			data.submit();
		}
	});
</script>
</body>

</html>