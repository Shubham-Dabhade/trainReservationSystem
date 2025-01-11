<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="javax.servlet.http.HttpSession" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    // Check if there is an active session
    HttpSession homeSession = request.getSession(false);
    if (homeSession == null || homeSession.getAttribute("userId") == null) {
        // If no session or user is not logged in, redirect to login page
        response.sendRedirect("login.jsp");
        return; // End the execution here
    }
    else{
    	String alertType = (String) homeSession.getAttribute("alertType");
        String alertMessage = (String) homeSession.getAttribute("alertMessage");

        if (alertType != null && alertMessage != null) {
        	out.print("<div id='dynamicAlert' class='alert alert-" + alertType + " alert-dismissible fade show' role='alert'>"+alertMessage+"<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
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
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
	<link rel="stylesheet" href="css/home.css">
</head>
<body>
    <%-- Include Navbar --%>
    <jsp:include page="navbar.jsp" />
<div id="Home" class="home-container">
	User Home Page
</div>
</body>

	<script src="js/home.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</html>