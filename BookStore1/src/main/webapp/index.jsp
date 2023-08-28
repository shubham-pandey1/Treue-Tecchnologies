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
<title>Online Book Store</title>
<%@include file = "AllComponent/allCss.jsp"%>
<style type= "text/css">
	.back-img{
		background: url("image/Book1.jpeg");
		height: 60vh;
		min-height: 400px;
		width: 100%;
		Background-repeat: no-repeat;
		background-size: cover;
		
	}
	body{
		background: #fae6e6;
	}
	.back-img h1{
		text-align: center;
		color: #fc6203;
	}
	.anc{
		
		text-decoration: none;
	}
	.co{
		display: inline-block;
		font-size: 5px;
		text-align: center
	}
	.mo{
		text-decoration: none;
		padding: 1px;
		color: white;
		margin: 0px 1px 10px 1px;
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
	
	<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
	
	
	<div class= "container-fluid back-img">
		<h1> <i class="fa-solid fa-book-open-reader pt-3 me-3"></i>Online Book Store</h1>
	</div>
	<!-- Start recent book -->
	<div class="container" id = "recent">
		<h3 class= "text-center">Recent Book</h3>
		<div class="row cd">
			
			  <%
			  	
			  	String su = (String)session.getAttribute("addmsg");
			  	String fa = (String)session.getAttribute("fadd");
			  	
				Format f = new SimpleDateFormat("HH.mm.ss");
				String time = f.format(new Date());
			
			  	String uid = "";
							  
			  	User us1 = (User)session.getAttribute("user");
			  	if(us1 != null)
			  		uid = "&&uid="+ us1.getId();
				
			  	BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
			  	List<BookDet> list = bdi.getRecentBooks();
			  	for(BookDet bdt: list){
			  	String add = "login.jsp";
			  	if(us1 != null){
			  		add = "CartServ?id=" +bdt.getBookID()+uid +"&&pg=index"; 
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
			
			  
			<div class = "col-md-3 ">
				<div class="card card-ho">
				<div class="card-body text-cneter">
					<img alt="<%=bdt.getBookname() %>" src="book/<%=bdt.getPhotoname()%>" style= "width:180px; height: 200px" class = "img-thumblin">
					<p class=" par"><%=bdt.getBookname() %></p>
					<p class= "par"><%=bdt.getAuthor() %></p>
					<p class= "par">Condition : <%=bdt.getBookCategory() %></p>
				</div>
				<div class= "co pb-2">
				  <% if(bdt.getBookCategory().equalsIgnoreCase("new")){ %>
				   <!-- Button trigger modal -->
					<a href="<%=add%>" class="btn btn-danger btn-sm p-1-3 me-1 mo "><i class="fa-solid fa-cart-shopping me-1"></i>Add Cart</a>
					<%} %>
					<a href="ViewDetail.jsp?bid=<%=bdt.getBookID()%>" class="btn btn-success btn-sm p-1-3 me-1 mo">View Details</a>
					<a href="" class="btn btn-danger btn-sm p-1-3 mo"><i class="fa-solid fa-indian-rupee-sign me-1"></i><%=bdt.getPrice() %></a>
				</div>
			</div>
			</div>
			<%} %>
			
		</div>
	</div>
	<!-- End recent book -->
	<div class = "text-center text-white"><a href="recentBook.jsp" class = "btn btn-danger mb-3">View All</a></div> 
	<!-- Start new book -->
	<div class="container" id = "recent">
		<h3 class= "text-center">New Book</h3>
		<div class="row cd">
			
			 <%
			  	
			  	List<BookDet> list1 = bdi.getNewBooks();
			  	for(BookDet bdt: list1){
			  		String add = "login.jsp";
				  	if(us1 != null){
				  		add = "CartServ?id=" +bdt.getBookID()+uid; 
				  	}
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
				
					<a href="<%=add%>" class="btn btn-danger btn-sm p-1-3 me-1 mo"><i class="fa-solid fa-cart-shopping me-1"></i>Add Cart</a>
					<a href="ViewDetail.jsp?bid=<%=bdt.getBookID()%>" class="btn btn-success btn-sm p-1-3 me-1 mo">View Details</a>
					<a href="" class="btn btn-danger btn-sm p-1-3 mo"><i class="fa-solid fa-indian-rupee-sign me-1"></i><%=bdt.getPrice() %></a>
				</div>
			</div>
			</div>
			<%} %>
			
		</div>
	</div>
	<!-- End new book -->
	<div class = "text-center text-white"><a href="newBook.jsp" class = "btn btn-danger mb-3">View All</a></div> 
	<!-- Start old book -->
	<div class="container" id = "recent">
		<h3 class= "text-center">Old Book</h3>
		<div class="row cd">
			
			<%
			  	
			  	List<BookDet> list2 = bdi.getOldBooks();
			  	for(BookDet bdt: list2){
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
	<!-- End old book -->
	<div class = "text-center text-white"><a href="oldBook.jsp" class = "btn btn-danger mb-3">View All</a></div> 
	
    
	<script  src="AllComponent/main.js"></script>
	<%@include file="AllComponent/Footer.jsp"%>
	
</body>
</html>