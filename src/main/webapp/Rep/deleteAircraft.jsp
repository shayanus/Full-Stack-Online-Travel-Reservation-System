<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Delete Aircraft - Flight Reservation System</title>
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

        .delete-aircraft-container {
            background-color: #f5f5f5;
            border: 2px solid #000;
            border-radius: 5px;
            box-shadow: 10px 0 10px rgba(0, 0, 0, 0.1);
            width: 600px;
            padding: 20px;
            margin-top: 400px;
        }

        .delete-aircraft-container h2 {
            color: #333;
            text-align: center;
            margin-bottom: 20px;
            margin-top: 50px;
        }

        .delete-aircraft-container table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }

        .delete-aircraft-container th, .delete-aircraft-container td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }

        .delete-aircraft-container th {
            background-color: #f2f2f2;
        }

        .delete-aircraft-container label {
            display: block;
            margin-bottom: 8px;
        }

        .delete-aircraft-container input {
            width: calc(100% - 16px);
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .delete-aircraft-container button {
            background-color: #dc3545; /* Red color for delete */
            color: #fff;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 100%;
        }

        .delete-aircraft-container button:hover {
            background-color: #c82333;
        }
    </style>
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
            <%= request.getAttribute("successMessage") %>
        </p>
        <p id="error">
            <%= request.getAttribute("errorMessage") %>
        </p>

        <!-- Back Button -->
        <button onclick="location.href='CustomerRepMainPage.jsp'">Back to Rep Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>

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
