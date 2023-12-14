<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservations List</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'"style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    <h1>Search Reservations</h1>
    <form action="reservationList.jsp" method="post">
        <label for="searchType">Search By:</label>
        <select name="searchType" id="searchType">
            <option value="flightNumber">Flight Number</option>
            <option value="customerName">Customer Name</option>
        </select>
        <input type="text" name="searchQuery" required>
        <input type="submit" value="Search">
    </form>

    <%
        if(request.getParameter("searchQuery") != null) {
            String searchType = request.getParameter("searchType");
            String searchQuery = request.getParameter("searchQuery");
            Connection conn = null;
            PreparedStatement pstmt = null;
            ResultSet rs = null;

            try {
    			ApplicationDB db = new ApplicationDB();
                conn = db.getConnection();     
                String sql = "";
                if("flightNumber".equals(searchType)) {
                    sql = "SELECT * FROM reservations WHERE flightNumber = ?";
                } else if("customerName".equals(searchType)) {
                    sql = "SELECT * FROM reservations WHERE customerName = ?";
                }

                pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, searchQuery);
                rs = pstmt.executeQuery();

                %><table border="1"><%
                    while(rs.next()) {
                        %><tr><%
                            %><td><%= rs.getString("reservationId") %></td><%
                            %><td><%= rs.getString("flightNumber") %></td><%
                            %><td><%= rs.getString("customerName") %></td><%
                        %></tr><%
                    }
                %></table><%
            } catch(Exception e) {
                e.printStackTrace();
            } finally {
                try { if (rs != null) rs.close(); } catch (Exception e) {};
                try { if (pstmt != null) pstmt.close(); } catch (Exception e) {};
                try { if (conn != null) conn.close(); } catch (Exception e) {};
            }
        }
    %>
</body>
</html>

<!-- INSERT INTO reservations (flightNumber, customerID, customerName, reservationDate, class, status, seatNumber, totalFare, bookingDate) VALUES
('F001', 'Customer1', 'John Doe', '2023-12-15', 'Economy', 'Confirmed', '12A', 300.00, '2023-11-01 10:30:00'),
('F001', 'Customer12', 'Jane Smith', '2023-12-15', 'Business', 'Confirmed', '1B', 600.00, '2023-11-02 11:00:00'),
('F002', 'Customer1', 'John Doe', '2023-12-18', 'Economy', 'Cancelled', '14C', 200.00, '2023-11-05 09:15:00'),
('F002', 'Customer12', 'Jane Smith', '2023-12-18', 'Business', 'Confirmed', '2D', 400.00, '2023-11-06 08:45:00'); -->