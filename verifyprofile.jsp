<%@ page import="java.sql.*" %>
<%
    String pusername = request.getParameter("pusername");
    Connection conn;
    Statement stmt;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
        stmt = conn.createStatement();
        ResultSet rs = stmt.executeQuery("SELECT * FROM editprofile WHERE pusername='" + pusername + "'");
        if (rs.next()) {
            response.sendRedirect("ViewProfile.jsp?pusername=" + pusername);
        } else {
            // Username not found, redirect to profile.html with alert message
%>
            <script>
                alert("pusername is not found");
                window.location.href = "Editprofile.html";
            </script>
<%
        }
        conn.close();
    } catch (Exception e) {
        out.println(e);
    }
%>
