<!DOCTYPE html>
<html>
<head>
<title>Add Salary</title>
<style>
body {
	font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 0;
}

.container {
	max-width: 500px;
	margin: 80px auto;
	background: white;
	padding: 30px;
	border-radius: 12px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

h2 {
	text-align: center;
	color: #2c3e50;
	margin-bottom: 25px;
}

label {
	font-weight: 600;
	display: block;
	margin-bottom: 8px;
	color: #333;
}

input[type="number"], input[type="text"], select {
	width: 100%;
	padding: 10px;
	margin-bottom: 20px;
	border: 1px solid #ccc;
	border-radius: 6px;
	font-size: 15px;
}

button {
	width: 100%;
	padding: 12px;
	background-color: #007bff;
	color: white;
	border: none;
	font-size: 16px;
	border-radius: 6px;
	cursor: pointer;
	transition: background-color 0.3s ease;
}

button:hover {
	background-color: #0056b3;
}
</style>
</head>
<body>

	<div class="container">
		<h2>Add Salary</h2>
		<form action="AddSalaryServlet" method="post">
			<label for="empId">Employee ID:</label> <input type="number"
				name="empId" id="empId" required> <label for="month">Month:</label>
			<input type="text" name="month" id="month" required
				placeholder="e.g. April 2025"> <label for="amount">Amount:</label>
			<input type="number" name="amount" id="amount" step="0.01" required>

			<label for="status">Status:</label> <select name="status" id="status">
				<option value="Paid">Paid</option>
				<option value="Pending">Pending</option>
			</select>

			<button type="submit">Add Salary</button>
		</form>
	</div>

</body>
</html>
