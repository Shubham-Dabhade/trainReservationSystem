<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Login</title>
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=person" />
<link rel="stylesheet"
	href="https://fonts.googleapis.com/css2?family=Material+Symbols+Outlined:opsz,wght,FILL,GRAD@20..48,100..700,0..1,-50..200&icon_names=lock" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/newstyle.css">
</head>
<body>
    <%
 // Get session and check for alert attributes
    HttpSession logSession = request.getSession(false);
    if (logSession != null) {
        String alertType = (String) logSession.getAttribute("alertType");
        String alertMessage = (String) logSession.getAttribute("alertMessage");

        if (alertType != null && alertMessage != null) {
        	out.print("<div id='dynamicAlert' class='alert alert-" + alertType + " alert-dismissible fade show' role='alert'>"+alertMessage+"<button type='button' class='btn-close' data-bs-dismiss='alert' aria-label='Close'></button></div>");
            logSession.removeAttribute("alertType");
            logSession.removeAttribute("alertMessage");
            out.print("<script>hideAlert();</script>");
        }
    }
    %>


	<div class="main">
		<section class="sign-in">
			<div class="sign-in-container">
				<div class="signin-content">
					<!-- Image Content -->
					<div class="signin-image">
						<figure>
							<img src="images/signin-image.jpg" alt="Sign up image">
						</figure>
						<a href="registration.jsp" class="signup-image-link">Create an
							account</a>
					</div>

					<!-- Form Content -->
					<div class="signin-form">
						<h2 class="form-title">Login</h2>
						<form method="POST" action="login" name="login_form"
							class="login-form" id="login-form">
							<div class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="username" class="input-tags-label"> <svg
										xmlns="http://www.w3.org/2000/svg" height="24px"
										viewBox="0 -960 960 960" width="24px" fill="#999999">
                                        <path
											d="M480-480q-66 0-113-47t-47-113q0-66 47-113t113-47q66 0 113 47t47 113q0 66-47 113t-113 47ZM160-160v-112q0-34 17.5-62.5T224-378q62-31 126-46.5T480-440q66 0 130 15.5T736-378q29 15 46.5 43.5T800-272v112H160Zm80-80h480v-32q0-11-5.5-20T700-306q-54-27-109-40.5T480-360q-56 0-111 13.5T260-306q-9 5-14.5 14t-5.5 20v32Zm240-320q33 0 56.5-23.5T560-640q0-33-23.5-56.5T480-720q-33 0-56.5 23.5T400-640q0 33 23.5 56.5T480-560Zm0-80Zm0 400Z" />
                                    </svg>
								</label> <input type="text" name="username" id="username"
									class="form-control-custom" placeholder="Your Name"
									oninput="validateForm()" oninput="validateForm()" />
							</div>
							<div class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="password" class="input-tags-label"> <svg
										xmlns="http://www.w3.org/2000/svg" height="20px"
										viewBox="0 -960 960 960" width="20px" fill="#999999">
                                        <path
											d="M263.72-96Q234-96 213-117.15T192-168v-384q0-29.7 21.15-50.85Q234.3-624 264-624h24v-96q0-79.68 56.23-135.84 56.22-56.16 136-56.16Q560-912 616-855.84q56 56.16 56 135.84v96h24q29.7 0 50.85 21.15Q768-581.7 768-552v384q0 29.7-21.16 50.85Q725.68-96 695.96-96H263.72Zm.28-72h432v-384H264v384Zm216.21-120Q510-288 531-309.21t21-51Q552-390 530.79-411t-51-21Q450-432 429-410.79t-21 51Q408-330 429.21-309t51 21ZM360-624h240v-96q0-50-35-85t-85-35q-50 0-85 35t-35 85v96Zm-96 456v-384 384Z" />
                                    </svg>
								</label> <input type="password" name="password" id="password"
									class="form-control-custom" placeholder="Password"
									oninput="validateForm()" oninput="validateForm()" />
							</div>
							<div class="form-group mt-4 mb-3 d-flex flex-row">
								<input type="checkbox" name="remember-me" id="remember-me" /> <label
									for="remember-me" class="label-agree-term"> <span><span></span></span>Remember
									me
								</label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="login" id="login"
									class="btn btn-primary w-100" value="Log in" disabled />
							</div>
						</form>
					</div>
				</div>
			</div>
		</section>

	</div>

	<!-- JS -->
	<script src="js/main.js"></script>
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.11.8/dist/umd/popper.min.js" integrity="sha384-I7E8VVD/ismYTF4hNIPjVp/Zjvgyol6VFvRkX/vR+Vc4jQkC+hVqc2pM8ODewa9r" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.min.js" integrity="sha384-0pUGZvbkm6XF6gxjEnlmuGrJXVbNuzT9qBBavbLwCsOGabYfZo0T0to5eqruptLy" crossorigin="anonymous"></script>
</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>