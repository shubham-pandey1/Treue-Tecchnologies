<%@page import="com.entity.BookDet"%>
<%@page import="com.db.Conpro"%>
<%@page import="com.dao.BookDaoImp"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Store: Edit</title>
<%@include file="AllComponent/allCss.jsp"%>
</head>
<body>
<%@ include file="AllComponent/Navbar.jsp" %>
<c:if test="${empty user }">
		<c:redirect url="login.jsp"></c:redirect>
</c:if>
<%
	int id = Integer.parseInt(request.getParameter("id"));
	BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
	
	BookDet bdt = bdi.getBookbyId(id);
	
%>
<div class="container mt-3">
		<div class="row pb-4">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mb-3 ">
					<div class="card-body">
						<h4 class="text-center text-success">Add Books</h4>
						 
						 	
						  <form action="EditBookServ" method="post">
							<div class="mb-2">
								 <input
									type="hidden" class="form-control" id="formGroupExampleInput"
									 name="bookid" value= <%=id %>>
							</div>
							<div class="mb-2">
								<label for="bname" class="form-label">Book Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Book Name" name="bname" value="<%=bdt.getBookname() %>" required>
							</div>
							<div class="mb-2">
								<label for="aname" class="form-label">Author Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput2"
									placeholder="Author name" name="aname" value="<%=bdt.getAuthor() %>" required>
							</div>
							<div class="mb-2">
								<label for="price" class="form-label">Price: </label> <input
									type="number" class="form-control" id="formGroupExampleInput2"
									placeholder="Price" name="price" value="<%=bdt.getPrice() %>" required>
							</div>
							
							<div class="mb-2">
								<label for="status" class="form-label">Book Status: </label> 
								<select class="form-select" aria-label="Default select example" name="status" required>
									<%
										if("Active".equals(bdt.getStatus())){
									%>   
									  <option value="Active">Active</option>
									  <option value="Inactive">Inactive</option>
									 <%}
									else {
									%> 
									  <option value="Inactive">Inactive</option>
									  <option value="Active">Active</option>
									<%} %>
									</select>
							</div>
							
							<div>
								<button type="submit" class="btn btn-primary m-2">Update</button>
								<button type="reset" class="btn btn-danger ms-5 m-2">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<div class="fixed-bottom">
	<%@ include file="AllComponent/Footer.jsp"%>
</div>

</body>
</html>