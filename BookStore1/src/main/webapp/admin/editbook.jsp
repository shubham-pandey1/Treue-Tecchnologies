<%@page import="com.entity.BookDet"%>
<%@page import="com.entity.User"%>
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
<%@include file="allCss.jsp"%>
</head>
<body>
<%@ include file="Navbar.jsp" %>
	<%
		String id2,id1;
		id1 = id2 = null;	
	
		User user = (User)session.getAttribute("user");
		id1 = (String)session.getAttribute("oid");
		if(user == null)
			response.sendRedirect("../login.jsp");
	%>
<%
	
	id2 = request.getParameter("id");
	System.out.println(id1 +" "+ id2);
	
	int id ;
	if(id2 != null) id = Integer.parseInt(id2);
	else id = Integer.parseInt(id1);
	
	BookDaoImp bdi = new BookDaoImp(Conpro.getCon());
	
	BookDet bdt = bdi.getBookbyId(id);
	id1 = id2 = null;
	
%>
<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4 ">
				<div class="card mb-3">
					<div class="card-body">
						<h4 class="text-center text-success">Edit Books</h4>
						 <c:if test="${not empty smsg}">
						 	<p class="text-success text-center">${smsg}</p>
						 	<c:remove var="smsg" scope="session"/>
						 </c:if>
						 <c:if test="${not empty fmsg}">
						 	<p class="text-success text-center">${fmsg }</p>
						 	<c:remove var="fmsg" scope="session"/>
						 </c:if>
						 	
						  <form action="../EditBookServ" method="post">
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
	<%@ include file="Footer.jsp"%>
</div>

</body>
</html>