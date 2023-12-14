<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Customer Rep- Flight Reservation System</title>
    
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
    <h2>Delete Customer Rep</h2>

    <form method="post" action="deleteCustomerRep.jsp">
        <table>
            <tr>
                <th>User ID</th>
                <th>Representative Identifier</th>
                <th>Action</th>
            </tr>

            <%
                try {
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();

                    ResultSet rs = statement.executeQuery("SELECT * FROM CustomerRepresentative");

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("UserID") %></td>
                            <td><%= rs.getString("RepresentativeIdentifier") %></td>
                            <td>
                                <form method="post" action="deleteCustomerRep.jsp">
                                    <input type="hidden" name="UserID" value="<%= rs.getString("UserID") %>">
                                    <input type="submit" name="delete" value="Delete" onclick="return confirm('Are you sure you want to delete this customer rep?')">
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

                int rowsAffectedCustomer = statement.executeUpdate("DELETE FROM CustomerRepresentative WHERE UserID='" + UserID + "'");


                if (rowsAffectedCustomer > 0) {

                    int rowsAffectedUser = statement.executeUpdate("DELETE FROM User WHERE UserID='" + UserID + "'");


                    if (rowsAffectedUser > 0) {
                        %>
                        <div class="success-message">
                            Customer Rep records deleted successfully. Refresh page to see changes.
                        </div>
                        <%
                    } else {
                        %>
                        <div class="error-message">
                            Customer Rep record not deleted. An error occurred.
                        </div>
                        <%
                    }
                } else {
                    %>
                    <div class="error-message">
                        No records deleted. User ID not found in the CustomerRepresentative table.
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
                UserID parameter not provided.
            </div>
            <%
        }
    %>
</body>
</html>
