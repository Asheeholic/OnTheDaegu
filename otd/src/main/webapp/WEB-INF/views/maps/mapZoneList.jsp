<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
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
<!-- 여기에 존 리스트 보여줘야함. -->
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
	<section class="section">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2">위치별 자전거 현황</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>위치</th>
						<th>전체 자전거 수</th>
						<th>사용 가능 자전거 수</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="zoneList" items="${list }">
					<tr onclick="getParkNumber('${zoneList.parkNumber}')">
						<td>
						<c:if test="${zoneList.parkNumber eq 1}">
							중앙로역
						</c:if>
						<c:if test="${zoneList.parkNumber eq 2}">
							반월당역
						</c:if>
						</td>
						<td>${zoneList.parkTotal}</td>
						<td>${zoneList.parkPossible}</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<form id="frm" action="mapSelectZone.do" method="post">
		<input type="hidden" id="parkNumber" name="parkNumber">
	</form>
	<script>
		function getParkNumber(n) {
			frm.parkNumber.value = n;
			frm.submit();
		}
	</script>
</body>
</html>