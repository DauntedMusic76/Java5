<!-- forgotpassword.jsp -->
<!DOCTYPE html>
<html>
<head>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/tags/form" prefix="form"%>
<link
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"
	rel="stylesheet">
<title>Forgot Password</title>
<style>
body {
	font-family: Arial, sans-serif;
}

.container1 {
	width: 300px;
	margin: 0 auto;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 10px;
}

.form-group {
	margin-bottom: 15px;
}

.form-group label {
	display: block;
	margin-bottom: 5px;
}

.form-group input {
	width: 100%;
	padding: 8px;
	box-sizing: border-box;
	margin-bottom: 10px;
}

.form-group button {
	width: 100%;
	padding: 10px;
	background-color: #007bff;
	color: white;
	border: none;
	border-radius: 5px;
	cursor: pointer;
}

.form-group button:hover {
	background-color: #0056b3;
}

.message {
	margin-top: 20px;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 5px;
}

.message.success {
	border-color: #4CAF50;
	color: #4CAF50;
}

.message.error {
	border-color: #f44336;
	color: #f44336;
}
</style>
</head>
<body>
	<%@include file="menu.jsp"%>
	<div class="container1">
		<h2>Forgot Password</h2>

		<form action="/forgotpassword/layma" method="post" class="form-group">
			<label for="to">Enter your email:</label> <input type="email" id="to"
				name="to" required>
			<button type="submit">Send Verification Code</button>
		</form>

		<form action="/forgotpassword/doimatkhau" method="post"
			class="form-group">
			<label for="to">Enter your email:</label> <input type="email" id="to"
				name="to" required> <label for="ma">Enter
				verification code:</label> <input type="text" id="ma" name="ma" required>
			<label for="newPassword">Enter new password:</label> <input
				type="password" id="newPassword" name="newPassword" required>
			<button type="submit">Change Password</button>
		</form>

		<div
			class="message ${successMessage != null ? 'success' : errorMessage != null ? 'error' : ''}">
			${successMessage != null ? successMessage : errorMessage != null ? errorMessage : ''}
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>
