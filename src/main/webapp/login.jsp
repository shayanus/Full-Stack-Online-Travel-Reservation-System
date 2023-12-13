<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>CS 336 Group 32 Project</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 100vh;
            margin: 60;
        }

        .login-container {
            background-color: #f5f5f5; /* Light gray background color */
            border: 2px solid #000; /* Black border */
            border-radius: 5px;
            box-shadow: 10px 0 10px rgba(0, 0, 0, 0.1); /* Right side shadow */
            width: 300px;
            padding: 50px;
        }

        .login-container h2 {
            color: #333;
            text-align: center;
        }

        .login-container label {
            display: block;
            margin-bottom: 8px;
        }

        .login-container input,
        .login-container select {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .login-container button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .login-container button:hover {
            background-color: #0056b3;
        }

        .login-container p#error {
            color: red;
            text-align: center;
            margin-top: 15px;
        }

        .register-button {
            text-align: center;
            margin-top: 10px;
        }

        .image-container {
            flex: 1;
            text-align: center;
        }

        .image-container img {
            max-width: 100%;
            height: auto;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <h2>CS 336 Group 32 Project</h2>
        <form id="loginForm" action="login.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <label for="role">Role:</label>
            <select id="role" name="role">
                <option value="Customer">Customer</option>
                <option value="CustomerRepresentative">CustomerRepresentative</option>
                <option value="SiteAdmin">SiteAdmin</option>
            </select>

            <button type="submit">Login</button>
        </form>
        <p id="error">
            <%= request.getAttribute("errorMessage") %>
        </p>
        <div class="register-button">
            <a href="register.jsp">Register New User</a>
        </div>
    </div>

    <div class="image-container">
        <img src="airplane_logo.jpg" alt="logo">
    </div>

    <%-- Server-side validation and processing--%>
    <%
    String UserID = request.getParameter("username");
    String Password = request.getParameter("password");
    String role = request.getParameter("role");

    if (UserID != null && Password != null && role != null) {
        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();
            Statement statement = connection.createStatement();

            ResultSet rs1 = statement.executeQuery("SELECT * FROM User WHERE UserID='" + UserID + "'");

            if (rs1.next()) {
                ResultSet rs2 = statement.executeQuery("SELECT * FROM User WHERE UserID='" + UserID + "' AND Password='" + Password + "' AND role='" + role + "'");
                
                if (rs2.next()) {
    
                    if(role.equals("Customer")){
                    	session.setAttribute("user", UserID);
                    	response.sendRedirect("Customer/CustomerMainPage.jsp");
                    }
                    if(role.equals("CustomerRepresentative")){
                    	 session.setAttribute("user", UserID);
                         response.sendRedirect("Rep/CustomerRepMainPage.jsp");	
                    }
                    if(role.equals("SiteAdmin")){
                    	 session.setAttribute("user", UserID);
                         response.sendRedirect("Admin/AdminMainPage.jsp");
                    }
                } else {
                    out.println("Invalid password or Role Selection<a href='login.jsp'>try again</a>");
                }
            } else {
                out.println("Username doesn't exist <a href='register.jsp'>Create An Account</a>");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            out.println("An error occurred while processing your request. Please try again later.");
        } 
    }
        
        
    %>
</body>
</html>
