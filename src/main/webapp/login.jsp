<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Login Page</title>

</head>
<body>
    <div>
        <h2>Login</h2>
        <form id="loginForm" action="login.jsp" method="post">
            <table>
                <tr>
                    <td><label for="username">Username:</label></td>
                    <td><input type="text" id="username" name="username" required></td>
                </tr>
                <tr>
                    <td><label for="password">Password:</label></td>
                    <td><input type="password" id="password" name="password" required></td>
                </tr>
                <tr>
                    <td><label for="role">Role:</label></td>
                    <td>
                        <select id="role" name="role">
                            <option value="Customer">Customer</option>
                            <option value="CustomerRepresentative">Representative</option>
                            <option value="SiteAdmin">Admin</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td colspan="2"><button type="submit">Login</button></td>
                </tr>
            </table>
        </form>
        <p id="error">
            <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
        </p>
        <div>
            <a href="register.jsp">Register New User</a>
        </div>
    </div>


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
                    	response.sendRedirect("User/UserPortal.jsp");
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
                    out.println("Invalid password or role selected, please <a href='login.jsp'>try again</a>");
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
