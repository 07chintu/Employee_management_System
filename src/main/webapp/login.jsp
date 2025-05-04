<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>

    <style>
        /* Global styling */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Login container styling */
        .login-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
            text-align: center;
        }

        /* Title styling */
        .login-title {
            margin-bottom: 20px;
            font-size: 24px;
            color: #333;
        }

        /* Form input group styling */
        .input-group {
            margin-bottom: 15px;
            text-align: left;
        }

        .input-group label {
            display: block;
            font-size: 14px;
            color: #333;
            margin-bottom: 5px;
        }

        .input-group input {
            width: 100%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ddd;
            border-radius: 4px;
            box-sizing: border-box;
        }

        .input-group input:focus {
            border-color: #4e73df;
            outline: none;
        }

        /* Button styling */
        .btn-submit {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            background-color: #4e73df;
            color: #fff;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .btn-submit:hover {
            background-color: #3e63d1;
        }

        /* Error message styling */
        .error-message {
            margin-top: 15px;
            font-size: 14px;
        }

        .error {
            color: #e74a3b;
            background-color: #f8d7da;
            padding: 10px;
            border-radius: 4px;
            border: 1px solid #e74a3b;
        }
    </style>

</head>
<body>

    <div class="login-container">
        <h2 class="login-title">Admin Login</h2>
        <form action="LoginServlet" method="post" class="login-form">
            <div class="input-group">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required placeholder="Enter username">
            </div>
            <div class="input-group">
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required placeholder="Enter password">
            </div>
            <div class="input-group">
                <input type="submit" value="Login" class="btn-submit">
            </div>
        </form>

        <div class="error-message">
            <c:if test="${not empty param.error}">
                <p class="error">Invalid username or password. Please try again.</p>
            </c:if>
        </div>
    </div>

</body>
</html>
