<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>sidebar</title>
</head>
<body>
	<div class="d-flex flex-column flex-shrink-0 p-3 sidebar text-white col-xl-2 col-12 border-end border-secondary shadow ">
	    <a href="home.do" class="d-flex align-items-center mb-3 mb-md-0 text-white text-decoration-none">
	      <svg class="bi" width="40" height="32"><use xlink:href="#bootstrap"/></svg>
	      <span class="fs-4">Ye-Dam<br>Art Collage</span>
	    </a>
	    <hr>
	    <ul class="nav nav-pills flex-column mb-auto">
	      <li class="nav-item">
	        <a href="home.do" class="nav-link ${home } text-white" aria-current="page">
	          <svg class="bi me-2" width="16" height="16"><use xlink:href="#home"/></svg>
	          Home
	        </a>
	      </li>
	      <li>
	        <a href="snsList.do" class="nav-link ${community } text-white">
	          <svg class="bi me-2" width="16" height="16"><use xlink:href="#speedometer2"/></svg>
	          Community
	        </a>
	      </li>
	      <c:if test="${session.author == 'STUDENT'}">
		      <li>
		        <a href="examForm.do" class="nav-link ${examSubmitPage } text-white">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
		          Exam Submit
		        </a>
		      </li>
	      </c:if>
	      <c:if test="${session.author == 'PROFESSOR'}">
		      <li>
		        <a href="examList.do" class="nav-link ${examListPage } text-white">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
		          Exam List
		        </a>
		      </li>
	      </c:if>
	      <c:if test="${session.author == 'ADMIN'}">
		      <li>
		        <a href="examForm.do" class="nav-link ${examSubmitPage } text-white">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#table"/></svg>
		          Exam Submit
		        </a>
		      </li>
		      <li>
		        <a href="examList.do" class="nav-link ${examListPage } text-white">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#grid"/></svg>
		          Exam List
		        </a>
		      </li>
		      <li>
		        <a href="memberList.do" class="nav-link ${memberListPage } text-white">
		          <svg class="bi me-2" width="16" height="16"><use xlink:href="#people-circle"/></svg>
		          Member List
		        </a>
		      </li>
	      </c:if>
	    </ul>
	    <hr>
	    <div class="dropdown">
	      <a href="#" class="d-flex align-items-center text-white text-decoration-none dropdown-toggle" id="dropdownUser1" data-bs-toggle="dropdown" aria-expanded="false">
	        <img src="https://github.com/mdo.png" alt="" width="32" height="32" class="rounded-circle me-2">
	        <strong>${sessionName }님 (${sessionId })</strong>
	      </a>
	      <ul class="dropdown-menu dropdown-menu-dark text-small shadow" aria-labelledby="dropdownUser1">
	        <li><a class="dropdown-item" href="memberSelect.do?id=${session.id}">Profile</a></li>
	        <li><hr class="dropdown-divider"></li>
	        <li><a class="dropdown-item" href="logout.do">Log out</a></li>
	      </ul>
	    </div>
  	</div>
</body>
</html>