<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Your Orders</title>
    <style>
        /* Add your CSS styles here */
        html{
            background-image: url(https://images2.alphacoders.com/171/171612.jpg);
            background-size: cover;
            backdrop-filter:  blur(3px);
        }
        .order {
            border: 2px solid #f5f3f3;
            border-radius: 25px;
            padding: 10px;
            margin-bottom :20px;
            width: 75%;
            align-items: center;
            margin: auto;
            margin-bottom: 20px;
            background-color: #ffffffa9;
            padding-bottom:30px;    
        }
        .order .o{
            margin-left:40px;
            font-size: larger;
        }
        
        .order img {
            width: 200px;
            height: 200px;
            margin-left: 40px;
            float: left;
            <%-- border: 2px solid black; --%>
        }
        .order .details {
            float: left;
            width: 800px;
            height: max-content;
            line-height: 2;
            margin-left: 40px;
            <%-- border:2px solid black; --%>
            font-size: larger;
            margin-top: 20px;
        }
        .order .actions {
            clear: both;
            margin-top: 40px;
        }
        .button {
            padding: 5px 10px;
            background-color: blue;
            color:black;
            border: none;
            border-radius: 3px;
            cursor: pointer;
            margin-right: 5px;
            width: 200px;
            margin-top: 20px;
        }
        .button:hover {
            background-color:skyblue;
        }
        .actions{
          text-align: center;
          color: #ccc;  
        }

        .actions button a{
            text-decoration: none;
            color: black;
            font-size: larger;
        }

        h2{
            margin-top: -5px;
            margin-left: 650px;
            color: #f5f3f3;
            font-size:40px;
        }
    </style>
</head>
<body>
<h2>My Orders</h2>
<%
Connection conn;
Statement stmt;
ResultSet rs;
try{
    Class.forName("com.mysql.jdbc.Driver");
    conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
    stmt = conn.createStatement();
    rs = stmt.executeQuery("SELECT * FROM orders");

    while(rs.next()){
%>
    <div class="order">
        <p class="o"><strong>Order No:</strong> <%= rs.getInt(1) %></p>
        <a href="#"><img src="<%= rs.getString(8) %>" alt="Product Image"></a>

        <div class="details">
            <strong><%= rs.getString(5) %></strong>
            <p><%= rs.getString(7) %></p>
            <strong>Price : &#8377;<%= rs.getString(9) %></strong>
        </div>
        <div class="actions">
            
            
        </div>
    </div>
    
    <%
}
}catch(Exception e){
    out.println(e);
}
%>
</body>
</html>