<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Upcoming Flight Reservations</title>
</head>
<body>

	<button onclick="location.href='UserPortal.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    <h1>Upcoming Flight Reservations</h1>
    <%
    PreparedStatement pstmt = null;
    ResultSet rs = null;
    ApplicationDB db = new ApplicationDB();	
	Connection con = db.getConnection();

        try {

            String query = "SELECT t.TicketNumber, t.seatNumber, t.total_fare, t.class, tfa.flightNumber, tfa.fromAirport, tfa.toAirport, tfa.departureDate, tfa.departureTime FROM ticket t JOIN admintickets tfa ON t.TicketNumber = tfa.TicketNumber WHERE tfa.departureDate >= CURRENT_DATE";
            pstmt = con.prepareStatement(query);

            rs = pstmt.executeQuery();
            %>
            <table border="1">
                <tr>
                    <th>Ticket Number</th>
                    <th>Seat Number</th>
                    <th>Total Fare</th>
                    <th>Class</th>
                    <th>Flight Number</th>
                    <th>From Airport</th>
                    <th>To Airport</th>
                    <th>Departure Date</th>
                    <th>Departure Time</th>
                </tr>
            <%
            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("TicketNumber") %></td>
                    <td><%= rs.getString("seatNumber") %></td>
                    <td><%= rs.getDouble("total_fare") %></td>
                    <td><%= rs.getString("class") %></td>
                    <td><%= rs.getString("flightNumber") %></td>
                    <td><%= rs.getString("fromAirport") %></td>
                    <td><%= rs.getString("toAirport") %></td>
                    <td><%= rs.getDate("departureDate") %></td>
                    <td><%= rs.getTime("departureTime") %></td>
                </tr>
                <%
            }
            %>
            </table>
            <%
        } catch (Exception e) {
            out.println("Error: " + e.getMessage());
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) {}
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
            if (con != null) try { con.close(); } catch (SQLException e) {}
        }
    %>
</body>
</html>