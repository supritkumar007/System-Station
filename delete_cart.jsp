<%@ page import="java.sql.*" %>
<%
int productId = Integer.parseInt(request.getParameter("id"));
String user = request.getParameter( "us" );
Connection conn = null;
PreparedStatement pstmt = null;
try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
    String query = "DELETE FROM cart WHERE prod_id = ? ";
    pstmt = conn.prepareStatement(query);
    pstmt.setInt(1, productId);
    pstmt.executeUpdate();
    response.sendRedirect("cart.jsp");
} catch (Exception e) {
    e.printStackTrace();
} finally {
    try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
    try { if (conn != null) conn.close(); } catch (Exception e) {}
}
%>
