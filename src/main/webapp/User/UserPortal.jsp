<!DOCTYPE html>
<html>
<head>
    <title>Flight Reservation System</title>
</head>
<body>
    <div>
        <h1>Welcome, <%= session.getAttribute("user") %></h1>
        <form action="../Logout.jsp" method="post">
            <input type="submit" value="Logout"/>
        </form>

        <div>
            <a href="faq.jsp">Questions and Answers Section</a>
        </div>
    </div>

    <div>
        <a href="searchFlights.jsp">Search Flights</a>
    </div>
    </div>

    <div>
        <div>
            <h3>Book Reservations</h3>
            <div>
                <a href="UserBookRes.jsp">Book a Reservation</a>
            </div>
        </div>
        <div>
            <h3>Past Reservations</h3>
            <div>
                <a href="UserPastRes.jsp">View Past Reservations</a>
            </div>
        </div>
        <div>
            <h3>Upcoming Tickets</h3>
            <div>
                <a href="UserFutureRes.jsp">View Upcoming Reservations</a>
            </div>
        </div>
    </div>
</body>
</html>
