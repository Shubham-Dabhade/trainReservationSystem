function validateEditForm() {
    const username = document.getElementById('userName').value.trim();
    const email = document.getElementById('userEmail').value.trim();
    const contact = document.getElementById('userContact').value.trim();
    const aadhaar = document.getElementById('userAadharNum').value.trim();
    const signupButton = document.getElementById('submitEditProfile');


    // Individual field validations
    const usernameValid = /^[a-zA-Z\s]{6,}$/.test(username); // At least 6 characters, letters only
    const emailValid = /^[^\s@]+@[^\s@]+\.[^\s@]+$/.test(email); // Valid email format
    const contactValid = /^\d{10}$/.test(contact); // Exactly 10 digits
    const aadhaarValid = /^\d{12}$/.test(aadhaar); // Exactly 12 digits

    // Enable/Disable submit button based on validations
    signupButton.disabled = !(
        usernameValid &&
        emailValid &&
        contactValid &&
        aadhaarValid 
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
