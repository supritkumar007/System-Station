<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

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
        <!-- Content goes here -->
        <section id="products">
            <h2>Manage Products</h2>
            <a href="addproducts.html"><button id="add-product-btn">Add New Product</button></a>
            <table>
                <thead>
                    <tr>
                        <th>Product ID</th>
                        <th>Name</th>
                        <th>Category</th>
                        <th>Description</th>
                        <th>Price</th>
                        <th>Stock</th>
                        <th>Actions</th>
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
        rs = stmt.executeQuery("SELECT * FROM product");
        while (rs.next()) {
            int productId = rs.getInt("prod_id");
            String productName = rs.getString("prod_name");
            String productCategory = rs.getString("prod_cat");
            String productDescription = rs.getString("prod_desc");
            double productPrice = rs.getDouble("prod_price");
            int productStock = rs.getInt("stock");
    %>
    <tr>
        <td><%= productId %></td>
        <td><%= productName %></td>
        <td><%= productCategory %></td>
        <td><%= productDescription %></td>
        <td>&#8377;<%= productPrice %></td>
        <td><%= productStock %></td>
        <td>
            <a href="edit_product.jsp?id=<%= productId %>"><button >Edit</button></a>
            <a href="delete_product.jsp?id=<%= productId %>"><button >Delete</button></a>
        </td>
    </tr>
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
