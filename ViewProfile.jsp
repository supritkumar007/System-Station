<%@page import="java.sql.*"%>

<!DOCTYPE html>
<html>
<head>
<link rel="icon" type="image/x-icon" href="images/logo2.png">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile</title>
    
    <link href='https://unpkg.com/boxicons@2.1.4/css/boxicons.min.css' rel='stylesheet'>
    <style>
*{
   font-family:"Poppins", sans-serif;
}
.head{
    color: black;
    background-color: grey; 
    display: flex;
    justify-content: center;
    border-radius: 5px;

}
body{
    
    background-image: url(https://img.freepik.com/free-photo/natural-abstract-shadow-details_23-2149210764.jpg?w=2000&t=st=1712503318~exp=1712503918~hmac=950ffa59a435d773c2922b3ae1ff5f6215bd33bf291f77a38b5d70296221a51d);
    background-size: cover;
}
.wrapper{
    
    width: 1300px;
    height: 650px;
    border:2px solid black;
    border-radius: 25px;
   display: flex;
   margin: 20px;
   margin-left: 120px;
   box-shadow: 5px 5px 50px black;
   color:black;
   backdrop-filter:  blur(7px);
}
   input{
    font-size: 23px;
    padding-left: 20px;
    
}
   
.location{
   padding-left: 400px;
   
}

form div input{
        background-color:transparent;
        height: 30px;
         width:500px;
          border: none;
           border-bottom: 1px  solid grey;
            outline: none; margin-left: 10px;
            color:black;

}
img{
    margin-top: 10px;
}
b{
    font-size: 22px;
    padding-left: 15px;
}
    </style>
 

</head>
<body>
<%
   String r;
    r=request.getParameter("u");
   Connection con;
   Statement stmt;
     try
	{
 	Class.forName("com.mysql.jdbc.Driver");
        	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
        	stmt=con.createStatement();
	ResultSet resultSet=stmt.executeQuery("select * from register where username='"+r+"' ");
	while(resultSet.next()){
	%>

   
<div class="head">
<h1>My Profile</h1>
</div>
        <div class="wrapper">
        
         <form style="padding-top: 150px;" action="">
                
              
                <div style="padding: 20px;" class="input-box">
                  <b>User Name:</b><br> <input type="text" value="<%out.print(resultSet.getString(2));%>"  readonly>
                  </div><br>


                  <div style="padding: 20px;" class="input-box">
                     <b>Full Name:</b><br> <input type="text" value="<%out.print(resultSet.getString(3));%>"style= "" readonly>
                     </div><br>

                     <div style="padding: 20px;" class="input-box">
                        <b>Mobile No:</b><br> <input type="text" value="<%out.print(resultSet.getString(4));%>"style= "" readonly>
                        </div><br>
                
                        <div style="padding: 20px;" class="input-box">
                           <b>Email:</b><br> <input type="email" value="<%out.print(resultSet.getString(5));%>"style= "" readonly>
                           </div><br>

                 
            </form>
            <div class="img"><img src="images/profilelogo.png" style="height: 150px; align-items: center; "></div>
            <form style="padding-top: 150px;" action="">
               
               <div style="padding: 20px;" class="input-box">
                  <b>Address:</b><br> <input type="text" value="<%out.print(resultSet.getString(6));%>"style= "" readonly>
                  </div><br>
 
                  <div style="padding: 20px;" class="input-box">
                     <b>State:</b><br> <input type="text" value="<%out.print(resultSet.getString(7));%>"style= "" readonly>
                     </div><br>
 
                     <div style="padding: 20px;" class="input-box">
                        <b>City:</b><br> <input type="text" value="<%out.print(resultSet.getString(8));%>"style= "" readonly>
                        </div><br>
                 
                        <div style="padding: 20px;" class="input-box">
                           <b>Pin:</b><br> <input type="text" value="<%out.print(resultSet.getString(9));%>"style= "" readonly>
                           </div><br>
            </form>

            </div>
        </div>

     
    
</body>
</html>        
<%   
     
                }
    }
            catch(Exception e) {
                out.println(e);
            } 
        %>

