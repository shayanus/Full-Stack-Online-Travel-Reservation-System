<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Customer - Flight Reservation System</title>
    
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    <h2>Delete Customer</h2>

    <form method="post" action="deleteCustomer.jsp">
        <table border="2">
            <tr>
                <th>User ID</th>
                <th>Customer Identifier</th>
                <th>Action</th>
            </tr>

            <%
                try {
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();

                    ResultSet rs = statement.executeQuery("SELECT * FROM Customer");

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("UserID") %></td>
                            <td><%= rs.getString("CustomerIdentifier") %></td>
                            <td>
                                <form method="post" action="deleteCustomer.jsp">
                                    <input type="hidden" name="UserID" value="<%= rs.getString("UserID") %>">
                                    <input type="submit" name="delete" value="Delete" onclick="return confirm('Are you sure you want to delete this customer?')">
                                </form>
                            </td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>
    </form>

    <%
        String UserID = request.getParameter("UserID");

        if (UserID != null) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();


                // Delete from Customer table
                int rowsAffectedCustomer = statement.executeUpdate("DELETE FROM Customer WHERE UserID='" + UserID + "'");


                if (rowsAffectedCustomer > 0) {

                    // Delete from User table only if the deletion from Customer was successful
                    int rowsAffectedUser = statement.executeUpdate("DELETE FROM User WHERE UserID='" + UserID + "'");


                    if (rowsAffectedUser > 0) {
                        %>
                        <div class="success-message">
                            Customer records deleted successfully. Refresh Page to see changes
                        </div>
                        <%
                    } else {
                        %>
                        <div class="error-message">
                            Customer record not deleted. An error occurred.
                        </div>
                        <%
                    }
                } else {
                    %>
                    <div class="error-message">
                        No records deleted. User ID not found in the Customer table.
                    </div>
                    <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                %>
                <div class="error-message">
                    An error occurred while processing your request. Please try again later.
                </div>
                <%
            }
        } else {
            %>
            <div class="error-message">
                No user selected
            </div>
            <%
        }
    %>
</body>
</html>
