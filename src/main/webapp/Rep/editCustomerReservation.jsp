<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
    <title>Edit Ticket - Ticket Reservation System</title>
</head>

<body>
    <button onclick="location.href='CustomerRepMainPage.jsp'" >Back to Rep Main Page</button>

    <h2>Edit Ticket</h2>

    <!-- Display all tickets -->
    <form method="post">
        <label for="ticketNumber">Select Ticket Number to Edit:</label>
        <select id="ticketNumber" name="ticketNumber">
            <%
                try {
                    ApplicationDB db = new ApplicationDB();
                    Connection connection = db.getConnection();
                    Statement statement = connection.createStatement();
                    ResultSet rs = statement.executeQuery("SELECT TicketNumber FROM ticket");

                    while (rs.next()) {
            %>
                        <option value="<%= rs.getString("TicketNumber") %>"><%= rs.getString("TicketNumber") %></option>
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
            <option value="seatNumber">Seat Number</option>
            <option value="total_fare">Total Fare</option>
            <option value="bookingFee">Booking Fee</option>
            <!-- Add more attributes as needed -->
        </select>
        <br>

        <label for="newValue">Enter New Value:</label>
        <input type="text" id="newValue" name="newValue" required>
        <br>

        <button type="submit">Edit Ticket</button>
    </form>

    <!-- Process Edit -->
    <%
        String ticketNumberToEdit = request.getParameter("ticketNumber");
        String attributeToEdit = request.getParameter("attribute");
        String newValue = request.getParameter("newValue");

        if (ticketNumberToEdit != null && !ticketNumberToEdit.isEmpty() &&
            attributeToEdit != null && !attributeToEdit.isEmpty() &&
            newValue != null && !newValue.isEmpty()) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement updateStatement = connection.createStatement();
                int rowsUpdated = updateStatement.executeUpdate("UPDATE ticket SET " + attributeToEdit + "='" + newValue + "' WHERE TicketNumber='" + ticketNumberToEdit + "'");
    %>
                <p><%= rowsUpdated > 0 ? "Ticket updated successfully." : "Ticket not found." %></p>
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
