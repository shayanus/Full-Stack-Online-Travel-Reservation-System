<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Booking</title>
</head>
<body>
    <button onclick="location.href='UserPortal.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button><br>

    <%
        String action = request.getParameter("action");
        Object accountIDObj = session.getAttribute("user");
        String accountID = (accountIDObj != null) ? accountIDObj.toString() : null;
        if (accountID == null) { 
            out.println("\nYou have been logged out due to inactivity, please log in again"); %>
            <button onclick="location.href='../login.jsp'">Log In</button>
    <%
        
        }

        if ("book".equals(action)) {
            
            String seatNumber = request.getParameter("seatNumber");
            double totalFare = 50.0;
            String classType = request.getParameter("classType");
            String classTypeParsed = classType.equalsIgnoreCase("economy") ? "Economy" : classType.equalsIgnoreCase("business") ? "Business" : classType.equalsIgnoreCase("first_class") ? "First" : classType;
            
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            
            String flightNumber = request.getParameter("flightNumber");
            String fromAirport = request.getParameter("fromAirport");
            String toAirport = request.getParameter("toAirport");
            String departureDate = request.getParameter("departureDate");

            ApplicationDB db = new ApplicationDB();  
            Connection con = db.getConnection();
            ResultSet rs = null;
            boolean isFlightFull = false;
            int ticketNumber = -1;
            ResultSet generatedKeys = null;


            try {

                String fareQuery = "SELECT " + classType + "_fare FROM travelsystem.flightservices WHERE fromAirport = ? AND toAirport = ? AND flightNumber = ? AND departureDate = ?";
                PreparedStatement pstmt = con.prepareStatement(fareQuery, Statement.RETURN_GENERATED_KEYS);

                pstmt.setString(1, fromAirport);
                pstmt.setString(2, toAirport);
                pstmt.setString(3, flightNumber);
                pstmt.setString(4, departureDate);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    totalFare = rs.getInt(1);
                }

                String insertTicket = "INSERT INTO ticket VALUES (NULL, NULL, ?, CURRENT_TIMESTAMP, ?, ?, ?)";
                pstmt = con.prepareStatement(insertTicket, Statement.RETURN_GENERATED_KEYS);
                pstmt.setDouble(1, totalFare);
                pstmt.setString(2, firstName);
                pstmt.setString(3, lastName);
                pstmt.setString(4, classTypeParsed);
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

                    out.println("<h2>Flight Booking Confirmed, ticket number is " + ticketNumber + " and the fare is $" + totalFare + "</h2>");
                } else {
                    String insertWaitingList = "INSERT INTO waitinglist (accountID, TicketNumber) VALUES (?, ?)";
                    pstmt = con.prepareStatement(insertWaitingList);
                    pstmt.setString(1, "Acc001"); 
                    pstmt.setInt(2, ticketNumber); 
                    pstmt.executeUpdate();
                    out.println("<h2>There are currently no available seats for this flight. \nYou have been added to waiting list, and will be notified if there are any changes. \n Your waiting list ticket number is " + ticketNumber + "</h2>");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage() + "\n\n" + generatedKeys + "\n\n" + totalFare + "classTypeParsed");
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (con != null) try { con.close(); } catch (SQLException e) {}
            }
        } else {
            String flightNumber = request.getParameter("flightNumber");
            String originAirport = request.getParameter("fromAirport");
            String destinationAirport = request.getParameter("toAirport");
            String departureDate = request.getParameter("departureDate");

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
        
            <label for="fromAirport">Origin Airport:</label>
            <input type="text" id="fromAirport" name="fromAirport" value="<%= originAirport %>"><br>

            <label for="toAirport">Destination Airport:</label>
            <input type="text" id="toAirport" name="toAirport" value="<%= destinationAirport %>"><br>

            <label for="departureDate">Departure Date:</label>
            <input type="date" id="departureDate" name="departureDate" value="<%= departureDate %>"><br>


            <!-- Add other necessary fields for user to fill -->
            <!-- Example: dropdown for class selection -->
            <label for="classType">Class Type:</label>
            <select id="classType" name="classType">
                <option value="economy">Economy</option>
                <option value="business">Business</option>
                <option value="first_class">First Class</option>
            </select><br>

            <!-- You can add more fields here if necessary -->
        
            <input type="submit" value="Book Flight">
        </form>
    <%
        }
    %>
</body>
</html>
