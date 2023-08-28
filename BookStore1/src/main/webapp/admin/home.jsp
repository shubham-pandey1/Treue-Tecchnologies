<%@page import="com.entity.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@include file="allCss.jsp" %>

<style type="text/css">
	.hov:hover{
		transform: scale(1.2);
		
	}
</style>
</head>
<body>
	<%@include file="Navbar.jsp" %>
	
	<%
		User user = (User)session.getAttribute("user");
		if(!user.getEmail().equals("admin@gmail.com"))
			response.sendRedirect("../login.jsp");
	%>
	
	<div class="container mt-5 p-5">
		<div class = "row d-flex justify-content-center mt-4">
		<h4 class="text-center text-danger">Admin Panel</h4>
		<div class = "col-md-3 hov">
		  <a href="add_books.jsp" class = "nav-link">
			<div class = "card">
				<div class = "card-body text-center text-primary">
					<i class="fa-solid fa-book-medical fa-3x "></i><br>
					<h4>Add Books</h4>
					_ _ _ _ _ _ _ 
				</div>
			</div>
		  </a>
		</div>
		<div class = "col-md-3 hov">
		<a href = "allbooks.jsp" class= "nav-link">
			<div class = "card">
				<div class = "card-body text-center text-success">
					<i class="fa-solid fa-book fa-3x "></i><br>
					<h4>All Books</h4>
					_ _ _ _ _ _ _ 
				</div>
			</div>
		  </a>
		</div>
		<div class = "col-md-3 hov">
			<a href= "AllOrder.jsp" class= "nav-link">
			<div class = "card">
				<div class = "card-body text-center text-warning">
					<i class="fa-solid fa-box-open fa-3x "></i><br>
					<h4>Orders</h4>
					_ _ _ _ _ _ _ 
				</div>
			</div>
			</a>
		</div>
		</div>
	</div>
	
<div class="fixed-bottom">
	<%@include file="Footer.jsp" %>
</div>
	
</body>
</html>