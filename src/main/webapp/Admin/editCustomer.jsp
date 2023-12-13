<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Customer - Flight Reservation System</title>
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
        }

        button:hover {
            background-color: #0056b3;
        }
        
        /* Add more styles as needed */
    </style>
    <script>
        function editUser(userId) {
            var newUsername = prompt("Enter new Username:");
            var newPassword = prompt("Enter new Password:");

            if (newUsername !== null && newPassword !== null) {
                // Assuming your updateCustomerData.jsp is in the same directory
                window.location.href = "updateCustomerData.jsp?userId=" + userId + "&newUsername=" + newUsername + "&newPassword=" + newPassword;
            }
        }
    </script>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
    <h2>Edit Customer</h2>

    <form method="post" action="editCustomer.jsp">
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
                                <button type="button" onclick="editUser('<%= rs.getString("UserID") %>')">Edit</button>
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
</body>
</html>
