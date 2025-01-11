function validateForm() {
	const username = document.getElementById('username').value.trim();
	const password = document.getElementById('password').value.trim();
	const loginButton = document.getElementById('login');
	loginButton.disabled = !(username && password);
}


function hideAlert() {
	setTimeout(function() {
		var alert = document.getElementById('dynamicAlert');
		if (alert) {
			alert.style.display = 'none';
		}
	}, 5000); // Hide after 5 seconds
}