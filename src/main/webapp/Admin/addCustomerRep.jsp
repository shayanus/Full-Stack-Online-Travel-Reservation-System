<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add CustomerRep - Flight Reservation System</title>
    
</head>
<body>
    <div class="add-customer-container">
        <h2>Add Customer Rep</h2>
        <form id="addCustomerRepForm" action="addCustomerRep.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Add Customer Rep</button>
        </form>
        <p id="success">
            <%= request.getAttribute("successMessage") %>
        </p>
        <p id="error">
            <%= request.getAttribute("errorMessage") %>
        </p>
        <!-- Back Button -->
        <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
        
    </div>

    <%-- Server-side validation and processing--%>
    <%
    String UserID = request.getParameter("username");
    String Password = request.getParameter("password");

    if (UserID != null && Password != null) {
        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM CustomerRepresentative WHERE UserID='" +UserID+ "'");

            if (rs.next()) {
                // Username already exists
            	out.println("UserID exists, please try another <a href='addCustomerRep.jsp'>try again</a>");
            } else {
                // Username doesn't exist, add to the table
                int x = statement.executeUpdate("INSERT INTO User(UserID, Password, role) VALUES('" +UserID+ "', '" +Password+ "', 'CustomerRepresentative')");
                int y = statement.executeUpdate("INSERT INTO CustomerRepresentative(UserID, RepresentativeIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
                out.println("Customer Rep Added");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
        }
    }
    %>
</body>
</html>
