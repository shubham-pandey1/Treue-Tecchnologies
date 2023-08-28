<%@page import="com.entity.BookDet"%>
<%@page import="java.util.List"%>
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
<title>Old Books</title>
<%@include file = "AllComponent/allCss.jsp"%>

<style type="text/css">
	body{
		background: #fae6e6;
	}
	.co{
		display: inline-block;
		font-size: 5px;
		text-align: center
	}
	.mo{
		margin-bottom: 10px;
	}
	.cd{
		padding: 20px 0px;
	}
	.par{
		
		margin: 0px;
		
	}
	.card{
		text-align: center;
		
	}
	.card-ho:hover{
		background-color: #f0f4fa;
	}
</style>

</head>
<body>
	<%@include file = "AllComponent/Navbar.jsp" %>
	<div class="container" id = "recent">
		<h3 class= "text-center pt-2">Old Book</h3>
		<div class="row cd">
			
			  <%
			  	BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			  	List<BookDet> list = bdi.getAllOldBooks();
			  	for(BookDet bdt: list){
			  %>
			<div class = "col-md-3 ">
				<div class="card card-ho">
				<div class="card-body text-cneter">
					<img alt="<%=bdt.getBookname() %>" src="book/<%=bdt.getPhotoname()%>" style= "width:180px; height: 200px" class = "img-thumblin">
					<p class=" par"><%=bdt.getBookname() %></p>
					<p class= "par"><%=bdt.getAuthor() %></p>
					<p class= "par">Condition : <%=bdt.getBookCategory() %></p>
				</div>
				<div class= "co pb-2">
				 
					
					
					<a href="ViewDetail.jsp?bid=<%=bdt.getBookID()%>" class="btn btn-success btn-sm p-1-3 me-1 mo">View Details</a>
					<a href="" class="btn btn-danger btn-sm p-1-3 mo"><i class="fa-solid fa-indian-rupee-sign me-1"></i><%=bdt.getPrice() %></a>
				</div>
			</div>
			</div>
			<%} %>
			
		</div>
	</div>
	<div class="fixed-bottom">
	<%@include file="AllComponent/Footer.jsp"%>
	</div>
</body>
</html>