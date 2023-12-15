<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register New User</title>
</head>
<body>
    <div>


        <div>
            <h2>Register New User</h2>
            

            <form id="registrationForm" action="register.jsp" method="post">
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
                        <td colspan="2">
                            <button type="submit">Register</button>
                        </td>
                    </tr>
                </table>
            </form>
            
            <p id="error">
                <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
            </p>
            <div>
                <a href="login.jsp">Log in User</a>
            </div>

            <%
            
            	String UserID = request.getParameter("username");
                
                if (UserID != null && !UserID.isEmpty()) {
                    String Password = request.getParameter("password");
                    String Role = request.getParameter("role");
                    
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();
                    
                    ResultSet rs = statement.executeQuery("SELECT * from User WHERE UserID='" + UserID + "'");
                    if(rs.next()){
                        out.println("Username already exists, please <a href='register.jsp'>try again</a>");
                    }else{
                        int x = statement.executeUpdate("INSERT INTO User(UserID, Password, role) VALUES('" +UserID+ "', '" +Password+ "', '" +Role+ "')");
                        
                        if (Role != null) {
                            if(Role.equals("Customer")){
                                int y = statement.executeUpdate("INSERT INTO Customer(UserID, CustomerIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
                            }else if(Role.equals("CustomerRepresentative")){
                                int y = statement.executeUpdate("INSERT INTO CustomerRepresentative(UserID, RepresentativeIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
                                
                            }else if(Role.equals("SiteAdmin")){
                                int y = statement.executeUpdate("INSERT INTO SiteAdmin(UserID, AdminIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
                                
                            }
                        }
                        
                        session.setAttribute("user", UserID); 
                        response.sendRedirect("LoginSuccess.jsp");
                    }
                }
            	
            	
            %>
        </div>
    </div>
</body>
</html>
