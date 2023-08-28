<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Success Order</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
body {
	background: #f5f3f2;
}
.hl{
	height: 200px;
	widows: 200px;
}
</style>
</head>
<body>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp"/>
	</c:if>
	
	<%@include file="AllComponent/Navbar.jsp"%>
	<div class="d-flex justify-content-center align-items-center">
		<div class="text-center mt-5 pt-5">
		<i class="fa-solid fa-circle-check fa-beat fa-6x text-success"></i>
		<div class="text-primary">
		<h3 class="mt-2">Your Order Placed Successfully</h3>
		<strong>Your Order Deliver within 7 days.</strong><br>
		<div class="p-3">
		<a class="btn btn-primary me-3" href="index.jsp">Home</a>
		<a class="btn btn-success" href="order.jsp">View Order</a>
		</div>
		</div>
	</div>
	</div>

</body>
</html>