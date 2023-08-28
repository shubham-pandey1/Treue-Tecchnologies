<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<%@ page isELIgnored= "false" %>
<style>
.bgm{
	background-color:#d9d4d4 
}
</style>
<div class="container-fluid p-3 bg1">
	<div class = "row">
		<div class= "col-sm-4 text-success">
			<h3><i class="fa-solid fa-book me-3"></i>E-Books</h3>
		</div>
		
		<div class= "col-md-8 d-flex flex-row-reverse">
		  <c:if test="${not empty user}">
		  <!-- logout start -->
		  <!-- Vertically centered modal -->
		  <!-- logout end -->
			<button type="button" class="btn btn-danger" data-toggle="modal" data-target="#exampleModalCenter"><i class="fa-solid fa-power-off me-2"></i>
  Logout
</button>

<!-- Modal -->
<div class="modal fade " id="exampleModalCenter" tabindex="-1" role="dialog" aria-labelledby="exampleModalCenterTitle" aria-hidden="true">
  <div class="modal-dialog modal-dialog-centered" role="document">
    <div class="modal-content text bgm">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalCenterTitle"><i class="fa-solid fa-triangle-exclamation me-2"></i>Logout</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
     
      <div class="modal-body text-center text-danger">
        Do you want to Logout?
     	<br>
        <button type="button" class="btn btn-success mt-3 " data-dismiss="modal">No</button>
        <a href="../LogoutServ" class="btn btn-danger mt-3">Yes</a>
      </div>
    </div>
  </div>
</div>		  	
			<a href = "#" class = "btn btn-primary mx-3 "><i class="fa-solid fa-user me-2"></i></i>${user.name}</a>
		  </c:if>
		  <c:if test="${empty user}">
					  	
		  
			<a href = "../login.jsp" class = "btn btn-success mx-3 "><i class="fa-solid fa-right-to-bracket me-2"></i>Login</a>
			<a href ="../register.jsp" class = "btn btn-primary "><i class="fa-solid fa-user-plus me-2"></i>Register</a>
		  </c:if>
		</div>
	</div>
</div>
<!-- Button trigger modal -->
<!-- Button trigger modal -->
<!-- Button trigger modal -->


<!-- Vertically centered scrollable modal -->


<nav class="navbar navbar-expand-lg navbar-dark bg-custom">
  <div class="container-fluid">
    <a class="navbar-brand" href="#"><i class="fa-solid fa-house-chimney "></i></a>
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
    <div class="collapse navbar-collapse" id="navbarSupportedContent">
      <ul class="navbar-nav me-auto mb-2 mb-lg-0">
        <li class="nav-item">
          <a class="nav-link text-white" aria-current="page" href="home.jsp">Home</a>
        </li>
      </ul>
     
    </div>
  </div>
</nav>