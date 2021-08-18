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
<!-- 여기에 존 리스트 보여줘야함. -->
	<div>
		<table>
			<tr>
				<th>위치</th>
				<th>전체 자전거 수</th>
				<th>사용 가능 자전거 수</th>
			</tr>
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
		</table>
	</div>
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