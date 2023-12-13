<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Flight Booking</title>
</head>
<body>
    <button onclick="location.href='UserMainPage.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>

    <%
        String action = request.getParameter("action");
        if ("book".equals(action)) {
            // Processing form submission
            // ... existing code for processing form ...
        } else {
            // Retrieve hidden data from the search result page
            String flightNumber = request.getParameter("flightNumber");
            String originAirport = request.getParameter("origin_airport");
            String destinationAirport = request.getParameter("destination_airport");
            String departure_date = request.getParameter("departure_date");
            // Display the form
    %>
        <form method="post">
            <input type="hidden" name="action" value="book">

            <label for="firstName">First Name:</label>
            <input type="text" id="firstName" name="firstName"><br>
        
            <label for="lastName">Last Name:</label>
            <input type="text" id="lastName" name="lastName"><br>
            
            <label for="flightNumber">Flight Number:</label>
            <input type="text" id="flightNumber" name="flightNumber" value="<%= flightNumber %>"><br>
        
            <label for="origin_airport">Origin Airport:</label>
            <input type="text" id="origin_airport" name="origin_airport" value="<%= originAirport %>"><br>

            <label for="destination_airport">Destination Airport:</label>
            <input type="text" id="destination_airport" name="destination_airport" value="<%= destinationAirport %>"><br>

            <label for="departure_date">Departure Date:</label>
            <input type="text" id="departure_date" name="departure_date" value="<%= departure_date %>"><br>


            <!-- Add other necessary fields for user to fill -->
            <!-- Example: dropdown for class selection -->
            <label for="classType">Class Type:</label>
            <select id="classType" name="classType">
                <option value="economy">Economy</option>
                <option value="business">Business</option>
                <option value="firstClass">First Class</option>
            </select><br>

            <!-- You can add more fields here if necessary -->
        
            <input type="submit" value="Book Flight">
        </form>
    <%
        }
    %>
</body>
</html>
