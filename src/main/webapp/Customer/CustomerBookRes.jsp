<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Booking</title>
    
</head>
<body>
        <button onclick="location.href='CustomerMainPage.jsp'">Back to Customer Main Page</button>
        <button onclick="location.href='../Logout.jsp'" >Log out</button>
 
    <div>
        <h1>Book Your Flight</h1>
        <form action="../Logout.jsp" method="post">
            <input type="submit" value="Logout"/>
        </form>
    </div>

    <form method="post">
        <input type="hidden" name="action" value="book">
        <label for="ticketNumber">Ticket Number:</label>
        <input type="text" id="ticketNumber" name="ticketNumber" required><br>
        <label for="seatNumber">Seat Number:</label>
        <input type="text" id="seatNumber" name="seatNumber" required><br>
        <label for="totalFare">Total Fare:</label>
        <input type="number" id="totalFare" name="totalFare" required><br>
        <label for="class">Class:</label>
        <input type="text" id="class" name="class" required><br>
        <label for="bookingFee">Booking Fee:</label>
        <input type="number" id="bookingFee" name="bookingFee"><br>
        <label for="passengerName">Passenger Name:</label>
        <input type="text" id="passengerName" name="passengerName"><br>
        <label for="firstName">First Name:</label>
        <input type="text" id="firstName" name="firstName"><br>
        <label for="lastName">Last Name:</label>
        <input type="text" id="lastName" name="lastName"><br>
        <label for="isEconomy">Is Economy (true/false):</label>
        <input type="text" id="isEconomy" name="isEconomy"><br>
        <label for="changeCancelFee">Change/Cancel Fee:</label>
        <input type="number" id="changeCancelFee" name="changeCancelFee"><br>
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

    <%
        String action = request.getParameter("action");
        if ("book".equals(action)) {
            String ticketNumber = request.getParameter("ticketNumber");
            String seatNumber = request.getParameter("seatNumber");
            double totalFare = Double.parseDouble(request.getParameter("totalFare"));
            String classType = request.getParameter("class");
            String bookingFee = request.getParameter("bookingFee");
            String passengerName = request.getParameter("passengerName");
            String firstName = request.getParameter("firstName");
            String lastName = request.getParameter("lastName");
            boolean isEconomy = Boolean.parseBoolean(request.getParameter("isEconomy"));
            float changeCancelFee = Float.parseFloat(request.getParameter("changeCancelFee"));
            String flightNumber = request.getParameter("flightNumber");
            String fromAirport = request.getParameter("fromAirport");
            String toAirport = request.getParameter("toAirport");
            String departureDate = request.getParameter("departureDate");
            String departureTime = request.getParameter("departureTime");

            ApplicationDB db = new ApplicationDB();  
            Connection con = db.getConnection();
            ResultSet rs = null;
            boolean isFlightFull = false;

            try {
                String insertTicket = "INSERT INTO ticket VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, CURRENT_DATE)";
                PreparedStatement pstmt = con.prepareStatement(insertTicket);
                pstmt.setString(1, ticketNumber);
                pstmt.setString(2, seatNumber);
                pstmt.setDouble(3, totalFare);
                
                pstmt.setString(4, firstName);
                pstmt.setString(5, lastName);
               
                pstmt.executeUpdate();

                String checkFlight = "SELECT is_full FROM flightservices WHERE flightNumber = ?";
                pstmt = con.prepareStatement(checkFlight);
                pstmt.setString(1, flightNumber);
                rs = pstmt.executeQuery();
                if (rs.next()) {
                    isFlightFull = rs.getBoolean("is_full");
                }

                if (!isFlightFull) {
                    String insertFlight = "INSERT INTO ticketflightassociatedwith (TicketNumber, flightNumber, fromAirport, toAirport, departureDate, departureTime) VALUES (?, ?, ?, ?, ?, ?)";
                    pstmt = con.prepareStatement(insertFlight);
                    pstmt.setString(1, ticketNumber);
                    pstmt.setString(2, flightNumber);
                    pstmt.setString(3, fromAirport);
                    pstmt.setString(4, toAirport);
                    pstmt.setString(5, departureDate);
                    pstmt.setString(6, departureTime);
                    pstmt.executeUpdate();

                    out.println("<h2>Flight Booking Confirmed</h2>");
                } else {
                    String insertWaitingList = "INSERT INTO waitinglist (accountID, TicketNumber) VALUES (?, ?)";
                    pstmt = con.prepareStatement(insertWaitingList);
                    pstmt.setString(1, "Customer1"); 
                    pstmt.setString(2, ticketNumber);
                    pstmt.executeUpdate();
                    out.println("<h2>Flight is full. Added to waiting list.</h2>");
                }
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
