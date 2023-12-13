<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Aircraft - Flight Reservation System</title>
    
</head>
<body>
    <div class="add-aircraft-container">
        <h2>Add Aircraft</h2>
        <form id="addAircraftForm" action="addAircraft.jsp" method="post">
            <label for="aircraftID">Aircraft ID:</label>
            <input type="text" id="aircraftID" name="aircraftID" required>
            
            <label for="seats">Number of Seats:</label>
            <input type="text" id="seats" name="seats" required>

            <label for="operationDays">Operation Days:</label>
            <input type="text" id="operationDays" name="operationDays" required>

            <button type="submit">Add Aircraft</button>
        </form>
        <p id="success">
            <%= request.getAttribute("successMessage") %>
        </p>
        <p id="error">
            <%= request.getAttribute("errorMessage") %>
        </p>
        <!-- Back Button -->
        <button onclick="location.href='CustomerRepMainPage.jsp'">Back to Rep Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    </div>

    <%-- Server-side validation and processing--%>
    <%
        String aircraftID = request.getParameter("aircraftID");
        String seats = request.getParameter("seats");
        String operationDays = request.getParameter("operationDays");

        if (aircraftID != null && seats != null && operationDays != null) {
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery("SELECT * FROM Aircraft WHERE AircraftID='" + aircraftID + "'");

                if (rs.next()) {
                    // Aircraft ID already exists
                    out.println("Aircraft ID exists, please try another <a href='addAircraft.jsp'>try again</a>");
                } else {
                    // Aircraft ID doesn't exist, add to the table
                    int x = statement.executeUpdate("INSERT INTO aircraft(AircraftID, seats, operation_days) VALUES('" + aircraftID + "', '" + seats + "', '" + operationDays + "')");
                    out.println("Aircraft Added");
                }
            } catch (SQLException e) {
                e.printStackTrace();
                request.setAttribute("errorMessage", "An error occurred while processing your request. Please try again later.");
            }
        }
    %>
</body>
</html>
