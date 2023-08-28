<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<%@page import="com.entity.User"%>

<!DOCTYPE html>
<html>
<head>
<style type="text/css">
	body{
		background: url("../image/Book.jpeg");  
		background-size: cover;
	}
</style>
<meta charset="UTF-8">
<title>Store: Add Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	<%
		User user = (User)session.getAttribute("user");
		if(!user.getEmail().equals("admin@gmail.com"))
			response.sendRedirect("../login.jsp");
	%>
	<div class="container my-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-success">Add Books</h4>
						 <c:if test="${not empty smsg}">
						 <h6 class="text-center text-success">${smsg}</h6>
						 <c:remove var="smsg" scope="session"/>
						 </c:if>
						 <c:if test="${not empty fmsg}">
							 <p class="text-center text-danger">${fmsg}</p>
							 <c:remove var="fmsg" scope="session"/>
						 </c:if>
						  <form action="../BooksAdd" method="post" enctype="multipart/form-data">
							<div class="mb-2">
								<label for="bname" class="form-label">Book Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Book Name" name="bname" required>
							</div>
							<div class="mb-2">
								<label for="aname" class="form-label">Author Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Author name" name="aname" required>
							</div>
							<div class="mb-2">
								<label for="price" class="form-label">Price: </label> <input
									type="number" class="form-control" id="formGroupExampleInput2"
									placeholder="Price" name="price" required>
							</div>
							<div class="mb-2">
								<label for="btype" class="form-label">Book Categories: </label> 
								<select class="form-select" aria-label="Default select example" name="btype">
									  <option selected>---Select---</option>
									  <option value="New">New Book</option>
									  
									</select>
							</div>
							
							<div class="mb-2">
								<label for="status" class="form-label">Book Status: </label> 
								<select class="form-select" aria-label="Default select example" name="status" required>
									  <option selected>---Select---</option>
									  <option value="Active">Active</option>
									  <option value="Inactive">Inactive</option>
									</select>
							</div>
							<div class="form-group">
								<label for="image" class="form-label">Upload image: </label>
								<input type="file" class="form-control-file"
									id="exampleformcontrolfile1" name="file" required>
							</div>
							<div class="mb-0">
								<button type="submit" class="btn btn-primary m-2">Add</button>
								<button type="reset" class="btn btn-danger ms-5 m-2">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="d-flex-bottom">
		<%@include file="Footer.jsp" %>
	</div>
</body>
</html>