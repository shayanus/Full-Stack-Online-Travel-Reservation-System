<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Successful</title>
</head>
<body>
    <div class="container">
        <h2>Welcome, <%=session.getAttribute("user") %>! <a href="login.jsp">Login here</a>
</p>
        <!-- You can customize the content of the successful login page -->

    </div>
</body>
</html>
