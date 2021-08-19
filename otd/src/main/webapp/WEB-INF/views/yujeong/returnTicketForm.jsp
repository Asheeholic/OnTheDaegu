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
			"url" : "http://localhost/otd/returnTicket.do", // 예: http://www.myservice.com/payments/cancel
			"type" : "POST",
			"contentType" : "application/json",
			"data" : JSON.stringify({
				"merchant_uid" : "merchant_1629334275584", // 예: ORD20180131-0000011
				"cancel_request_amount" : 1000, // 환불금액
				"reason": "테스트 결제 환불" // 환불사유
			}),
			"dataType" : "json"
		}).done(function(result) { // 환불 성공시 로직 
			alert("결제 취소가 정상적으로 처리되었습니다.");
			frm.submit();
		}).fail(function(error) { // 환불 실패시 로직
			alert("결제 취소가 실패했습니다.");
		});
	}
</script>

<!-- <script>
  const statusTexts = [
    { id : 0, text : "결제대기" },
    { id : 1, text : "결제완료" },
    { id : 2, text : "결제실패" },
    { id : 3, text : "환불완료" },
  ];

  export default {
    name: "Item",
    data() {
      return {
        items : null
      }
    },
    beforeCreate() {
      this.$axios.get(`${this.serverHost}/items`)
        .then( res => {
          this.items = res.data;
        })
        .catch( err => {
          console.error("Item List Get Error!", err.response.data.msg);
        })
    },
    methods : {
      // 환불
      refundItem(item) {
        if(!confirm('정말로 환불하시겠어요?')) return;
        //환불 이유
        item.reason = '결제취소';
        //환불 요청
        this.$axios.post(`${this.serverHost}/pg/iamport/item/refund`, { 'item' : item })
          .then( res => {
            let idx = this.items.indexOf(item);
            this.items.splice(idx, 1, res.data);
            alert('환불되었습니다!');
          })
          .catch( err => {
            const errMsg = err.response.data.msg;
            console.error("Item Refund Error!", errMsg);  
            alert(`환불에 실패했습니다. 에러 내용 : ${errMsg}`)
          })
      },
      viewReceipt(item) {
         console.log(item);
         //TODO : 영수증보기
      }
    },
    filters : {
      getStatusText(status) {
        return statusTexts.filter( s => s.id == status)[0].text;
      }
    }
  }  
</script> -->
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