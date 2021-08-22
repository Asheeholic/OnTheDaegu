<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>mapChoice</title>
<style>
	.choice {
		background-image: url("img/choiceCity.jpg");
		background-size: cover;
		background-attachment: fixed;
		z-index: -100;
	}
	
	.delivery {
		background-image: url("img/choiceDelivery.jpg");
		background-size: cover;
		transition: all .3s ease-in-out;
	}
	
	.pickup {
		background-image: url("img/choicePickUp.jpg");
		background-size: cover;
		transition: all .3s ease-in-out;
	}
	
	.delivery:hover, .pickup:hover {
		transform: scale(1.1);
	}
	
	.feature-item h2 {
		color: #00B6BC;
	}
	
	.feature-item span {
		color: #E4F4F3;
	}
	
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
</style>
</head>
<body>
	<!-- <div>
		<div>
			<a href="mapDeliverySystem.do">
				<div>배달 요청</div>
			</a>
		</div>
		<div>
			<a href="mapPickupSystem.do">
				<div>자전거 직접 픽업</div>
			</a>
		</div>
	</div> -->
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
	<section class="section py-5">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2">대여 선택</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
		</div>
		<div class="container-fluid choice">
			<div class="choice row py-5">
				<div class="col-lg-12 py-5">
					<div class="feature-block d-lg-flex justify-content-evenly py-5">
						<div class="feature-item mb-5 mb-lg-0 py-5 delivery" onclick="location.href='mapDeliverySystem.do'">
							<div class="p-5">
								<span>자전거 배달을 받고 싶을 때</span>
								<h2 class="mb-3">배달 요청</h2>
							</div>
						</div>
					
						<div class="feature-item mb-5 mb-lg-0 py-5 pickup" onclick="location.href='mapPickupSystem.do'">
							<div class="p-5">
								<span>내 주위 자전거를 직접 타고 싶을 때</span>
								<h2 class="mb-3">직접 픽업</h2>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>