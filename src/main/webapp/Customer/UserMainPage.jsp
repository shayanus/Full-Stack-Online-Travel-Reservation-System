<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation System</title>
</head>
<body>
    <div class="header">
        <h1>Welcome, User</h1>
        <!-- Logout button -->
        <form action="../Logout.jsp" method="post" style="position: absolute; top: 10px; left: 10px;">
            <input type="submit" value="Logout" class="logout-button"/>
        </form>
    </div>

    <div class="search-section">
        <a href="searchFlights.jsp" class="search-button">Search Flights</a>
    </div>
    </div>

    <div class="reservations">
        <div>
            <h3>Book Reservations</h3>
            <div class="search-section">
                <a href="UserBookRes.jsp" class="search-button">Book a Reservation</a>
            </div>
        </div>
        <div>
            <h3>Past Reservations</h3>
            <div class="search-section">
                <a href="UserPastRes.jsp" class="search-button">View Past Reservations</a>
            </div>
        </div>
        <div>
            <h3>Upcoming Tickets</h3>
            <div class="search-section">
                <a href="UserFutureRes.jsp" class="search-button">View Upcoming Reservations</a>
            </div>
        </div>
    </div>
</body>
</html>
