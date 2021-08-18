<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<script>
	$(document).ready(function(){
	
		// 폼전송 버튼 누르면 실행할 이벤트, 기능 정의
		$('#frm').on('submit', function(event){
			event.preventDefault();
			console.log('submit');
			
			// 폼전송처리
			$.ajax({
				url: $('#frm').attr('action'),
				method: 'post',
				data: $('#frm').serialize(),
				dataType: 'json',
				success: reviewInsertFnc,
				error: function(reject){
					console.error(reject);
				}
			});
		})
	});	
	
	// 입력처리 후 콜백함수
	function reviewInsertFnc(data){
		let tr1 = $('<tr />');
		let th_writer = $('<th />').attr('width', '90').text('작성자');
    	let td_writer = $('<td />').text(data.email).attr('width', '200');
		let th_like = $('<th />').attr('width', '90').text('별점');
		let td_like = $('<td />').attr('width', '130').text(data.reviewLike);
		let td_btn = $('<td />').attr('rowspan', '2');
		$(td_btn).append('#btn');
    	$(tr1).append(th_writer, td_writer, th_like, td_like, td_btn);
				
		let tr2 = $('<tr />');
		let td_content = $('<td />').attr('colspan', '4').attr('height', '150').text(data.reviewContent);
		let hInput = $('<input />').attr('type', 'hidden').attr('id', 'reviewNo').attr('value', data.reviewNo);
		$(td_content).append(hInput);
		$(tr2).append(td_content);
			
		$('#table').append(tr1, tr2);
	}
	
	</script>
</head>

<body>
	<!-- 리뷰 insert 폼 -->
	<div align="center">
	<button type="button" onclick="location.href='home.do'">HOME</button><br><br>
		<c:if test="${sessionEmail != null}">
		<div><h3>리뷰작성</h3></div>
		<div>
			<form id="frm" name="frm" action="ReviewInsertServlet" method="post">
			<table border="1">
				<tr>
					<th width="90">작성자</th>
					<td width="200" align="center">${sessionEmail}<input type="hidden" id="email" name="email" value="${sessionEmail}"></td>
					<th width="90">별점</th>
					<td width="160" align="center">
						<input type="text" id="reviewLike" name="reviewLike" required="required">
					</td>
				</tr>
				<tr>
					<td colspan="6" height="150">
						<textarea rows="10" cols="80" id="reviewContent" name="reviewContent" required="required"></textarea>
					</td>
				</tr>
			</table><br>
				<div>
					<button type="submit">작성</button>
					&nbsp;&nbsp;&nbsp;
					<button type="reset">취소</button>
				</div><br><br>
			</form>
		</div>
	</c:if>
	</div>


	<!-- 목록 -->
	<div align="center">
		<div><h3>리뷰목록</h3></div>
		<div>
			<form id="form" name="form" action="reviewSelect.do" method="post">
				<c:forEach var="review" items="${list}">
				<table id="table" border="1">
					<tr>
						<th width="90">작성자</th>
						<td width="200" align="center">${review.email}</td>
						<th width="90">별점</th>
						<td width="160" align="center">${review.reviewLike}</td>
						<td id="btn" rowspan="2" align="center"><button type="button" onclick="location.href='reviewSelect.do?reviewNo=' + ${review.reviewNo}">조회</button>&nbsp;</td>
					</tr>
					<tr>
						<td colspan="4" height="150">${review.reviewContent}<input type="hidden" id="reviewNo" name="reviewNo" value="${review.reviewNo}"></td>
					</tr>
				</table><br>
				</c:forEach>	
			</form>				
		</div>
	</div>
</body>
</html>