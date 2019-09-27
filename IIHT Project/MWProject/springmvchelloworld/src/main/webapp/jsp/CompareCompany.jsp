<%@ page language="java" contentType="text/html; charset=ISO-8859-1" import="com.example.stockspring.model.User"
	pageEncoding="ISO-8859-1"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Bootstrap Example</title>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">

<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link rel="stylesheet" type="text/css" href="./styles/style.css" />
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
</head>
<body>
<%response.setHeader("Cache-Control","no-cache");
	  response.setHeader("Cache-Control","no-store");
	  response.setHeader("Pragma","no-cache");
	  response.setDateHeader ("Expires", 0); %>
	<c:if test="${sessionScope.user.id==null}">
		<%response.sendRedirect("/Home"); %>
	</c:if>
	<c:if test="${(sessionScope.user.usertype).equals('admin') }">
	<%response.sendRedirect("/AccessDenied"); %> %>
	</c:if>
	<%
		User user = (User) request.getAttribute("user");
		System.out.println(user);
	%>
	<div class="header">
		<nav class="navbar navbar-inverse">
			<div class="container-fluid" style="background: black">
				<div class="navbar-header">
					<img alt="logo" src="./images/logo.png">
				</div>
				<div class="navbar-header">
					<spring:url value="/userLandingPage" var="home" htmlEscape="true" />
					<a class="navbar-brand" href="${home }" style="color: white"><b>&nbsp;Stock
							Exchange Chart</b></a>
				</div>
				<ul class="nav navbar-nav">
					<spring:url value="/getIPODetails" var="url6" htmlEscape="true" />
					<li><a href="${url6 }">IPOs</a></li>
					<spring:url value="/compareCompany" var="url1" htmlEscape="true" />
					<li><a href="${url1}">Compare Company</a></li>
					<spring:url value="/graph" var="url2" htmlEscape="true" />
					<li><a href="${url2 }">Stock Graph</a></li>
				</ul>
				<div class="nav navbar-nav navbar-right" id="logout">
					<button class="dropdown-toggle"
						data-toggle="dropdown" style="background-color: black;border: none;">
          				<span class="glyphicon glyphicon-cog" id="glyph" style="font-size: 30px; background-color: black;color: gray;"></span></button>
						<ul class="dropdown-menu">
							<spring:url value="/resetPassword" var="url2" htmlEscape="true" />
							<li><a href="${url2 }" style="color: white;">Reset Password</a></li>
							<spring:url value="/logout" var="url3" htmlEscape="true" />
							<li><a href="${url3 }" style="color: white;">Logout &nbsp;&nbsp;&nbsp;<span class="glyphicon glyphicon-off"></span></a></li>
						</ul>
				</div>
			</div>
		</nav>
	</div>
	<div id="mySidenav" class="sidenav">
		<a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
		<img class="aligncenter" alt="userphoto"
			src="./images/Profilepicture.jfif" width="200px" height="200px"
			style="padding-left: 40px;"><br>
		<hr>
		<p class="aligncenter" style="color: white;">ID:
			${sessionScope.user.id }</p>
		<hr>
		<p class="aligncenter" style="color: white;">Name:
			${sessionScope.user.username }</p>
		<hr>
		<p class="aligncenter" style="color: white;">Mail ID:
			${sessionScope.user.email }</p>
		<hr>
		<p class="aligncenter" style="color: white;">Contact Number:
			${sessionScope.user.mobilenumber }</p>
		<hr>

	</div>
	<span style="font-size: 30px; color: white; cursor: pointer"
		onclick="openNav()">&#9776;</span>
	<script>
		function openNav() {
			document.getElementById("mySidenav").style.width = "250px";
		}

		function closeNav() {
			document.getElementById("mySidenav").style.width = "0";
		}
	</script>
	<div class="container">
		<!-- Code starts from here -->
		<div class="row">
			<div class="col-sm-3"></div>
			<div>
				<div class="col-sm-6">
					<div class="card">
						<div class="card-body">
							<h3 class="card-title text-center" align="center">Compare Companies  <span class="glyphicon glyphicon-stats"></span></h3>
							<hr>
							<form:form class="form" role="form" autocomplete="off" action="/compare" modelAttribute="e1">
								<div class="form-group row">
									<label class="col-lg-4 col-form-label form-control-label">Select
										Company Code:</label>
									<div class="col-lg-8">
										<form:select class="form-control" path="c1" id="c1">
											<option value="" disabled selected style="display: none;">-:Select Company Code:-</option>
        									<c:forEach items="${companyList}" var="cl">
        										<form:option value="${cl.company_code}">${cl.company_code}-${cl.company_Name}</form:option>
        									</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label form-control-label">Select
										Company Code:</label>
									<div class="col-lg-8">
										<form:select class="form-control" path="c2" id="c2
										-">
											<option value="" disabled selected style="display: none;">-:Select Company Code:-</option>
        									<c:forEach items="${companyList}" var="cl">
        										<form:option value="${cl.company_code}">${cl.company_code}-${cl.company_Name}</form:option>
        									</c:forEach>
										</form:select>
									</div>
								</div>
								<div class="form-group row">
									<label class="col-lg-4 col-form-label form-control-label"></label>
									<div class="col-lg-8">
										<div class="col-lg-2">
							
										</div>
										<div class="col-lg-3">
											<input type="submit" class="btn btn-primary"
												value="Compare"/>
										</div>
									</div>
								</div>
							</form:form>
						</div>
					</div>
				</div>
				<div class="col-sm-3"></div>
			</div>
		</div>
		<!-- Code ends here -->
	</div>
	<div class="footer">
		<h4>Copyright � 2019 Stock Exchange Chart-All Rights Reserved</h4>
	</div>

</body>
</html>