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
			alert(msg);
			// 그 다음 실행
			frm.submit();
		} else {
			var msg = '결제에 실패하였습니다.';
			msg += '에러내용 : ' + rsp.error_msg;
			alert(msg);
		}

	});

</script>
<meta charset="UTF-8">
<title>payment page</title>
</head>
<body>
	<form name="frm" action="insertDB.do" method="post">
		<!-- payment table -->
		<input type="hidden" id="email" name="email" value="${sessionEmail}">
		<input type="hidden" id="payment_price" name="payment_price" value="${ticket}">
		<input type="hidden" id="payment_method" name="payment_method" value="${payment}">
		<!-- history table -->
		<input type="hidden" id="ticket_no" name="ticket_no" value="">
		<input type="hidden" id="history_date" name="history_date" value="">
	</form>
	<script>
	let merchant_uid = 'merchant_' + new Date().getTime();
	frm.ticket_no.value = merchant_uid; //21/08/18
	
	/* function formatDate(date) { 
		var d = new Date(date), month = '' + (d.getMonth() + 1), day = '' + d.getDate(), year = d.getFullYear();
		if (month.length < 2) month = '0' + month;
		if (day.length < 2) day = '0' + day;
		return [year, month, day].join('/');
		}
	// Date string 형식
	let now = new Date();
	console.log(now.toString()); // "Fri Nov 27 2020 16:56:53 GMT+0900 (대한민국 표준시)"
	console.log(now.toJSON()); // "2020-11-27T07:56:53.606Z"
	console.log(now.toISOString()); // "2020-11-27T07:56:53.606Z"
	// Date객체의 toJSON() 이나 toISOString() 의 데이터를 이용
	// Date String 에서 앞 10자리만 잘라내면 yyyy-MM-dd 만 가져온다.
	var today = new Date().toISOString().substring(2,10).replaceAll('-','/');
	frm.history_date.value = today; */
	</script>
</body>
</html>