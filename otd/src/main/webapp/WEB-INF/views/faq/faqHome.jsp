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
	</style>
</head>
<body>
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
</body>
</html>