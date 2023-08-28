<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="java.util.*"%>
<%@page import="java.text.*"%>
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
body{
	
  background-color: #c7c7c7;
  
  background-size: cover;
}
.co{
	background-color: #ebebeb;
}


</style>
</head>
<body>
<%@include file="AllComponent/Navbar.jsp"%>

<%
	String fa,su;
	HttpSession sess = request.getSession();
	fa = (String)sess.getAttribute("csmsg");
	su = (String)sess.getAttribute("cfmsg");
	
	Format f = new SimpleDateFormat("HH.mm.ss");
	String time = f.format(new Date());
	
%>
 <% if(fa != null || su !=null){ %>
			    <div class="toast-container position-fixed bottom-0 end-0 me-2 mb-3 p-0 toast" role="alert" aria-live="assertive" aria-atomic="true">
			  <div class="toast-header pb-1 mb-0">
			     <c:if test="${not empty csmsg}">
			      <strong class=" text-success"><i class="fa-solid fa-circle-check me-2 fa-beat"></i>Feedback Message</strong>
			      </c:if>
			    
			      <c:if test="${ not empty cfmsg}">
			      <strong class="me-auto text-danger "><i class="fa-solid fa-circle-xmark fa-beat me-2"></i>Feedback Message</strong>
			      </c:if>
			      <small class="ms-4"><%= time%></small>
			   	 <button type="button" class="btn-close ms-2" data-bs-dismiss="toast" aria-label="Close"></button>
			      
			  </div>
			   <c:if test="${not empty csmsg}">
			    <div class="toast-body text-success  m-0 p-auto text-center ">
			      ${csmsg}
			    </div> 
			    <c:remove var="csmsg" scope="session"/>
			    </c:if>
			    <c:if test="${ not empty cfmsg}">
			    <div class="toast-body text-danger p-1 m-0 text-center">
			      ${cfmsg}
			    </div>
			    <c:remove var="cfmsg" scope="session"/>
			    </c:if>
			</div>
			<%} %>

<div class="container mb-5 ">
		<div class="row mt-2 co">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Send your views</h4>
						<form class="row g-3" action="ContactServ" method="post">
							
							<div class="col-md-6">
								<label for="address" class="form-label m-1">Name:</label>
								<input type="text" class="form-control m-0" id="inputPassword4" name="name">
							</div>
							<div class="col-md-6">
								<label for="lmark" class="form-label m-1">Email:</label> <input
									type="email" class="form-control m-0" id="inputEmail4" name="email">
							</div>
							<div class="col-md-6">
								<label for="city" class="form-label m-1">Phone:</label>
								<input type="number" class="form-control m-0" id="inputPassword4" name="phone">
							</div>
							<div class="col-md-6">
								<label for="state" class="form-label m-1">Subject:</label> <input
									type="text" class="form-control m-0" id="inputEmail4" name="subject">
							</div>
							<div class="input-group">
							  
							  <textarea name="msg" class="form-control" aria-label="With textarea" rows="4" cols="50" placeholder="Write your message here....."></textarea>
							</div>
							
							<div class="form-group text-center">
								
								<button class="btn btn-success ms-3" type="submit">Submit</button>
								<button class="btn btn-warning ms-3" type="reset">Reset</button>
							</div>
							</form>
					</div>
				</div>
			</div>

			<div class="col-md-5 p-3 ms-4">
				<h3>Reach us...</h3>
				<br> <br>
				<table class="table table-borderless table-light">
				
					<tr scope="row" >
					<td scope="col" >Email:</td>
					<td class="col">shubhampandeycse1@gmail.com</td>
					</tr>
				
					<tr scope="row">
					<td scope="col">Phone:</td>
					<td scope="col">+91 12345678980</td>
					</tr>
				
					<tr scope="row">
					<td scope="col">Address:</td>
					<td scope="col">#212, Ground floor, 7th cross Some layout, Some Road, Karamangla, Bengaluru 560001</td>
					</tr>
				
				</table>
				
			</div>
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