<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Helpline</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
body {
	background: #ebebf5;
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
		<div class="text-center">
		<img alt="callcenter" src="image/help.avif" class="hl mt-5">
		<div class="text-primary">
		<h3 class="mt-2">24*7 Service</h3>
		<h4>Helpline Number</h4>
		<h5>+91 8698990231</h5>
		<a class="btn btn-primary" href="index.jsp">Home</a>
		</div>
	</div>
	</div>

</body>
</html>