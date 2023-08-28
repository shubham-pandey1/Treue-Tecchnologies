<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql"%>
<%@ page isELIgnored="false"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Edit Profile</title>
<%@include file="AllComponent/allCss.jsp"%>
<style type="text/css">
body {
	background: #ebebf5;
}
</style>
</head>
<body>
	<%@include file="AllComponent/Navbar.jsp"%>

	<%
	User user = (User) session.getAttribute("user");
	%>
	<c:if test="${empty user }">
		<c:redirect url="login.jsp" />
	</c:if>
	<div class="container mt-3">
		<div class="row">
			<div class="col-md-4 offset-md-4">
				<div class="card">
					<div class="card-body">
						<h4 class="text-center text-primary">Edit Profile</h4>
						<c:if test="${not empty esmsg}">
							<p class="text-center text-success">${esmsg}</p>
							<c:remove var= "esmsg" scope="session"/>
						</c:if>
						<c:if test="${not empty efmsg}">
							<p class="text-center text-danger">${efmsg}</p>
							<c:remove var= "efmsg" scope="session"/>
						</c:if>
						<c:if test="${not empty epmsg}">
							<p class="text-center text-warning">${epmsg}</p>
							<c:remove var= "epmsg" scope="session"/>
						</c:if>
						<form action="UpdateProfile" method="post">
							<div class="mb-2">
								<label for="name" class="form-label">Enter full Name: </label> <input
									type="text" class="form-control" id="formGroupExampleInput"
									placeholder="Enter Name" name="name" required
									value="<%=user.getName()%>">
							</div>
							<div class="mb-2">
								<label for="email" class="form-label">Email: </label> <input
									type="email" class="form-control" id="formGroupExampleInput2"
									placeholder="Email" name="email" required
									value="<%=user.getEmail()%>" readonly="readonly">
							</div>
							<div class="mb-2">
								<label for="phone" class="form-label">Phone: </label> <input
									type="number" class="form-control" id="formGroupExampleInput2"
									placeholder="Phone Number" name="phone" required
									value="<%=user.getPhone()%>">
							</div>
							<div class="mb-2">
								<label for="pass" class="form-label">Password: </label> <input
									type="password" class="form-control"
									id="formGroupExampleInput2" placeholder="Password" name="pass"
									required>
							</div>

							<div class="mb-0 text-center">
								<button type="submit" class="btn btn-primary m-2">Update</button>
								<button type="reset" class="btn btn-danger ms-5 m-2">Reset</button>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>