<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adDashCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
    <header>
        <a href="" class="heading"><h1>Admin Dashboard</h1></a>
    </header>
    <nav>
        <ul>
            <li><a href="Admindashboard.jsp">Dashboard</a></li>
            <li><a href="engagement.jsp">Engagements</a></li>
            <li><a href="orders.jsp">Orders</a></li>
            <li><a href="Product.jsp">Products</a></li>
            <li><a href="Ledger.jsp">Orders Ledger</a></li>
            <li><a href="feedback.jsp">Feedback/Support</a></li>
            <li><a href="logoutadmin.html">Logout</a></li>
        </ul>
    </nav>
    <main>
        <%
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) FROM register");

                // Retrieving count from the result set
                if (resultSet.next()) {
                    int numberOfUsers = resultSet.getInt(1);
        %>
        <section id="dashboard">
            <h2>Dashboard</h2>
            <div class="stats">
                <div class="stat">
                    <h3>User Engaged with Website</h3>
                    <p> <%= numberOfUsers %></p>
                </div>
                <%
                }}catch(Exception e){
                    out.println(e);
                }
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) FROM orders");

                // Retrieving count from the result set
                if (resultSet.next()) {
                    int numberOfOrders = resultSet.getInt(1);
        %>
                <div class="stat">
                    <h3>Number of Orders</h3>
                    <p><%= numberOfOrders %></p>
                </div><%
                }}catch(Exception e){
                    out.println(e);
                }
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
                Statement statement = connection.createStatement();
                ResultSet resultSet = statement.executeQuery("SELECT COUNT(*) FROM ledgers");

                // Retrieving count from the result set
                if (resultSet.next()) {
                    int numberOfSales = resultSet.getInt(1);
        %>
                <div class="stat">
                    <h3>Product Sales</h3>
                    <p><%= numberOfSales %></p>
                </div>
            </div><%
                }}catch(Exception e){
                    out.println(e);
                }%>
            <div class="graph">
                <!-- Placeholder for graph -->
                <!-- <p>Graphical representation of data will go here.</p> -->
                <canvas id="myChart" width="400" height="400"></canvas>
            </div>
        </section>
    </main>
    <footer>
        <p>System Station</p>
    </footer>
</body>
</html>
