<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
	.show {display:block} /*보여주기*/
	.hide {display:none} /*숨기기*/
</style>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>
		$(document).ready(function(){

			let tr1 = $('#tr1');
			let tr2 = $('#tr2');
			
			tr1.click(function(){
			   tr2.toggle(
			     function(){tr2.addClass('show')}, //클릭하면 show클래스 적용되서 보이기
			     function(){tr2.addClass('hide')} //한 번 더 클릭하면 hide클래스가 숨기기
			   );
			 });
			
		});
	</script>
</head>
<body>
	<div id="show">
		결제/환불/마일리지
	</div>
	<div align="center">
		<c:forEach var="faq" items="${list}">
		<table border="1">
			<tr id="tr1">
				<td width="600">${faq.faqTitle}</td>
			</tr>
			<tr id="tr2" class="hide" height="100">
				<td>${faq.faqContent}</td>
			</tr>
		</table>
		</c:forEach>
	</div>
</body>
</html>