<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Flights - Flight Reservation System</title>

</head>

<body>
    <button onclick="location.href='UserPortal.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    <h2>Search Flights</h2>

    <form method="post" action="FlightSearchServlet.jsp">
        <label for="startAirport">Start Airport:</label>
        <input type="text" id="startAirport" name="startAirport" required>
		<br>
        <label for="endAirport">End Airport:</label>
        <input type="text" id="endAirport" name="endAirport" required>
		<br>
		<br>
		<label>
                <input type="radio" name="flightType" value="oneWay" checked> One Way
        </label>
        <label>
                <input type="radio" name="flightType" value="roundTrip"> Round Trip
        </label>
		<br>
		<br>
        <label for="departureDate">Departure Date:</label>
        <input type="date" id="departureDate" name="departureDate" required>
		<br>
        <div id="returnDateDiv" style="display: none;">
            <label for="returnDate">Return Date:</label>
            <input type="date" id="returnDate" name="returnDate">
        </div>
        <br>
    	<label for="isFlexible">Flexible Dates:</label>
    	<input type="checkbox" id="isFlexible" name="isFlexible">
		
	<h2>Sorting Options</h2>

		<input type="radio" name="sortOption" value="none" checked> None

		<fieldset>
			<legend>Sort by Pricing:</legend>

			<input type="radio" id="sortedByEconomy" name="sortOption" value="sortedByEconomy">
			<label for="sortedByEconomy">Economy Price</label>

			<input type="radio" id="sortedByBusiness" name="sortOption" value="sortedByBusiness">
			<label for="sortedByBusiness">Business Price</label>

			<input type="radio" id="sortedByFirstClass" name="sortOption" value="sortedByFirstClass">
			<label for="sortedByFirstClass">First Class Price</label>

		</fieldset>
	
			<input type="radio" id="sortedByDuration" name="sortOption" value="sortedByDuration">
			<label for="sortedByDuration">Sort by Duration</label>
		<br>
			<input type="radio" id="sortedByTakeoff" name="sortOption" value="sortedByTakeoff">
			<label for="sortedByTakeoff">Sort by Takeoff Time</label>
		<br>
			<input type="radio" id="sortedByArrival" name="sortOption" value="sortedByArrival">
			<label for="sortedByArrival">Sort by Arrival Time</label>
		<br>
        	<label for="sortOrder">Sort Order:</label>
        
        <select id="sortOrder" name="sortOrder">
            <option value="asc">Ascending</option>
            <option value="desc">Descending</option>
        </select>
        <br>
    <h2>Filter Options</h2>
        <label for="numStops">Number of Stops:</label>
    	<input type="text" id="numStops" name="numStops">
    	<br>
    	<label for="airline">Enter Airline:</label>
    	<input type="text" id="airline" name="airline" placeholder="Enter airline code (e.g., AA)">
    	<br>
    	<label for="takeoffTime">Takeoff Time (24-hour format):</label>
		<input type="time" id="takeoffTime" name="takeoffTime">
		<br>
		<label for="landingTime">Landing Time (24-hour format):</label>
		<input type="time" id="landingTime" name="landingTime">
    	<br>
    	<label for="maxFare">Maximum Fare:</label>
		<input type="text" id="maxFare" name="maxFare">
    	


        <button type="submit">Search</button>
    </form>

<script>
    document.querySelectorAll('input[name="flightType"]').forEach(input => {
        input.addEventListener('change', function() {
            document.getElementById('returnDateDiv').style.display = this.value === 'roundTrip' ? 'block' : 'none';
        });
    });
</script>
</body>
</html>
