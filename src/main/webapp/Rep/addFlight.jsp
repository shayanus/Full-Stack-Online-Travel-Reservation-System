<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Flight - Flight Reservation System</title>
    
    <script>
        function validateForm() {
            var requiredFields = ["flightNumber", "AircraftID", "originAirport", "destinationAirport",
                "economyFare", "businessFare", "firstClassFare", "airline", "numStops",
                "flightType", "departureDate", "departureTimes", "arrivalDate", "arrivalTimes"];

            for (var i = 0; i < requiredFields.length; i++) {
                var field = requiredFields[i];
                var value = document.getElementById(field).value.trim();

                if (value === "") {
                    alert("Please fill out all required fields.");
                    return false;
                }
            }

            return true;
        }
    </script>
</head>

<body>
    <!-- Back Button -->
    <button onclick="location.href='CustomerRepMainPage.jsp'">Back to Customer Rep Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>

    <h2>Add Flight</h2>

    <form method="post" action="processAddFlight.jsp" onsubmit="return validateForm()">
        <label for="flightNumber">Flight Number:</label>
        <input type="text" id="flightNumber" name="flightNumber" required>
<br>
        <label for="AircraftID">Aircraft ID:</label>
        <input type="text" id="AircraftID" name="AircraftID" required>
<br>
        <label for="originAirport">Origin Airport:</label>
        <input type="text" id="originAirport" name="originAirport" required>
<br>
        <label for="destinationAirport">Destination Airport:</label>
        <input type="text" id="destinationAirport" name="destinationAirport" required>
<br>
        <label for="economyFare">Economy Fare:</label>
        <input type="text" id="economyFare" name="economyFare" required>
<br>
        <label for="businessFare">Business Fare:</label>
        <input type="text" id="businessFare" name="businessFare" required>
<br>
        <label for="firstClassFare">First Class Fare:</label>
        <input type="text" id="firstClassFare" name="firstClassFare" required>
<br>
        <label for="airline">Airline:</label>
        <input type="text" id="airline" name="airline" required>
<br>
        <label for="numStops">Number of Stops:</label>
        <input type="text" id="numStops" name="numStops" required>
<br>
        <label for="flightType">Flight Type:</label>
        <select id="flightType" name="flightType" required>
            <option value="domestic">Domestic</option>
            <option value="international">International</option>
        </select>
<br>
        <label for="departureDate">Departure Date:</label>
        <input type="date" id="departureDate" name="departureDate" required>
<br>
        <label for="departureTimes">Departure Times (HH:mm:ss):</label>
		<input type="text" id="departureTimes" name="departureTimes" pattern="(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d" required title="Enter a valid time in the format HH:mm:ss">
<br>
        <label for="arrivalDate">Arrival Date:</label>
        <input type="date" id="arrivalDate" name="arrivalDate" required>
<br>
        <label for="arrivalTimes">Arrival Times (HH:mm:ss):</label>
		<input type="text" id="arrivalTimes" name="arrivalTimes" pattern="(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d" required title="Enter a valid time in the format HH:mm:ss">
<br>
        <button type="submit">Add Flight</button>
        
        
    </form>
</body>
</html>
