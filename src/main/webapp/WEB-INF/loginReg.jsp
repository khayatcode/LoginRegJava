<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login & Reg</title>
<link rel="stylesheet" href="/webjars/bootstrap/css/bootstrap.min.css">
</head>
<body>
	<div class="container mt-3">
		<div class="d-flex justify-content-around gap-3">
			<div class="col-5 bg-secondary p-5 rounded">
				<h2 class="text-white">Register</h2>
				<form:form action="/users/register" method="post"
					modelAttribute="newUser">
					<div class="mb-3">
						<form:label path="userName" class="form-label text-white">User Name:</form:label>
						<div class="mb-3">
							<form:errors path="userName" class="text-danger" />
						</div>
						<form:input path="userName" class="form-control" type="text" />
					</div>
					<div class="mb-3">
						<form:label path="email" class="form-label text-white">Email:</form:label>
						<div class="mb-3">
							<form:errors path="email" class="text-danger" />
						</div>
						<form:input path="email" class="form-control" type="email" />
					</div>
					<div class="mb-3">
						<form:label path="password" class="form-label text-white">Password:</form:label>
						<div class="mb-3">
							<form:errors path="password" class="text-danger" />
						</div>
						<form:input path="password" class="form-control" type="password" />
					</div>
					<div class="mb-3">
						<form:label path="confirm" class="form-label text-white">Confirm Password:</form:label>
						<div class="mb-3">
							<form:errors path="confirm" class="text-danger" />
						</div>
						<form:input path="confirm" class="form-control" type="password" />
					</div>
					<input type="submit" value="Register" class="btn btn-warning" />
				</form:form>
			</div>
			<div class="col-5 p-5 bg-primary rounded">
				<h2 class="text-white">Log in</h2>
				<form:form action="/users/login" method="post"
					modelAttribute="newLogin">
					<div class="mb-3">
						<form:label path="email" class="form-label text-white">Email:</form:label>
						<div class="mb-3">
							<form:errors path="email" class="text-danger" />
						</div>
						<form:input path="email" class="form-control" type="email" />
					</div>
					<div class="mb-3">
						<form:label path="password" class="form-label text-white">Password:</form:label>
						<div class="mb-3">
							<form:errors path="password" class="text-danger" />
						</div>
						<form:input path="password" class="form-control" type="password" />
					</div>
					<input type="submit" value="Login" class="btn btn-warning">
				</form:form>
			</div>
		</div>
	</div>
</body>
</html>