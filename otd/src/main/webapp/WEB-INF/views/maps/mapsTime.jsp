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
	<!-- 여기 time에 자바에서 넘어온 시간을 가지고 써야함. -->
	<script>
		$(window).on('load', function() {
			let start = setInterval(function() {
				// 시간 대충 2시간이라 하면
				let time = 2 * 60 * 60;
				
				// 1초 마다 까지고 초기화 하면됨.
				time = Math.floor((time/60)/60) + "시간" 
						+ Math.floor((time/60)%60) + "분"
						+ Math.floor(time%60) + "초";
				$("#time").text(time);
			}, 1000)
		});
	</script>
</body>
</html>