<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Question - Flight Reservation System</title>
</head>
<body>
    <%
        String newQuestion = request.getParameter("newQuestion");

        try {
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();
            PreparedStatement statement = connection.prepareStatement("INSERT INTO FAQ (question, answer) VALUES (?, ?)");

            // Set the question (you can set a default or empty answer if needed)
            statement.setString(1, newQuestion);
            statement.setString(2, "A User Representative will get back to you soon.");

            int rowsInserted = statement.executeUpdate();

            if (rowsInserted > 0) {
    %>
                <h2>Question Added Successfully</h2>
                <p>The question "<%= newQuestion %>" has been added to the FAQ.</p>
                <a href="faq.jsp">Back to FAQ</a>
    <%
            } else {
    %>
                <h2>Error Adding Question</h2>
                <p>There was an error adding the question. Please try again.</p>
                <a href="faq.jsp">Back to FAQ</a>
    <%
            }

        } catch (SQLException e) {
            e.printStackTrace();
    %>
            <h2>Error</h2>
            <p>There was an error processing your request. Please try again.</p>
            <a href="faq.jsp">Back to FAQ</a>
    <%
        }
    %>
</body>
</html>
