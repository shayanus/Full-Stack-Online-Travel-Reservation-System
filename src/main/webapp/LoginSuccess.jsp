<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Successful</title>
    <!-- Add any additional styling or metadata here -->
    <style>
        /* Add your custom styles here */
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
        }
        .container {
            text-align: center;
            margin-top: 50px;
        }
        .logout-btn {
            padding: 10px 20px;
            background-color: #dc3545;
            color: #fff;
            text-decoration: none;
            border: none;
            cursor: pointer;
            font-size: 16px;
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Congratulations! New Account Creation Successful. You can now login with this account. Please log out and login with your account.</h2>
          <p>Welcome,<%=session.getAttribute("user") %>!</p>
        <a href="Logout.jsp">Log out</a>
        <!-- You can customize the content of the successful login page -->

    </div>
</body>
</html>
