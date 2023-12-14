<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"  import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Customer - Flight Reservation System</title>
</head>
<body>
    <div class="add-customer-container">
        <h2>Add Customer</h2>
        <form id="addCustomerForm" action="addCustomer.jsp" method="post">
            <label for="username">Username:</label>
            <input type="text" id="username" name="username" required>
            
            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required>

            <button type="submit">Add Customer</button>
        </form>
        <p id="success">
            <%= (request.getAttribute("successMessage") != null) ? request.getAttribute("successMessage") : "" %>
        </p>
        <p id="error">
            <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
        </p>
        <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'">Log out</button>
        
    </div>

    <%
    String UserID = request.getParameter("username");
    String Password = request.getParameter("password");

    if (UserID != null && Password != null) {
        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();
            Statement statement = connection.createStatement();

            ResultSet rs = statement.executeQuery("SELECT * FROM Customer WHERE UserID='" +UserID+ "'");

            if (rs.next()) {
                // Username already exists
            	out.println("Username already exists, please <a href='addCustomer.jsp'>try again</a>");
            } else {
                // Username doesn't exist, add to the table
                int x = statement.executeUpdate("INSERT INTO User(UserID, Password, role) VALUES('" +UserID+ "', '" +Password+ "', 'Customer')");
                int y = statement.executeUpdate("INSERT INTO Customer(UserID, CustomerIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
                out.println("Customer Added");
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
        }
    }
    %>
</body>
</html>
