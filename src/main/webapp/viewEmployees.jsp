<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="java.sql.*, com.ems.utility.Database"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>View All Employees</title>
<style>
body {
	font-family: Arial, sans-serif;
	background-color: #f4f6f9;
	margin: 0;
	padding: 0;
}

.container {
	width: 80%;
	margin: 50px auto;
}

.table-container {
	background-color: #fff;
	padding: 20px;
	border-radius: 8px;
	box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
}

table {
	width: 100%;
	border-collapse: collapse;
	margin-bottom: 20px;
}

th, td {
	padding: 12px;
	text-align: left;
	border-bottom: 1px solid #ddd;
}

th {
	background-color: #5c6bc0;
	color: white;
}

tr:hover {
	background-color: #f1f1f1;
}

.btn {
	padding: 10px 20px;
	background-color: #5c6bc0;
	color: white;
	border-radius: 6px;
	text-decoration: none;
	text-align: center;
	display: inline-block;
}

.btn:hover {
	background-color: #3f51b5;
}

.back-btn {
	display: block;
	width: fit-content;
	margin: 30px auto 0;
	padding: 10px 20px;
	background-color: #e3f2fd;
	color: #2c3e50;
	border: none;
	border-radius: 6px;
	text-decoration: none;
	text-align: center;
	transition: background-color 0.3s;
}

.back-btn:hover {
	background-color: #bbdefb;
}

</style>
</head>
<body>

	<div class="container">
		<div class="table-container">
			<h2>All Employees</h2>

			<%
			Connection conn = null;
			Statement stmt = null;
			ResultSet rs = null;

			try {
				// Get database connection
				conn = Database.getConnection();
				stmt = conn.createStatement();
				String sql = "SELECT * FROM employees"; // Your query to fetch employee data
				rs = stmt.executeQuery(sql);
			%>

			<table>
				<thead>
					<tr>
						<th>Username</th>
						<th>Email</th>
						<th>Department</th>
						<th>Age</th>
						<th>Phone</th>
						<th>Address</th>
						<th>Salary</th>
					</tr>
				</thead>
				<tbody>
					<%
					while (rs.next()) {
					%>
					<tr>
						<td><%=rs.getString("username")%></td>
						<td><%=rs.getString("email")%></td>
						<td><%=rs.getString("department")%></td>
						<td><%=rs.getInt("age")%></td>
						<td><%=rs.getString("phone")%></td>
						<td><%=rs.getString("address")%></td>
						<td><%=rs.getDouble("salary")%></td>
						
					</tr>
					<%
					}
					%>
				</tbody>
			</table>

			<%
			} catch (SQLException e) {
			e.printStackTrace();
			} finally {
			try {
				if (rs != null)
					rs.close();
				if (stmt != null)
					stmt.close();
				if (conn != null)
					conn.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
			}
			%>

			<a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>
		</div>
	</div>

</body>
</html>
