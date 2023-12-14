<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Revenue Summary</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'" >Log out</button>
    <h1>Revenue Summary</h1>
    <form action="revenueSummary.jsp" method="post">
        <label for="searchType">Search By:</label>
        <select name="searchType" id="searchType">
            <option value="flight">Flight Number</option>
            <option value="airline">Airline ID</option>
            <option value="customer">Customer ID</option>
        </select>
        <input type="text" name="searchQuery" required>
        <input type="submit" value="Search">
    </form>

    <%
        String searchType = request.getParameter("searchType");
        String searchQuery = request.getParameter("searchQuery");
        if (searchType != null && searchQuery != null) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                ApplicationDB db = new ApplicationDB();
                conn = db.getConnection();

                String sql = "";
                if ("flight".equals(searchType)) {
                    sql = "SELECT SUM(totalFare) AS TotalRevenue FROM reservations WHERE flightNumber = ?";
                } else if ("airline".equals(searchType)) {
                    sql = "SELECT SUM(totalFare) AS TotalRevenue FROM reservations JOIN flightservices ON reservations.flightNumber = flightservices.flightNumber WHERE flightservices.airline = ?";
                } else if ("customer".equals(searchType)) {
                    sql = "SELECT SUM(totalFare) AS TotalRevenue FROM reservations WHERE customerID = ?";
                }

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, searchQuery);
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    %>
                    <p>Total Revenue: <%= rs.getDouble("TotalRevenue") %></p>
                    <%
                } else {
                    %>
                    <p>No data available for the selected criteria.</p>
                    <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            } finally {
                if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if (conn != null) try { conn.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
</body>
</html>