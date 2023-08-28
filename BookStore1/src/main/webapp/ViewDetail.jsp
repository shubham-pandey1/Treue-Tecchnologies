<%@page import="com.dao.RateDetDaoImp"%>
<%@page import="javax.servlet.jsp.tagext.TryCatchFinally"%>
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
<title>Book Details</title>
<style type="text/css">
.co{
	background-color: #f4f7f2;
}
.sp{
color: #46ad02;
}
</style>

<%@include file="AllComponent/allCss.jsp"%>
<link rel="stylesheet" href="AllComponent/style1.css">
</head>
<body style = "background-color: #fccaca">
	<%@include file="AllComponent/Navbar.jsp"%>
	<%
		String su = (String)session.getAttribute("fsmsg");
	  	String fa = (String)session.getAttribute("ffmsg");
		String bid1 = (String)session.getAttribute("bid");
		HttpSession sess = request.getSession();
	  	
	  	Format f = new SimpleDateFormat("HH.mm.ss");
		String time = f.format(new Date());
		
		int bid= 0;
		String st = request.getParameter("bid");
		
		if(st != null) bid = Integer.parseInt(st);
		else bid = Integer.parseInt(bid1);
		
		
		sess.setAttribute("bid1", bid+"");
		String uid = "";
		User user = (User)session.getAttribute("user");
		
		
	  	if(user != null)
  			uid = "&&uid="+ user.getId();
	  	
		
		BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
		BookDet bdt = bdi.getBookbyId(bid);
		
		
		String feed,add = "login.jsp";
		feed = "login.jsp";
	  	if(user != null){
	  		add = "CartServ?bid=" +bid+uid+ "&pg=view"; 
	  		feed = "RatingServ?bid="+bid;
	  	}
	%>
	 <% if(fa != null || su !=null){ %>
			    <div class="toast-container position-fixed bottom-0 end-0 me-2 mb-3 p-0 toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header pb-1 mb-0">
			     <c:if test="${not empty fsmsg}">
			      <strong class=" text-success"><i class="fa-solid fa-circle-check me-2 fa-beat"></i>Feedback Message</strong>
			      </c:if>
			    
			      <c:if test="${ not empty ffmsg}">
			      <strong class="me-auto text-danger "><i class="fa-solid fa-circle-xmark fa-beat me-2"></i>Feedback Message</strong>
			      </c:if>
			      <small class="ms-4"><%= time%></small>
			   	 <button type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
			      
			  </div>
			   <c:if test="${not empty fsmsg}">
			    <div class="toast-body text-success  m-0 p-auto text-center ">
			      ${fsmsg}
			    </div> 
			    <c:remove var="fsmsg" scope="session"/>
			    </c:if>
			    <c:if test="${ not empty ffmsg}">
			    <div class="toast-body text-danger p-1 m-0 text-center">
			      ${ffmsg}
			    </div>
			    <c:remove var="ffmsg" scope="session"/>
			    </c:if>
			</div>
			<%} %>
	<div class="container mb-5 ">
		<div class="row mt-4 ">
			<div class="col-md-5 me-5 co text-center mb-3 p-4">
				<img alt="" src="book/<%=bdt.getPhotoname()%>" style="height: 200px; width: 150px;"><br>
				<h5 class="mt-3">Book Name: <span class="sp"> <%=bdt.getBookname()%></span></h5>
				<h5>Author: <span class="sp"><%=bdt.getAuthor()%></span></h5>
				<h5>Category: <span class="sp"><%=bdt.getBookCategory() %></span></h5>
			</div>

			<div class="col-md-5 ms-5 text-center co p-4">
				<h3 class="text-center"> <%=bdt.getBookname()%></h3>
				<%
					if(bdt.getBookCategory().equalsIgnoreCase("old")){
				%>
					<h4 class="text-primary">Contact to Seller</h4>
					<h6 class="text-primary"><i class="fa-solid fa-envelope me-1"></i>Email: <span class="text-danger" ><%=bdt.getEmail()%></span></h6>
				<%} %>
				<div class="row mt-3">
					<div class="col-md-4 text-center p-2 text-danger">
						<i class="fa-solid fa-money-bill-1-wave fa-2x"></i>
						<h6 class="mt-2">Cash on Delivery</h6>
					</div>
					<div class="col-md-4 text-center p-2 text-success">
						<i class="fa-solid fa-arrow-rotate-left fa-2x"></i>
						<h6 class="mt-2">Return available</h6>
					</div>
					<div class="col-md-4 text-center p-2 text-primary">
						<i class="fa-solid fa-truck fa-2x"></i>
						<h6 class="mt-2">Free Delivery</h6>
					</div>
					<div class="row justify-content-center mt-4 mb-3">
					<% if(!bdt.getBookCategory().equalsIgnoreCase("old")){
					%>
						<div class="col-md-4 ms-2">
							<a href="<%=add%>" class="btn btn-primary "><i
								class="fa-solid fa-cart-shopping me-1"></i>Add Cart</a>
						</div>
					
					<% } else { %>
						<div class="col-md-6 ms-2">
							<a href="index.jsp" class="btn btn-success "><i
								class="fa-solid fa-cart-shopping me-1"></i>Continue Shopping</a>
						</div>
						<%} %>
						<div class="col-md-4 ">
							<a href="" class="btn btn-danger "><i
								class="fa-solid fa-indian-rupee-sign me-1"></i> <%=bdt.getPrice()%></a>
						</div>
					</div>
					<div>
					<h5>Give your valuable Feedback</h5>
						<form action="<%=feed %>" method="get">
						<div class="rating">
					    <label>
					      <input type="radio" name="stars" value="1" />
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    <label>
					      <input type="radio" name="stars" value="2" />
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    <label>
					      <input type="radio" name="stars" value="3" />
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>  
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>  
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>  
					    </label>
					    <label>
					      <input type="radio" name="stars" value="4" />
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    <label>
					      <input type="radio" name="stars" value="5" />
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    </div>
					    <div>
					    	<button type="submit" class="btn btn-info" >Submit</button>
					    </div>
					  </form>
					</div>
				</div>
			</div>
		</div>
	</div>
	
	<!--Start of Feedback section  -->
	<div class="container mb-5 pb-4">
		<h3 class= "text-center">Feedback's</h3>
		<div class="row">
			
			 <%
			  	RateDetDaoImp rdi = new RateDetDaoImp(Conpro.getCon());
			  	List<RateDet> list = rdi.getRate(bid);
			  	for(RateDet rd: list){
			  %>
			<div class = "col-md-3 ">
				<div class="card card-ho">
				<div class="card-body">
					<small class="ms-1 mt-1"><i class="fa-solid fa-face-laugh-beam me-1 text-success"></i>Feedback</small>
					<hr class="m-0 p-0">
				
					
					<p class="text-start m-0 ps-2 pt-1"><i class="fa-solid fa-user me-1 text-primary"></i><%=rd.getUname() %>...</p>
						<form>
						<div class="rating text-center">
					    <label tabindex= "-1">
					    <% if(rd.getRate() == 1){ %>
					      <input tabindex= "-1" type="radio" name="stars" value="1" checked="checked" readonly="readonly" disabled="disabled"/>
					    <%}else { %>
					    <input type="radio" name="stars" value="1" readonly="readonly" disabled="disabled"/>
					    <%} %>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    <label tabindex= "-1">
					      <% if(rd.getRate() == 2){ %>
					      <input tabindex= "-1" type="radio" name="stars" value="2" checked="checked" readonly="readonly" disabled="disabled"/>
					    <%}else { %>
					    <input tabindex= "-1" type="radio" name="stars" value="2" readonly="readonly" disabled="disabled"/>
					    <%} %>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    <label tabindex="-1" >
					      <% if(rd.getRate() == 3){ %>
					      <input tabindex= "-1" type="radio" name="stars" value="3" checked="checked" readonly="readonly" disabled="disabled"/>
					    <%}else { %>
					    <input type="radio" name="stars" value="3" readonly="readonly" disabled="disabled"/>
					    <%} %>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>  
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>  
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>  
					    </label>
					    <label tabindex= "-1">
					      <% if(rd.getRate() == 4){ %>
					      <input tabindex="-1"  type="radio" name="stars" value="4" checked="checked" readonly="readonly" disabled="disabled"/>
					    <%}else { %>
					    <input tabindex= "-1" type="radio" name="stars" value="4" readonly="readonly" disabled="disabled"/>
					    <%} %>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    <label tabindex= "-1">
					      <% if(rd.getRate() == 5){ %>
					      <input type="radio" name="stars" value="5" checked="checked" readonly="readonly" disabled="disabled"/>
					    <%}else { %>
					    <input tabindex= "-1" type="radio" name="stars" value="5" readonly="readonly" disabled="disabled"/>
					    <%} %>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					      <span class="icon"><i class="fa-solid fa-star fa-xs"></i></span>
					    </label>
					    </div>
					    
					  </form>
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
	<script  src="AllComponent/main1.js"></script>

	<div class="fixed-bottom">
		<%@include file="AllComponent/Footer.jsp"%>
	</div>
</body>
</html>