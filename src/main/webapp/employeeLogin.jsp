<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Employee Login</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f9;
        }

        .login-container {
            max-width: 400px;
            margin: 100px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .login-container h2 {
            text-align: center;
            color: #333;
        }

        .login-container label {
            margin-top: 10px;
            display: block;
        }

        .login-container input {
            width: 100%;
            padding: 10px;
            margin-top: 5px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .btn {
            width: 100%;
            padding: 10px;
            background-color: #5c6bc0;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
        }

        .btn:hover {
            background-color: #3f51b5;
        }

        .error-message {
            color: red;
            text-align: center;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .signup-text {
            text-align: center;
            margin-top: 15px;
            font-size: 14px;
        }

        .signup-text a {
            color: #5c6bc0;
            text-decoration: none;
            font-weight: 500;
        }

        .signup-text a:hover {
            text-decoration: underline;
        }
    </style>
</head>
<body>

<div class="login-container">
    <h2>Employee Login</h2>

    <form action="EmployeeLoginServlet" method="post">
        <label for="username">Username</label>
        <input type="text" id="username" name="username" required />

        <label for="password">Password</label>
        <input type="password" id="password" name="password" required />

        <%
            String errorMessage = (String) request.getAttribute("errorMessage");
            if (errorMessage != null) {
        %>
            <div class="error-message"><%= errorMessage %></div>
        <%
            }
        %>

        <button type="submit" class="btn">Login</button>
    </form>

    <div class="signup-text">
        Don't have an account? <a href="employeeSignup.jsp">Sign up here</a>
    </div>
</div>

</body>
</html>
