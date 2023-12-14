<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Rep- Flight Reservation System</title>
    
    <script>
        function editUser(userId) {
            var newUsername = prompt("Enter new Username:");
            var newPassword = prompt("Enter new Password:");

            if (newUsername !== null && newPassword !== null) {
                // Assuming your updateCustomerData.jsp is in the same directory
                window.location.href = "updateCustomerRepData.jsp?userId=" + userId + "&newUsername=" + newUsername + "&newPassword=" + newPassword;
            }
        }
    </script>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    <h2>Edit Rep</h2>

    <form method="post" action="editCustomerRep.jsp">
        <table border="2">
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
