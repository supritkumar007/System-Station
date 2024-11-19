<%@ page import="java.sql.*" %>

    <% 
    String name = request.getParameter("name");
    String phno = request.getParameter("phno");
    String email = request.getParameter("email");
    String question = request.getParameter("question");
    String date = request.getParameter("date");
    
    
    Connection conn;
    Statement stmt;
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
        stmt = conn.createStatement();
        int k = stmt.executeUpdate("INSERT INTO contactus VALUES ('" + name + "', '" + phno + "', '" + email + "','" + question + "','"+date+"')");
        %>
        <script>
            alert("Thank you for ur Time,, We Surely get back to you soon");
            document.location="contactus.html";
        </script>

        <%
    } 
    catch(Exception e) {
        out.println(e);
    } %>