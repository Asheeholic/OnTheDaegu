<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<style>
		textarea {
			width: 100%;
			padding: 5px;
			box-sizing: border-box;
			border: solid 0px #1E90FF;
			border-radius: 5px;
			font-size: 16px;
			resize: both;
		}
	</style>
</head>
<body>
	<section class="page-title bg-1">
		<div class="overlay"></div>
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="block text-center">
						<h1 class="text-capitalize mb-5 text-lg">Notice</h1>
					</div>
				</div>
			</div>
		</div>
	</section>

	<!-- Page Wrapper -->
	<div id="wrapper">
		<!-- Content Wrapper -->
		<div id="content-wrapper" class="d-flex flex-column">
			<!-- Main Content -->
			<div id="content">
				<!-- Begin Page Content -->
				<div class="container" align="center">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800" style="margin: 40px">Notice</h1>
					<p class="mb-4">
						DataTables is a third party plugin that is used to generate the
						demo table below. For more information about DataTables, please
						visit the <a target="_blank" href="https://datatables.net">official
							DataTables documentation</a>.
					</p>
					<div class="col-lg-9">
						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold">DataTables Example</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<br>
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<tr>
											<th width="90">No.</th>
											<td width="90" align="center">${notice.noticeNo}</td>
											<th width="90">작성자</th>
											<td width="150" align="center">관리자</td>
											<th width="90">작성일자</th>
											<td width="150" align="center">${notice.noticeDate}</td>
											<th width="90">조회수</th>
											<td width="90" align="center">${notice.noticeHit}</td>
										</tr>
										<tr>
											<th>제목</th>
											<td colspan="7">${notice.noticeTitle}</td>
										</tr>
										<tr>
											<th>내용</th>
											<td colspan="7" align="center"><textarea rows="10" cols="87" style="vertical-align: middle;" readonly>${notice.noticeContent}</textarea></td>
										</tr>
									</table>
								</div>
							</div>
						</div>
						<div>
							<!-- 글 조회 후 다시 목록으로 돌아갈 때 마지막으로 머물렀던 페이지로 넘어가는 기능 미구현 -->
							<button type="button"
								onclick="location.href='noticeList.do?pageNum=1&amount=10'">목록</button>
							<c:if test="${sessionAuthor eq 'ADMIN'}">
				&nbsp;&nbsp;&nbsp;
				<button type="submit"
									onclick="location.href='noticeUpdateForm.do?noticeNo=${notice.noticeNo}'">수정</button>
				&nbsp;&nbsp;&nbsp;
				<button type="submit"
									onclick="location.href='noticeDelete.do?noticeNo=${notice.noticeNo}'">삭제</button>
							</c:if>
						</div>
					</div>
					<!-- /.container-fluid -->
				</div>
				<!-- End of Main Content -->
			</div>
			<!-- End of Content Wrapper -->
		</div>
		<!-- End of Page Wrapper -->
	</div>
</body>
</html>