<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		.input {
			width: 100%;
		}
		
		textarea {
			width: 100%;
			padding: 5px;
			box-sizing: border-box;
			border: solid 1px;
			resize: both;
		}
		
		.pageInfo {
			width: 800px;
			list-style: none;
			display: inline-block;
			margin: 18px 0 0 0;
			padding: 4px 0 0 0;
			text-align: center;
		}
		
		.pageInfo li {
			display: inline-block;
			font-size: 17px;
			margin-left: 9px;
			padding: 7px;
			font-weight: 500;
		}
		
		a:link {
			color: black;
			text-decoration: none;
		}
		
		a:visited {
			color: black;
			text-decoration: none;
		}
		
		a:hover {
			color: black;
			text-decoration: underline;
		}
		
		.pageInfo_btn.active {
			text-decoration: underline;
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
			vertical-align: middle;
		}
		
		td {
			padding-left: 10px;
			vertical-align: middle;
		}
		
		.text-white {
			z-index: 10;
		}
		
		.card-header {
			background: #00B6BC;
		}
		
		.section-title h2 {
			color: #000000;
		}
		
		.hpad {
			padding: 80px 0 0 0;
		}
		
		td.td-content {
			height: 150px;
			padding: 20px;
		}
		
		.detail {
			padding: 8px 8px 8px 8px;
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
			    error: function(){
			         alert("리뷰 작성이 실패하였습니다. 관리자에게 문의해주세요."); // 실패 시 팝업창
			    }
			});
		})
	});	
	
	// 입력처리 후 콜백함수
	function reviewInsertFnc(data){
		let div0 = document.createElement('div');
		div0.classList.add('col-lg-8');
		let br = $('<br />');
		let div1 = $('<div />').attr('class', 'card shadow mb-5 rounded');
		let div2 = $('<div />').attr('class', 'card-body');
		let div3 = $('<div />').attr('class', 'card-header py-3');
		let h6_h = $('<h6 />').attr('class', 'm-0 font-weight-bold text-white').text('사용후기');
		$(div3).append(h6_h);

		let div4 = $('<div />').attr('class', 'table-responsive');
		let div5 = $('<div />').attr('id', 'list');
		
		let newTable = document.createElement('table'); // table 생성시 단순 $('<table />')가 아닌 createElement를 통해 생성하면 Node로 사용할 수 있다.
		newTable.classList.add('table', 'table-bordered'); 
		newTable.setAttribute('width', '100%');
		newTable.setAttribute('cellspacing', '0');
		newTable.setAttribute('border-style', 'solid');
		newTable.setAttribute('border-width', '1px');
		newTable.setAttribute('border-color', 'lightGray');
		newTable.setAttribute('border-collapse', 'collapse');
		newTable.setAttribute('padding', '5px');
		
		let tr1 = $('<tr />');
		let th_writer = $('<th />').attr('width', '90').attr('class', 'detail').text('작성자');
    	let td_writer = $('<td />').attr('width', '200').attr('class', 'detail').attr('align', 'center').text(data.email);
		let th_like = $('<th />').attr('width', '90').attr('class', 'detail').text('별점');
		let td_like = $('<td />').attr('width', '150').attr('class', 'detail').attr('align', 'center').text(data.reviewLike);
		let td_btn = $('<td />').attr('rowspan', '2').attr('width', '90').attr('class', 'detail').attr('align', 'center').css('vertical-align', 'middle');
		let btn = $('<button />').append($('#btn').clone()).css('padding', '0 0 0 0').css('border-left', 'none').css('border-right', 'none');
		$(td_btn).append(btn);
    	$(tr1).append(th_writer, td_writer, th_like, td_like, td_btn);
				
		let tr2 = $('<tr />');
		let td_content = $('<td />').attr('colspan', '4').attr('class', 'td-content').text(data.reviewContent);
		let hInput = $('<input />').attr('type', 'hidden').attr('id', 'reviewNo').attr('value', ${review.reviewNo} + 1);
		console.log(data.reviewNo);
		$(td_content).append(hInput);
		$(tr2).append(td_content);
		$(newTable).append(tr1, tr2);
		$(div5).append(newTable);
		$(div4).append(br, div5);
		$(div2).append(div3, div4);		
		$(div1).append(div2);
		$(div0).append(div1);
		
		const form = document.querySelector('#form');
		
		// 새로 작성된 리뷰를 form의 가장 처음에 붙여주기 위해 insertBefore을 사용. Node만 파라미터로 사용할 수 있어서 newTable을 createElement로 생성해줬다.
		form.insertBefore(div0, form.firstChild); //맨 앞에 삽입
		
		
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


	<!-- 리뷰 작성폼 -->
	<section class="contact-form-wrap section">
		<div class="container" align="center">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2">이용후기</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>
			<c:if test="${session.email != null}">
				<div class="col-lg-8">
					<div class="card shadow mb-5 rounded">
						<div class="card-body">
							<div class="card-header py-3" style="background-color: #71D5E4;">
								<h6 class="m-0 font-weight-bold text-white">글 작성</h6>
							</div>
							<div class="table-responsive">
								<br>

								<div>
									<form id="frm" name="frm" action="ReviewInsertServlet"
										method="post">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<tr>
												<th width="100">작성자</th>
												<td width="240" align="center">${session.email}<input
													type="hidden" id="email" name="email"
													value="${session.email}"></td>
												<th width="100">별점</th>
												<td width="180" align="center"><input class="input"
													type="text" id="reviewLike" name="reviewLike"
													required="required"></td>
											</tr>
											<tr>
												<td colspan="6"><textarea rows="5" id="reviewContent"
														name="reviewContent" required="required"
														style="vertical-align: middle;"></textarea></td>
											</tr>
										</table>
										<br>
										<div>
											<button class="btn btn-main btn-round-full" type="submit">작성</button>
											&nbsp;&nbsp;&nbsp;
											<button class="btn btn-main btn-round-full" type="reset">취소</button>
										</div>
										<br>
									</form>
								</div>

							</div>
						</div>
					</div>
				</div>
				<h1 class="h3 mb-2 text-gray-800 hpad">목록</h1>
				<br>
			</c:if>
		</div>


		<!-- 리뷰 목록 -->
		<div class="container" align="center">
			<form id="form" name="form" action="reviewSelect.do" method="post">
				<c:forEach var="review" items="${list}">
					<div class="col-lg-8">
						<div class="card shadow mb-5 rounded">
							<div class="card-body">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-white">이용후기</h6>
								</div>
								<div class="table-responsive">
									<br>
									<div id="list">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<tr>
												<th width="90">작성자</th>
												<td width="200" align="center">${review.email}</td>
												<th width="90">별점</th>
												<td width="150" align="center">${review.reviewLike}</td>
												<td width="90" rowspan="2" align="center"
													style="vertical-align: middle;"><button id="btn"
														class="btn btn-main btn-round-full" type="button"
														onclick="location.href='reviewSelect.do?reviewNo=' + ${review.reviewNo}">조회</button>&nbsp;</td>
											</tr>
											<tr>
												<td class="td-content" colspan="4">${review.reviewContent}<input
													type="hidden" id="reviewNo" name="reviewNo"
													value="${review.reviewNo}"></td>
											</tr>
										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
			</form>

			<!-- 페이지 인터페이스 작업을 위한 div -->
			<div class="pageInfo_wrap">
				<div class="pageInfo_area">
					<ul id="pageInfo" class="pageInfo">
						<!-- 이전페이지 버튼 -->
						<c:if test="${pageMaker.prev}">
							<li class="pageInfo_btn previous"><a
								href="reviewList.do?pageNum=${pageMaker.startPage-1}&amount=5"">Previous</a></li>
						</c:if>

						<!-- 각 번호 페이지 버튼 누른 거 표시되도록 -->
						<c:forEach var="num" begin="${pageMaker.startPage}"
							end="${pageMaker.endPage}">
							<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
								href="reviewList.do?pageNum=${num}&amount=5">${num}</a></li>
						</c:forEach>

						<!-- 다음페이지 버튼 -->
						<c:if test="${pageMaker.next}">
							<li class="pageInfo_btn next"><a
								href="reviewList.do?pageNum=${pageMaker.endPage + 1}&amount=5">Next</a></li>
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

	</section>

</body>
</html>