<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Admin - Change Password</title>
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<style>
:root {
	--primary-color: #4a90e2;
	--danger-color: #e74c3c;
	--success-color: #27ae60;
	--card-bg: #ffffff;
	--form-bg: #f9fafc;
	--text-color: #2c3e50;
}

body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #eef1f7;
	margin: 0;
	padding: 0;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100vh;
}

.card {
	background-color: var(--card-bg);
	width: 100%;
	max-width: 420px;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 10px 25px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: var(--text-color);
	margin-bottom: 20px;
}

.form-group {
	margin-bottom: 18px;
}

label {
	display: block;
	margin-bottom: 6px;
	font-weight: bold;
	color: #444;
}

input {
	width: 100%;
	padding: 12px;
	font-size: 15px;
	border: 1px solid #ccc;
	border-radius: 8px;
	background-color: var(--form-bg);
}

.btn {
	background-color: var(--primary-color);
	color: white;
	padding: 12px;
	width: 100%;
	border: none;
	font-size: 16px;
	border-radius: 8px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

.btn:hover {
	background-color: #357ABD;
}

.message {
	text-align: center;
	font-weight: bold;
	margin-bottom: 15px;
}

.error {
	color: var(--danger-color);
}

.success {
	color: var(--success-color);
}
</style>
</head>
<body>

	<div class="card">
		<h2>Change Admin Password</h2>

		<%
		String successMessage = (String) request.getAttribute("successMessage");
		%>
		<%
		String errorMessage = (String) request.getAttribute("errorMessage");
		%>

		<%
		if (successMessage != null) {
		%>
		<div class="message success"><%=successMessage%></div>
		<%
		} else if (errorMessage != null) {
		%>
		<div class="message error"><%=errorMessage%></div>
		<%
		}
		%>

		<form action="AdminChangePasswordServlet" method="post">
			<div class="form-group">
				<label for="username">Admin Username</label> <input type="text"
					id="username" name="username" required>
			</div>

			<div class="form-group">
				<label for="currentPassword">Current Password</label> <input
					type="password" id="currentPassword" name="currentPassword"
					required>
			</div>

			<div class="form-group">
				<label for="newPassword">New Password</label> <input type="password"
					id="newPassword" name="newPassword" required>
			</div>

			<button type="submit" class="btn">Change Password</button>
		</form>
	</div>

</body>
</html>
