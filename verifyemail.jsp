<%@ page import="java.sql.*" %>
 <%         
        String email=request.getParameter("email");
            Connection conn;
            Statement stmt;
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
                stmt = conn.createStatement();
                ResultSet rs = stmt.executeQuery("SELECT * FROM register where email='"+email+"'");
                if (rs.next()) {
        %>
        
        <%
                }
else{
    %>
    <script>
        alert("Entered Email ID is not Registered");
    </script>
<%
}
            }
            catch(Exception e){
                out.println(e);
            }

%>