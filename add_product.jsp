<%@ page import="java.sql.*" %>
<%@ page import="java.util.Random" %>

<%
String productName = request.getParameter("product_name");
String productCategory = request.getParameter("product_category");
String productDescription = request.getParameter("product_description");
double productPrice = Double.parseDouble(request.getParameter("product_price"));
int productStock = Integer.parseInt(request.getParameter("product_stock"));

Random random = new Random();
int productId = random.nextInt(9000) + 1000;

Connection conn = null;
PreparedStatement pstmt = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
    String query = "INSERT INTO product (prod_id, prod_name, prod_cat, prod_desc, prod_price, stock) VALUES  (?, ?, ?, ?, ?, ?)";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, productId);
    pstmt.setString(2, productName);
    pstmt.setString(3, productCategory);
    pstmt.setString(4, productDescription);
    pstmt.setDouble(5, productPrice);
    pstmt.setInt(6, productStock);
    pstmt.executeUpdate();
    %>
    <script>
        alert('Product added successfully.');
        window.location.href='Product.jsp';
    </script>
    <%
} catch (NumberFormatException nfe) {
    out.println("<script>alert('Error: Invalid product price or stock value. Please enter valid numeric values.');</script>");
} catch (Exception e) {
    out.println("<script>alert('Error adding product: " + e.getMessage() + "');</script>");
} finally {
    try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
