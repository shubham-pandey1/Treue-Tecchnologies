<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>User Registration</title>
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
	<div class="container mt-3 mb-4 pb-4">
		<div class="row mb-2">
			<div class="col-md-5 offset-md-4">
				<div class="card">
					<div class="card-body round-2">
						<h2 class ="text-center text-primary">Enter Registration Details</h2>
						<c:if test="${not empty serv}">
							<p class="text-center text-success">${serv}</p>
							<c:remove var= "serv" scope="session"/>
						</c:if>
						<c:if test="${not empty fserv}">
							<p class="text-center text-danger">${fserv}</p>
							<c:remove var= "fserv" scope="session"/>
						</c:if>
						<form action="RegisterServlet" method= "post" >
						<div class="mb-2">
							<label for="name" class="form-label">Enter full Name: </label>
							 <input type="text" class="form-control" id="formGroupExampleInput" placeholder="Enter Name" name="name" required>
						</div>
						<div class="mb-2">
							<label for="email" class="form-label">Email: </label>
							<input type="email" class="form-control"
								id="formGroupExampleInput2"
								placeholder="Email" name="email" required>
							<c:if test="${not empty exist}">
							<div id="emailHelp" class="form-text text-danger">${exist}</div>
							<c:remove var="exist" scope="session"/>
							</c:if>
						</div>
						<div class="mb-2">
							<label for="phone" class="form-label">Phone: </label> 
							<input type="number" class="form-control"
								id="formGroupExampleInput2"
								placeholder="Phone Number" name="phone" required>
						</div>
						<div class="mb-2">
							<label for="pass" class="form-label">Password: </label> 
							<input type="password" class="form-control"
								id="formGroupExampleInput2"
								placeholder="Password" name="pass" required>
						</div>
						<div class="form-check">
							<input type = "checkbox" class="form-check-input" id="examplecheck1" name="term"><label for="term" required>I Accept terms and conditions</label>
						</div>
						<div class = "mb-0">
							<button type="submit" class="btn btn-primary m-2">Submit</button>
							<button type="reset" class="btn btn-danger ms-5 m-2">Reset</button>
						</div>
						</form>
					</div>
				</div>

			</div>
		</div>
	</div>
	<div class="fixed-bottom mt-3">
	<%@include file= "AllComponent/Footer.jsp" %>
	</div>
</body>
</html>