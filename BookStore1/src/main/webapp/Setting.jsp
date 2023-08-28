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
<title>Profile Setting</title>
<%@include file="AllComponent/allCss.jsp" %>
<style type="text/css">
	.help{
		height: 100px;
		width: 100px;
	}
	body {
	background-color: #ebebf5; 
}
.clr{
	color: #FE6949;
}
</style>
</head>
<body>
	<%@include file = "AllComponent/Navbar.jsp" %>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"/>
	</c:if>
	<div class="container mt-3">
		<h3 class="text-primary text-center">Hello, ${user.name}</h3>
		<div class="row p-3">
			<div class="col-md-4 ">
				<a href="SellBook.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center ">
							<i class="fa-solid fa-book-open-reader fa-3x text-primary"></i>
							<h4 class="mt-3">Sell Old Book</h4>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4 ">
				<a href="MyBook.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center text-danger">
							<i class="fa-solid fa-book-medical fa-3x clr"></i>
							<h4 class="mt-3">My Old Books</h4>
						</div> 
					</div>
				</a>
			</div>
			<div class="col-md-4 ">
				<a href="EditProfile.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center text-primary">
							<i class="fa-solid fa-user-pen fa-3x"></i>
							<h4 class="mt-3 text-danger">Edit Profile</h4>
						</div>
					</div>
				</a>
			</div>
		</div>
		<div class="row p-3 justify-content-center">
			
			<div class="col-md-4 ">
				<a href="order.jsp" class="text-decoration-none">
					<div class="card">
						<div class="card-body text-center text-warning">
							<i class="fa-solid fa-box-open fa-3x"></i>
							<h4 class="mt-3">My Order</h4>
							<h6>See your orders</h6>
						</div>
					</div>
				</a>
			</div>
			<div class="col-md-4">
				<a href="helpline.jsp" class="text-decoration-none">			
					<div class="card pt-0">
						<div class="card-body text-center text-primary">
							<img alt="" src="image/help.avif" class="help">
							<h4>Help Center</h4>
							<h6>24*7 Service</h6>
						</div>
					</div>
				</a>
			</div>
				
			</div>

		</div>
</body>
</html>