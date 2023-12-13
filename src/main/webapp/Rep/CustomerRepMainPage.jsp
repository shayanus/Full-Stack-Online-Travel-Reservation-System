<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Customer Representative Dashboard - Flight Reservation System</title>
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
        .functionality-block {
            background-color: white;
            border: 1px solid #ddd;
            padding: 15px;
            margin-bottom: 10px;
            border-radius: 4px;
            box-shadow: 0 2px 4px rgba(0,0,0,0.1);
            transition: box-shadow 0.3s ease-in-out;
        }
        .functionality-block:hover {
            box-shadow: 0 5px 15px rgba(0,0,0,0.2);
        }
        .functionality-block a {
            text-decoration: none;
            color: #0056b3;
            font-weight: bold;
        }
        .functionality-block ul {
            list-style-type: none;
            padding: 0;
        }
        .functionality-block li {
            padding: 5px 0;
        }
    </style>
</head>
<body>
    <div class="header">
        <h1>Customer Representative Dashboard</h1>
    </div>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    
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
                <li><a href="waitingList.jsp">Passengers on Waiting List</a></li>
                <li><a href="CustomerRepFlightsList.jsp">Flights by Airport</a></li>
            </ul>
        </div>
        
        <!-- Additional functionality blocks can be added here -->
    </div>
</body>
</html>