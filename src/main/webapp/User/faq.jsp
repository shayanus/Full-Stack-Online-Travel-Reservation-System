<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="com.cs336.pkg.*,java.sql.*,java.util.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>FAQ - Flight Reservation System</title>
    <script>
        function askQuestion() {
            var newQuestion = prompt("Enter your question:");

            if (newQuestion !== null) {
                window.location.href = "addQuestion.jsp?newQuestion=" + encodeURIComponent(newQuestion);
            }
        }

        function searchQuestions() {
            var searchTerm = document.getElementById("searchTerm").value.toLowerCase();
            var rows = document.querySelectorAll("table tr");

            for (var i = 1; i < rows.length; i++) { 
                var questionText = rows[i].cells[0].innerText.toLowerCase();
                var answerText = rows[i].cells[1].innerText.toLowerCase();

                if (questionText.includes(searchTerm) || answerText.includes(searchTerm)) {
                    rows[i].style.display = "";
                } else {
                    rows[i].style.display = "none";
                }
            }
        }
    </script>
</head>

<body>
    <button onclick="location.href='UserPortal.jsp'">Back to User Main Page</button>
    <button onclick="location.href='../Logout.jsp'">Log out</button>

    <h2>Frequently Asked Questions</h2>

    <label for="searchTerm">Search:</label>
    <input type="text" id="searchTerm" oninput="searchQuestions()">

    <table border="1">
        <tr>
            <th>Question</th>
            <th>Answer</th>
        </tr>

        <%
            try {
                ApplicationDB db = new ApplicationDB();
                Connection connection = db.getConnection();
                Statement statement = connection.createStatement();

                ResultSet rs = statement.executeQuery("SELECT * FROM FAQ");

                while (rs.next()) {
        %>
                    <tr>
                        <td><%= rs.getString("question") %></td>
                        <td><%= rs.getString("answer") %></td>
                    </tr>
        <%
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }
        %>
    </table>

    <button onclick="askQuestion()">Ask a Question</button>
</body>
</html>
