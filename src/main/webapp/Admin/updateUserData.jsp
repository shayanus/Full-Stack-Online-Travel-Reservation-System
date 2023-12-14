<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Customer Data - Flight Reservation System</title>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'" >Log out</button>
    
    <h2>Update Customer Data</h2>

    <%
        String userId = request.getParameter("userId");
        String UserID = request.getParameter("newUsername");
        String Password = request.getParameter("newPassword");

        if (userId != null && UserID != null && Password != null) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();

                // Update User table
                int rowsAffectedUser = statement.executeUpdate("UPDATE User SET UserID='" +UserID+ "', Password='" +Password+ "' WHERE UserID='" +userId+ "'");

                if (rowsAffectedUser > 0) {
                    // Update Customer table
                    int rowsAffectedCustomer = statement.executeUpdate("UPDATE Customer SET UserID='" +UserID+ "', CustomerIdentifier='" +UserID+ "' WHERE UserID='" + userId + "'");

                    if (rowsAffectedCustomer > 0) {
                        %>
                        <div class="success-message">
                            User data updated successfully.
                        </div>
                        <%
                    } else {
                        %>
                        <div class="error-message">
                            Customer data not updated. An error occurred.
                        </div>
                        <%
                    }
                } else {
                    %>
                    <div class="error-message">
                        User data not updated. User ID not found in the User table.
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
