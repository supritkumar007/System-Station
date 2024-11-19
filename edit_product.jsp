<%@ page import="java.sql.*" %>

<%
// Retrieve product ID from URL parameter
int productId = Integer.parseInt(request.getParameter("id"));

// Fetch product details from the database using the product ID
Connection conn = null;
PreparedStatement pstmt = null;
ResultSet rs = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
    String query = "SELECT * FROM product WHERE prod_id = ?";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, productId);
    rs = pstmt.executeQuery();
    if (rs.next()) {
        String productName = rs.getString("prod_name");
        String productCategory = rs.getString("prod_cat");
        String productDescription = rs.getString("prod_desc");
        double productPrice = rs.getDouble("prod_price");
        int productStock = rs.getInt("stock");
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard</title>
    <link rel="stylesheet" href="adDashCss.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;700&display=swap" rel="stylesheet">
</head>
<body>
    <header>
        <a href="dashboard.html" class="heading"><h1>Admin Dashboard</h1></a>
    </header>
    <nav>
        <ul>
            <li><a href="Admindashboard.html">Dashboard</a></li>
            <li><a href="orders.html">Orders</a></li>
            <li><a href="Product.jsp">Products</a></li>
            <li><a href="feedback.jsp">Feedback/Support</a></li>
            <li><a href="logoutadmin.html">Logout</a></li>
        </ul>
    </nav>
    <main>
<form action="update_product.jsp" method="post">
    <input type="hidden" name="product_id" value="<%= productId %>">
    <label for="product_name">Product Name:</label>
    <input type="text" id="product_name" name="product_name" value="<%= productName %>" required>
    
    <label for="product_category">Product Category:</label>
    <input type="text" id="product_category" name="product_category" value="<%= productCategory %>" required>

    <label for="product_description">Product Description:</label>
    <input type="text" id="product_description" name="product_description" value="<%= productDescription %>" required>
    
    <label for="product_price">Product Price:</label>
    <input type="number" id="product_price" name="product_price" min="0" step="0.01" value="<%= productPrice %>" required>

    <label for="product_stock">Product Stock:</label>
    <input type="text" id="product_stock" name="product_stock" value="<%= productStock %>" required>
    
    <button type="submit">Update Product</button>
</form>
</main>
    <footer>
        <p>&copy; 2024 Computer Ecommerce</p>
    </footer>
</body>
</html>
<%
    } else {
        out.println("Product not found.");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (rs != null) rs.close(); } catch (Exception e) {}
    try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
