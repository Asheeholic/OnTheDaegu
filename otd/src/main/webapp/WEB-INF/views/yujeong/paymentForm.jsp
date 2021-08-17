<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script type="text/javascript"
	src="https://code.jquery.com/jquery-1.12.4.min.js"></script>
<script type="text/javascript"
	src="https://service.iamport.kr/js/iamport.payment-1.1.5.js"></script>

<script>
	IMP.init('imp24006420');

	IMP.request_pay({
		pg : 'inicis', // version 1.1.0부터 지원.
		pay_method : '${payment}',
		merchant_uid : 'merchant_' + new Date().getTime(),
		name : '${sessionName}',
		amount : '${ticket}', //판매 가격
		buyer_email : '${sessionEmail}',
		buyer_name : '${sessionName}',
		buyer_tel : '${sessionPhone}',
	}, function(rsp) {
		if (rsp.success) {
			var msg = '결제가 완료되었습니다.';
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
		}
		alert(msg);
	});
</script>
<meta charset="UTF-8">
<title>payment page</title>
</head>
<body>

</body>
</html>