<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공지목록</title>
	<script type="text/javascript">
		function getRecord(n) {
			frm.noticeNo.value = n;
			frm.submit();
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