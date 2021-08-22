<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		textarea {
			width: 100%;
			padding: 5px;
			box-sizing: border-box;
			border: solid 0px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
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
		
		table, th, td {
			border: solid 1px lightGray;
			border-collapse: collapse;
			padding: 5px;
		}
		
		table {
			margin: auto;
		}
		
		th {
			text-align: center;
		}
		
		td {
			padding-left: 10px;
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
		
		td.td-content {
			height: 150px;
			padding: 20px;
		}		
	</style>
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
						<h2 class="mb-2">사용후기</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
			<div class="col-lg-8">
				<div class="card shadow mb-5 rounded">
					<div class="card-body">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-white">사용후기</h6>
						</div>
						<div class="table-responsive">
							<br>
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tr>
									<th width="90">작성자</th>
									<td width="200" align="center">${review.email}</td>
									<th width="90">별점</th>
									<td width="150" align="center">${review.reviewLike}</td>
								</tr>
								<tr>
									<th width="90">작성일자</th>
									<td colspan="4">${review.reviewDate}</td>
								</tr>
								<tr>
									<td class="td-content" colspan="6" height="150">${review.reviewContent}</td>
								</tr>
							</table>
						</div>
						<br>
						<div>
							<button class="btn btn-main btn-round-full" type="button"
								onclick="location.href='reviewList.do?pageNum=1&amount=5'">목록</button>
							<c:if test="${review.email == sessionEmail}">
					&nbsp;&nbsp;&nbsp;
					<button class="btn btn-main btn-round-full" type="button"
									onclick="location.href='reviewUpdateForm.do?reviewNo=' + ${review.reviewNo}">수정</button>
					&nbsp;&nbsp;&nbsp;
					<button class="btn btn-main btn-round-full" type="button"
									onclick="location.href='reviewDelete.do?reviewNo=' + ${review.reviewNo}">삭제</button>
							</c:if>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
</body>
</html>