<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html> 
<html>
<head>
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
    <link href="" rel="stylesheet">
    <title>System Station.in</title>
    <!-- Load SMTPJS library -->
    <script src="https://smtpjs.com/v3/smtp.js"></script>
</head>
<style>
     body {
        text-align: center;
        padding: 40px 0;
        background: #EBF0F5;
    }
    h1 {
        color: #88B04B;
        font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
        font-weight: 900;
        font-size: 40px;
        margin-bottom: 10px;
    }
    p {
        color: #404F5E;
        font-family: "Nunito Sans", "Helvetica Neue", sans-serif;
        font-size:20px;
        margin: 0;
    }
    i {
        color: #9ABC66;
        font-size: 100px;
        line-height: 200px;
        margin-left:-15px;
    }
    .card {
        background: white;
        padding: 60px;
        border-radius: 4px;
        box-shadow: 0 2px 3px #C8D0D8;
        display: inline-block;
        margin: 0 auto;
    }
</style>
<body>
<%
// Get email and order_id parameters from request
String email = request.getParameter("e");
String orderId = request.getParameter("order");

Connection con = null;
Statement stmt = null;

try {
    // Load MySQL JDBC driver
    Class.forName("com.mysql.cj.jdbc.Driver");
    
    // Establish database connection
    con = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
    
    // Create statement
    stmt = con.createStatement();
    
    // Insert into ledger table with current date
    int i = stmt.executeUpdate("INSERT INTO ledgers (orderId, cust_name, email, prod_id, prod_name, prod_cat, prod_desc, prod_img, total_amt, address, deliver_date, phno) " +
                                "SELECT orderId, cust_name, email, prod_id, prod_name, prod_cat, prod_desc, prod_img, total_amt, address, CURDATE(),phno " +
                                "FROM orders WHERE orderId='" + orderId + "'");
    
    // Delete from orders table
    int d = stmt.executeUpdate("DELETE FROM orders WHERE orderId='" + orderId + "'");
    
} catch (Exception e) {
    out.println(e);
} 
%>
<div class="card">
    <!-- Display delivery confirmation message -->
    <div style="border-radius: 200px; height: 200px; width: 200px; background: #F8FAF5; margin: 0 auto;">
        <img src="images/tick.gif" alt="Computer man" style="width: 100%;">
    </div>
    <h1>Delivery Confirmed</h1> 
    <!-- Hidden input to store email -->
    <input type="hidden" id="e" value="<%= email %>">
    <!-- Button to confirm delivery -->
    <button style="width: 400px; margin-top: 30px; padding: 20px; color: green; font-size: 18px;" onclick="sendOTP()">Confirm</button>     
</div>

<script>
    function sendOTP() {
        const email = document.getElementById('e');
        let emailbody = `<div style="height : 300px;width: 500px; margin: 20px; border: 2px solid black; background-color: black;">
        <div style="display: flex;">
        <img src="https://i.postimg.cc/bwsBDW5k/logo2.png" alt="" height="100px" width="120px" style="margin: 10px;">
        <h1 style="margin-left: 20px; color: azure; font-size:35px; padding-top: 20px;">System Station</h1><br/>
    </div>
        <hr>
        <h1 style="color: azure; margin: 25px;">Your Order Is Successfully Delivered<br>Keep Shopping With Us</h1>
        
    </div>`;
        Email.send({
        SecureToken : "6ac31da1-1dc5-4804-8fb6-962206c361b1",
        To : email.value,
        From : "systemstation06@gmail.com",
        Subject : "Email OTP using JavaScript",
        Body : emailbody,
    }).then(

        message => {	
            if (message === "OK") {
                window.location.href="delivery.jsp";
            }
            else{
              alert("error");
            }
        }
    );
    }
</script>

</body>
</html>
