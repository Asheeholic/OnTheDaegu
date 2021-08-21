<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
	<style>
		.pageInfo{
			width: 500px;
			list-style : none;
			display: inline-block;
			margin: 18px 0 0 0;
			padding: 4px 0 0 0;
			text-align: center;
	   	}
	 	.pageInfo li{
			display: inline-block;
	   		font-size: 17px;
	   		margin-left: 9px;
	   		padding: 7px;
	   		font-weight: 500;
	 	}
		a:link {color:black; text-decoration: none;}
		a:visited {color:black; text-decoration: none;}
		a:hover {color:black; text-decoration: underline;}
		.pageInfo_btn.active{
      		text-decoration: underline;
  		}
  		.bg-1 {
			background: url("img/payForm.png") no-repeat 50% 50%;
			background-size: 100%;
			height: 320px;
			position: relative;
			z-index: -50;
		}
		body {
			line-height: 1.6;
			font-family: "Roboto", sans-serif;
			-webkit-font-smoothing: antialiased;
			font-size: 16px;
			color: #6F8BA4;
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
			background: #223a66;
			color: #fff;
			border-color: #223a66;
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
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>
                    <div class="col-lg-9">
	                    <!-- DataTales Example -->
	                    <div class="card shadow mb-4">
	                        <div class="card-header py-3">
	                            <h6 class="m-0 font-weight-bold">DataTables Example</h6>
	                        </div>
	                        <div class="card-body">
	                            <div class="table-responsive">
	                            <br>
	                                <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
	                                    <tr>
	                                        <th>No.</th>
	                                        <th>제목</th>
	                                        <th>작성자</th>
	                                        <th>작성일자</th>
	                                        <th>조회수</th>
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
								                    <li class="pageInfo_btn previous"><a href="noticeList.do?pageNum=${pageMaker.startPage-1}&amount=10">Previous</a></li>
								                </c:if>
									        
								                <!-- 각 번호 페이지 버튼 누른 거 표시되도록 -->
								                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
								                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="noticeList.do?pageNum=${num}&amount=10">${num}</a></li>
								                </c:forEach>
								                
								                <!-- 다음페이지 버튼 -->
								                <c:if test="${pageMaker.next}">
								                    <li class="pageInfo_btn next"><a href="noticeList.do?pageNum=${pageMaker.endPage + 1}&amount=10">Next</a></li>
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
	                            
	                            <!-- Home 및 글쓰기 버튼 -->
								<div align="center">
									<div>
										<c:if test="${sessionAuthor eq 'ADMIN'}">
											<button type="button" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
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
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
        </div>    
        <!-- End of Content Wrapper -->
    </div>
    <!-- End of Page Wrapper -->
    <!-- Scroll to Top Button-->
    <a class="scroll-to-top rounded" href="#page-top">
        <i class="fas fa-angle-up"></i>
    </a>
</body>
</html>