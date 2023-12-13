<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Waiting List</title>
    
</head>
<body>
        <button onclick="location.href='CustomerRepMainPage.jsp'"style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Rep Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
 
    <h1>Flight Waiting List</h1>
    <table>
        <tr>
            <th>Account ID</th>
            <th>Ticket Number</th>
        </tr>

        <%
            ApplicationDB db = new ApplicationDB();  
            try (Connection con = db.getConnection();
                 PreparedStatement pstmt = con.prepareStatement("SELECT * FROM waitinglist");
                 ResultSet rs = pstmt.executeQuery()) {

                while (rs.next()) {
                    String accountId = rs.getString("accountID");
                    String ticketNumber = rs.getString("TicketNumber");

                    out.println("<tr>");
                    out.println("<td>" + accountId + "</td>");
                    out.println("<td>" + ticketNumber + "</td>");
                    out.println("</tr>");
                }

            } catch (SQLException e) {
                out.println("Database error: " + e.getMessage());
            }
        %>
    </table>
</body>
</html>