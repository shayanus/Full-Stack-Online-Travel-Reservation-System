<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Aircraft - Flight Reservation System</title>
    
</head>
<body>
    <div class="edit-aircraft-container">
        <h2>Edit Aircraft</h2>

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

        <form id="editAircraftForm" action="editAircraft.jsp" method="post">
            <label for="selectedAircraft">Select Aircraft ID to Edit:</label>
            <input type="text" id="selectedAircraft" name="selectedAircraft" required>

            <label for="newSeats">New Number of Seats:</label>
            <input type="text" id="newSeats" name="newSeats" required>

            <label for="newOperationDays">New Operation Days:</label>
            <input type="text" id="newOperationDays" name="newOperationDays" required>

            <button type="submit">Edit Aircraft</button>
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
    </div>

    <%-- Server-side validation and processing--%>
    <%
        String selectedAircraft = request.getParameter("selectedAircraft");
        String newSeats = request.getParameter("newSeats");
        String newOperationDays = request.getParameter("newOperationDays");

        if (selectedAircraft != null && newSeats != null && newOperationDays != null) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery("SELECT * FROM aircraft WHERE AircraftID='" + selectedAircraft + "'");

                if (rs.next()) {
                    // Aircraft ID exists, update the details
                    int x = statement.executeUpdate("UPDATE aircraft SET seats = '" + newSeats + "', operation_days = '" + newOperationDays + "' WHERE AircraftID = '" + selectedAircraft + "'");
                    out.println("Aircraft Updated");
                } else {
                    // Aircraft ID doesn't exist
                    out.println("Aircraft ID does not exist, please try another <a href='editAircraft.jsp'>try again</a>");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
            }
        }
    %>
</body>
</html>
