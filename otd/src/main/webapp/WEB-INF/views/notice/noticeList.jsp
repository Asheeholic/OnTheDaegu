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
          <span class="text-white">All Department</span> <!-- 엥 왜 색깔 안 먹히냐;;; -->
          <h1 class="text-capitalize mb-5 text-lg">Care Department</h1>

          <!-- <ul class="list-inline breadcumb-nav">
            <li class="list-inline-item"><a href="index.html" class="text-white">Home</a></li>
            <li class="list-inline-item"><span class="text-white">/</span></li>
            <li class="list-inline-item"><a href="#" class="text-white-50">All Department</a></li>
          </ul>  -->
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

                <!-- Topbar -->
                <div class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">
					Notice	
                </div>
                <!-- End of Topbar -->

                <!-- Begin Page Content -->
                <div class="container">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">Notice</h1>
                    <p class="mb-4">DataTables is a third party plugin that is used to generate the demo table below.
                        For more information about DataTables, please visit the <a target="_blank"
                            href="https://datatables.net">official DataTables documentation</a>.</p>

                    <!-- DataTales Example -->
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">DataTables Example</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive">
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
							                    <li class="pageInfo_btn previous"><a href="${pageMaker.startPage-1}">Previous</a></li>
							                </c:if>
								        
							                <!-- 각 번호 페이지 버튼 누른 거 표시되도록 -->
							                <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
							                    <li class="pageInfo_btn ${pageMaker.cri.pageNum == num ? "active":"" }"><a href="noticeList.do?pageNum=${num}&amount=10">${num}</a></li>
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
                            
                            <!-- Home 및 글쓰기 버튼 -->
							<div align="center">
								<div>
									<button type="button" onclick="location.href='home.do'">HOME</button>
									&nbsp;&nbsp;&nbsp;
									<button type="button" onclick="location.href='noticeInsertForm.do'">글쓰기</button>
								</div>
								<form id="frm" name="frm" action="noticeSelect.do" method="post">
									<input type="hidden" id="noticeNo" name="noticeNo">
								</form>	
							</div>
							<!-- End of Home 및 글쓰기 버튼 -->
							   
                        </div>
                    </div>
                </div>
                <!-- /.container-fluid -->
            </div>
            <!-- End of Main Content -->
            <!-- Footer -->
            <footer class="sticky-footer bg-white">
                <div class="container my-auto">
                    <div class="copyright text-center my-auto">
                        <span>Copyright &copy; Your Website 2020</span>
                    </div>
                </div>
            </footer>
            <!-- End of Footer -->

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