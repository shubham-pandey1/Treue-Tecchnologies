<%@page import="com.entity.*"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>

<%@page import="com.db.Conpro"%>
<%@page import="com.dao.BookDaoImp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Sell Book</title>
<%@include file="AllComponent/allCss.jsp" %>
<style type="text/css">
	body {
	background: #ebebf5;
}
</style>
</head>
<body>
<%@include file = "AllComponent/Navbar.jsp" %>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"/>
	</c:if>
<div class="container mt-3">
<div class="row">
	<div class="col-md-4 offset-md-4" >
		<div class="card">
			<div class="card-body" >
				<h5 class="text-center text-primary" >Enter your Old Book Details</h5>
				<c:if test="${not empty osmsg }">
					<h6 class="text-center text-success">${osmsg}</h6>
					<c:remove var="osmsg"/>
				</c:if>
				<c:if test="${not empty ofmsg }">
					<h6 class="text-center text-danger">${ofmsg}</h6>
					<c:remove var="ofmsg"/>
				</c:if>
				<form action="SellOldBook" method="post" enctype="multipart/form-data">
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
							
							<div class="form-group">
								<label for="image" class="form-label">Upload image: </label>
								<input type="file" class="form-control-file"
									id="exampleformcontrolfile1" name="file" required>
							</div>
							<div class="mb-0 text-center">
								<button type="submit" class="btn btn-primary m-2">Sell</button>
								<button type="reset" class="btn btn-danger ms-5 m-2">Reset</button>
							</div>
						</form>
			</div>
		</div>
	</div>
</div>
</div>
	
</body>
</html>