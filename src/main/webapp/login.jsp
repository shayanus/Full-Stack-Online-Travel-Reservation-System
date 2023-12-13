<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>

</head>
<body>
    <div class="login-container">
        <h2>Login</h2>
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
                    	response.sendRedirect("User/UserMainPage.jsp");
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
