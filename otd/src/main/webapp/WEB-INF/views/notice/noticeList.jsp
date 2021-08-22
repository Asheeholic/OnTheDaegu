<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
<style>
.pageInfo {
	width: 500px;
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
</style>

<script>
		function getRecord(n) {
			frm.noticeNo.value = n;
			frm.submit();
		}
		
		let moveForm = $('#moveForm');

		$('.pageInfo a').on('click', function(e){
	        e.preventDefault();
	        moveForm.find("input[name='pageNum']").val($(this)).attr('href');
	        moveForm.attr('action', 'noticeList.do');
	        moveForm.submit();
		});
			
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


	<section class="contact-form-wrap section">
		<div class="container" align="center">
			<div class="row justify-content-center">
				<div class="col-lg-6">
					<div class="section-title text-center">
						<h2 class="mb-2">공지사항</h2>
						<div class="divider mx-auto my-4"></div>
						<p class="mb-5"></p>
					</div>
				</div>
			</div>

			<div class="col-lg-9">
				<div class="card shadow mb-5 rounded">
					<div class="card-body">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-white">공지사항</h6>
						</div>
						<div class="table-responsive">
							<br>
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<tr>
									<th width="90">No.</th>
									<th width="350">제목</th>
									<th width="100">작성자</th>
									<th width="150">작성일자</th>
									<th width="100">조회수</th>
								</tr>
								<c:forEach var="notice" items="${list}">
									<tr onclick="getRecord(${notice.noticeNo})">
										<td align="center">${notice.noticeNo}</td>
										<td>${notice.noticeTitle}</td>
										<td align="center">관리자</td>
										<td align="center">${notice.noticeDate}</td>
										<td align="center">${notice.noticeHit}</td>
									</tr>
								</c:forEach>
							</table>


							<!-- 페이지 인터페이스 작업을 위한 div -->
							<div class="pageInfo_wrap">
								<div class="pageInfo_area">
									<ul id="pageInfo" class="pageInfo">
										<!-- 이전페이지 버튼 -->
										<c:if test="${pageMaker.prev}">
											<li class="pageInfo_btn previous"><a
												href="noticeList.do?pageNum=${pageMaker.startPage-1}&amount=10">Previous</a></li>
										</c:if>

										<!-- 각 번호 페이지 버튼 누른 거 표시되도록 -->
										<c:forEach var="num" begin="${pageMaker.startPage}"
											end="${pageMaker.endPage}">
											<li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a
												href="noticeList.do?pageNum=${num}&amount=10">${num}</a></li>
										</c:forEach>

										<!-- 다음페이지 버튼 -->
										<c:if test="${pageMaker.next}">
											<li class="pageInfo_btn next"><a
												href="noticeList.do?pageNum=${pageMaker.endPage + 1}&amount=10">Next</a></li>
										</c:if>

									</ul>
								</div>
							</div>

							<!-- 페이지 이동을 위한 폼 -->
							<form id="moveForm" method="get">
								<input type="hidden" name="pageNum"
									value="${pageMaker.cri.pageNum}"> <input type="hidden"
									name="amount" value="${pageMaker.cri.amount}">
							</form>

						</div>
						<br>

						<!-- Home 및 글쓰기 버튼 -->
						<div align="center">
							<div>
								<c:if test="${sessionAuthor eq 'ADMIN'}">
									<button class="btn btn-main btn-round-full" type="button"
										onclick="location.href='noticeInsertForm.do'">글쓰기</button>
								</c:if>
							</div>
							<form id="frm" name="frm" action="noticeSelect.do" method="post">
								<input type="hidden" id="noticeNo" name="noticeNo">
							</form>
						</div>
						<!-- End of Home 및 글쓰기 버튼 -->

					</div>
				</div>
			</div>
		</div>
	</section>
	
</body>
</html>