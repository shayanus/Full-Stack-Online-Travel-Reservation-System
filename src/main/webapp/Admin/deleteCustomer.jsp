<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Customer - Flight Reservation System</title>
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

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 20px;
        }

        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        th {
            background-color: #007BFF;
            color: #fff;
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

        form {
            margin-top: 20px;
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
    
    <h2>Delete Customer</h2>

    <form method="post" action="deleteCustomer.jsp">
        <table>
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
                UserID parameter not provided.
            </div>
            <%
        }
    %>
</body>
</html>
