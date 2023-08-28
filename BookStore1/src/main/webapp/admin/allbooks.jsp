<%@page import="com.entity.BookDet"%>
<%@page import="com.db.Conpro"%>
<%@page import="com.dao.BookDaoImp"%>
<%@page import="java.util.*"%>
<%@page import="com.dao.BookDao"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="com.entity.User"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin: All Books</title>
<%@include file="allCss.jsp" %>
</head>
<body>
<%@include file="Navbar.jsp" %>
	<%
		User user = (User)session.getAttribute("user");
		if(!user.getEmail().equals("admin@gmail.com"))
			response.sendRedirect("../login.jsp");
	%>
	<h3 class = "text-center m-3 text-success">All Books</h3>
	<c:if test="${not empty smsg}">
	 	<p class="text-success text-center">${smsg}</p>
	 	<c:remove var="smsg" scope="session"/>
	 </c:if>
	 <c:if test="${not empty fmsg}">
	 	<p class="text-success text-center">${fmsg }</p>
	 	<c:remove var="fmsg" scope="session"/>
	 </c:if>
	 <div class="pb-5">
	<table class="table table-striped p-3 text-center">
	<thead class="bg-primary text-white">
  		<tr>
  			<th scope = "col">ID</th>
  			<th scope = "col">Book Name</th>
  			<th scope = "col">Author</th>
  			<th scope = "col">Price</th>
  			<th scope = "col">Categories</th>
  			<th scope = "col">Status</th>
  			<th scope = "col">Seller Email</th>
  			
  			<th scope = "col">Action</th>
  		</tr>
  		</thead>
  		<%
  			BookDaoImp dao= new BookDaoImp(Conpro.getCon());
  			List<BookDet> list = dao.getAllBooks();
  			for(BookDet b: list){
  		%>
  		<tr>
  			<td scope = "row"><%=b.getBookID()%></td>
  			<td scope = "row"><%=b.getBookname()%></td>
  			<td scope = "row"><%=b.getAuthor()%></td>
  			<td scope = "row"><%=b.getPrice()%></td>
  			<td scope = "row"><%=b.getBookCategory()%></td>
  			<td scope = "row"><%=b.getStatus()%></td>
  			<td scope = "row"><%=b.getEmail()%></td>
  			<td scope = "row">
  				<a href = "editbook.jsp?id=<%=b.getBookID()%>" class = "btn btn-sm btn-primary"><i class="fa-solid fa-pen-to-square me-2"></i>Edit</a>
  				<a href = "../DeleteBook?id=<%=b.getBookID()%>&fr=all" class = "btn btn-sm btn-danger"><i class="fa-solid fa-trash-can me-2"></i>Delete</a>
  			</td>
  		</tr>
  		<%} %>
	</table>
	</div>
<div class="fixed-bottom ">
	<%@include file="Footer.jsp"%>
</div>
</body>
</html>