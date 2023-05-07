<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3 gap-3">
		<h1 class="">Welcome <c:out value="${user.userName}"/>!!</h1>
		<p>This is your dashboard. Nothing to see here yet.</p>
		<a href="/users/logout" class="btn btn-danger">Logout</a>
	</div>
</body>
</html>