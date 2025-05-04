<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Add Employee</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 600px;
	margin: 50px auto;
	background-color: #fff;
	padding: 30px;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #333;
}

.form-group {
	margin-bottom: 20px;
}

.form-group label {
	font-size: 16px;
	color: #333;
	display: block;
}

.form-group input, .form-group select, .form-group textarea {
	width: 100%;
	padding: 10px;
	margin-top: 5px;
	border: 1px solid #ddd;
	border-radius: 6px;
	font-size: 16px;
}

.form-group textarea {
	resize: vertical;
}

.btn {
	display: inline-block;
	width: 100%;
	padding: 12px 20px;
	background-color: #5c6bc0;
	color: white;
	border-radius: 6px;
	text-align: center;
	font-size: 16px;
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s;
}

.btn:hover {
	background-color: #3f51b5;
}

.error-message {
	color: red;
	font-size: 14px;
	margin-bottom: 15px;
	text-align: center;
}

.back-btn {
	display: inline-block;
	padding: 10px 20px;
	background-color: #e3f2fd;
	color: #2c3e50;
	border-radius: 6px;
	text-align: center;
	text-decoration: none;
	cursor: pointer;
	transition: background-color 0.3s;
	width: 100%;
	margin-top: 20px;
}

.back-btn:hover {
	background-color: #bbdefb;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Add Employee</h2>

		

		<form action="AddEmployeeServlet" method="post">
			<div class="form-group">
				<label for="username">Username</label> <input type="text"
					id="username" name="username" required />
			</div>
			<div class="form-group">
				<label for="password">Password</label> <input type="password"
					id="password" name="password" required />
			</div>
			<div class="form-group">
				<label for="email">Email</label> <input type="email" id="email"
					name="email" required />
			</div>
			<div class="form-group">
				<label for="department">Department</label> <input type="text"
					id="department" name="department" required />
			</div>
			<div class="form-group">
				<label for="age">Age</label> <input type="number" id="age"
					name="age" min="18" required />
			</div>
			<div class="form-group">
				<label for="phone">Phone</label> <input type="tel" id="phone"
					name="phone" pattern="[0-9]{10}" required />
			</div>
			<div class="form-group">
				<label for="address">Address</label>
				<textarea id="address" name="address" rows="3" required></textarea>
			</div>
			<div class="form-group">
				<label for="salary">Salary</label> <input type="number" id="salary"
					name="salary" min="0" required />
			</div>
			<button type="submit" class="btn">Add Employee</button>
		</form>

		<a href="adminDashboard.jsp" class="back-btn">Back to Dashboard</a>
	</div>

</body>
</html>
