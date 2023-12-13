<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<html>
<head>
    <title>Airport Data</title>
    <style>
        table {
            width: 50%;
            border-collapse: collapse;
            margin-top: 20px;
        }
        th, td {
            border: 1px solid #ddd;
            padding: 8px;
            text-align: left;
        }
        th {
            background-color: #f2f2f2;
        }
    </style>
</head>
    
<body>
<!-- Back Button -->
        <button onclick="location.href='CustomerRepMainPage.jsp'"style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Back to Rep Main Page</button>
        <button onclick="location.href='../Logout.jsp'" style="background-color: #007BFF; color: #fff; padding: 10px; border: none; border-radius: 4px; cursor: pointer;">Log out</button>
    <h2>Data from airport</h2>
    <!-- Information Line -->
    <p>Please use Airport 3 letter codes as input entries. For Example: EWR, JFK, LAX</p>
    
    <!-- Add Form -->
    <form method="post">
        <label for="addInput">Add:</label>
        <input type="text" id="addInput" name="addInput">
        <input type="hidden" name="formAction" value="add">
        <input type="submit" value="Add">
    </form>
    
    <!-- Edit Form -->
    <form method="post">
        <label for="editInputOld">Edit:</label>
        <input type="text" id="editInputOld" name="editInputOld">
        <span>to</span>
        <input type="text" id="editInputNew" name="editInputNew">
        <input type="hidden" name="formAction" value="edit">
        <input type="submit" value="Edit">
    </form>
   

    <!-- Delete Form -->
    <form method="post">
        <label for="deleteInput">Delete:</label>
        <input type="text" id="deleteInput" name="deleteInput">
        <input type="hidden" name="formAction" value="delete">
        <input type="submit" value="Delete">
    </form>
    
    <!-- Show Form -->
    <form method="post">
        <label for="showInput">Show:</label>
        <input type="hidden" name="formAction" value="show">
        <input type="submit" value="Show">
    </form>
    
    <% 
        if ("add".equals(request.getParameter("formAction"))) {
        	String error = null;
            // JSP code to handle Add form submission
            // Retrieve the input value and process it
            String addInput = request.getParameter("addInput");
            // Database insertion logic here
            ApplicationDB db = new ApplicationDB();	
            Connection con = db.getConnection();	
            Statement stmt = con.createStatement();
            try {
            stmt.executeUpdate("INSERT INTO airport(ThreeLetterID) VALUES('" + addInput + "')");
            out.println("<tr><td>" + addInput + "</td></tr>");
            }
            catch (SQLException e) {
            	error = "Could not execute query!";
            	e.printStackTrace();
            }
            
            if (error != null) {
                out.println("<tr><td colspan='2'>" + error + "</td></tr>");
            }
            
        }
    %>
    
    <% 
        if ("edit".equals(request.getParameter("formAction"))) {
            // JSP code to handle Edit form submission
            // Retrieve the input values and process them
            String editInputOld = request.getParameter("editInputOld");
            String editInputNew = request.getParameter("editInputNew");
            // Database update logic here
            ApplicationDB db = new ApplicationDB();	
            Connection con = db.getConnection();	
            Statement stmt = con.createStatement();
            stmt.executeUpdate("UPDATE airport SET ThreeLetterID = '" + editInputNew + "' WHERE ThreeLetterID = '" + editInputOld + "'");
            ResultSet rs = null;
            try {
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT ThreeLetterID FROM airport");
                out.println("<table>");
                out.println("<tr><th>ThreeLetterID</th></tr>");
                while(rs.next()) {
                    out.println("<tr><td>" + rs.getString("ThreeLetterID") + "</td></tr>");
                }
                out.println("</table>");
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            } finally {
                if(rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if(stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if(con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
    %>
    
    <% 
        if ("delete".equals(request.getParameter("formAction"))) {
            // JSP code to handle Delete form submission
            // Retrieve the input value and process it
            String error = null;
            String deleteInput = request.getParameter("deleteInput");
            // Database deletion logic here
            ApplicationDB db = new ApplicationDB();	
            Connection con = db.getConnection();	
            Statement stmt = con.createStatement();
            try {
            stmt.executeUpdate("DELETE FROM airport WHERE ThreeLetterID = '"+deleteInput+"'");
            }
            catch (SQLException e) {
            	error = "Could not execute query!";
            	e.printStackTrace();
            }
            
            if (error != null) {
                out.println("<tr><td colspan='2'>" + error + "</td></tr>");
            }
        }
    %>
    	
    <%
    	if ("show".equals(request.getParameter("formAction"))) {
    		ApplicationDB db = new ApplicationDB();	
            Connection con = db.getConnection();	
            Statement stmt = con.createStatement();
            ResultSet rs = null;
            try {
                stmt = con.createStatement();
                rs = stmt.executeQuery("SELECT ThreeLetterID FROM airport");
                out.println("<table>");
                out.println("<tr><th>ThreeLetterID</th></tr>");
                while(rs.next()) {
                    out.println("<tr><td>" + rs.getString("ThreeLetterID") + "</td></tr>");
                }
                out.println("</table>");
            } catch (SQLException e) {
                out.println("SQLException caught: " + e.getMessage());
            } finally {
                if(rs != null) try { rs.close(); } catch (SQLException e) { e.printStackTrace(); }
                if(stmt != null) try { stmt.close(); } catch (SQLException e) { e.printStackTrace(); }
                if(con != null) try { con.close(); } catch (SQLException e) { e.printStackTrace(); }
            }
        }
		
    
    %>

</table>
</body>
</html>