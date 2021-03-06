<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://tiles.apache.org/tags-tiles" prefix="tiles"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>On The Daegu</title>
<!-- bootstrap css -->
<link href="css/bootstrap.min.css" rel="stylesheet">
 <!-- Main Stylesheet -->
 <link rel="stylesheet" href="css/style.css">
<!-- icon -->
 <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.8.2/css/all.min.css"/>
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