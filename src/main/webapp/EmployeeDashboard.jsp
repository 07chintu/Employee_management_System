<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ page import="jakarta.servlet.http.HttpSession"%>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>Employee Dashboard</title>
<style>
body {
    font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
    background: linear-gradient(to right, #e0ecff, #f4f8fb);
    margin: 0;
    padding: 0;
}

.navbar {
    background-color: #2f3e9e;
    color: white;
    padding: 15px 30px;
    display: flex;
    justify-content: space-between;
    align-items: center;
    box-shadow: 0 3px 10px rgba(0, 0, 0, 0.1);
}

.navbar .title {
    font-size: 20px;
    font-weight: bold;
}

.navbar .actions a {
    color: white;
    text-decoration: none;
    margin-left: 20px;
    padding: 10px 14px;
    background-color: #4b61cf;
    border-radius: 6px;
    transition: 0.3s;
}

.navbar .actions a:hover {
    background-color: #6c7ae0;
}

.navbar .actions .logout {
    background-color: #e74c3c;
}

.navbar .actions .logout:hover {
    background-color: #c0392b;
}

.container {
    max-width: 850px;
    margin: 40px auto;
    background-color: #ffffff;
    padding: 40px;
    border-radius: 12px;
    box-shadow: 0 6px 15px rgba(0, 0, 0, 0.05);
}

.footer {
    text-align: center;
    padding: 25px;
    font-size: 14px;
    color: #777;
    margin-top: 40px;
}

h2 {
    text-align: center;
    color: #2f3e9e;
    margin-bottom: 30px;
}

table {
    width: 100%;
    border-collapse: collapse;
    background-color: #fafafa;
}

table th, table td {
    padding: 14px 18px;
    border-bottom: 1px solid #ddd;
    text-align: left;
}

table th {
    background-color: #f0f3fa;
    color: #333;
}

table tr:hover {
    background-color: #f9fcff;
}

/* Updated Change Password Button with new color */
.change-password-btn {
    padding: 12px 18px;
    background-color: #2ecc71; /* Green color */
    color: white;
    border-radius: 8px;
    text-decoration: none;
    display: inline-block;
    font-weight: bold;
}

.change-password-btn:hover {
    background-color: #27ae60; /* Darker Green */
}

@media (max-width: 768px) {
    .container {
        margin: 20px;
        padding: 20px;
    }

    .navbar {
        flex-direction: column;
        align-items: flex-start;
    }

    .navbar .actions {
        margin-top: 10px;
    }
}
</style>
</head>
<body>

    <div class="navbar">
        <div class="title">
            Welcome, <%= session.getAttribute("username") %>
        </div>
        <div class="actions">
            <!-- Updated Change Password button -->
            <a href="changePassword.jsp" class="change-password-btn">Change Password</a>
            <a href="EmployeeLogoutServlet" class="logout">Logout</a>
        </div>
    </div>

    <div class="container">
        <h2>Employee Details</h2>
        <table>
            <tr>
                <th>Email</th>
                <td><%= session.getAttribute("email") %></td>
            </tr>
            <tr>
                <th>Department</th>
                <td><%= session.getAttribute("department") %></td>
            </tr>
            <tr>
                <th>Age</th>
                <td><%= session.getAttribute("age") %></td>
            </tr>
            <tr>
                <th>Phone</th>
                <td><%= session.getAttribute("phone") %></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><%= session.getAttribute("address") %></td>
            </tr>
            <tr>
                <th>Salary</th>
                <td><%= session.getAttribute("salary") %></td>
            </tr>
        </table>
    </div>

    <div class="footer">&copy; 2025 Employee Management System | Powered by JSP + Servlets</div>

</body>
</html>
