<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="css/navbar.css">
</head>
<body>


	<nav class="navbar-container">
		<div class="inside-navbar-container">
			<div class="logo-container">
				<a class="navbar-brand-container"
					href="<%// Get the session and check if the user is an admin
HttpSession navSession = request.getSession(false);
Boolean isAdmin = (Boolean) navSession.getAttribute("isAdmin");

// If isAdmin is true, send to Admin.jsp, else Home.jsp
if (isAdmin != null && isAdmin) {
	out.print("Admin.jsp");
} else {
	out.print("Home.jsp");
}%>">
					<div class="logo-image-container">
						<img src="images/logo.png" class="logo-image" alt="Bootstrap"
							width="30" height="24">
					</div> RailEase
				</a>
			</div>
			<div class="nav-right-container">
				<a class="profile-container btn" href="viewProfile.jsp"
					> <svg
						xmlns="http://www.w3.org/2000/svg" height="27px"
						viewBox="0 -960 960 960" width="27px" fill="#0070E0">
						<path
							d="M234-276q51-39 114-61.5T480-360q69 0 132 22.5T726-276q35-41 54.5-93T800-480q0-133-93.5-226.5T480-800q-133 0-226.5 93.5T160-480q0 59 19.5 111t54.5 93Zm246-164q-59 0-99.5-40.5T340-580q0-59 40.5-99.5T480-720q59 0 99.5 40.5T620-580q0 59-40.5 99.5T480-440Zm0 360q-83 0-156-31.5T197-197q-54-54-85.5-127T80-480q0-83 31.5-156T197-763q54-54 127-85.5T480-880q83 0 156 31.5T763-763q54 54 85.5 127T880-480q0 83-31.5 156T763-197q-54 54-127 85.5T480-80Zm0-80q53 0 100-15.5t86-44.5q-39-29-86-44.5T480-280q-53 0-100 15.5T294-220q39 29 86 44.5T480-160Zm0-360q26 0 43-17t17-43q0-26-17-43t-43-17q-26 0-43 17t-17 43q0 26 17 43t43 17Zm0-60Zm0 360Z" /></svg>
				</a>
				<!-- drop down menu for profile container -->
				<!--<ul class="dropdown-menu">
					<li><a class="dropdown-item" href="viewProfile.jsp">View Profile</a></li>
					<li><a class="dropdown-item" href="#">Edit Profile</a></li>
					<li><a class="dropdown-item" href="#">Something else here</a></li>
				</ul>-->



				<!-- drop down menu ends -->


				<div class="logout-container">
					<button type="button" class="btn" data-bs-toggle="modal"
						data-bs-target="#logoutModal">
						<svg xmlns="http://www.w3.org/2000/svg" height="24px"
							viewBox="0 -960 960 960" width="24px" fill="#0070E0">
							<path
								d="M200-120q-33 0-56.5-23.5T120-200v-560q0-33 23.5-56.5T200-840h280v80H200v560h280v80H200Zm440-160-55-58 102-102H360v-80h327L585-622l55-58 200 200-200 200Z" /></svg>
					</button>
				</div>
			</div>
		</div>
	</nav>

	<!-- Logout Confirmation Modal -->
	<div class="modal fade" id="logoutModal" tabindex="-1"
		aria-labelledby="logoutModalLabel" aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="logoutModalLabel">Confirm Logout</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal"
						aria-label="Close"></button>
				</div>
				<div class="modal-body">Are you sure you want to log out?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-bs-dismiss="modal">Cancel</button>
					<form action="LogoutController" method="post">
						<button type="submit" class="btn btn-danger">Logout</button>
					</form>
				</div>
			</div>
		</div>
	</div>
</body>

</html>