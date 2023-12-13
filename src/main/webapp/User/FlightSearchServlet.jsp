<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
pageEncoding="ISO-8859-1" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Title</title>
</head>
<body>

    <!-- Display Search Results -->
    <table border="1">
        <tr>
            <th>Flight Number</th>
            <th>Aircraft ID</th>
            <th>Origin Airport</th>
            <th>Destination Airport</th>
            <th>Departure Date</th>
            <th>Departure Time</th>
            <th>Arrival Date</th>
            <th>Arrival Time</th>
            <th>Economy Fare</th>
            <th>Business Fare</th>
            <th>First Class Fare</th>
            <th>Airline</th>
            <th>Number of Stops</th>
            <th>Flight Type</th>
            <th>Duration</th>
            <!-- Add more header columns as needed -->
        </tr>

    <%
        String startAirport = request.getParameter("startAirport");
        String endAirport = request.getParameter("endAirport");
        boolean roundTrip = "on".equals(request.getParameter("roundTripCheckbox"));
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        boolean isFlexible = "on".equals(request.getParameter("isFlexible"));
        boolean sortedByEconomy = false;
        boolean sortedByBusiness = false;
        boolean sortedByFirstClass = false;
        String sortOrder = request.getParameter("sortOrder");
        String sortOrderText = sortOrder.equalsIgnoreCase("asc") ? "ascending" : sortOrder.equalsIgnoreCase("desc") ? "descending" : "unknown";
        

        // Check if the priceSortCheckbox is selected
        if ("on".equals(request.getParameter("priceSortCheckbox"))) {
            // Get the selected value from the priceSort dropdown
            String priceSortValue = request.getParameter("priceSort");
            
            // Determine the sorting criteria based on the selected value
            if ("sortedByEconomy".equals(priceSortValue)) {
                sortedByEconomy = true;
                out.println("Sorted by " + sortOrderText + " economy price");
            } else if ("sortedByBusiness".equals(priceSortValue)) {
                sortedByBusiness = true;
                out.println("Sorted by " + sortOrderText + " business pricing");
            } else if ("sortedByFirstClass".equals(priceSortValue)) {
                sortedByFirstClass = true;
                out.println("Sorted by " + sortOrderText + " first class pricing");
            }
        }

        PreparedStatement preparedStatement = null; // Declare preparedStatement

        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();

            // Update the SQL query to handle round trip, date filtering, and sorting
            String query = ""; // Declare the query variable

            if (roundTrip) {
                // Round trip search: check departure and arrival airports for both outbound and return
                query = "SELECT * FROM flightservices WHERE " +
                        "((origin_airport = ? AND destination_airport = ?) OR (origin_airport = ? AND destination_airport = ?)) ";

                if (isFlexible) {
                    query += "AND (departure_date BETWEEN ? AND DATE_ADD(?, INTERVAL 3 DAY)) ";
                } else {
                    query += "AND (departure_date = ? OR departure_date = ?) ";
                }
                int parameterIndex = 7;

                if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                    query += "AND number_of_stops = ? ";
                    
                }
                if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                    query += "AND airline = ? ";
                    
                }
                if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                    query += "AND (economy_fare <= ? OR business_fare <= ? OR first_class_fare <= ?) ";
                }
                if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                    query += "AND departure_times >= ? ";
                }
                if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                    query += "AND arrival_times <= ? ";
                }
                if (sortedByEconomy) {
                    query += "ORDER BY economy_fare " + sortOrder;
                } else if (sortedByBusiness) {
                    query += "ORDER BY business_fare " + sortOrder;
                } else if (sortedByFirstClass) {
                    query += "ORDER BY first_class_fare " + sortOrder;
                } else if (request.getParameter("sortDuration") != null) {
                    query += "ORDER BY duration " + sortOrder;
                } else if (request.getParameter("sortTakeoffTime") != null) {
                    query += "ORDER BY departure_times " + sortOrder;
                } else if (request.getParameter("sortLandingTime") != null) {
                    query += "ORDER BY arrival_times " + sortOrder;
                }

                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, startAirport);
                preparedStatement.setString(2, endAirport);
                preparedStatement.setString(3, endAirport); // Flip the airports for the return leg
                preparedStatement.setString(4, startAirport); // Flip the airports for the return leg
                if (isFlexible) {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(5, java.sql.Date.valueOf(departureDate));
                        preparedStatement.setDate(6, java.sql.Date.valueOf(departureDate));
                    } else {
                        // Handle the case where departureDate is not valid
                        // You might want to set a default date or handle it in another way
                    }
                    
                } else {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(5, java.sql.Date.valueOf(departureDate));
                        preparedStatement.setDate(6, java.sql.Date.valueOf(returnDate));
                    } else {
                        // Handle the case where departureDate is not valid
                        // You might want to set a default date or handle it in another way
                    }
                }
                if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                    preparedStatement.setInt(parameterIndex, Integer.parseInt(request.getParameter("numStops")));
                    parameterIndex++;
                }
                if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                    preparedStatement.setString(parameterIndex, request.getParameter("airline"));
                    parameterIndex++;
                }
                if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                    float maxFare = Float.parseFloat(request.getParameter("maxFare"));
                    preparedStatement.setFloat(parameterIndex++, maxFare);
                    preparedStatement.setFloat(parameterIndex++, maxFare);
                    preparedStatement.setFloat(parameterIndex++, maxFare);
                }
                if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                    preparedStatement.setString(parameterIndex++, request.getParameter("takeoffTime"));
                }
                if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                    preparedStatement.setString(parameterIndex++, request.getParameter("landingTime"));
                }
            } else {
                // One-way search: check only departure airport
                query = "SELECT * FROM flightservices WHERE origin_airport = ? AND destination_airport = ? ";

                if (isFlexible) {
                    query += "AND (departure_date BETWEEN ? AND DATE_ADD(?, INTERVAL 3 DAY)) ";
                } else {
                    query += "AND (departure_date = ?) ";
                }
                int parameterIndex = 4;
                if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                    query += "AND number_of_stops = ? ";
                }
                if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                    query += "AND airline = ? ";
                }
                if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                    query += "AND (economy_fare <= ? OR business_fare <= ? OR first_class_fare <= ?) ";
                }
                if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                    query += "AND departure_times >= ? ";
                }
                if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                    query += "AND arrival_times <= ? ";
                }

                if (sortedByEconomy) {
                    query += "ORDER BY economy_fare " + sortOrder;
                } else if (sortedByBusiness) {
                    query += "ORDER BY business_fare " + sortOrder;
                } else if (sortedByFirstClass) {
                    query += "ORDER BY first_class_fare " + sortOrder;
                } else if (request.getParameter("sortDuration") != null) {
                    query += "ORDER BY duration " + sortOrder;
                } else if (request.getParameter("sortTakeoffTime") != null) {
                    query += "ORDER BY departure_times " + sortOrder;
                } else if (request.getParameter("sortLandingTime") != null) {
                    query += "ORDER BY arrival_times " + sortOrder;
                }


                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, startAirport);
                preparedStatement.setString(2, endAirport);
                if (isFlexible) {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(3, java.sql.Date.valueOf(departureDate));
                        preparedStatement.setDate(4, java.sql.Date.valueOf(departureDate));
                        parameterIndex++;
                    } else {
                        // Handle the case where departureDate is not valid
                        // You might want to set a default date or handle it in another way
                    }
                } else {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(3, java.sql.Date.valueOf(departureDate));
                    } else {
                        // Handle the case where departureDate is not valid
                        // You might want to set a default date or handle it in another way
                    }
                }
                if (request.getParameter("numStops") != null && !request.getParameter("numStops").isEmpty()) {
                    preparedStatement.setInt(parameterIndex, Integer.parseInt(request.getParameter("numStops")));
                    parameterIndex++;
                }
                if (request.getParameter("airline") != null && !request.getParameter("airline").isEmpty()) {
                    preparedStatement.setString(parameterIndex, request.getParameter("airline"));
                    parameterIndex++;
                }
                if (request.getParameter("maxFare") != null && !request.getParameter("maxFare").isEmpty()) {
                    float maxFare = Float.parseFloat(request.getParameter("maxFare"));
                    preparedStatement.setFloat(parameterIndex++, maxFare);
                    preparedStatement.setFloat(parameterIndex++, maxFare);
                    preparedStatement.setFloat(parameterIndex++, maxFare);
                }
                if (request.getParameter("takeoffTime") != null && !request.getParameter("takeoffTime").isEmpty()) {
                    preparedStatement.setString(parameterIndex++, request.getParameter("takeoffTime"));
                }
                if (request.getParameter("landingTime") != null && !request.getParameter("landingTime").isEmpty()) {
                    preparedStatement.setString(parameterIndex++, request.getParameter("landingTime"));
                }
            }

            ResultSet rs = preparedStatement.executeQuery();

            while (rs.next()) {
    %>
                <tr>
                    <td><%= rs.getString("flightNumber") %></td>
                    <td><%= rs.getString("AircraftID") %></td>
                    <td><%= rs.getString("origin_airport") %></td>
                    <td><%= rs.getString("destination_airport") %></td>
                    <td><%= rs.getString("departure_date") %></td>
                    <td><%= rs.getString("departure_times") %></td>
                    <td><%= rs.getString("arrival_date") %></td>
                    <td><%= rs.getString("arrival_times") %></td>
                    <td><%= rs.getFloat("economy_fare") %></td>
                    <td><%= rs.getFloat("business_fare") %></td>
                    <td><%= rs.getFloat("first_class_fare") %></td>
                    <td><%= rs.getString("airline") %></td>
                    <td><%= rs.getInt("number_of_stops") %></td>
                    <td><%= rs.getString("flight_type") %></td>
                    <td><%= rs.getString("duration") %></td>
                    <!-- Add more data columns as needed -->
                    <td>
                        <!-- Add a 'Book Flight' button for each flight -->
                        <form action="UserBookRes.jsp" method="post">
                            <input type="hidden" name="flightNumber" value="<%= rs.getString("flightNumber") %>" />
                            <input type="hidden" name="origin_airport" value="<%= rs.getString("origin_airport") %>" />
                            <input type="hidden" name="destination_airport" value="<%= rs.getString("destination_airport") %>" />
                            <input type="hidden" name="departure_date" value="<%= rs.getString("departure_date") %>" />
                            <!-- Add other hidden fields as needed to pass flight details -->
                            <input type="submit" value="Book Flight" />
                        </form>
                    </td>
                </tr>
                </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            // Close the preparedStatement in the finally block
            if (preparedStatement != null) {
                try {
                    preparedStatement.close();
                } catch (SQLException e) {
                    e.printStackTrace();
                }
            }
        }
    %>
    </table>



</body>
</html>