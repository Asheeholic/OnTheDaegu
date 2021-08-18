<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script type="text/javascript">
		function getRecord(n) {
			frm.faqCategory.value = n;
			frm.submit();
		}	

	</script>
</head>
<body>
		<div onclick="getRecord(faqCategory)"><label>대여소<input type="hidden" id="faqCategory" name="faqCategory" value="대여소"></label></div>
		<span onclick="getRecord2(faqCategory)"><label>결제/환불/마일리지<input type="hidden" id="faqCategory" name="faqCategory" value="결제/환불/마일리지"></label><br></span>
			이용안내
			자전거 및 시설관리
			대여/반납
			1:1 문의하기

	<form id="frm" name="frm" action="faqSelectList.do" method="post">
		<input type="hidden" id="faqCategory" name="faqCategory">
	</form>
</body>
</html>