<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Booking</title>
</head>
<body>
    <button onclick="location.href='UserMainPage.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>

    <%
        String action = request.getParameter("action");

        if ("book".equals(action)) {
            // Processing form submission
            // ... existing code for processing form ...
            
            //String ticketNumber = request.getParameter("ticketNumber");
            String seatNumber = request.getParameter("seatNumber");
            double totalFare = 20.5;
            String classType = request.getParameter("classType");
            //String bookingFee = request.getParameter("bookingFee");
            //String passengerName = request.getParameter("passengerName");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            //boolean isEconomy = Boolean.parseBoolean(request.getParameter("isEconomy"));
            //float changeCancelFee = Float.parseFloat(request.getParameter("changeCancelFee"));
            String flightNumber = request.getParameter("flightNumber");
            String fromAirport = request.getParameter("fromAirport");
            String toAirport = request.getParameter("toAirport");
            String departureDate = request.getParameter("departureDate");
            //String departureTime = request.getParameter("departureTime");

            ApplicationDB db = new ApplicationDB();  
            Connection con = db.getConnection();
            ResultSet rs = null;
            boolean isFlightFull = false;
            int ticketNumber = -1;
            ResultSet generatedKeys = null;

            try {
                String insertTicket = "INSERT INTO ticket VALUES (NULL, NULL, ?, CURRENT_TIMESTAMP, ?, ?, ?)";
                PreparedStatement pstmt = con.prepareStatement(insertTicket, Statement.RETURN_GENERATED_KEYS);

                pstmt.setDouble(1, totalFare);
                pstmt.setString(2, firstName);
                pstmt.setString(3, lastName);
                pstmt.setString(4, classType);
                pstmt.executeUpdate();
    
                String checkFlight = "SELECT is_full FROM flightservices WHERE flightNumber = ?";
                pstmt = con.prepareStatement(checkFlight);
                pstmt.setString(1, flightNumber);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    isFlightFull = rs.getBoolean("is_full");
                }

                String lastInsertIdQuery = "SELECT LAST_INSERT_ID()";
                pstmt = con.prepareStatement(lastInsertIdQuery);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    ticketNumber = rs.getInt(1);
                }

                if (!isFlightFull) {
                    String insertFlight = "INSERT INTO ticketflightassociatedwith VALUES (?, ?, ?, ?, ?)";
                    pstmt = con.prepareStatement(insertFlight);
                    pstmt.setInt(1, ticketNumber);
                    pstmt.setString(2, flightNumber);
                    pstmt.setString(3, fromAirport);
                    pstmt.setString(4, toAirport);
                    pstmt.setString(5, departureDate);
                    pstmt.executeUpdate();

                    out.println("<h2>Flight Booking Confirmed, ticket number is " + ticketNumber + "</h2>");
                } else {
                    String insertWaitingList = "INSERT INTO waitinglist (accountID, TicketNumber) VALUES (?, ?)";
                    pstmt = con.prepareStatement(insertWaitingList);
                    pstmt.setString(1, "Customer1"); // Replace with actual account ID
                    //pstmt.setString(2, ticketNumber);
                    pstmt.executeUpdate();
                    out.println("<h2>There are currently no available seats for this flight. \nYou have been added to waiting list, and will be notified if there are any changes.</h2>");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage() + "\n\n" + generatedKeys);
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (con != null) try { con.close(); } catch (SQLException e) {}
            }
        } else {
            // Retrieve hidden data from the search result page
            String flightNumber = request.getParameter("flightNumber");
            String originAirport = request.getParameter("origin_airport");
            String destinationAirport = request.getParameter("destination_airport");
            String departure_date = request.getParameter("departure_date");
            // Display the form

            flightNumber = (flightNumber != null) ? flightNumber : "";
            originAirport = (originAirport != null) ? originAirport : "";
            destinationAirport = (destinationAirport != null) ? destinationAirport : "";

    %>
        <form method="post">
            <input type="hidden" name="action" value="book">

            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName"><br>
        
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName"><br>
            
            <label for="flightNumber">Flight Number:</label>
            <input type="text" id="flightNumber" name="flightNumber" value="<%= flightNumber %>"><br>
        
            <label for="origin_airport">Origin Airport:</label>
            <input type="text" id="origin_airport" name="origin_airport" value="<%= originAirport %>"><br>

            <label for="destination_airport">Destination Airport:</label>
            <input type="text" id="destination_airport" name="destination_airport" value="<%= destinationAirport %>"><br>

            <label for="departure_date">Departure Date:</label>
            <input type="date" id="departure_date" name="departure_date" value="<%= departure_date %>"><br>


            <!-- Add other necessary fields for user to fill -->
            <!-- Example: dropdown for class selection -->
            <label for="classType">Class Type:</label>
            <select id="classType" name="classType">
                <option value="economy">Economy</option>
                <option value="business">Business</option>
                <option value="firstClass">First Class</option>
            </select><br>

            <!-- You can add more fields here if necessary -->
        
            <input type="submit" value="Book Flight">
        </form>
    <%
        }
    %>
</body>
</html>
