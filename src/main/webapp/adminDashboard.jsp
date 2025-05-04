<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ page session="true" %>
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
    <title>Admin Dashboard</title>
    <style>
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: #f4f6f9;
            margin: 0;
            padding: 0;
        }

        .navbar {
            background-color: #343a40;
            padding: 15px 30px;
            color: white;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar h2 {
            margin: 0;
        }

        .navbar .actions a {
            color: white;
            margin-left: 20px;
            text-decoration: none;
            background: #007bff;
            padding: 8px 14px;
            border-radius: 5px;
            transition: background 0.3s ease;
        }

        .navbar .actions a:hover {
            background: #0056b3;
        }

        .dashboard {
            max-width: 1100px;
            margin: 40px auto;
            padding: 20px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(300px, 1fr));
            gap: 25px;
        }

        .card {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 3px 10px rgba(0,0,0,0.1);
            transition: transform 0.2s ease;
        }

        .card:hover {
            transform: translateY(-5px);
        }

        .card h3 {
            margin-bottom: 15px;
        }

        .card a {
            display: inline-block;
            padding: 10px 16px;
            margin-top: 10px;
            background: #28a745;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

        .card a:hover {
            background: #218838;
        }

        .footer {
            text-align: center;
            padding: 20px;
            font-size: 14px;
            color: #777;
            margin-top: 40px;
        }

        @media (max-width: 768px) {
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
        <h2>Admin Dashboard</h2>
        <div class="actions">
            <span>Welcome, <strong><%= username %></strong></span>
            <a href="AdminLogoutServlet" style="background: #dc3545;">Logout</a>
        </div>
    </div>

    <div class="dashboard">
        <div class="grid">
            <div class="card">
                <h3>Manage Employees</h3>
                <a href="viewEmployees.jsp">View All Employees</a><br/>
                <a href="addEmployee.jsp">Add New Employee</a>
                <a href="deleteEmployee.jsp"> Delete Employee</a>
                
            </div>

           

            <div class="card">
                <h3>Salary Reports</h3>
                <a href="salaryReports.jsp">View Salary Reports</a><br/>
                <a href ="addSalary.jsp">Add Salary</a>
            </div>

            <div class="card">
                <h3>Admin Settings</h3>
                <a href="adminChangePassword.jsp">Change Password</a><br/>
            </div>
        </div>
    </div>

    <div class="footer">
        &copy; 2025 Employee Management System | Admin Panel
    </div>

</body>
</html>
