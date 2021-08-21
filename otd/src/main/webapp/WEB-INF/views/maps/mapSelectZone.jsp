<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<!-- 여기에 선택한 자전거 리스트 보여줘야함. -->
	<section class="section">
		<div class="container">
			<table class="table table-striped table-hover">
				<thead>
					<tr>
						<th>자전거 일련번호</th>
						<th>사용 가능 여부</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="bicycle" items="${list }">
						<c:if test="${bicycle.bicyclePossible eq 'N'}">
							<tr>
								<td>${bicycle.bicycleNo}</td>
								<td>
									<span class="text-danger">사용 불가능</span>
								</td>
							</tr>
						</c:if>
						<c:if test="${bicycle.bicyclePossible eq 'Y'}">
							<tr onclick="getBicycleNumber('${bicycle.bicycleNo}')">
								<td>${bicycle.bicycleNo}</td>
								<td>
									<span class="text-primary">사용 가능</span>
								</td>
							</tr>
						</c:if>
					</c:forEach>
				</tbody>
			</table>
		</div>
	</section>
	<form id="frm" action="mapSelectBicycle.do" method="post">
		<input type="hidden" id="bicycleNumber" name="bicycleNumber">
	</form>
	<script>
		function getBicycleNumber(n) {
			frm.bicycleNumber.value = n;
			frm.submit();
		}
	</script>
</body>
</html>