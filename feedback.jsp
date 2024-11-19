<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>

<link rel="icon" type="image/x-icon" href="images/logo2.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adDashCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
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
        <section id="feedback">
            <h2>Feedback/Support</h2>
            <div class="feedback-list">
                <% 
                    Connection conn;
                    Statement stmt;
                    ResultSet rs;

                    Class.forName("com.mysql.cj.jdbc.Driver");
                    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
                    stmt = conn.createStatement();
                    rs = stmt.executeQuery("SELECT * FROM contactus");
                    try{
                    while (rs.next()) {
                        String name = rs.getString("name");
                        String phno = rs.getString("phno");
                        String email = rs.getString("email");
                        String question = rs.getString("question");
                        String date = rs.getString("date");
                %>
                <div class="feedback">
                    <h3>Feedback from <%= name %></h3>
                    <p><b>Phone Number:</b> <%= phno %></p>
                    <p><b>Email:</b> <%= email %></p>
                    <p><b>Feedback:</b> <%= question %></p>
                    <p class="date"><b>Received on:</b><%= date %></p>
                </div>
                <% 
                    }
                    rs.close();
                    stmt.close();
                    conn.close();
                } catch(Exception e) {
                    out.println(e);
                } 
                %>
            </div>
        </section>
    </main>
    <footer>
        <p>System Station</p>
    </footer>
</body>
</html>
