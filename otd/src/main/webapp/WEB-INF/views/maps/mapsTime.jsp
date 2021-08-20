<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
	<div>
		<span id="title">남은 시간은</span>
		<span id="time"></span>
	</div>
	<button id="homeBtn">메인으로</button>
	<!-- 여기 time에 자바에서 넘어온 시간을 가지고 써야함. -->
	<script>
		$(window).on('load', function() {
			
			// 시간 보여주는 메소드 (제발 재사용 많이 해주세요)
			$.ajax({
				url:"LeftTimeShowServlet",
				type:'get',
				data:{
					email: "${session.email}"
				},
				dataType: 'json',
				success: function(result) {
					console.log(result);
					calculrateTime(result);
				},
				error: function(e) {
					console.error(e);
				}
			})
			
			function calculrateTime(result) {
				let now = new Date();
				let boughtTime = new Date(result.dateBought);
				
				console.log(boughtTime);
				if(result.ticketTime == "30분") {
					boughtTime.setMinutes(boughtTime.getMinutes() + 30);
				} else if (result.ticketTime == "1시간"){
					boughtTime.setHours(boughtTime.getHours() + 1);
				} else if (result.ticketTime == "2시간"){
					boughtTime.setHours(boughtTime.getHours() + 2);
				} else if (result.ticketTime == "4시간"){
					boughtTime.setHours(boughtTime.getHours() + 4);
				} else if (result.ticketTime == "8시간"){
					boughtTime.setHours(boughtTime.getHours() + 8);
				} else if (result.ticketTime == "12시간"){
					boughtTime.setHours(boughtTime.getHours() + 12);
				} else if (result.ticketTime == "24시간"){
					boughtTime.setHours(boughtTime.getHours() + 24);
				}
				
				console.log(boughtTime);
				if(boughtTime - now > 0) {
					let i = 0;
					let start = setInterval(function() {
						// 시간 대충 2시간이라 하면
						let time = Math.floor((boughtTime.getTime()-now.getTime())/1000) - i;
						// 1초 마다 까지고 초기화 하면됨.
						time = Math.floor((time/60)/60) + "시간" 
								+ Math.floor((time/60)%60) + "분"
								+ Math.floor(time%60) + "초";
						$("#time").text(time);
						i += 1;
					}, 1000)
				} else {
					window.location.href = "home.do";
				}
			}
			// 시간 보여주는 메소드 끝 (제발 재사용 많이 해주세요)
			
			// 홈으로
			$('#homeBtn').on('click', function() {
				window.location.href = "home.do";
			});
		});
	</script>
</body>
</html>