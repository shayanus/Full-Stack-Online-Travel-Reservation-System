<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Representative Dashboard - Flight Reservation System</title>
    
</head>
<body>
    <div class="header">
        <h1>Representative Dashboard</h1>
    </div>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    <div class="container">
        <div class="functionality-block">
            <h2>Reservation Management</h2>
            <ul>
                <li><a href="makeCustomerReservation.jsp">Make Flight Reservation</a></li>
                <li><a href="editCustomerReservation.jsp">Edit Flight Reservation</a></li>
                <li><a href="replytofaq.jsp">Reply to User Questions</a></li>
            </ul>
        </div>
        
        <div class="functionality-block">
            <h2>Aircraft & Flight Management</h2>
            <ul>
                <li><a href="addAircraft.jsp">Add Aircraft</a></li>
                <li><a href="editAircraft.jsp">Edit Aircraft</a></li>
                <li><a href="deleteAircraft.jsp">Delete Aircraft</a></li>
                <li><a href="CustomerRepEditAirport.jsp">Add/Edit/Delete Airport</a></li>
                <li><a href="addFlight.jsp">Add Flight</a></li>
                <li><a href="editFlight.jsp">Edit Flight</a></li>
                <li><a href="deleteFlight.jsp">Delete Flight</a></li>
            </ul>
        </div>
        
        <div class="functionality-block">
            <h2>Reporting & Lists</h2>
            <ul>
                <li><a href="CustomerRepWaitList.jsp">Passengers on Waiting List</a></li>
                <li><a href="CustomerRepFlightsList.jsp">Flights by Airport</a></li>
            </ul>
        </div>
        
        <!-- Additional functionality blocks can be added here -->
    </div>
</body>
</html>