<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@page isELIgnored= "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store: Login</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
	body{
		background: url("image/Book.jpeg");
		background-size: cover;
	}
</style>
</head>
<body>
	<%@include file="AllComponent/Navbar.jsp"%>
	<div class="container mt-5 mb-5">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
					   <h2 class="text-center text-primary">Login</h2>
					   <c:if test= "${not empty failedmsg}">
					   	<p class= "text-center text-danger">${failedmsg}</p>
					   	<c:remove var= "failedmsg" scope="session"/>
					   </c:if>
					   <c:if test= "${not empty lmsg}">
					   	<p class= "text-center text-success">${lmsg}</p>
					   	<c:remove var= "lmsg" scope="session"/>
					   </c:if>
					   <c:if test= "${not empty term}">
					   	<p class= "text-center text-warning">${term}</p>
					   	<c:remove var= "term" scope="session"/>
					   </c:if>
						<form action="LoginServ" method="post">
							<div class="mb-3">
								<label for="email" class="form-label">Email address: </label> 
								<input type="email" class="form-control" name = "email" id="exampleInputEmail1" aria-describedby="emailHelp">
								<div id="emailHelp" class="form-text">We'll never share
									your email with anyone else.</div>
							</div>
							<div class="mb-3">
								<label for="pass" class="form-label">Password: </label>
								<input type="password" class="form-control" name = "pass" id="exampleInputPassword1" required>
							</div>
							<div class="mb-3 form-check">
							<input type="checkbox" class="form-check-input" id="exampleCheck1" name="term"> 
							<label class="form-check-label" for="term" required>I accept term and condition</label>
							</div>
							<div class="text-align">
								<button type="submit" class="btn btn-primary">Submit</button>
								<button type="reset" class="btn btn-danger ms-5">Reset</button>
							</div>
							<a href="register.jsp">Click here for new User</a>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="fixed-bottom">
		<%@include file="AllComponent/Footer.jsp"%>
	</div>
</body>
</html>