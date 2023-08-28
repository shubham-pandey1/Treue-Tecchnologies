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
<title>Insert title here</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
body {
	background: #ebebf5;
}
</style>
</head>
<body>
	<%@include file="AllComponent/Navbar.jsp"%>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"/>
	</c:if>
	<div class="container mt-2">
		<h3 class="text-center text-primary">Your Orders</h3>
		<table class="table table-striped text-center mt-2">
  			<thead class="bg-primary text-white">
				<tr>
					<th scope="col">Order ID</th>
					<th scope="col">Name</th>
					<th scope="col">Book Name</th>
					<th scope="col">Author</th>
					<th scope="col">Price</th>
					<th scope="col">Payment Type</th>

				</tr>
			</thead>
			<tbody>
			<%
				User user = (User)session.getAttribute("user");
				
				OrderDaoImp	odi = new OrderDaoImp(Conpro.getCon());
				List<Order> list = odi.getOrderedBook(user.getId());
				for(Order o: list){
			%>
				<tr>
					<td scope="col"><%=o.getSoid() %></td>
					<td scope="col"><%=user.getName() %></td>
					<td scope="col"><%=o.getBookname() %></td>
					<td scope="col"><%=o.getAuthor() %></td>
					<td scope="col"><%=o.getPrice() %></td>
					<td scope="col"><%=o.getPayment() %></td>

				</tr>
				<%} %>
			</tbody>
		</table>
	</div>

</body>
</html>