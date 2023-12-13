<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Update Answer - Flight Reservation System</title>
    
</head>

<body>
    <h2>Update Answer</h2>

    <%
        // Retrieve parameters from the request
        String questionId = request.getParameter("questionId");
        String newAnswer = request.getParameter("newAnswer");

        try {
            // Implement your database update logic here
            ApplicationDB db = new ApplicationDB();
            Connection connection = db.getConnection();
            // Assume you have a table named "FAQ" with columns "id", "question", and "answer"
            String updateQuery = "UPDATE FAQ SET answer = ? WHERE id = ?";
            try (PreparedStatement preparedStatement = connection.prepareStatement(updateQuery)) {
                preparedStatement.setString(1, newAnswer);
                preparedStatement.setString(2, questionId);
                int rowsUpdated = preparedStatement.executeUpdate();

                if (rowsUpdated > 0) {
    %>
                    <p>Answer updated successfully!</p>
    <%
                } else {
    %>
                    <p>Error updating answer. Please try again.</p>
    <%
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
    %>
            <p>Error connecting to the database. Please try again.</p>
    <%
        }
    %>

    <!-- Back Button -->
    <button onclick="location.href='CustomerRepMainPage.jsp'">Back to Customer Main Page</button>
    <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
</body>
</html>
