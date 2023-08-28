<%@page import="java.util.List"%>
<%@page import="com.db.Conpro"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@page import="com.entity.*" %>
<%@page import="com.dao.*" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page isELIgnored="false"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store: Cart</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
body {
	background-color: #ebeffc;
}
</style>
</head>
<body>
	<%@include file="AllComponent/Navbar.jsp"%>
	<c:if test="${empty user}">
	<c:redirect url="login.jsp"/>
	</c:if>
	<c:if test="${not empty rsmsg}">
		<div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
		   ${rsmsg }
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="rsmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty rfmsg}">
		<div class="alert alert-success alert-dismissible fade show text-center" role="alert">
		   ${rfmsg}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="rfmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty mode}">
		<div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
		   ${mode}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="mode" scope="session"/>
	</c:if>
	<c:if test="${not empty ofmsg}">
		<div class="alert alert-danger alert-dismissible fade show text-center" role="alert">
		   ${ofmsg}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="ofmsg" scope="session"/>
	</c:if>
	<c:if test="${not empty ecart}">
		<div class="alert alert-warning alert-dismissible fade show text-center" role="alert">
		   ${ecart}
		  <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
		</div>
		<c:remove var="ecart" scope="session"/>
	</c:if>
	<div class="container">
		<div class="row mt-4 mb-4">
			<div class="col-md-6">
				<div class="card">
					<div class="card-body">
						<h3 class="text-center text-success">Your Selected Item</h3>
						
						
						<table class="table table-striped table-hover">
							<thead class="bg-primary text-white">
								<tr>
									<th scope="col">Order ID</th>
									<th scope="col">Book Name</th>
									<th scope="col">Author</th>
									<th scope="col">Price</th>
									<th scope="col">Action</th>

								</tr>
							</thead>
							<tbody>
								<%
									Double tot = 0d;
									int cnt = 0;
									User user = (User)session.getAttribute("user");
									CartDaoImp cdi = new CartDaoImp(Conpro.getCon());
									List<Cart> list = cdi.getBookbyUser(user.getId());
									cnt = list.size();
									for(Cart c: list){
										tot += c.getPrice();
								%>
								<tr>
									<td scope="col"><%=c.getCid() %></td>
									<td scope="col"><%=c.getBookname() %></td>
									<td scope="col"><%=c.getAuthor() %></td>
									<td scope="col"><%=c.getPrice() %></td>
									<td scope="col"><a class="btn btn-danger" href="RemoveBook?cid=<%=c.getCid()%>">Remove</a></td>
								</tr>
							   <%} %>
							</tbody>
							<tfoot>
								<tr>
									<th scope="col">Total Books</th>
									<th scope="col"><%=cnt %></th>
									<th scope="col">Total Price</th>
									<th scope="col"><%=tot %></th>
								</tr>
							</tfoot>
						</table>
					</div>
				</div>
			</div>
			<div class="col-md-6">
				<div class="card mb-3">
					<div class="card-body">
						<h3 class="text-center text-success">Your Detail for Order</h3>
						<form class="row g-3" action="OrderServ" method="post">
							<div class="col-md-6">
								<label for="name" class="form-label m-1">Name:</label> <input
									type="text" class="form-control m-0" id="inputEmail4" name="name" value="<%=user.getName()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="email" class="form-label m-1">Email:</label>
								<input type="email" class="form-control m-0" id="inputPassword4" name="email" value="<%=user.getEmail()%>" readonly="readonly">
							</div>
							<div class="col-md-6">
								<label for="phone" class="form-label m-1">Mobile No.:</label> <input
									type="number" class="form-control m-0" id="inputEmail4" value="<%=user.getPhone()%>" readonly="readonly" name="phone">
							</div>
							<div class="col-md-6">
								<label for="address" class="form-label m-1">Address:</label>
								<input type="text" class="form-control m-0" id="inputPassword4" name="address" required="required">
							</div>
							<div class="col-md-6">
								<label for="lmark" class="form-label m-1">Landmark:</label> <input
									type="text" class="form-control m-0" id="inputEmail4" name="lmark" required="required">
							</div>
							<div class="col-md-6">
								<label for="city" class="form-label m-1">City:</label>
								<input type="text" class="form-control m-0" id="inputPassword4" name="city" required="required">
							</div>
							<div class="col-md-6">
								<label for="state" class="form-label m-1">State:</label> <input
									type="text" class="form-control m-0" id="inputEmail4" name="state" required="required">
							</div>
							<div class="col-md-6">
								<label for="zip" class="form-label m-1">Zip:</label>
								<input type="number" class="form-control m-0" id="inputPassword4" name="zip" required="required">
							</div>
							<div class="form-group">
								<label for="mode" class="form-label m-1">Payment mode:</label>
							
								<select class="form-control" name="mode">
									<option>---Select---</option>
									<option value="cash">Cash on Delivery</option>
								</select>
							</div>
							<div class="form-group text-center">
								<button class="btn btn-warning me-3" type="submit">Order Now</button>
								<a href="index.jsp" class="btn btn-success ms-5" >Continue Shopping</a>
							</div>
							</form>
					</div>
				</div>
				<script type="text/javascript">
				const bsAlert = new bootstrap.Alert('.alert')
					setTimeout(() => {
						bsAlert.close();
					}, 3000);
				</script>
				<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm"
	crossorigin="anonymous"></script>
</body>
</html>