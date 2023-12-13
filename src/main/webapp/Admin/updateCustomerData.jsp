<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer Data - Flight Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-bottom: 20px;
        }

        button:hover {
            background-color: #0056b3;
        }

        .success-message, .error-message {
            text-align: center;
            margin-top: 20px;
            padding: 10px;
            border-radius: 4px;
        }

        .success-message {
            background-color: #28a745;
            color: #fff;
        }

        .error-message {
            background-color: #dc3545;
            color: #fff;
        }
    </style>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
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

                // Delete existing record from Customer table
                int rowsDeletedCustomer = statement.executeUpdate("DELETE FROM Customer WHERE UserID='" + userId + "'");

                if (rowsDeletedCustomer > 0) {
                    // Delete existing record from User table
                    int rowsDeletedUser = statement.executeUpdate("DELETE FROM User WHERE UserID='" + userId + "'");

                    if (rowsDeletedUser > 0) {
                        // Insert new record into User table
                        int rowsInsertedUser = statement.executeUpdate("INSERT INTO User (UserID, Password, role) VALUES ('" + newUsername + "', '" + newPassword + "', 'Customer')");

                        if (rowsInsertedUser > 0) {
                            // Insert new record into Customer table
                            int rowsInsertedCustomer = statement.executeUpdate("INSERT INTO Customer (UserID, CustomerIdentifier) VALUES ('" + newUsername + "', '" + newUsername + "')");

                            if (rowsInsertedCustomer > 0) {
                                %>
                                <div class="success-message">
                                    Customer data updated successfully.
                                </div>
                                <%
                            } else {
                                %>
                                <div class="error-message">
                                    User data not updated. An error occurred while inserting into Customer table.
                                </div>
                                <%
                            }
                        } else {
                            %>
                            <div class="error-message">
                                User data not updated. An error occurred while inserting into User table.
                            </div>
                            <%
                        }
                    } else {
                        %>
                        <div class="error-message">
                            User data not updated. An error occurred while deleting from User table.
                        </div>
                        <%
                    }
                } else {
                    %>
                    <div class="error-message">
                        User data not updated. An error occurred while deleting from Customer table.
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
                Parameters not provided.
            </div>
            <%
        }
    %>
</body>
</html>
