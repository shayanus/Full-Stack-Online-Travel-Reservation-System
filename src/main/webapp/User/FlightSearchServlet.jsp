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
            <th>Book Flight</th>
        </tr>

    <%
        String startAirport = request.getParameter("startAirport");
        String endAirport = request.getParameter("endAirport");
        boolean roundTrip = request.getParameter("flightType").equals("roundTrip");
        //out.println("test: " + "roundTrip".equals(request.getParameter("flightType")));
        String departureDate = request.getParameter("departureDate");
        String returnDate = request.getParameter("returnDate");
        boolean isFlexible = "on".equals(request.getParameter("isFlexible"));
        boolean sortedByEconomy = false;
        boolean sortedByBusiness = false;
        boolean sortedByFirstClass = false;
        boolean sortedByDuration = false;
        boolean sortedByTakeoff = false;
        boolean sortedByArrival = false;
        String sortOrder = request.getParameter("sortOrder");
        String sortOrderText = sortOrder.equalsIgnoreCase("asc") ? "ascending" : sortOrder.equalsIgnoreCase("desc") ? "descending" : "unknown";
        String sortOption = request.getParameter("sortOption");
        String sortOptionText = sortOption.length() > 8? sortOption.substring(8) : "None";


        String priceSortValue = request.getParameter("priceSort");
        
        if (sortOption.equals("sortedByEconomy")) {
            sortedByEconomy = true;
            out.println("<h2>Sorted by economy pricing in " + sortOrderText + " order</h2>");
        } 
        else if (sortOption.equals("sortedByBusiness")) {
            sortedByBusiness = true;
            out.println("<h2>Sorted by business pricing in " + sortOrderText + " order</h2>");
        } 
        else if (sortOption.equals("sortedByFirstClass")) {
            sortedByFirstClass = true;
            out.println("<h2>Sorted by first class pricing in " + sortOrderText + " order</h2>");
        } 
        else if (sortOption.equals("sortedByDuration")) {
            sortedByDuration = true;
            out.println("<h2>Sorted by duration time in " + sortOrderText + " order</h2>");
        } 
        else if (sortOption.equals("sortedByTakeoff")) {
            sortedByTakeoff = true;
            out.println("<h2>Sorted by takeoff time in " + sortOrderText + " order</h2>");
        } 
        else if (sortOption.equals("sortedByArrival")) {
            sortedByArrival = true;
            out.println("<h2>Sorted by arrival time in " + sortOrderText + " order</h2>");
        }
        

        PreparedStatement preparedStatement = null; 

        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();

            String query = ""; 

            if (roundTrip) {
                
                query = "SELECT * FROM flightservices WHERE " +
                        "((fromAirport = ? AND toAirport = ?) OR (fromAirport = ? AND toAirport = ?)) ";

                if (isFlexible) {
                    query += "AND (departureDate BETWEEN ? AND DATE_ADD(?, INTERVAL 3 DAY)) ";
                } else {
                    query += "AND (departureDate = ? OR departureDate = ?) ";
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
                    query += "AND departureTime >= ? ";
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
                } else if (sortedByDuration) {
                    query += "ORDER BY duration " + sortOrder;
                } else if (sortedByTakeoff) {
                    query += "ORDER BY departureTime " + sortOrder;
                } else if (sortedByArrival) {
                    query += "ORDER BY arrival_times " + sortOrder;
                }

                preparedStatement = connection.prepareStatement(query);
                preparedStatement.setString(1, startAirport);
                preparedStatement.setString(2, endAirport);
                preparedStatement.setString(3, endAirport); 
                preparedStatement.setString(4, startAirport); 
                if (isFlexible) {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(5, java.sql.Date.valueOf(departureDate));
                        preparedStatement.setDate(6, java.sql.Date.valueOf(departureDate));
                    } else {
                        
                    }
                    
                } else {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(5, java.sql.Date.valueOf(departureDate));
                        preparedStatement.setDate(6, java.sql.Date.valueOf(returnDate));
                    } else {
                        
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
                query = "SELECT * FROM flightservices WHERE fromAirport = ? AND toAirport = ? ";

                if (isFlexible) {
                    query += "AND (departureDate BETWEEN ? AND DATE_ADD(?, INTERVAL 3 DAY)) ";
                } else {
                    query += "AND (departureDate = ?) ";
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
                    query += "AND departureTime >= ? ";
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
                } else if (sortedByDuration) {
                    query += "ORDER BY duration " + sortOrder;
                } else if (sortedByTakeoff) {
                    query += "ORDER BY departureTime " + sortOrder;
                } else if (sortedByArrival) {
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
                        
                    }
                } else {
                    if (departureDate != null && !departureDate.isEmpty()) {
                        preparedStatement.setDate(3, java.sql.Date.valueOf(departureDate));
                    } else {
                        
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
                    <td><%= rs.getString("fromAirport") %></td>
                    <td><%= rs.getString("toAirport") %></td>
                    <td><%= rs.getString("departureDate") %></td>
                    <td><%= rs.getString("departureTime") %></td>
                    <td><%= rs.getString("arrival_date") %></td>
                    <td><%= rs.getString("arrival_times") %></td>
                    <td><%= rs.getFloat("economy_fare") %></td>
                    <td><%= rs.getFloat("business_fare") %></td>
                    <td><%= rs.getFloat("first_class_fare") %></td>
                    <td><%= rs.getString("airline") %></td>
                    <td><%= rs.getInt("number_of_stops") %></td>
                    <td><%= rs.getString("flight_type") %></td>
                    <td><%= rs.getString("duration") %></td>
                    <td>
                        <form action="UserBookRes.jsp" method="post">
                            <input type="hidden" name="flightNumber" value="<%= rs.getString("flightNumber") %>" />
                            <input type="hidden" name="fromAirport" value="<%= rs.getString("fromAirport") %>" />
                            <input type="hidden" name="toAirport" value="<%= rs.getString("toAirport") %>" />
                            <input type="hidden" name="departureDate" value="<%= rs.getString("departureDate") %>" />
                            <input type="submit" value="Book Now" />
                        </form>
                    </td>
                </tr>
                </tr>
    <%
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
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