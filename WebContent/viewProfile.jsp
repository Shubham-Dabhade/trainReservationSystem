<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ page import="javax.servlet.http.HttpSession"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<%
// Check if there is an active session
HttpSession homeSession = request.getSession(false);

if (homeSession == null || homeSession.getAttribute("userId") == null) {
	// If no session or user is not logged in, redirect to login page
	response.sendRedirect("login.jsp");
	return; // End the execution here
} else {
	String alertType = (String) homeSession.getAttribute("alertType");
	Integer userId = (Integer) homeSession.getAttribute("userId");
	String userIdString = (userId != null) ? userId.toString() : null;
	String alertMessage = (String) homeSession.getAttribute("alertMessage");

	if (alertType != null && alertMessage != null) {
		out.print("<div id='dynamicAlert' class='alert alert-" + alertType
		+ " alert-dismissible fade show' role='alert'>" + alertMessage
		+ "<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
		homeSession.removeAttribute("alertType");
		homeSession.removeAttribute("alertMessage");
		out.print("<script>hideAlert();</script>");
	}
}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>View Profile</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/viewProfile.css">
</head>
<body>
	<%-- Include Navbar --%>
	<jsp:include page="navbar.jsp" />
	<div id="View_profile" class="view-profile-container">
		<div class="inside-profile-container">
			<h2 id="view-profile-title">View Profile</h2>
			<form id="profileForm" class="profileForm" method="post" action="editProfile"
				oninput="validateEditForm()">
				<input type="hidden" id="hiddenUserId" name="hiddenUserId"
					value="<%=homeSession.getAttribute("userId")%>">
			<input type="hidden" id="hiddenIsAdmin" name="hiddenIsAdmin"
					value="<%= homeSession.getAttribute("isAdmin") != null ? homeSession.getAttribute("isAdmin") : false %>">
				<div class="mb-3">
					<label for="userId" class="form-label">User ID</label> <input
						type="text" class="form-control editProfileInputsId" id="userId"
						name="userId" disabled>
				</div>
				<div class="mb-3">
					<label for="userName" class="form-label">User Name</label> <input
						type="text" class="form-control editProfileInputs" id="userName"
						name="userName" disabled>
				</div>
				<div class="mb-3">
					<label for="userEmail" class="form-label">Email</label> <input
						type="email" class="form-control editProfileInputs" id="userEmail"
						name="userEmail" disabled>
				</div>
				<div class="mb-3">
					<label for="userContact" class="form-label">Contact</label> <input
						type="text" class="form-control editProfileInputs"
						id="userContact" name="userContact" maxlength="10"
						pattern="\d{10}"
						oninput="this.value = this.value.replace(/[^0-9]/g, '')" disabled>
				</div>
				<div class="mb-3">
					<label for="userAadharNum" class="form-label">Aadhaar
						Number</label> <input type="text" class="form-control editProfileInputs"
						maxlength="12" pattern="\d{12}" id="userAadharNum"
						name="userAadharNum"
						oninput="this.value = this.value.replace(/[^0-9]/g, '')" disabled>
				</div>

				<div class="editFormButtons">

					<button type="button" class="btn btn-primary" id="editProfileBtn">Edit
						Profile</button>
					<input type="submit" class="btn btn-primary" id="submitEditProfile" value="Submit"
						style="display: none" />
				</div>
			</form>
		</div>
	</div>
</body>
<script
	src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js"
	integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r"
	crossorigin="anonymous"></script>
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js"
	integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy"
	crossorigin="anonymous"></script>
<script>
		// going to add fetching data here
		window.onload = function(){
			fetchProfile();
		}
		
		function fetchProfile(){
			fetch("getUserProfile",{
				method:"POST",
				headers:{'Content-Type': 'application/x-www-form-urlencoded' },
				body:'userId=' + <%=homeSession.getAttribute("userId")%>+ 
	              '&isAdmin=' + <%= homeSession.getAttribute("isAdmin") != null ? homeSession.getAttribute("isAdmin") : false %>
			})
			.then(response => response.json())
			.then(data=>{
				// Populate the form fields with fetched data
                document.getElementById('userId').value = <%=homeSession.getAttribute("userId")%>;
                document.getElementById('userName').value = data.userName;
                document.getElementById('userEmail').value = data.userEmail;
                document.getElementById('userContact').value = data.userContact;
                document.getElementById('userAadharNum').value = data.userAadharNum;
			})
			.catch(error=>console.log("Error occured in fetching the data: "+error));
		}
		
		// Enable form fields when "Edit Profile" button is clicked
        document.getElementById('editProfileBtn').addEventListener('click', function() {
            let formElements = document.querySelectorAll('#profileForm .editProfileInputs');
            formElements.forEach(element => {
                element.disabled = !element.disabled; // Toggle disabled property
            });
            
            this.innerText = this.innerText === 'Edit Profile' ? 'Cancel' : 'Edit Profile';
            if(this.innerText==='Cancel'){
            	this.classList.add("btn-secondary");
            }else{
            	this.classList.remove("btn-secondary");
            }
            document.getElementById('view-profile-title').innerText = this.innerText === 'Cancel' ? 'Edit Profile' : 'View Profile'
            document.getElementById('submitEditProfile').style.display = this.innerText === 'Cancel' ? 'inline' : 'none';
        });
		
	</script>
<script src="js/viewProfile.js" />
</html>