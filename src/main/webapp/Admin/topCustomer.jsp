<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Top Revenue Generating Customer</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'"style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    <h1>Customer Generating Most Revenue</h1>
    <% 
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            ApplicationDB db = new ApplicationDB();
            connection = db.getConnection();

            String sql = "SELECT customerID, SUM(totalFare) AS TotalRevenue FROM reservations GROUP BY customerID ORDER BY SUM(totalFare) DESC LIMIT 1";
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();

            if (rs.next()) {
                %>
                <p>Top Customer: <%= rs.getString("customerID") %></p>
                <p>Total Revenue: <%= rs.getDouble("TotalRevenue") %></p>
                <%
            } else {
                %>
                <p>No data available.</p>
                <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            if (rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (pstmt != null) try { pstmt.close(); } catch (SQLException e) { e.printStackTrace(); }
            if (connection != null) try { connection.close(); } catch (SQLException e) { e.printStackTrace(); }
        }
    %>
</body>
</html>

