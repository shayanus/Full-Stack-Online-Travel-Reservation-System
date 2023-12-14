<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Search</title>
</head>
<body>
		<button onclick="location.href='CustomerRepMainPage.jsp'"style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Rep Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    <h1>Search Flights for an Airport</h1>
    <form method="post">
        <label for="airportCode">Enter Airport Code:</label>
        <input type="text" id="airportCode" name="airportCode" required>
        <input type="submit" value="Search">
    </form>

    <%
        String airportCode = request.getParameter("airportCode");
        if (airportCode != null && !airportCode.trim().isEmpty()) {
            PreparedStatement pstmt = null;
            ResultSet rs = null;
            ApplicationDB db = new ApplicationDB();	
        	Connection con = db.getConnection();	
        	Statement stmt = con.createStatement();

            try {
                
               	String queryDeparting = "SELECT * FROM FlightServices WHERE origin_airport = ? OR destination_airport = ?";
				pstmt = con.prepareStatement(queryDeparting);
				pstmt.setString(1, airportCode);
				pstmt.setString(2, airportCode);


                out.println("<h2>Departing Flights:</h2>");
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    out.println("<p>" + rs.getString("flightNumber") + " - " + rs.getString("origin_airport") + " to " + rs.getString("destination_airport") + "</p>");
                }

                String queryArriving = "SELECT * FROM flightservices fs JOIN departurearrival da ON fs.flightNumber = da.flightNumber WHERE da.ArrivalThreeLetterID = ?";
                pstmt = con.prepareStatement(queryArriving);
                pstmt.setString(1, airportCode);

                out.println("<h2>Arriving Flights:</h2>");
                rs = pstmt.executeQuery();
                while (rs.next()) {
                    out.println("<p>" + rs.getString("flightNumber") + " - " + rs.getString("origin_airport") + " to " + rs.getString("destination_airport") + "</p>");
                }
            } catch (Exception e) {
                out.println("Error: " + e.getMessage());
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) {}
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) {}
                if (con != null) try { con.close(); } catch (SQLException e) {}
            }
        }
    %>
</body>
</html>