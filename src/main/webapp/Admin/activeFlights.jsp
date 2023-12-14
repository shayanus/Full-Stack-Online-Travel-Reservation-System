<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Most Active Flights</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'">Log out</button>
    <h1>Most Active Flights (Most Tickets Sold)</h1>
    <% 
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            ApplicationDB db = new ApplicationDB();
            connection = db.getConnection();

            String sql = "SELECT tfa.flightNumber, COUNT(tfa.TicketNumber) AS TicketsSold FROM admintickets tfa JOIN ticketadmin t ON tfa.TicketNumber = t.TicketNumber GROUP BY tfa.flightNumber ORDER BY COUNT(tfa.TicketNumber) DESC";
            pstmt = connection.prepareStatement(sql);
            rs = pstmt.executeQuery();

            %>
            <table border="1">
                <tr>
                    <th>Flight Number</th>
                    <th>Tickets Sold</th>
                </tr>
            <%
            while (rs.next()) {
                %>
                <tr>
                    <td><%= rs.getString("flightNumber") %></td>
                    <td><%= rs.getInt("TicketsSold") %></td>
                </tr>
                <%
            }
            %>
            </table>
            <%
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
