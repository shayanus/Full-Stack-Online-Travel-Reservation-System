<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Search Flights - Flight Reservation System</title>

</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='UserMainPage.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>
    
    <h2>Search Flights</h2>

    <!-- Search Form -->
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
        <!-- Date fields for one-way or departure date for round-trip -->
        <label for="departureDate">Departure Date:</label>
        <input type="date" id="departureDate" name="departureDate" required>
		<br>
        <!-- Date field for return date for round-trip -->
        <div id="returnDateDiv" style="display: none;">
            <label for="returnDate">Return Date:</label>
            <input type="date" id="returnDate" name="returnDate">
        </div>
        <br>
        <!-- Checkbox for flexibility -->
    	<label for="isFlexible">Flexible Dates:</label>
    	<input type="checkbox" id="isFlexible" name="isFlexible">
		
	<h2>Sorting Options</h2>
		<div>
		    <input type="checkbox" id="priceSortCheckbox" name="priceSortCheckbox">
			<label for="priceSort">Sort by Pricing:</label>
			<select id="priceSort" name="priceSort">
				<option value="sortedByEconomy">Economy Price</option>
				<option value="sortedByBusiness">Business Price</option>
				<option value="sortedByFirstClas">First Class Price</option>
			</select>
		</div>
		
        <label for="sortDuration">Sort by Duration:</label>
		<input type="checkbox" id="sortDuration" name="sortDuration">
		
		<label for="sortTakeoffTime">Sort by Takeoff Time:</label>
		<input type="checkbox" id="sortTakeoffTime" name="sortTakeoffTime">
		
		<label for="sortLandingTime">Sort by Landing Time:</label>
		<input type="checkbox" id="sortLandingTime" name="sortLandingTime">
        <label for="sortOrder">Sort Order:</label>
        <select id="sortOrder" name="sortOrder">
            <option value="asc">Ascending</option>
            <option value="desc">Descending</option>
        </select>
      <h2>Filter Options</h2>
        <label for="numStops">Number of Stops:</label>
    	<input type="text" id="numStops" name="numStops">
    	
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
    // JavaScript to toggle the display of the return date field
    document.querySelectorAll('input[name="flightType"]').forEach(input => {
        input.addEventListener('change', function() {
            document.getElementById('returnDateDiv').style.display = this.value === 'roundTrip' ? 'block' : 'none';
        });
    });
</script>
</body>
</html>
