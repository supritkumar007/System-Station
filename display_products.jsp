<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

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
%>
<tr>
    <td><%= rs.getInt("prod_id") %></td>
    <td><%= rs.getString("prod_name") %></td>
    <td><%= rs.getString("prod_cat") %></td>
    <td><%= rs.getString("prod_desc") %></td>
    <td><%= rs.getDouble("prod_price") %></td>
    <td><%= rs.getInt("stock") %></td>
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
