<!DOCTYPE html>
<html>
<head>
    <title>Dashboard</title>
    <style>
        /* Additional style for the background image */
        body {
            background-image: url("dashboard_background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            padding: 20px; /* Add padding to center the content */
        }

        .container {
            max-width: 600px;
            margin: auto;
            background-color: rgba(255, 255, 255, 0.8); /* Adjust the transparency here */
            padding: 20px;
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        h2 {
            margin-bottom: 20px;
            color: #333;
            text-align: center;
        }

        .buttons {
            text-align: center;
        }

        .buttons form {
            display: inline-block;
            margin-right: 10px;
        }

        .buttons form:last-child {
            margin-right: 0; /* Remove margin from the last form */
        }

        input[type="submit"] {
            padding: 10px 20px;
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
    <div class="container">
    <h2>Welcome to Your Dashboard</h2>
    
    <%
        // Retrieve username from session attribute
        String username = (String) session.getAttribute("username");
        
        // Check if the user is logged in
        if (username != null && !username.isEmpty()) {
    %>
            <p>Welcome, <%= username %>!</p>
            <p>This is your dashboard. You can customize it as you like.</p>
            <!-- Buttons for various banking actions -->
            <div class="buttons">
            <form action="createAccount.jsp">
                <input type="submit" value="Create Bank Account">
            </form>
            <form action="withdrawMoney.jsp">
                <input type="submit" value="Withdraw">
            </form>
            <form action="depositMoney.jsp">
                <input type="submit" value="Deposit">
            </form>
            <form action="checkBalance.jsp">
                <input type="submit" value="Check Balance">
            </form>
            </div>
            <p><a href="register.jsp">Logout</a></p>
    <%
        } else {
            // If the user is not logged in, redirect to the login page
            response.sendRedirect("login.jsp");
        }
    %>
    </div>
</body>
</html>
