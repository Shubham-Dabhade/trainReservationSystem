function hideAlert() {
	setTimeout(function() {
		var alert = document.getElementById('dynamicAlert');
		if (alert) {
			alert.style.display = 'none';
		}
	}, 5000); // Hide after 5 seconds
}