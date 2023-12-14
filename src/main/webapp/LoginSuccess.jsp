<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Successful</title>
    
</head>
<body>
    <div class="container">
        <h2>Congratulations! New Account Creation Successful. You can now login with this account. Please log out and login with your account.</h2>
          <p>Welcome,<%=session.getAttribute("user") %>!</p>
        <a href="Logout.jsp">Log out</a>

    </div>
</body>
</html>
