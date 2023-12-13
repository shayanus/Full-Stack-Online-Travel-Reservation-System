<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="com.cs336.pkg.*"%>
<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*"%>
<!DOCTYPE html>
<%@ page import ="java.sql.*" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Register New User</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f7f7f7;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }

        .container {
            display: flex;
            justify-content: space-between;
            width: 80%;
        }

        .welcome-screen {
            background-color: #0056b3; /* Slightly darker blue */
            color: #fff;
            border-radius: 5px;
            width: 45%;
            padding: 20px;
            text-align: center;
        }

        .registration-container {
            background-color: #fff;
            border: 2px solid #000;
            border-radius: 5px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 45%;
            padding: 20px;
        }

        .registration-container h2 {
            color: #333;
            text-align: center;
        }

        .registration-container label {
            display: block;
            margin-bottom: 8px;
        }

        .registration-container input,
        .registration-container select {
            width: 80%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .registration-container button {
            background-color: #0056b3; /* Dark blue */
            color: #fff;
            padding: 10px 0;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            width: 80%;
        }

        .registration-container button:hover {
            background-color: #003366; /* Darker blue on hover */
        }

        .registration-container p#error {
            color: red;
            text-align: center;
            margin-top: 15px;
        }

        /* New styles for instructional text */
        .registration-container p.instruction {
            color: #555;
            font-size: 14px;
            text-align: left;
            margin-bottom: 10px;
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="welcome-screen">
            <h2>Welcome to The Flight Reservation System User Creation Page</h2>
            <p>Please create a Username, a strong Password, and choose your Role below</p>
            <p>Here is a brief description of each role:</p>
            <p>Customers use their accounts to buy plane tickets and reserve seats. </p>
            <p>Customer Representatives aid Customers in their purchases.</p>
            <p>Site Admins oversee the revenues, customer flow, and schematics of the service.</p>
        </div>

        <div class="registration-container">
            <h2>Register New User</h2>
            

            <form id="registrationForm" action="register.jsp" method="post">
                <label for="username">Username:</label>
                <input type="text" id="username" name="username" required>
                
                <label for="password">Password:</label>
                <input type="password" id="password" name="password" required>

                <label for="role">Role:</label>
                <select id="role" name="role">
                    <option value="Customer">Customer</option>
                    <option value="CustomerRepresentative">CustomerRepresentative</option>
                    <option value="SiteAdmin">SiteAdmin</option>
                </select>

                <button type="submit">Register</button>
            </form>
            <p id="error">
                <%= request.getAttribute("errorMessage") %>
            </p>
            <%
            
            	String UserID = request.getParameter("username");
            	String Password = request.getParameter("password");
            	String Role = request.getParameter("role");
            	
            	ApplicationDB db = new ApplicationDB();
            	Connection connection = db.getConnection();
            	Statement statement = connection.createStatement();
            	
            	ResultSet rs = statement.executeQuery("SELECT * from User WHERE UserID='" + UserID + "'");
            	if(rs.next()){
            		out.println("UserID exists, please try another <a href='register.jsp'>try again</a>");
            	}else{
            		int x = statement.executeUpdate("INSERT INTO User(UserID, Password, role) VALUES('" +UserID+ "', '" +Password+ "', '" +Role+ "')");
            		
            		if(Role.equals("Customer")){
            			int y = statement.executeUpdate("INSERT INTO Customer(UserID, CustomerIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
            		}else if(Role.equals("CustomerRepresentative")){
            			int y = statement.executeUpdate("INSERT INTO CustomerRepresentative(UserID, RepresentativeIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
            			
            		}else if(Role.equals("SiteAdmin")){
            			int y = statement.executeUpdate("INSERT INTO SiteAdmin(UserID, AdminIdentifier) VALUES('" +UserID+ "', '" +UserID+ "')");
            			
            		}
            		
            		session.setAttribute("user", UserID); // the username will be stored in the session
                    response.sendRedirect("LoginSuccess.jsp");
            	}
            	
            	
            %>
        </div>
    </div>
</body>
</html>
