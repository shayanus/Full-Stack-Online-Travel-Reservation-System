<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Aircraft - Flight Reservation System</title>    
</head>
<body>
    <div class="delete-aircraft-container">
        <h2>Delete Aircraft</h2>

        <table>
            <tr>
                <th>Aircraft ID</th>
                <th>Number of Seats</th>
                <th>Operation Days</th>
            </tr>
            <% 
                try {
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT * FROM aircraft");

                    while (rs.next()) {
            %>
                        <tr>
                            <td><%= rs.getString("AircraftID") %></td>
                            <td><%= rs.getInt("seats") %></td>
                            <td><%= rs.getString("operation_days") %></td>
                        </tr>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </table>

        <form id="deleteAircraftForm" action="deleteAircraft.jsp" method="post">
            <label for="selectedAircraft">Select Aircraft ID to Delete:</label>
            <input type="text" id="selectedAircraft" name="selectedAircraft" required>

            <button type="submit">Delete Aircraft</button>
        </form>

        <p id="success">
            <%= (request.getAttribute("successMessage") != null) ? request.getAttribute("successMessage") : "" %>
        </p>
        <p id="error">
            <%= (request.getAttribute("errorMessage") != null) ? request.getAttribute("errorMessage") : "" %>
        </p>

        <!-- Back Button -->
        <button onclick="location.href='CustomerRepMainPage.jsp'">Back to Rep Main Page</button>
        <button onclick="location.href='../Logout.jsp'" >Log out</button>

        <!-- Java code to delete the selected aircraft -->
        <%
            String selectedAircraft = request.getParameter("selectedAircraft");

            if (selectedAircraft != null) {
                try {
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();

                    // Delete the selected aircraft from the database
                    int rowsDeleted = statement.executeUpdate("DELETE FROM aircraft WHERE AircraftID='" + selectedAircraft + "'");

                    if (rowsDeleted > 0) {
                        request.setAttribute("successMessage", "Aircraft deleted successfully.");
                    } else {
                        request.setAttribute("errorMessage", "Aircraft not found or an error occurred.");
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                    request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
                }
            }
        %>
    </div>
</body>
</html>
