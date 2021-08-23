<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.hide {
			display: none
		} /*숨기기*/
		
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
	</style>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<!-- <script>
		$(document).ready(function(){

			let tr1 = $('.tr1');
			let tr2 = $('.tr2');
			
			tr1.click(function(e){
				console.log(this);
				$(tr2).hide();
				$(this).next().show();
			 });
			
		});
	</script> -->
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

						<!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">Book your Seat</a></li>
          </ul> -->
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
						<h2 class="mb-2">결제/환불/마일리지</h2>
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
					<div class="FAQ">
						<br>
						<ul class="faq_list">
							<c:forEach var="faq" items="${list}">
								<li class="on">
									<dl>
										<dt>
											<a href="#"> <span class="cont">${faq.faqTitle}</span></a>
										</dt>
										<dd id="88" class="hide" height="100">
											<!-- tr2는 default hide 상태(클릭하면 show) -->
											<p>${faq.faqContent}</p>
									</dl>
								</li>
							</c:forEach>
						</ul>
					</div>
				</div>
			</div>
		</div>
		
		<div align="center">
			<button class="btn btn-main btn-round-full" type="button"
								onclick="location.href='faqHome.do'">홈으로</button>
		</div>		
		
		<script>
			$('.faq_list li').each(function(index, item) {
				console.log(item);
			});
		</script>
		<script type="text/javascript">
			$(function() {
				var faq_open
				jQuery(".faq_list li dl dt a").on(
						"click",
						function() {
							var idx = jQuery(this).parent().parent().parent()
									.index()
							if (faq_open == idx) {
								jQuery(".faq_list li dl dd").css("display",
										"none")
								jQuery(".faq_list li").removeClass("on")
								faq_open = "99" //임의 상수 리셋
							} else {
								jQuery(".faq_list li").removeClass("on")
								jQuery(".faq_list li dl dd").css("display",
										"none")
								jQuery(this).parent().parent().parent().find(
										"dd").css("display", "block")
								jQuery(this).parent().parent().parent()
										.addClass("on")
								faq_open = idx
							}
							return false
						});
				jQuery(".faq_list li dl dt").on(
						"click",
						function() {
							var idx = jQuery(this).parent().parent().index()
							if (faq_open == idx) {
								jQuery(".faq_list li dl dd").css("display",
										"none")
								jQuery(".faq_list li").removeClass("on")
								faq_open = "99" //임의 상수 리셋
							} else {
								jQuery(".faq_list li").removeClass("on")
								jQuery(".faq_list li dl dd").css("display",
										"none")
								jQuery(this).parent().parent().find("dd").css(
										"display", "block")
								jQuery(this).parent().parent().addClass("on")
								faq_open = idx
							}
							return false
						});
			});
		</script>
	</section>
</body>
</html>