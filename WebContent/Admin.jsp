<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%
    // Check if there is an active session
    HttpSession adminHomesession = request.getSession(false);
    if (adminHomesession == null || Boolean.FALSE.equals(adminHomesession.getAttribute("isAdmin"))) {
        // If no session or user is not an admin, redirect to login page or user home page
        response.sendRedirect("adminLogin.jsp");
        return; // End the execution here
    }else{
    	String alertType = (String) adminHomesession.getAttribute("alertType");
        String alertMessage = (String) adminHomesession.getAttribute("alertMessage");

        if (alertType != null && alertMessage != null) {
        	out.print("<div id='dynamicAlert' class='alert alert-" + alertType + " alert-dismissible fade show' role='alert'>"+alertMessage+"<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
        	adminHomesession.removeAttribute("alertType");
        	adminHomesession.removeAttribute("alertMessage");
            out.print("<script>hideAlert();</script>");
        }
    }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="css/adminHome.css">
</head>
<body>
	Admin Home Page
</body>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
	<script src="adminHome.js"></script>
</html>