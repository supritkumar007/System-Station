<html>
  <head>
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
    <link href="" rel="stylesheet">
    <title>System Station.in</title>
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
    String un=request.getParameter("u1");
    String pw=request.getParameter("p1");
    %>
      <div class="card">
      <div style="border-radius:200px; height:200px; width:200px; background: #F8FAF5; margin:0 auto;">
        <img src="images/tick.gif" alt="Computer man" style="width:100%;">
      </div>
        <h1>Order Successful</h1> 
        <p>Your Order Is Confirmed.</p><br>
        <p>Thank You so much for your Order.</p>
        <a href="Home.jsp?username=<%= un %>&password=<%= pw %>"><input type="submit" name="" id="" value="Keep Shopping" style="width: 400px;margin-top: 30px;padding: 20px;color: green;font-size: 18px;"></a>
        
      </div>
    </body>
</html>