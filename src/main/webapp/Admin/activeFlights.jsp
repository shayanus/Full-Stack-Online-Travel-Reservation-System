<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*" %>
<!DOCTYPE html>
<html>
<head>
    <title>Most Active Flights</title>
</head>
<body>
		<button onclick="location.href='AdminMainPage.jsp'"style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Admin Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    <h1>Most Active Flights (Most Tickets Sold)</h1>
    <% 
        Connection connection = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            ApplicationDB db = new ApplicationDB();
            connection = db.getConnection();

            String sql = "SELECT tfa.flightNumber, COUNT(tfa.TicketNumber) AS TicketsSold FROM ticketflightassociatedwithAdmin tfa JOIN ticketAdmin t ON tfa.TicketNumber = t.TicketNumber GROUP BY tfa.flightNumber ORDER BY COUNT(tfa.TicketNumber) DESC";
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

<!-- -- Inserts for F100
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1010', 300, '2023-01-01 10:00:00', 'John Doe', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1011', 300, '2023-01-02 10:00:00', 'Jane Doe', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1012', 300, '2023-01-03 10:00:00', 'Jim Beam', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1013', 300, '2023-01-04 10:00:00', 'Jill Hill', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1014', 300, '2023-01-05 10:00:00', 'Jack Black', 'Economy');

-- Inserts for F101
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1015', 350, '2023-01-06 10:00:00', 'Sam Smith', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1016', 350, '2023-01-07 10:00:00', 'Sara Stone', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1017', 350, '2023-01-08 10:00:00', 'Sue Sand', 'Economy');

-- Inserts for F102
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1018', 320, '2023-01-09 10:00:00', 'Mike Mountain', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1019', 320, '2023-01-10 10:00:00', 'Molly Mole', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1020', 320, '2023-01-11 10:00:00', 'Marge Major', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1021', 320, '2023-01-12 10:00:00', 'Matt Minor', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1022', 320, '2023-01-13 10:00:00', 'Martha Mars', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1023', 320, '2023-01-14 10:00:00', 'Martin Moon', 'Economy');
INSERT INTO ticketAdmin (TicketNumber, total_fare, purchaseDateTime, Passenger_Name, class) VALUES ('T1024', 320, '2023-01-15 10:00:00', 'Megan Meteor', 'Economy');
 -->
 
<!--  -- Flight F100 associations
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1010', 'F100');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1011', 'F100');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1012', 'F100');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1013', 'F100');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1014', 'F100');

-- Flight F101 associations
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1015', 'F101');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1016', 'F101');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1017', 'F101');

-- Flight F102 associations
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1018', 'F102');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1019', 'F102');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1020', 'F102');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1021', 'F102');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1022', 'F102');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1023', 'F102');
INSERT INTO ticketflightassociatedwithAdmin (TicketNumber, flightNumber) VALUES ('T1024', 'F102'); -->
 
 
 