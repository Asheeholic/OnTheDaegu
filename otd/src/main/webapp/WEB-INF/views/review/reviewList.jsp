<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.pageInfo{
			list-style : none;
			display: inline-block;
			margin: 50px 0 0 100px;
	   	}
	 	.pageInfo li{
	    	float: left;
	   		font-size: 20px;
	   		margin-left: 18px;
	   		padding: 7px;
	   		font-weight: 500;
	 	}
		a:link {color:black; text-decoration: none;}
		a:visited {color:black; text-decoration: none;}
		a:hover {color:black; text-decoration: underline;}
		.pageInfo_btn.active{
      		text-decoration: underline;
  		}
	</style>
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script>
	
	let moveForm = $('#moveForm');

	$('.pageInfo a').on('click', function(e){
        e.preventDefault();
        moveForm.find("input[name='pageNum']").val($(this)).attr('href');
        moveForm.attr('action', 'reviewList.do');
        moveForm.submit();
	});	
	
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
		let newTable = document.createElement('table'); // table 생성시 단순 $('<table />')가 아닌 createElement를 통해 생성하면 Node로 사용할 수 있다.
		let tr1 = $('<tr />');
		let th_writer = $('<th />').attr('width', '90').text('작성자');
    	let td_writer = $('<td />').text(data.email).attr('width', '200');
		let th_like = $('<th />').attr('width', '90').text('별점');
		let td_like = $('<td />').attr('width', '130').text(data.reviewLike);
		let td_btn = $('<td />').attr('rowspan', '2');
 		let searchBtn = $('<button />').text('조회');
		$(td_btn).append(searchBtn);
    	$(tr1).append(th_writer, td_writer, th_like, td_like, td_btn);
				
		let tr2 = $('<tr />');
		let td_content = $('<td />').attr('colspan', '4').attr('height', '150').text(data.reviewContent);
		let hInput = $('<input />').attr('type', 'hidden').attr('id', 'reviewNo').attr('value', ${review.reviewNo} + 1);
		console.log(data.reviewNo);
		$(td_content).append(hInput);
		$(tr2).append(td_content);
			
		$(newTable).append(tr1, tr2).attr('border', '1');
		
		const form = document.querySelector('#form');
		
		// 새로 작성된 리뷰를 form의 가장 처음에 붙여주기 위해 insertBefore을 사용. Node만 파라미터로 사용할 수 있어서 newTable을 createElement로 생성해줬다.
		form.insertBefore(newTable, form.firstChild); //맨 앞에 삽입
		
		
		// (XXX) insert 후 입력폼 비우기 시도(해결못함)
		function clearInput(){
			let like = document.getElementsById('#reviewLike');
			like.value = '';
			let content = document.getElementsById('#reviewContent')
			content.value = '';
		}
	}
	
	</script>
</head>

<body>
	<!-- 리뷰 insert 폼 -->
	<div align="center">
	<button type="button" onclick="location.href='home.do'">HOME</button><br><br>
		<c:if test="${session.email != null}">
		<div><h3>리뷰작성</h3></div>
		<div>
			<form id="frm" name="frm" action="ReviewInsertServlet" method="post">
			<table border="1">
				<tr>
					<th width="90">작성자</th>
					<td width="200" align="center">${session.email}<input type="hidden" id="email" name="email" value="${session.email}"></td>
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
		<div id="list">
			<form id="form" name="form" action="reviewSelect.do" method="post">
				<c:forEach var="review" items="${list}">
				<table border="1">
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
				</table>
				</c:forEach>	
			</form>				
		</div>
		
		<!-- 페이지 인터페이스 작업을 위한 div -->
		<div class="pageInfo_wrap">
			<div class="pageInfo_area">
				<ul id="pageInfo" class="pageInfo">
				    <!-- 이전페이지 버튼 -->
					<c:if test="${pageMaker.prev}">
						<li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
					</c:if>
					
					<!-- 각 번호 페이지 버튼 누른 거 표시되도록 -->
					<c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
						<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="reviewList.do?pageNum=${num}&amount=10">${num}</a></li>
					</c:forEach>
					
					<!-- 다음페이지 버튼 -->
					<c:if test="${pageMaker.next}">
						<li class="pageInfo_btn next"><a href="${pageMaker.endPage + 1}">Next</a></li>
					</c:if> 
			            
				</ul>
			</div>
		</div>

		<!-- 페이지 이동을 위한 폼 -->
		<form id="moveForm" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}"> 
		</form>
	</div>
</body>
</html>