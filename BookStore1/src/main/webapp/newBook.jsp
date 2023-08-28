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
<title>New Books</title>
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
		<h3 class= "text-center pt-2">New Books</h3>
		<div class="row cd">
			
			  <%
			  	String su = (String)session.getAttribute("addmsg");
			  	String fa = (String)session.getAttribute("fadd");
			  	
			  	Format f = new SimpleDateFormat("HH.mm.ss");
				String time = f.format(new Date());
			  	
				String uid = "";
				  
			  	User user = (User)session.getAttribute("user");
			  	if(user != null)
			  		uid = "&uid="+ user.getId();
			  	
			  	BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			  	List<BookDet> list = bdi.getAllNewBooks();
			  	for(BookDet bdt: list){
			  		String add = "login.jsp";
				  	if(user != null){
				  		add = "CartServ?id=" +bdt.getBookID()+ uid+"&pg=new"; 
				  	}
			  %>
			   <% if(fa != null || su !=null){ %>
			    <div class="toast-container position-fixed bottom-0 end-0 me-2 mb-3 p-0 toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header pb-1 mb-0">
			     <c:if test="${not empty addmsg}">
			      <strong class=" text-success"><i class="fa-solid fa-circle-check me-2 fa-beat"></i>Cart Message</strong>
			      </c:if>
			    
			      <c:if test="${ not empty fadd}">
			      <strong class="me-auto text-danger "><i class="fa-solid fa-circle-xmark fa-beat me-2"></i>Cart Message</strong>
			      </c:if>
			      <small class="ms-4"><%= time%></small>
			   	 <button type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
			      
			  </div>
			   <c:if test="${not empty addmsg}">
			    <div class="toast-body text-success  m-0 p-auto text-center ">
			      ${addmsg}
			    </div> 
			    <c:remove var="addmsg" scope="session"/>
			    </c:if>
			    <c:if test="${ not empty fadd}">
			    <div class="toast-body text-danger p-1 m-0 text-center">
			      ${fadd}
			    </div>
			    <c:remove var="fadd" scope="session"/>
			    </c:if>
			</div>
			<%} %>
			<div class = "col-md-3 mb-4">
				<div class="card card-ho">
				<div class="card-body text-cneter">
					<img alt="<%=bdt.getBookname() %>" src="book/<%=bdt.getPhotoname()%>" style= "width:auto; height: 200px" class = "img-thumblin">
					<p class=" par"><%=bdt.getBookname() %></p>
					<p class= "par"><%=bdt.getAuthor() %></p>
					<p class= "par">Condition : <%=bdt.getBookCategory() %></p>
				</div>
				<div class= "co pb-2">
				 
					<a href="<%=add%>" class="btn btn-danger btn-sm p-1-3 me-1 mo"><i class="fa-solid fa-cart-shopping me-1"></i>Add Cart</a>
					
					<a href="ViewDetail.jsp?bid=<%=bdt.getBookID()%>" class="btn btn-success btn-sm p-1-3 me-1 mo">View Details</a>
					<a href="" class="btn btn-danger btn-sm p-1-3 mo"><i class="fa-solid fa-indian-rupee-sign me-1"></i><%=bdt.getPrice() %></a>
				</div>
			</div>
			</div>
			<%} %>
			
		</div>
	</div>
	
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	
	<script  src="AllComponent/main.js"></script>
	<div class="fixed-bottom">
	<%@include file="AllComponent/Footer.jsp"%>
	</div>
</body>
</html>