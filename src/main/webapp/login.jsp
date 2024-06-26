<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <title>User Login</title>
    <link rel="stylesheet" type="text/css" href="style.css">
    <style>
        /* Additional style for the image background */
        body {
            background-image: url("banking_image.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            padding: 20px; /* Add padding to center the form */
        }

        .container {
            max-width: 400px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.8); /* Adjust the transparency here */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        label {
            display: block;
            margin-bottom: 10px;
        }

        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
            width: 100%;
            padding: 10px;
            background-color: #007bff;
            color: #fff;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        input[type="submit"]:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <a href="index.html">Home</a>
        <a href="register.jsp">Register</a>
        <a href="login.jsp">Login</a>
    </div>
    <div class="container">
    <h2>User Login</h2>
    <%-- Check if registration was successful and display notification --%>
    <% if(request.getParameter("success") != null && request.getParameter("success").equals("true")) { %>
        <p style="color: green;">Registration successful! Please proceed to login.</p>
    <% } %>
    <form action="login" method="post">
        <label for="username">Username:</label>
        <input type="text" id="username" name="username" required><br><br>
        
        <label for="password">Password:</label>
        <input type="password" id="password" name="password" required><br><br>
        
        <input type="submit" value="Login">
    </form>
    <form action="register.jsp">
        <li>New User</li><input type="submit" value="Register">
    </form>
    </div>
</body>
</html>
    