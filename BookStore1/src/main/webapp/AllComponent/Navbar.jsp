<%@page import="com.entity.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>

<div class="container-fluid p-3 bg1">
	<div class = "row">
		<div class= "col-sm-4 text-success">
			<h3><i class="fa-solid fa-book me-3"></i>E-Books</h3>
		</div>
		<div class = "col-sm-4">
			 <form class="d-flex my-2 my-lg-0" action="searchbook.jsp">
		        <input class="form-control me-4" type="search" placeholder="Search" aria-label="Search" name = "search">
		        <button class="btn btn-primary me-6" type="submit">Search</button>
	      </form>
		</div>
		<%
			User us = (User)session.getAttribute("user");
			if(us == null){
		%>
		<div class= "col-sm-4 d-flex flex-row-reverse">
			<a href ="register.jsp" class = "btn btn-primary "><i class="fa-solid fa-user-plus me-2"></i>Register</a>
			<a href = "login.jsp" class = "btn btn-success mx-3 "><i class="fa-solid fa-right-to-bracket me-2"></i>Login</a>
		</div>
		<%} else { %>
			<div class= "col-sm-4 d-flex flex-row-reverse">
			<a href = "LogoutServ" class = "btn btn-danger mx-3 "><i class="fa-solid fa-power-off me-2"></i>Logout</a>
			<a href ="#" class = "btn btn-primary "><i class="fa-solid fa-circle-user me-2"></i>${user.name}</a>
			<a href="cart.jsp"><i class="fa-solid fa-cart-shopping me-3 fa-2x text-primary pt-1"></i></a>
			
		</div>
		<%} %>
	</div>
</div>

<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney "></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-white" aria-current="page" href="index.jsp">Home</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="recentBook.jsp"><i class="fa-solid fa-book-open me-1"></i>Recent Book</a>
        </li>
        
        <li class="nav-item">
          <a class="nav-link text-white" href="newBook.jsp" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-book-open me-1"></i>New Book</a>
        </li>
        <li class="nav-item">
          <a class="nav-link text-white" href="oldBook.jsp" tabindex="-1" aria-disabled="true"><i class="fa-solid fa-book-open me-1"></i>Old Book</a>
        </li>
      </ul>
      <form class="d-flex bg-#4a148c purple darken-4">
        
        <a class="btn btn-outline-success bg-white text-dark me-2 " href="Setting.jsp"><i class="fa-solid fa-gear me-1"></i>Setting</a>
        <a class="btn btn-outline-success bg-white text-dark" href="Contactus.jsp"><i class="fa-solid fa-phone me-1"></i>Contact Us</a>
      </form>
    </div>
  </div>
</nav>