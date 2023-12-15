<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Successful</title>
</head>
<body>
    <div>
        <h2>Welcome, <%=session.getAttribute("user") %>! <a href="login.jsp">Login here</a>
</p>
    </div>
</body>
</html>
