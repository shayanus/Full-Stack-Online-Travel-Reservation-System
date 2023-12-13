<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Flight - Flight Reservation System</title>
</head>

<body>
    <button onclick="location.href='CustomerRepMainPage.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Customer Rep Main Page</button>

    <h2>Delete Flight</h2>

    <!-- Display all flights -->
    <table border="1">
        <tr>
            <th>Flight Number</th>
            <th>Aircraft ID</th>
            <th>Origin Airport</th>
            <th>Destination Airport</th>
            <th>Departure Date</th>
            <th>Departure Time</th>
            <th>Arrival Date</th>
            <th>Arrival Time</th>
            <th>Economy Fare</th>
            <th>Business Fare</th>
            <th>First Class Fare</th>
            <th>Airline</th>
            <th>Number of Stops</th>
            <th>Flight Type</th>
            <th>Duration</th>
            <!-- Add more header columns as needed -->
        </tr>

        <%
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();
                ResultSet rs = statement.executeQuery("SELECT * FROM flightservices");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("flightNumber") %></td>
                        <td><%= rs.getString("AircraftID") %></td>
                        <td><%= rs.getString("origin_airport") %></td>
                        <td><%= rs.getString("destination_airport") %></td>
                        <td><%= rs.getString("departure_date") %></td>
                        <td><%= rs.getString("departure_times") %></td>
                        <td><%= rs.getString("arrival_date") %></td>
                        <td><%= rs.getString("arrival_times") %></td>
                        <td><%= rs.getFloat("economy_fare") %></td>
                        <td><%= rs.getFloat("business_fare") %></td>
                        <td><%= rs.getFloat("first_class_fare") %></td>
                        <td><%= rs.getString("airline") %></td>
                        <td><%= rs.getInt("number_of_stops") %></td>
                        <td><%= rs.getString("flight_type") %></td>
                        <td><%= rs.getString("duration") %></td>
                        <!-- Add more data columns as needed -->
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>

    <!-- Delete Form -->
    <h2>Delete Flight by Flight Number</h2>
    <form method="post" action="deleteFlight.jsp">
        <label for="flightNumber">Enter Flight Number to Delete:</label>
        <input type="text" id="flightNumber" name="flightNumber" required>
        <button type="submit">Delete Flight</button>
    </form>

    <!-- Process Delete -->
    <%
        String flightNumberToDelete = request.getParameter("flightNumber");
        if (flightNumberToDelete != null && !flightNumberToDelete.isEmpty()) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement deleteStatement = connection.createStatement();
                int rowsDeleted = deleteStatement.executeUpdate("DELETE FROM flightservices WHERE flightNumber='" + flightNumberToDelete + "'");
    %>
                <p><%= rowsDeleted > 0 ? "Flight deleted successfully." : "Flight not found." %></p>
    <%
            } catch (SQLException e) {
                e.printStackTrace();
    %>
                <p>An error occurred while processing your request. Please try again later.</p>
    <%
            }
        }
    %>
</body>
</html>
