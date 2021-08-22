<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
<script>
	// 이벤트목록
	$(document).ready(function() {
		$.ajax({
			url : 'EventListServlet', // 요청페이지
			dataType : 'json',
			success : eventListFnc,
			error : function(reject) {
				console.error(reject);
			}
		});
	});

	// 이벤트목록조회 콜백함수
	function eventListFnc(data) {
		let card = $('<div>').attr('class', 'card');
		let close = $('</div>');
		let br = $('<br>');
		
		for (let i = 0; i < data.length; i++) {
		let div = $('<div>');
		let a = $('<a />').attr('href', data[i].eventLink).attr('target', '_blank');
				$(div).append(a);
		
		let cardBody = $('<div>').attr('class', 'card-body');
		let img = $('<img />').attr('src', 'img/' + data[i].eventImage)
					.attr('width', '50%').attr('height', '50%').attr('alt', '이벤트 이미지');
				  $(cardBody).append(img, close);
		
		let cardFooter = $('<div>').attr('class', 'card-footer');
		let title = $('<h3>').text(data[i].eventTitle).$('</h3>');
		let period = $('<p />').text(data[i].eventPeriod);
		
		$(cardFooter).append(title, , br, period, close);
		
		$(card).append(cardBody, cardFooter, close);
		}
		
		$('#list').append(card);
	}
		
		/* let table = $('<table />').attr('border', '1');
	
		for (let i = 0; i < data.length; i++) {
			let br = $('<br>');
			let tr1 = $('<tr />');
			let a = $('<a />').attr('href', data[i].eventLink).attr('target',
					'_blank');
			let img = $('<img />').attr('src', 'img/' + data[i].eventImage)
					.attr('width', '50%').attr('height', '50%').attr('alt',
							'이벤트 이미지');
			let td_image = $('<td />');
			$(a).append(img)
			$(td_image).append(a);
			$(tr1).append(td_image);

			let tr2 = $('<tr />');
			let td_title = $('<td />').text(data[i].eventTitle);
			$(tr2).append(td_title);

			let tr3 = $('<tr />');
			let td_period = $('<td />').text(data[i].eventPeriod);
			$(tr3).append(td_period);

			$(table).append(tr1, tr2, tr3, br);
		}
		$('#list').append(table);
	} */
</script>
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
						<h2 class="mb-2">이벤트</h2>
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
					<br>
					<div id="list"></div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>