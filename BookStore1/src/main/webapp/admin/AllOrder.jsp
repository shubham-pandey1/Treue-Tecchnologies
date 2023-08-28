<%@page import="com.dao.OrderDaoImp"%>
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
<title>Admin: All Books</title>
<%@include file="allCss.jsp"%>
</head>
<body>
	<%@include file="Navbar.jsp"%>
	<%
		User user = (User)session.getAttribute("user");
		if(!user.getEmail().equals("admin@gmail.com"))
			response.sendRedirect("../login.jsp");
	%>
	<h3 class="text-center m-3 text-success">All Orders</h3>
	<table class="table table-striped mb-5 ">
		<thead class="bg-primary text-white text-center">
			<tr>
				<th scope="col">Order ID</th>
				<th scope="col">Name</th>
				<th scope="col">Email</th>
				<th scope="col">Address</th>
				<th scope="col">Phone No.</th>
				<th scope="col">Book Name</th>
				<th scope="col">Author</th>
				<th scope="col">Price</th>
				<th scope="col">Payment type</th>
			</tr>
		</thead>
		<tbody>
		<%
				
				
				OrderDaoImp	odi = new OrderDaoImp(Conpro.getCon());
				List<Order> list = odi.getAllOrdered();
				for(Order o: list){
		%>
		<tr>
			<td scope="col"><%=o.getSoid() %></td>
			<td scope="col"><%=o.getUname() %></td>
			<td scope="col"><%=o.getEmail() %></td>
			<td scope="col"><%=o.getAddress() %></td>
			<td scope="col"><%=o.getPhone() %></td>
			<td scope="col"><%=o.getBookname() %></td>
			<td scope="col"><%=o.getAuthor() %></td>
			<td scope="col"><%=o.getPrice() %></td>
			<td scope="col"><%=o.getPayment() %></td>
		</tr>
		<%} %>
		</tbody>
		<tfoot class="mb-5"></tfoot>
		
	</table>
<div class="fixed-bottom mt-2">
	<%@include file="Footer.jsp" %>
</div>
</body>
</html>