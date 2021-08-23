<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>	
		img.faq {
			width: 130px;
			height: 130px;
			margin: 3px;
		}
		.option {	
			width: 180px;
			display: inline-block;
			margin: 0px 5px;
			vertical-align: top;
		}
		
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
</head>
<body>

	<!-- 공통상단바 -->
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
	<!-- 공통상단바 -->
	
	<section class="contact-form-wrap section">
		<div class="container" align="center">
		
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2">자주 하는 질문</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
				
			<div id="faq-wrapper">
				<div class="faq-option" align="center">
					<dl>
						<dd class="option">
							<a href="faqRentalOffice.do">
								<span><img class="faq" src="img/faqRentalOffice.png" alt="대여소"></span><br>
								<span><b>대여소</b></span>
							</a>
						</dd>
						<dd class="option">
							<a href="faqPaymentRefundMileage.do">
								<span><img class="faq" src="img/faqPaymentRefundMileage.png" alt="결제/환불/마일리지"></span><br>
								<span><b>결제/환불/마일리지</b></span>
							</a>
						</dd>
						<dd class="option">
							<a href="faqUseInformation.do">
								<span><img class="faq" src="img/faqUseInformation.png" alt="이용안내"></span><br>
								<span><b>이용안내</b></span>
							</a>
						</dd>
						<br><br><br>
						<dd class="option">
							<a href="faqBicycleFacilityManagement.do">
								<span><img class="faq" src="img/faqBicycleFacilityManagement.png" alt="자전거 및 시설관리"></span><br>
								<span><b>자전거 및 시설관리</b></span>
							</a>
						</dd>		
						<dd class="option">
							<a href="faqRentalReturn.do">
								<span><img class="faq" src="img/faqRentalReturn.png" alt="대여/반납"></span><br>
								<span><b>대여/반납</b></span>
							</a>
						</dd>
						<dd class="option">
							<a href="http://www.daeguoracle.com/" target="_blank">
								<span><img class="faq" src="img/mantoman.png" alt="1:1 문의하기"></span><br>
								<span><b>1:1 문의하기</b></span>
							</a>
						</dd>																	
					</dl>
				</div>
			</div>
		</div>
	</section>
</body>
</html>