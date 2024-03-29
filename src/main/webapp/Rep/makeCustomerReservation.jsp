<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Flight Booking</title>
    <script>
        function populateFields(userId, customerIdentifier) {
            document.getElementById('userId').value = userId;
            document.getElementById('customerIdentifier').value = customerIdentifier;
        }
    </script>
</head>
<body>
    <button onclick="location.href='CustomerRepMainPage.jsp'">Back to Rep Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>

    <div>
        <h1>Customer List</h1>
        <%
            ApplicationDB db1 = new ApplicationDB();	
            Connection con1 = db1.getConnection();
            ResultSet rs1 = null;

            try {
                Statement stmt = con1.createStatement();
                String query = "SELECT UserID, CustomerIdentifier FROM customer";
                rs1 = stmt.executeQuery(query);
        %>
                <table border="1">
                    <tr>
                        <th>User ID</th>
                        <th>Customer Identifier</th>
                       
                    </tr>
                    <% while (rs1.next()) { %>
                        <tr>
                            <td><%= rs1.getString("UserID") %></td>
                            <td><%= rs1.getString("CustomerIdentifier") %></td>
                        </tr>
                    <% } %>
                </table>
        <%
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs1 != null) try { rs1.close(); } catch (SQLException e) {}
                if (con1 != null) try { con1.close(); } catch (SQLException e) {}
            }
        %>

        <h1>Book Your Flight</h1>
        <form method="post">
            <input type="hidden" name="action" value="book">
            <input type="hidden" id="userId" name="userId">

            <label for="ticketNumber">Ticket Number:</label>
            <input type="text" id="ticketNumber" name="ticketNumber" required><br>

            <label for="seatNumber">Seat Number:</label>
            <input type="text" id="seatNumber" name="seatNumber" required><br>

            <label for="totalFare">Total Fare:</label>
            <input type="number" id="totalFare" name="totalFare" required><br>

            <label for="class">Class:</label>
            <input type="text" id="class" name="class" required><br>

            <label for="passengerName">Passenger Name:</label>
            <input type="text" id="passengerName" name="passengerName"><br>

            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName"><br>

            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName"><br>

            <label for="isEconomy">Is Economy (true/false):</label>
            <input type="text" id="isEconomy" name="isEconomy"><br>

            <label for="flightNumber">Flight Number:</label>
            <input type="text" id="flightNumber" name="flightNumber" required><br>

            <label for="fromAirport">From Airport:</label>
            <input type="text" id="fromAirport" name="fromAirport" required><br>

            <label for="toAirport">To Airport:</label>
            <input type="text" id="toAirport" name="toAirport" required><br>

            <label for="departureDate">Departure Date:</label>
            <input type="date" id="departureDate" name="departureDate" required><br>

            <label for="departureTime">Departure Time:</label>
            <input type="time" id="departureTime" name="departureTime" required><br>

            <input type="submit" value="Book Flight">
        </form>
    </div>

    <%
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            String userId = request.getParameter("userId");
            String customerIdentifier = request.getParameter("customerIdentifier");
            String ticketNumber = request.getParameter("ticketNumber");
            String seatNumber = request.getParameter("seatNumber");
            double totalFare = Double.parseDouble(request.getParameter("totalFare"));
            String classType = request.getParameter("class");
            String flightNumber = request.getParameter("flightNumber");
            String fromAirport = request.getParameter("fromAirport");
            String toAirport = request.getParameter("toAirport");
            String departureDate = request.getParameter("departureDate");
            String departureTime = request.getParameter("departureTime");
            String passengerName = request.getParameter("passengerName"); 
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            boolean isEconomy = Boolean.parseBoolean(request.getParameter("isEconomy"));
            float changeCancelFee = Float.parseFloat(request.getParameter("changeCancelFee"));
            float bookingFee = Float.parseFloat(request.getParameter("bookingFee"));

            ResultSet rs = null;
            ApplicationDB db = new ApplicationDB();	
            Connection con = db.getConnection();

            try {
                
                String insertTicket = "INSERT INTO ticket (TicketNumber, seatNumber, total_fare, class, Passenger_Name, first_name, last_name, isEconomy, changeCancelFee, bookingFee, purchaseDateTime) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_DATE)";
                try (PreparedStatement pstmt = con.prepareStatement(insertTicket)) {
                	pstmt.setString(1, ticketNumber);
    			    pstmt.setString(2, seatNumber);
    			    pstmt.setDouble(3, totalFare);
    			    pstmt.setString(4, classType);
    			    pstmt.setString(5, passengerName);
    			    pstmt.setString(6, firstName);
    			    pstmt.setString(7, lastName);
    			    pstmt.setBoolean(8, isEconomy);
    			    pstmt.setFloat(9, changeCancelFee);
    			    pstmt.setFloat(10, bookingFee);
                    pstmt.executeUpdate();
                }

                String insertFlight = "INSERT INTO ticketflightassociatedwith (TicketNumber, flightNumber, fromAirport, toAirport, departureDate, departureTime) VALUES (?, ?, ?, ?, ?, ?)";
                try (PreparedStatement pstmt = con.prepareStatement(insertFlight)) {
                    pstmt.setString(1, ticketNumber);
                    pstmt.setString(2, flightNumber);
                    pstmt.setString(3, fromAirport);
                    pstmt.setString(4, toAirport);
                    pstmt.setString(5, departureDate);
                    pstmt.setString(6, departureTime);
                    pstmt.executeUpdate();
                }

                out.println("<h2>Flight Booking Confirmed</h2>");
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (con != null) try { con.close(); } catch (SQLException e) {}
            }
        }
    %>
</body>
</html>
