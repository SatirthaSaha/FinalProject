<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html>
<head>
<title>Login</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./css/login.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

<script src="./js/jquery-3.3.1.min.js"></script>
<script src="./js/jquery-migrate-1.4.1.min.js"></script>
<script src="./js/jquery-ui-1.10.3.custom.min.js"></script>
</head>
<body background="./images/background.jpg" style="background-repeat: no-repeat; background-size: cover;">
	<div class="container-fluid">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid">
				<div class="navbar-header">
					<button type="button" class="navbar-toggle" data-toggle="collapse"
						data-target="#myNavbar">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<a class="navbar-brand" href="#"><span class="glyphicon glyphicon-education"></span>  ShikshaDham</a>
				</div>
				<div class="collapse navbar-collapse" id="myNavbar" style="">
					<ul class="nav navbar-nav">
						<spring:url value="/mentorLogin" var="url3" htmlEscape="true" />
						<li ><a href="${url3 }">Login As Mentor</a></li>
						<spring:url value="/adminLogin" var="url1" htmlEscape="true" />
						<li class="active"><a href="${url1 }">Login As Admin</a></li>
						<spring:url value="/userLogin" var="url2" htmlEscape="true" />
						<li ><a href="${url2 }">Login As User</a></li>
						
					</ul>
					
					
				</div>
			</div>
		</nav>
	</div>
	<div class="container">
		<div class="col-sm-2"></div>
		<div class="row">
			<div class="col-sm-8">
				<div class="card card-signin my-5">
					<div class="card-body">
						<h5 class="card-title text-center">Login</h5>
						<hr>
						<form:form class="form-signin" action="/loginAdmin" modelAttribute="ul">
							<div class="form-label-group"></div>
							<form:input type="text" placeholder="Username"
								class="form-control input-lg" id="email" path="email"/> <br />
							<div class="form-label-group"></div>
							<form:input type="password" placeholder="Password"
								class="form-control input-lg" id="password" path="password"/> <br />
							<div style="text-align: center;">
							<input type="submit" class="btn btn-primary" value="Login">								
							</div>
						</form:form>
					</div>
				</div>
			</div>
		</div>
		<div class="col-sm-2"></div>
	</div>
</body>
</html>