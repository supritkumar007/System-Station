<%@ page import="java.sql.*" %>

    <% 
    String profilephoto = request.getParameter("profilephoto");
    String pusername = request.getParameter("pusername");
    String fname = request.getParameter("fname");
    String lname = request.getParameter("lname");
    String mobileno = request.getParameter("mobileno");
    String gender = request.getParameter("gender");
    String state = request.getParameter("state");
    String city = request.getParameter("city");
    String pincode = request.getParameter("pincode");
    
    Connection conn;
    Statement stmt;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
        stmt = conn.createStatement();
        int k = stmt.executeUpdate("INSERT INTO editprofile VALUES ('" + profilephoto + "', '" + pusername + "', '" + fname + "','" + lname + "','" + mobileno + "','" + gender + "','" + state + "','" + city + "','" + pincode + "')");
        %>
        <script>
            alert("Updated Successfully");
            document.location="veriffyprofile.html";
        </script>

        <%
    } 
    catch(Exception e) {
        out.println(e);
    } %>