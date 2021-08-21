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
 <!-- Icon Font Css -->
 <link rel="stylesheet" href="css/icofont.min.css">
</head>
<body>
	<tiles:insertAttribute name="header" />
	<tiles:insertAttribute name="body" />
	<tiles:insertAttribute name="footer" />
	<!-- bootstrap javascript -->
	<script src="js/bootstrap.bundle.min.js"></script>
	<%-- <tiles:insertAttribute name="menu" /> --%>
</body>
</html>