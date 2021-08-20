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
	
	<section class="choice py-5">
		<div class="container">
			<div class="row py-5">
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