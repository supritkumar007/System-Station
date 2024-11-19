<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Delivery Orders</title>
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
            padding: 5px;
            margin-bottom :20px;
            width: 98%;
            align-items: center;
            margin: auto;
            margin-bottom: 20px;
            background-color: #ffffffa9;
            padding-bottom:30px;    
            display:flex;
            gap:50px;  
        }
        .order .o{
            margin-left:10px;
            font-size: larger;
        }
        
        .order img {
            width: 200px;
            height: 200px;
            margin-left: 10px;
            padding-top: 20px;
            <%-- border: 2px solid black; --%>
        }
        .order .details {
            float: left;
            width: 400px;
            height: max-content;
            line-height: 2;
            margin-left: 10px;
            <%-- border:2px solid black; --%>
            font-size: larger;
            margin-top: 20px;
        }
        .address {
            font-size: larger;
            width:200px;
        }
        
        .actions button{
            width: 200px;
            height: 40px;
            font-size: large;
            /*background-color: #f6c87e;*/
            text-align:center;
            cursor:pointer;
            outline: none;
            border:none;
            margin-left:60px;
            background-image: linear-gradient(to right,#ffd969 ,#ffa76b);
            -webkit-box-shadow: inset 0 0 10px rgba(255,125,107,.5),0 1px  3px rgba(0,0,0,.1);
            box-shadow: inset 0 0 10px rgba(255,125,107,.5),0 1px 3px rgba(0,0,0,.1)
        }

        .actions button:hover {
           /* background-color: #fcd3a2; */
            transform: scale(1.05);
            transition: all .3s ease-in-out;
            
        }

        .actions button a{
            text-decoration: none;
            color: black;
            font-size: larger;
        }

        .header{
            width:100%;
            
        }

        .header h2{
            color:white;
            font-size:40px;
            margin-left:5%;
        }

        .foot{
            margin-left:88%;
        }
        .foot a{
            text-decoration:none;
            color:white;
            border:2px solid white;
            padding:0px 20px 5px 20px;
        }
        .foot a:hover{
            color:red;
        }
    </style>
</head>
<body>
<div class="header" style="display:flex">
<img src="images/logo2.png" alt="logo" style="width:130px;height:100px;">
<h2>Delivery Orders</h2>
</div>
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
    <form action="deliveryotp.jsp" method="post">
    <div class="order">
        <p class="o"><strong>Order ID:</strong> <%= rs.getInt(1) %></p>
        <a href="#"><img src="<%= rs.getString(8) %>" alt="Product Image"></a>


        <div class="details">
            <strong><%= rs.getString(5) %></strong>
            <p><%= rs.getString(7) %></p>
            <strong>Price : &#8377;<%= rs.getString(9) %></strong>
        </div>
        <div class="address">
            <strong><%= rs.getString(2) %></strong>
            <p><%= rs.getString(11) %></p>
            <p><%= rs.getString(3) %></p>
            <p>+91 <%= rs.getString(12) %></p>
            <input type="hidden" name="e" value="<%= rs.getString(3) %>">
            <input type="hidden" name="o" value="<%= rs.getInt(1) %>">
        </div>
        <div class="actions">
            <button>Delivered</button> 
        </div>
    </div>
    </form>
    
    <%
}
}catch(Exception e){
    out.println(e);
}
%>
<div class="foot">
<h1><a href="logout.html">Logout</a></h1>
</div>
</body>
</html>