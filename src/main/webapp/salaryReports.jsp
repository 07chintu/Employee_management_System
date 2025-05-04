<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<%@ page import="java.sql.*, com.ems.utility.Database"%>
<%@ page session="true"%>
<%
    String username = (String) session.getAttribute("username");
    if (username == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
<title>Salary Reports</title>
<style>
body {
	font-family: 'Segoe UI', sans-serif;
	background-color: #f8f9fa;
	padding: 40px;
}

h2 {
	text-align: center;
	margin-bottom: 30px;
	color: #333;
}

table {
	width: 100%;
	border-collapse: collapse;
	margin: 0 auto;
	background-color: #fff;
	box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

th, td {
	padding: 14px 16px;
	border: 1px solid #ccc;
	text-align: left;
}

th {
	background-color: #007bff;
	color: white;
}

tr:nth-child(even) {
	background-color: #f2f2f2;
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

	<h2>Employee Salary Reports</h2>

	<table>
		<tr>
			<th>Employee ID</th>
			<th>Username</th>
			<th>Month</th>
			<th>Salary Amount</th>
			<th>Status</th>
		</tr>

		<%
        try {
            Connection conn = Database.getConnection();
            String sql = "SELECT e.id, e.username, s.month, s.amount, s.status FROM employees e JOIN salary s ON e.id = s.emp_id ORDER BY s.month DESC";
            PreparedStatement ps = conn.prepareStatement(sql);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
    %>
		<tr>
			<td><%= rs.getInt("id") %></td>
			<td><%= rs.getString("username") %></td>
			<td><%= rs.getString("month") %></td>
			<td>₹<%= rs.getDouble("amount") %></td>
			<td><%= rs.getString("status") %></td>
		</tr>
		<%
            }
            rs.close();
            ps.close();
            conn.close();
        } catch (Exception e) {
            out.println("<tr><td colspan='5'>Error fetching salary data: " + e.getMessage() + "</td></tr>");
        }
    %>
	</table>

	<a href="adminDashboard.jsp" class="back-btn">← Back to Dashboard</a>

</body>
</html>
