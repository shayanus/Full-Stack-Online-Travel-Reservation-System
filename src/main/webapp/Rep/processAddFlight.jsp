<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.cs336.pkg.ApplicationDB,java.text.SimpleDateFormat,java.util.Date,java.text.ParseException"%>
<!DOCTYPE html>
<html>
<head>
    <title>Process Add Flight - Flight Reservation System</title>
</head>

<body>
	<button onclick="location.href='CustomerRepMainPage.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Customer Rep Main Page</button>
    <%@ page import="java.io.*,java.util.*"%>
    <%@ page import="javax.servlet.*,javax.servlet.http.*"%>

    <%
        // Retrieve parameters from the form
        String flightNumber = request.getParameter("flightNumber");
        String aircraftID = request.getParameter("AircraftID");
        String originAirport = request.getParameter("originAirport");
        String destinationAirport = request.getParameter("destinationAirport");
        String economyFare = request.getParameter("economyFare");
        String businessFare = request.getParameter("businessFare");
        String firstClassFare = request.getParameter("firstClassFare");
        String airline = request.getParameter("airline");
        String numStops = request.getParameter("numStops");
        String flightType = request.getParameter("flightType");
        String departureDate = request.getParameter("departureDate");
        String departureTimes = request.getParameter("departureTimes");
        String arrivalDate = request.getParameter("arrivalDate");
        String arrivalTimes = request.getParameter("arrivalTimes");

        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();
            Statement statement = connection.createStatement();

            // Check if Flight Number already exists
            ResultSet rs = statement.executeQuery("SELECT * FROM flightservices WHERE flightNumber='" + flightNumber + "'");

            if (rs.next()) {
                // Flight Number already exists
    %>
                <p>Flight Number exists, please <a href='addFlight.jsp'>try again</a>.</p>
    <%
            } else {
                // Flight Number doesn't exist, add to the table
                // Calculate duration (assuming departureTimes and arrivalTimes are in the format "HH:mm:ss")
                SimpleDateFormat format = new SimpleDateFormat("HH:mm:ss");
                Date departureTime = format.parse(departureTimes);
                Date arrivalTime = format.parse(arrivalTimes);
                long durationMillis = arrivalTime.getTime() - departureTime.getTime();
                Time duration = new Time(durationMillis);

                // Modify the query to include other columns and their values
                int x = statement.executeUpdate("INSERT INTO flightservices(flightNumber, AircraftID, origin_airport, destination_airport, " +
                        "economy_fare, business_fare, first_class_fare, airline, number_of_stops, flight_type, " +
                        "departure_date, departure_times, arrival_date, arrival_times, duration) " +
                        "VALUES('" + flightNumber + "', '" + aircraftID + "', '" + originAirport + "', '" + destinationAirport + "', " +
                        "'" + economyFare + "', '" + businessFare + "', '" + firstClassFare + "', '" + airline + "', " +
                        "'" + numStops + "', '" + flightType + "', '" + departureDate + "', '" + departureTimes + "', " +
                        "'" + arrivalDate + "', '" + arrivalTimes + "', '" + duration + "')");
    %>
                <p>Flight Added</p>
    <%
            }
        } catch (SQLException | ParseException e) {
            e.printStackTrace();
    %>
            <p>An error occurred while processing your request. Please <a href='addFlight.jsp'>try again</a> later.</p>
    <%
        }
    %>
</body>
</html>
