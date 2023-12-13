<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.sql.*,com.cs336.pkg.ApplicationDB"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Flight - Flight Reservation System</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            margin: 20px;
        }

        h2 {
            color: #333;
            text-align: center;
        }

        form {
            width: 50%;
            margin: auto;
        }

        label {
            display: block;
            margin-top: 10px;
        }

        input {
            width: 100%;
            padding: 8px;
            box-sizing: border-box;
        }

        button {
            background-color: #007BFF;
            color: #fff;
            padding: 10px;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            margin-top: 10px;
        }

        button:hover {
            background-color: #0056b3;
        }
    </style>
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
    <button onclick="location.href='CustomerRepMainPage.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Customer Rep Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>

    <h2>Add Flight</h2>

    <!-- Add Flight Form -->
    <form method="post" action="processAddFlight.jsp" onsubmit="return validateForm()">
        <label for="flightNumber">Flight Number:</label>
        <input type="text" id="flightNumber" name="flightNumber" required>

        <label for="AircraftID">Aircraft ID:</label>
        <input type="text" id="AircraftID" name="AircraftID" required>

        <label for="originAirport">Origin Airport:</label>
        <input type="text" id="originAirport" name="originAirport" required>

        <label for="destinationAirport">Destination Airport:</label>
        <input type="text" id="destinationAirport" name="destinationAirport" required>

        <label for="economyFare">Economy Fare:</label>
        <input type="text" id="economyFare" name="economyFare" required>

        <label for="businessFare">Business Fare:</label>
        <input type="text" id="businessFare" name="businessFare" required>

        <label for="firstClassFare">First Class Fare:</label>
        <input type="text" id="firstClassFare" name="firstClassFare" required>

        <label for="airline">Airline:</label>
        <input type="text" id="airline" name="airline" required>

        <label for="numStops">Number of Stops:</label>
        <input type="text" id="numStops" name="numStops" required>

        <label for="flightType">Flight Type:</label>
        <select id="flightType" name="flightType" required>
            <option value="domestic">Domestic</option>
            <option value="international">International</option>
        </select>

        <label for="departureDate">Departure Date:</label>
        <input type="date" id="departureDate" name="departureDate" required>

        <label for="departureTimes">Departure Times (HH:mm:ss):</label>
		<input type="text" id="departureTimes" name="departureTimes" pattern="(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d" required title="Enter a valid time in the format HH:mm:ss">

        <label for="arrivalDate">Arrival Date:</label>
        <input type="date" id="arrivalDate" name="arrivalDate" required>

        <label for="arrivalTimes">Arrival Times (HH:mm:ss):</label>
		<input type="text" id="arrivalTimes" name="arrivalTimes" pattern="(?:[01]\d|2[0-3]):[0-5]\d:[0-5]\d" required title="Enter a valid time in the format HH:mm:ss">

        <button type="submit">Add Flight</button>
        
        
    </form>
</body>
</html>
