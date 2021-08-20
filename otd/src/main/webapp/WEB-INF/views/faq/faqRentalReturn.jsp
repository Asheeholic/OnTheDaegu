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

			let tr1 = $('.tr1');
			let tr2 = $('.tr2');
			
			tr1.click(function(e){
				console.log(this);
				$(tr2).hide();
				$(this).next().show();
			 });
			
		});
	</script>
</head>
<body>
	<div id="show">
		대여/반납
	</div>
	<div align="center">
		<c:forEach var="faq" items="${list}">
		<table border="1">
			<tr class="tr1"> <!-- id값으로 주면 단 하나만 사용 가능하기 때문에 tr1, tr2를 calss로 줬다. -->
				<td width="600">${faq.faqTitle}</td>
			</tr>
			<tr class="tr2 hide" height="100"> <!-- tr2는 default hide 상태(클릭하면 show) -->
				<td>${faq.faqContent}</td>
			</tr>
		</table>
		</c:forEach>
	</div>
</body>
</html>