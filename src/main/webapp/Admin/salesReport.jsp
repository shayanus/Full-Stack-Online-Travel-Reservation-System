<%@ page import="java.sql.*" %>
<%@ page import="javax.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <!-- Jan 2023, Feb 2023  -->
    <title>Sales Report</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'" >Log out</button>
    <h1>Sales Report for a Specific Month</h1>

    <form action="" method="post">
        <label for="month">Select Month:</label>
        <select name="month" id="month">
            <% for (int i = 1; i <= 12; i++) { %>
                <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>

        <label for="year">Select Year:</label>
        <select name="year" id="year">
            <% for (int i = 2020; i <= 2025; i++) { %>
                <option value="<%= i %>"><%= i %></option>
            <% } %>
        </select>
        
        <input type="submit" value="Generate Report">
    </form>

    <%
        if ("post".equalsIgnoreCase(request.getMethod())) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
                ApplicationDB db = new ApplicationDB();
                conn = db.getConnection();            
                String sql = "SELECT SUM(t.total_fare) AS TotalSales, COUNT(t.TicketNumber) AS TotalTicketsSold FROM transactionAdmin tr JOIN ticketAdmin t ON tr.TicketNumber = t.TicketNumber WHERE MONTH(t.purchaseDateTime) = ? AND YEAR(t.purchaseDateTime) = ?";
                
                int desiredMonth = Integer.parseInt(request.getParameter("month"));
                int desiredYear = Integer.parseInt(request.getParameter("year"));
                
                pstmt = conn.prepareStatement(sql);
                pstmt.setInt(1, desiredMonth);
                pstmt.setInt(2, desiredYear);
                
                rs = pstmt.executeQuery();

                if (rs.next()) {
                    %>
                    <p>Total Sales: <%= rs.getDouble("TotalSales") %></p>
                    <p>Total Tickets Sold: <%= rs.getInt("TotalTicketsSold") %></p>
                    <%
                } else {
                    %>
                    <p>No data available for the selected month and year.</p>
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