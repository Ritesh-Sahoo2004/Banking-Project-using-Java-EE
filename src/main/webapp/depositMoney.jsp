<!DOCTYPE html>
<html>
<head>
    <title>Deposit Money</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url("dashboard_background.jpg");
            background-size: cover;
            background-repeat: no-repeat;
            background-position: center;
            margin: 0;
            padding: 0;
        }

        .navbar {
            overflow: hidden;
            background-color: #333;
        }

        .navbar a {
            float: left;
            display: block;
            color: #f2f2f2;
            text-align: center;
            padding: 14px 20px;
            text-decoration: none;
        }

        .navbar a:hover {
            background-color: #ddd;
            color: black;
        }

        h2 {
            margin-top: 50px; /* Adjust the margin to center vertically */
            text-align: center;
            color: #333;
        }

        form {
            max-width: 400px;
            margin: 20px auto;
            padding: 20px;
            background-color: rgba(255, 255, 255, 0.8); /* Adjust the transparency here */
            border-radius: 5px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }

        input[type="text"],
        input[type="submit"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 3px;
        }

        input[type="submit"] {
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
        <a href="depositMoney.jsp">Deposit Money</a>
        <a href="withdrawMoney.jsp">Withdraw Money</a>
        <a href="checkBalance.jsp">Check Balance</a>
    </div>
    <h2>Deposit Money</h2>
    <form action="depositMoneyServlet" method="post">
        Account Number: <input type="text" name="accountNumber"><br>
        Deposit Amount: <input type="text" name="amount"><br>
        <input type="submit" value="Deposit">
    </form>
    <form action="dashboard.jsp">
        <li>Return to Dashboard</li><input type="submit" value="Dashboard">
    </form>
</body>
</html>