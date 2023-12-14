<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Flight Reservation System</title>
    
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    
    <div class="container">
        <div class="admin-option">
            <h2>Customer Management</h2>
            <ul>
                <li><a href="addCustomer.jsp">Add Customer</a></li>
                <li><a href="editCustomer.jsp">Edit Customer</a></li>
                <li><a href="deleteCustomer.jsp">Delete Customer</a></li>
                
                <!-- Add/Edit/Delete Customer Representative Buttons -->
                <li><a href="addCustomerRep.jsp">Add Customer Representative</a></li>
                <li><a href="editCustomerRep.jsp">Edit Customer Representative</a></li>
                <li><a href="deleteCustomerRep.jsp">Delete Customer Representative</a></li>
                <!-- End of Customer Representative Buttons -->
            </ul>
        </div>
        
        <div class="admin-option">
            <h2>Reporting</h2>
            <ul>
                <li><a href="salesReport.jsp">Sales Report</a></li>
                <li><a href="reservationList.jsp">Reservation List</a></li>
                <li><a href="revenueSummary.jsp">Revenue Summary</a></li>
                <li><a href="topCustomer.jsp">Top Customer by Revenue</a></li>
                <li><a href="activeFlights.jsp">Most Active Flights</a></li>
            </ul>
        </div>
        
    </div>
</body>
</html>
