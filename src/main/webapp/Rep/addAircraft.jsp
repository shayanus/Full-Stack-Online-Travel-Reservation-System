<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Aircraft - Flight Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: space-between;
            align-items: center;
            height: 100vh;
            margin: 60;
        }

        .add-aircraft-container {
            background-color: #f5f5f5;
            border: 2px solid #000;
            border-radius: 5px;
            box-shadow: 10px 0 10px rgba(0, 0, 0, 0.1);
            width: 300px;
            padding: 50px;
        }

        .add-aircraft-container h2 {
            color: #333;
            text-align: center;
        }

        .add-aircraft-container label {
            display: block;
            margin-bottom: 8px;
        }

        .add-aircraft-container input {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .add-aircraft-container button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .add-aircraft-container button:hover {
            background-color: #0056b3;
        }

        .add-aircraft-container p#success {
            color: green;
            text-align: center;
            margin-top: 15px;
        }

        .add-aircraft-container p#error {
            color: red;
            text-align: center;
            margin-top: 15px;
        }
    </style>
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
