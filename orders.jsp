<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>


<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
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
            <ul>
                <li><a href="Admindashboard.jsp">Dashboard</a></li>
                <li><a href="engagement.jsp">Engagements</a></li>
                <li><a href="orders.jsp">Orders</a></li>
                <li><a href="Product.jsp">Products</a></li>
                <li><a href="Ledger.jsp">Orders Ledger</a></li>
                <li><a href="feedback.jsp">Feedback/Support</a></li>
                <li><a href="logoutadmin.html">Logout</a></li>
            </ul>
        </ul>
    </nav>
    <main>
        <!-- Content goes here -->
        <section id="orders">
            <h2>Orders</h2>
            <table>
                <thead>
                    <tr>
                        <th>Order ID</th>
                        <th>Product name</th>
                        <th>Product category</th>
                        <th>Customer Name</th>
                        <th>Location</th>
                        <th>Total Amount</th>
                        <th>Status</th>
                        
                        
                    </tr>
                </thead>
                <tbody>

                    <% 
    Connection conn = null;
    Statement stmt = null;
    ResultSet rs = null;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
        stmt = conn.createStatement();
        rs = stmt.executeQuery("SELECT * FROM orders");
        while (rs.next()) {
            %>
    
                    <!-- Placeholder for order rows -->
                    <tr>
                        <td><%=rs.getString(1)%></td>
                        <td><%=rs.getString(5)%></td>
                        <td><%=rs.getString(6)%></td>
                        <td><%=rs.getString(2)%></td>
                        <td><%=rs.getString(11)%></td>
                        <td>&#8377;<%=rs.getString(9)%></td>
                        <td>Processing</td>
                        
                    </tr>
                    <!-- Additional order rows go here -->
                    <% 
        }
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (stmt != null) stmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
    %>
                </tbody>
            </table>
        </section>
        
    </main>
    <footer>
        <p>System Station</p>
    </footer>
</body>
</html>