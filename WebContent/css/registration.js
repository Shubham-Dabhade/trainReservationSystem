function validateRegistrationForm() {
    const username = document.getElementById('name').value.trim();
    const password = document.getElementById('pass').value;
    const confirmPassword = document.getElementById('re_pass').value;
    const email = document.getElementById('email').value.trim();
    const contact = document.getElementById('contact').value.trim();
    const aadhaar = document.getElementById('aadhaar').value.trim();
    const agreeTerm = document.getElementById('agree-term').checked;
    const signupButton = document.getElementById('signup');
    const errorElement = document.getElementById('password-error');

    // Validate password match
    if (password && confirmPassword && password !== confirmPassword) {
        errorElement.textContent = "Passwords do not match.";
    } else {
        errorElement.textContent = ""; // Clear the error message
    }

    // Individual field validations
    const usernameValid = /^[a-zA-Z\s]{6,}$/.test(username); // At least 6 characters, letters only
    const passwordValid = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_]).{8,}$/.test(password); // Min 8 chars, upper, lower, digit, special char
    const confirmPasswordValid = confirmPassword === password;
    const emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email); // Valid email format
    const contactValid = /^\d{10}$/.test(contact); // Exactly 10 digits
    const aadhaarValid = /^\d{12}$/.test(aadhaar); // Exactly 12 digits

    // Enable/Disable submit button based on validations
    signupButton.disabled = !(
        usernameValid &&
        passwordValid &&
        confirmPasswordValid &&
        emailValid &&
        contactValid &&
        aadhaarValid &&
        agreeTerm
    );
}

function hideAlert() {
	setTimeout(function() {
		var alert = document.getElementById('dynamicAlert');
		if (alert) {
			alert.style.display = 'none';
		}
	}, 5000); // Hide after 5 seconds
}
