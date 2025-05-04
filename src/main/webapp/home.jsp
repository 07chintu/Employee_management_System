<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Employee Management System</title>
   <style>
        body {
            margin: 0;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(to right, #e3f2fd, #ffffff);
            display: flex;
            flex-direction: column;
            min-height: 100vh;
        }

        .container {
            flex: 1;
            max-width: 600px;
            margin: 80px auto;
            background-color: #ffffff;
            padding: 40px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

        h1 {
            font-size: 32px;
            color: #2c3e50;
            margin-bottom: 10px;
        }

        h2 {
            font-size: 22px;
            color: #34495e;
            margin-bottom: 30px;
        }

        .login-buttons {
            display: flex;
            justify-content: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .btn {
            padding: 14px 28px;
            font-size: 18px;
            border: none;
            border-radius: 6px;
            text-decoration: none;
            color: white;
            cursor: pointer;
            transition: all 0.3s ease;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }

        .admin-btn {
            background-color: #007bff;
        }

        .admin-btn:hover {
            background-color: #0056b3;
        }

        .employee-btn {
            background-color: #28a745;
        }

        .employee-btn:hover {
            background-color: #1e7e34;
        }

        footer {
            text-align: center;
            padding: 15px 0;
            background-color: #f0f0f0;
            font-size: 14px;
            color: #555;
        }
    </style>
</head>
<body>

    <!-- Main Container -->
    <div class="container">
        <h1>Welcome to Employee Management System</h1>
        
        <!-- Role Selection -->
        <h2>Select Your Role to Login</h2>

        <!-- Login Buttons for Admin and Employee -->
        <div class="login-buttons">
            <a href="adminLogin.jsp" class="btn admin-btn">Admin Login</a>
            <a href="employeeLogin.jsp" class="btn employee-btn">Employee Login</a>
        </div>
    </div>

    <!-- Footer Section -->
    <footer>
        <p>&copy; 2025 Employee Management System</p>
    </footer>

</body>
</html>
