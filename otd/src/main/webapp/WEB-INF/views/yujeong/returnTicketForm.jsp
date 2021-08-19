<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script src="https://code.jquery.com/jquery-3.3.1.min.js"
	integrity="sha256-FgpCb/KJQlLNfOu91ta32o/NMZxltwRo8QtmkMRdAu8="
	crossorigin="anonymous"></script>
<!-- jQuery CDN --->
<script>
	function cancelPay() {
		jQuery.ajax({
			"url" : "https://api.iamport.kr/", // 예: http://www.myservice.com/payments/cancel
			"type" : "POST",
			"contentType" : "application/json",
			"data" : JSON.stringify({
				"merchant_uid" : "merchant_1629265728678", // 예: ORD20180131-0000011
				"amount" : 2000, // 환불금액
			}),
			"dataType" : "json"
		}).done(function(result) { // 환불 성공시 로직 
			alert("결제가 성공적으로 취소되었습니다.");
			frm.submit();
		}).fail(function(error) { // 환불 실패시 로직
			alert("결제 취소가 실패했습니다.");
		});
	}
</script>
<title>refund page</title>
</head>
<body>
	<form name="frm" action="updateDB.do" method="post">
		<!-- history table -->
		<input type="hidden" id="email" name="email" value="${sessionEmail}">
		<input type="hidden" id="ticket_no" name="ticket_no" value="">
	</form>
</body>
</html>