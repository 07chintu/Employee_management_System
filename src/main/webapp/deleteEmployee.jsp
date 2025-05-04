<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Delete Employee</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f0f4f8;
            padding: 40px;
            display: flex;
            justify-content: center;
        }

        .container {
            background-color: #fff;
            padding: 30px 40px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            margin-bottom: 25px;
            color: #333;
        }

        label {
            display: block;
            margin-bottom: 10px;
            font-weight: bold;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border-radius: 6px;
            border: 1px solid #ccc;
        }

        .btn {
            background-color: #ef5350;
            color: white;
            padding: 10px 20px;
            border: none;
            border-radius: 6px;
            width: 100%;
            font-size: 16px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #d32f2f;
        }

        .back-btn {
            margin-top: 15px;
            text-align: center;
        }

        .back-btn a {
            color: #3f51b5;
            text-decoration: none;
            font-size: 14px;
        }

        .message {
            text-align: center;
            color: green;
        }

        .error {
            text-align: center;
            color: red;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Delete Employee</h2> 
  

    <% if (request.getAttribute("message") != null) { %>
        <div class="message"><%= request.getAttribute("message") %></div>
    <% } %>
    <% if (request.getAttribute("error") != null) { %>
        <div class="error"><%= request.getAttribute("error") %></div>
    <% } %>

    <form action="DeleteEmployeeServlet" method="post">
        <label for="employeeId">Enter Employee ID:</label>
        <input type="text" id="employeeId" name="employeeId" required />

        <button type="submit" class="btn">Delete</button>
    </form>

    <div class="back-btn">
        <a href="adminDashboard.jsp">← Back to Dashboard</a>
    </div>
</div>

</body>
</html>
