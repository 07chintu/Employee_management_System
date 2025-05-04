<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Employee Signup</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <style>
        body {
            margin: 0;
            padding: 20px;
            font-family: 'Segoe UI', sans-serif;
            background-color: #f4f6f9;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .signup-box {
            background-color: #ffffff;
            padding: 30px 25px;
            border-radius: 10px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 480px;
            box-sizing: border-box;
        }

        .signup-box h2 {
            margin-bottom: 20px;
            color: #2c3e50;
            font-weight: 600;
            font-size: 24px;
            text-align: center;
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            margin-bottom: 6px;
            color: #555;
            font-weight: 500;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 10px;
            font-size: 15px;
            border: 1px solid #ccc;
            border-radius: 6px;
            transition: border-color 0.3s;
            box-sizing: border-box;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #5c6bc0;
            outline: none;
        }

        .btn {
            width: 100%;
            padding: 12px;
            background-color: #5c6bc0;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: 500;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #3f51b5;
        }

        .error-message {
            color: #d9534f;
            font-weight: bold;
            margin-bottom: 15px;
            text-align: center;
        }

        .login-redirect {
            text-align: center;
            margin-top: 20px;
            font-size: 14px;
            color: #777;
        }

        .login-redirect a {
            color: #5c6bc0;
            text-decoration: none;
            font-weight: 500;
        }

        .login-redirect a:hover {
            text-decoration: underline;
        }

        @media (max-width: 480px) {
            .signup-box {
                padding: 20px;
            }
        }
    </style>
</head>
<body>

<div class="signup-box">
    <h2>Create Your Account</h2>

    <% String errorMessage = (String) request.getAttribute("errorMessage");
       if (errorMessage != null) { %>
        <div class="error-message"><%= errorMessage %></div>
    <% } %>

    <form action="EmployeeSignupServlet" method="post">
        <div class="form-group">
            <label for="username">Username</label>
            <input type="text" name="username" id="username" required />
        </div>
        <div class="form-group">
            <label for="password">Password</label>
            <input type="password" name="password" id="password" required />
        </div>
        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" name="email" id="email" required />
        </div>
        <div class="form-group">
            <label for="department">Department</label>
            <input type="text" name="department" id="department" required />
        </div>
        
         <div class="form-group">
            <label for="salary">Salary</label>
            <input type="number" name="salary" id="salary" required />
        </div>
        
        <div class="form-group">
            <label for="age">Age</label>
            <input type="number" name="age" id="age" min="18" max="100" required />
        </div>
        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" name="phone" id="phone" pattern="[0-9]{10}" required />
        </div>
        <div class="form-group">
            <label for="address">Address</label>
            <textarea name="address" id="address" rows="3" required></textarea>
        </div>
        <button type="submit" class="btn">Sign Up</button>
    </form>

    <div class="login-redirect">
        Already have an account? <a href="employeeLogin.jsp">Login here</a>
    </div>
</div>

</body>
</html>
