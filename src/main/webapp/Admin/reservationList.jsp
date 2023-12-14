<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>

<!DOCTYPE html>
<html>
<head>
    <title>Reservations List</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'">Log out</button>
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
