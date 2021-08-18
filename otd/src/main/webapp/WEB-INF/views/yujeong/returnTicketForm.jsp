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
		jQuery
				.ajax(
						{
							"url" : "https://api.iamport.kr/payments/cancel?_token=40b3f893c2596278c2134adc2b56431e6df6a67a", // 예: http://www.myservice.com/payments/cancel
							"type" : "POST",
							"contentType" : "application/json",
							"data" : JSON.stringify({
								"merchant_uid" : "merchant_1629205659337", // 예: ORD20180131-0000011
								"amount" : 1000, // 환불금액
								"reason" : "테스트 결제 환불" // 환불사유
							/*  "refund_holder": "홍길동", // [가상계좌 환불시 필수입력] 환불 수령계좌 예금주
							 "refund_bank": "88" // [가상계좌 환불시 필수입력] 환불 수령계좌 은행코드(예: KG이니시스의 경우 신한은행은 88번)
							 "refund_account": "56211105948400" // [가상계좌 환불시 필수입력] 환불 수령계좌 번호 */
							}),
							"dataType" : "json"
						}).done(function(result) { // 환불 성공시 로직 
					alert("환불 성공");
				}).fail(function(error) { // 환불 실패시 로직
					alert("환불 실패");
				});
	}
</script>
<title>refund page</title>
</head>
<body>

</body>
</html>