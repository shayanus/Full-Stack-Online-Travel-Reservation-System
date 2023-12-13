<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard - Flight Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
        }
        .header {
            background-color: #333;
            color: white;
            padding: 20px;
            text-align: center;
        }
        .container {
            padding: 20px;
        }
        .admin-option {
            background-color: white;
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: box-shadow 0.3s ease-in-out;
        }
        .admin-option:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .admin-option a {
            text-decoration: none;
            color: #0056b3;
            font-weight: bold;
        }
        .admin-option ul {
            list-style-type: none;
            padding: 0;
        }
        .admin-option li {
            padding: 5px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Admin Dashboard</h1>
    </div>
    <button onclick="location.href='Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
    
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
        
        <!-- More admin options can be added here -->
    </div>
</body>
</html>
