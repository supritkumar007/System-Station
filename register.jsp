<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>

<%
    // String designation = request.getParameter("designation");
    String username = request.getParameter("u1");
    String fullname = request.getParameter("f1");
    String mobileno = request.getParameter("m1");
    String userEmail = request.getParameter("e1");
    String address = request.getParameter("a1");
    String state = request.getParameter("s1");
    String city = request.getParameter("c1");
    String pincode = request.getParameter("p1");
    String password = request.getParameter("pw1");
    
    Connection conn = null;
    PreparedStatement stmt = null;
    ResultSet rs = null;
    boolean usernameEmailExists = false; // Flag to indicate if username
    try {
        // Connect to MySQL database
        Class.forName("com.mysql.cj.jdbc.Driver");
        conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
        
        // Check if username or email already exists in the database
        stmt = conn.prepareStatement("SELECT * FROM register WHERE username=?");
        stmt.setString(1, username);
        rs = stmt.executeQuery();
        if(rs.next()) {
            usernameEmailExists = true;
        } else {
            // Insert new user if username and email are not already in the database
            int k = stmt.executeUpdate("INSERT INTO register VALUES('customer','"+username+"','"+fullname+"','"+ mobileno+"','"+ userEmail+"','"+ address+"','"+ state+"','"+ city+"','"+ pincode+"','"+ password+"')");
            
        }
    } catch(Exception e) {
        out.println("An error occurred: " + e.getMessage());
    } 
%>

<!DOCTYPE html>
<html>
<head>
    <title>Registration</title>
    <script>
        window.onload = function() {
            <% if(usernameEmailExists) { %>
                alert("Username is already available. Try another Username");
                window.location.href = "register1.html";
            <% } else { %>
                alert("Thank You for Registration!!");
                window.location.href = "login.html";
            <% } %>
        }
    </script>
</head>
<body>
    <!-- You can add HTML content here if needed -->
</body>
</html>
