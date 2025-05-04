<%@ page language="java" contentType="text/html;charset=UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Login / Sign Up</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background: #f4f4f4;
            padding: 50px;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            background: white;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            width: 400px;
            text-align: center;
        }

        h2 {
            margin-bottom: 20px;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 10px;
            margin: 8px 0;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background: #28a745;
            border: none;
            color: white;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
        }

        input[type="submit"]:hover {
            background: #218838;
        }

        .form-section {
            margin-bottom: 30px;
        }

        .form-section h3 {
            margin-top: 20px;
        }

        .link {
            display: inline-block;
            margin-top: 15px;
            color: #007bff;
            text-decoration: none;
        }

        .link:hover {
            text-decoration: underline;
        }

        /* Error message styling */
        .error-message {
            color: red;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <!-- Admin Login Form -->
        <div class="form-section">
            <h2>Admin Login</h2>
            <form action="AdminLoginServlet" method="post">
                <input type="text" name="username" placeholder="Username" required><br/>
                <input type="password" name="password" placeholder="Password" required><br/>
                <input type="submit" value="Login">
            </form>

          
        <!-- Admin Sign Up Form (at bottom) -->
        <div class="form-section">
            <h3>First time here? Create an Admin account</h3>
            <form action="AdminSignupServlet" method="post">
                <input type="text" name="username" placeholder="New Username" required><br/>
                <input type="password" name="password" placeholder="New Password" required><br/>
                <input type="submit" value="Sign Up">
            </form> <br>

			<%-- Show error or success messages --%>
			<c:if test="${not empty errorMessage}">
				<div style="color: red; text-align: center; margin-bottom: 10px;">
					${errorMessage}</div>
			</c:if>
			<c:if test="${not empty successMessage}">
				<div style="color: green; text-align: center; margin-bottom: 10px;">
					${successMessage}</div>
			</c:if>

			<p>Already have an account? <a href="adminLogin.jsp" class="link">Login here</a></p>
        </div>
    </div>
</body>
</html>
