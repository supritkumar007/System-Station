<%@ page import="java.sql.*" %>

<%
// Retrieve form parameters
int productId = Integer.parseInt(request.getParameter("product_id"));
String productName = request.getParameter("product_name");
String productCategory = request.getParameter("product_category");
String productDescription = request.getParameter("product_description");
double productPrice = Double.parseDouble(request.getParameter("product_price"));
int productStock = Integer.parseInt(request.getParameter("product_stock"));

// Update product details in the database
Connection conn = null;
PreparedStatement pstmt = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
    String query = "UPDATE product SET prod_name = ?, prod_cat = ?, prod_desc = ?, prod_price = ?, stock = ? WHERE prod_id = ?";
    pstmt = conn.prepareStatement(query);
    pstmt.setString(1, productName);
    pstmt.setString(2, productCategory);
    pstmt.setString(3, productDescription);
    pstmt.setDouble(4, productPrice);
    pstmt.setInt(5, productStock);
    pstmt.setInt(6, productId);
    int rowsAffected = pstmt.executeUpdate();
    if (rowsAffected > 0) {
%>
<script>
    alert('Product updated successfully.');
    window.location.href='Product.jsp';
</script>
<%
    } else {
        out.println("Failed to update product.");
    }
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
