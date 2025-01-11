<%@ page import="javax.servlet.http.HttpSession" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>Sign Up Form by Colorlib</title>

<!-- Font Icon -->
<link rel="stylesheet"
	href="fonts/material-icon/css/material-design-iconic-font.min.css">

<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-QWTKZyjpPEjISv5WaRU9OFeRpok6YctnYmDr5pNlyT2bRjXh0JMhjY6hW+ALEwIH"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/registration.css">
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

		<!-- Sign up form -->
		<section class="signup">
			<div class="signup-container">
				<div class="signup-content">
					<div class="signup-form">
						<h2 class="form-title">Sign up</h2>

						<form method="POST" action="register" class="register-form" id="register-form" oninput="validateRegistrationForm()">
							<div
								class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="name" class="input-tags-label"><i
									class="zmdi zmdi-account material-icons-name"></i></label> <input
									type="text" name="name" id="name" class="form-control-custom"
									placeholder="Your Name" required/>
							</div>
							<div
								class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="email" class="input-tags-label"><i
									class="zmdi zmdi-email"></i></label> <input type="email" name="email"
									id="email" class="form-control-custom" placeholder="Your Email" required/>
							</div>
							<div
								class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="pass" class="input-tags-label"><i
									class="zmdi zmdi-lock"></i></label> <input type="password" name="pass"
									id="pass" class="form-control-custom" placeholder="Password" required/>
							</div>
							<div
								class="form-group custom-input-fields-container pb-1 d-flex flex-row">
								<label for="re-pass" class="input-tags-label"><i
									class="zmdi zmdi-lock-outline"></i></label> <input type="password"
									name="re_pass" id="re_pass" class="form-control-custom"
									placeholder="Repeat your password" required/>
							</div>
							<div id="password-error" class="text-danger mt-1 mb-4 show-password-error"></div>
							<div
								class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="contact" class="input-tags-label"><i
									class="zmdi zmdi-lock-outline"></i></label> <input type="text"
									name="contact" id="contact" class="form-control-custom"
									placeholder="Contact no" maxlength="10" pattern="\d{10}" required
        oninput="this.value = this.value.replace(/[^0-9]/g, '')"/>
							</div>
							<div
								class="form-group custom-input-fields-container pb-1 mb-4 d-flex flex-row">
								<label for="aadhaar" class="input-tags-label"><i
									class="zmdi zmdi-lock-outline"></i></label> <input type="text"
									name="aadhaar" id="aadhaar" class="form-control-custom"
									placeholder="Aadhaar no" maxlength="12" pattern="\d{12}" required
        oninput="this.value = this.value.replace(/[^0-9]/g, '')"/>
							</div>
							<div class="form-group mt-4 mb-3 d-flex flex-row">
								<input type="checkbox" name="agree-term" id="agree-term"
									class="agree-term" /> <label for="agree-term"
									class="label-agree-term"><span><span></span></span>I
									agree all statements in <a href="#" class="term-service">Terms
										of service</a></label>
							</div>
							<div class="form-group form-button">
								<input type="submit" name="signup" id="signup"
									class="btn btn-primary w-100" value="Register" disabled />
							</div>
						</form>
					</div>
					<div class="signup-image">
						<figure>
							<img src="images/signup-image.jpg" alt="sing up image">
						</figure>
						<a href="login.jsp" class="signup-image-link">I am already
							member</a>
					</div>
				</div>
			</div>
		</section>


	</div>
	<!-- JS -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="js/registration.js"></script>



</body>
<!-- This templates was made by Colorlib (https://colorlib.com) -->
</html>