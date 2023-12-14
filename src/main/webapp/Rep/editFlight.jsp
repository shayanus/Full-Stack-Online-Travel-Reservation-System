<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Flight - Flight Reservation System</title>
</head>

<body>
    <button onclick="location.href='CustomerRepMainPage.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Customer Rep Main Page</button>

    <h2>Edit Flight</h2>

    <form method="post" action="editFlight.jsp">
        <label for="flightNumber">Select Flight Number to Edit:</label>
        <select id="flightNumber" name="flightNumber">
            <%
                try {
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT flightNumber FROM flightservices");

                    while (rs.next()) {
            %>
                        <option value="<%= rs.getString("flightNumber") %>"><%= rs.getString("flightNumber") %></option>
            <%
                    }
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            %>
        </select>
        <br>

        <label for="attribute">Select Attribute to Edit:</label>
        <select id="attribute" name="attribute">
            <option value="AircraftID">Aircraft ID</option>
            <option value="origin_airport">Origin Airport</option>
            <option value="destination_airport">Destination Airport</option>
            <option value="economy_fare">Economy Fare</option>
            <option value="business_fare">Business Fare</option>
            <option value="first_class_fare">First Class Fare</option>
            <option value="airline">Airline</option>
            <option value="number_of_stops">Number of Stops</option>
            <option value="flight_type">Flight Type</option>
            <option value="departure_date">Departure Date</option>
            <option value="departure_times">Departure Times</option>
            <option value="arrival_date">Arrival Date</option>
            <option value="arrival_times">Arrival Times</option>
        </select>
        <br>

        <label for="newValue">Enter New Value:</label>
        <input type="text" id="newValue" name="newValue" required>
        <br>

        <button type="submit">Edit Flight</button>
    </form>

    <%
        String flightNumberToEdit = request.getParameter("flightNumber");
        String attributeToEdit = request.getParameter("attribute");
        String newValue = request.getParameter("newValue");

        if (flightNumberToEdit != null && !flightNumberToEdit.isEmpty() &&
            attributeToEdit != null && !attributeToEdit.isEmpty() &&
            newValue != null && !newValue.isEmpty()) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement updateStatement = connection.createStatement();
                int rowsUpdated = updateStatement.executeUpdate("UPDATE flightservices SET " + attributeToEdit + "='" + newValue + "' WHERE flightNumber='" + flightNumberToEdit + "'");
    %>
                <p><%= rowsUpdated > 0 ? "Flight updated successfully." : "Flight not found." %></p>
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
