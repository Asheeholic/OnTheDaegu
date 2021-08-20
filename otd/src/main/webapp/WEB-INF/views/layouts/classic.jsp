<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>예담예술대학교 LMS</title>
<!-- bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
 <!-- Main Stylesheet -->
 <link rel="stylesheet" href="css/style.css">
</head>
<body>
	<div class="container-fluid">
		<div class="d-flex flex-stratch row" >
			<div class="col-12">
				<div class="row">
					<div class="col-12 sticky-top shadow"> <tiles:insertAttribute name="header" /></div>
				</div>
			</div>
		</div>
				<tiles:insertAttribute name="body" />
				<tiles:insertAttribute name="footer" />
	</div>
	<!-- bootstrap javascript -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<%-- <tiles:insertAttribute name="menu" /> --%>
</body>
</html>