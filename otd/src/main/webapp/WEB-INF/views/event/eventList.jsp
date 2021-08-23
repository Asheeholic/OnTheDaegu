<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.div-row {
			margin: 30px;
			padding: 10px;
		}
		.div-col {
			margin-left: auto;
			margin-right: auto;
		}
		.col-card {
			margin: 30px;
		}
		.cardstyle {
			width: 300px;
			height: 200px;
		}

		.pageInfo {
			width: 800px;
			list-style: none;
			display: inline-block;
			margin: 18px 0 0 0;
			padding: 4px 0 0 0;
			text-align: center;
		}
		
		.pageInfo li {
			display: inline-block;
			font-size: 17px;
			margin-left: 9px;
			padding: 7px;
			font-weight: 500;
		}
		
		a:link {
			color: black;
			text-decoration: none;
		}
		
		a:visited {
			color: black;
			text-decoration: none;
		}
		
		a:hover {
			color: black;
			text-decoration: underline;
		}
		
		.pageInfo_btn.active {
			text-decoration: underline;
		}
		
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
		
		.btn {
			display: inline-block;
			font-size: 20px;
			font-size: 0.8125rem;
			font-weight: 1000;
			letter-spacing: .5px;
			padding: .75rem 2rem;
			font-family: "Exo", sans-serif;
			text-transform: uppercase;
			border-radius: 5px;
			border: 2px solid transparent;
			transition: all .35s ease;
		}
		
		.btn-main {
			background: #00B6BC;
			color: #fff;
			border-color: #00B6BC;
		}
		
		.btn-round-full {
			border-radius: 50px;
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
		
		/* 공통 상단 바 */
		.bg-1 {
			background: url("img/payForm.png") no-repeat 50% 50%;
			background-size: 100%;
			height: 370px;
			position: relative;
			z-index: -50;
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
		
		.section-title h2 {
			color: #000000;
		}
		/* 공통상단바 */		
	</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
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
		let container = $('<div />').addClass('container');
		let div_row = $('<div />').addClass('row div-row');
		let div_col = $('<div />').addClass('col-lg-10 div-col').attr('align', 'center');
		for (let i = 0; i < data.length; i++) {
			let col = $('<div />').addClass('col-lg-3 col-card').css('float', 'left');
			let card = $('<div />').addClass('card h-100 cardstyle');
			let a_img = $('<a />').attr('href', data[i].eventLink).attr('target', '_blank');
			let img = $('<img />').attr('src', 'img/' + data[i].eventImage)
					.attr('width', '100%').attr('height', '200')
					.attr('alt', '이벤트 이미지');
			$(a_img).append(img)
			
			let cardbody = $('<div />').addClass('card-body p-4');
			let div_center = $('<div />').addClass('text-center');
			let title = $('<h6 />').text(data[i].eventTitle);
			$(div_center).append(title);
			$(cardbody).append(div_center);
			
			let cardfooter = $('<div />').addClass('card-footer p-4 pt-0 border-top-0 bg-transparent');
			let div_center2 = $('<div />').addClass('text-center');
			let period = $('<h6 />').text(data[i].eventPeriod);
			$(div_center2).append(period);
			$(cardfooter).append(div_center2);
			
			$(card).append(a_img, cardbody, cardfooter);
			$(col).append(card);
			$(div_col).append(col);
		}
		$(div_row).append(div_col);
		$(container).append(div_row);
		$('#list').append(container);
	}
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
		<div class="container" align="center">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2">이벤트</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
			<div id="list" align="center">
			</div>
		</div>
	</section>
</body>
</html>