<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer Data - Flight Reservation System</title>
</head>

<body>
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'" >Log out</button>
    
    <h2>Update Customer Data</h2>

    <%
        String userId = request.getParameter("userId");
        String newUsername = request.getParameter("newUsername");
        String newPassword = request.getParameter("newPassword");

        if (userId != null && newUsername != null && newPassword != null) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();

                int rowsDeletedCustomer = statement.executeUpdate("DELETE FROM Customer WHERE UserID='" + userId + "'");

                if (rowsDeletedCustomer > 0) {
                    int rowsDeletedUser = statement.executeUpdate("DELETE FROM User WHERE UserID='" + userId + "'");

                    if (rowsDeletedUser > 0) {
                        int rowsInsertedUser = statement.executeUpdate("INSERT INTO User (UserID, Password, role) VALUES ('" + newUsername + "', '" + newPassword + "', 'Customer')");

                        if (rowsInsertedUser > 0) {
                            int rowsInsertedCustomer = statement.executeUpdate("INSERT INTO Customer (UserID, CustomerIdentifier) VALUES ('" + newUsername + "', '" + newUsername + "')");

                            if (rowsInsertedCustomer > 0) {
                                %>
                                <div>
                                    Customer data updated successfully.
                                </div>
                                <%
                            } else {
                                %>
                                <div>
                                    User data not updated. An error occurred while inserting into Customer table.
                                </div>
                                <%
                            }
                        } else {
                            %>
                            <div>
                                User data not updated. An error occurred while inserting into User table.
                            </div>
                            <%
                        }
                    } else {
                        %>
                        <div>
                            User data not updated. An error occurred while deleting from User table.
                        </div>
                        <%
                    }
                } else {
                    %>
                    <div>
                        User data not updated. An error occurred while deleting from Customer table.
                    </div>
                    <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
                %>
                <div>
                    An error occurred while processing your request. Please try again later.
                </div>
                <%
            }
        } else {
            %>
            <div>
                Parameters not provided.
            </div>
            <%
        }
    %>
</body>
</html>
