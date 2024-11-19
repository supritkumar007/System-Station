<%@page import="java.sql.*"%>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<html>

<head>
<link rel="icon" type="image/x-icon" href="images/logo2.png">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
  <script src="https://smtpjs.com/v3/smtp.js"></script>
  <title>Payment</title>
  <style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
  background-image:url(https://static.vecteezy.com/system/resources/previews/009/532/442/original/simple-and-minimalist-cover-design-with-black-and-white-abstract-background-design-for-website-poster-banner-vector.jpg);
  background-size: cover;
  backdrop-filter: blur(5px);
}

* {
  box-sizing: border-box;
}

.row {
  display: flex;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
  width: 400px;
  flex: 25%;
}

.col-50 {
  -ms-flex: 50%; /* IE10 */
  flex: 50%;
}

.col-75 {
  flex: 75%;
}

.col-25,
.col-50,
.col-75 {
  padding: 0 16px;
}

.container {
  color: white;
  background-color: rgba(0, 0, 0, 0.716);
  
  padding: 5px 20px 15px 20px;
  border: 2px solid rgb(0, 0, 0);
  border-radius: 30px;

}

input{
  width: 100%;
  margin-bottom: 20px;
  padding: 12px;
  border: 1px solid #ccc;
  border-radius: 3px;
}
#payoptions{
  border-radius: 5px;
  border: none;
  background-color: #85bca8;
  font-weight: 900;
  cursor: pointer;
  width: 100px; 
  height: 35px;
}
label {
  margin-bottom: 10px;
  display: block;
}

.icon-container {
  margin-bottom: 20px;
  padding: 7px 0;
  font-size: 24px;
}

.btn {
  background-color: rgba(0, 0, 0, 0.716);
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: 2px solid white;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: grey;
  color:black;
  border:2px solid black;
}

a {
  color: #2196F3;
}

hr {
  border: 1px solid lightgrey;
}

span.price {
  float: right;
  color: rgb(255, 255, 255);
}
.payment-details {
  display: none;
}

.show {
  display: block;
}
.otpverify {
    width: 100%;
    margin-top:25px;
    margin-right:20px;
    border-radius:25px;
    display:none;
    gap: 20px;
    background-color: rgba(0, 0, 0, 0.716);
    padding:40px;

}

.otpverify  input{
    width: 250px;
    height: 40px;
    text-align: center;
}

.otpverify  button{
    width: 250px;
    height: 40px;
}

#promo{
  width: 0;
  height: 0;
  border-radius: 50px;
  margin-left: -20px;
  border: none;
}
#promo:active{
  background-color: #09704b;
  border-radius: 20px;
  border: none;
}

    /* Added style for the cash-on-delivery-message */
    #cash-on-delivery-message {
      display: none;
      color: white;
      text-align: center;
      margin-top: 10px;
    }
  </style>
</head>

<body>
<%

String un=request.getParameter("user");
String pwd=request.getParameter("pass");
String fname=request.getParameter("fname");
String email=request.getParameter("email");
String pn=request.getParameter("phno");
String address=request.getParameter("address");
String paymentMethod=request.getParameter("payment-method");

Random random = new Random();
int orderID = random.nextInt(9000) + 1000;
%>
  <div class="row">
    <div class="col-75">
      <div class="container">
        <h2 align="center"><u>PAYMENT DETAILS</u></h2>

        <div class="row">
          <div class="col-50">
            <h3>Payment</h3>
            <form id="checkout-form">
              <div class="payop" style="float: right;">
                
                <label for="upi-id">Please Select Payment Option</label>
                <select id="payment-method" name="payment-method" class="payment-select" style="width: 230px; height: 30px; border-radius: 20px; border: none; padding-left: 15%;">
                  <option value="">-- Select Payment Option--</option>
                  <option value="upi">UPI</option>
                  <option value="card">Card</option>
                  <option value="cod">Cash on Delivery</option>
                </select>
              </div>

              <div id="upi-details" class="payment-details">
                <label for="fname">Accepted UPIs </label>
                <div class="icon-container">
                    <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSsKmwT4Lg-b_pzcg000VGriLCqu-90Ot7ibgjRQT2u1g&s" width="40px" style="border-radius: 50%;">
                    <img src="https://cdn.icon-icons.com/icons2/730/PNG/512/paytm_icon-icons.com_62778.png" width="40px" style="border-radius: 50%; background-color: white;">
                    <img src="https://cdn.worldvectorlogo.com/logos/google-pay-1.svg" width="40px" style="border-radius: 50%;">
                    <img src="https://images.softwaresuggest.com/software_logo/1551849343_amazonpay%20logo.png" width="40px" style="border-radius: 50%;">
                </div>
                <label for="upi-id">UPI ID:</label>
                <input type="text" id="upi-id" name="upi-id" placeholder="Abcde@ybl" class="payment-input" required>
            </div>
            

              <div id="card-details" class="payment-details">
                <label for="fname">Accepted Cards</label>
                <div class="icon-container">
                  <i class="fa fa-cc-visa" style="color:rgb(246, 246, 246);"></i>
                  <i class="fa fa-cc-amex" style="color:rgb(255, 255, 255);"></i>
                  <i class="fa fa-cc-mastercard" style="color:rgb(255, 255, 255);"></i>
                  <i class="fa fa-cc-discover" style="color:rgb(255, 255, 255);"></i>
                </div>
                <label for="cname">Name on Card Holder</label>
                <input type="text" id="cname" name="cardname" placeholder="Abcde" class="payment-input" required>
                <label for="ccnum">Credit card number</label>
                <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" class="payment-input" required>
                <label for="expmonth">Exp Month</label>
                <input type="text" id="expmonth" name="expmonth" placeholder="September" class="payment-input" required>
                <div class="row">
                  <div class="col-50">
                    <label for="expyear">Exp Year</label>
                    <input type="text" id="expyear" name="expyear" placeholder="2029" class="payment-input" required>
                  </div>
                  <div class="col-50">
                    <label for="cvv">CVV</label>
                    <input type="text" id="cvv" name="cvv" placeholder="352" class="payment-input" required>
                  </div>
                </div>
              </div>
          </div>
        </div>
        <div id="cash-on-delivery-message">
          <p>COD selected. Please pay the cash to the delivery person.</p>
        </div>
        <!-- OTP -->
        <a href="tick.jsp?u1=<%=un%>&p1=<%=pwd%>" style="text-decoration: none;" class="btn" >Confirm the Booking</a>
        <%
        int id;
        String d1,d2,d3,d4,d5,d6,d7,d8,d9,d10,d11;
        Connection con;
        Statement stmt;
     try
	{
 	Class.forName("com.mysql.jdbc.Driver");
        	con=DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
        	stmt=con.createStatement();
	ResultSet rs=stmt.executeQuery("select * from cart");
    
	while(rs.next()){
        id=orderID;
        d1=fname;
        d2=email;
        d3=rs.getString(1);
        d4=rs.getString(2);
        d5=rs.getString(3);
        d6=rs.getString(4);
        d7=rs.getString(6);
        d8=rs.getString(5);
        d9=paymentMethod;
        d10=address;
        d11=pn;

  try
   { 
    
     Class.forName("com.mysql.jdbc.Driver");
  con=DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station","root","9353");
  stmt=con.createStatement();
  int k=stmt.executeUpdate("insert into orders values('"+id+"','"+d1+"','"+d2+"','"+d3+"','"+d4+"','"+d5+"','"+d6+"','"+d7+"','"+d8+"','"+d9+"','"+d10+"','"+d11+"')");

  int d = stmt.executeUpdate("DELETE FROM cart");

  }
  
  catch(SQLIntegrityConstraintViolationException e)
  {
  %><script>alert("The products are already Booked.Keep Ordering new Products");document.location="cart.jsp";</script><%     
  } 
}
}
catch(Exception e)
{
out.println(e);
}

        %>
        </form>
      </div>
    </div>
      
    </div>
  </div>

  <script>
    document.getElementById("payment-method").addEventListener("change", function () {
  var selectedOption = this.value;
  var upiDetails = document.getElementById("upi-details");
  var cardDetails = document.getElementById("card-details");
  var cashOnDeliveryMessage = document.getElementById("cash-on-delivery-message");

     if (selectedOption === "upi") {
        upiDetails.classList.add("show");
        cardDetails.classList.remove("show");
        //cashOnDeliveryMessage.style.display = "none"; // Hide the Cash on Delivery message
      } else if (selectedOption === "card") {
        cardDetails.classList.add("show");
        upiDetails.classList.remove("show");
        cashOnDeliveryMessage.style.display = "none"; // Hide the Cash on Delivery message
      } else if (selectedOption === "cod") {
        upiDetails.classList.remove("show");
        cardDetails.classList.remove("show");
        cashOnDeliveryMessage.style.display = "block"; // Display the Cash on Delivery message
      }
    });



    document.getElementById("checkout-form").addEventListener("submit", function (event) {
      event.preventDefault(); // Prevent form submission for demonstration purposes

      // Here you can add code to handle form submission, like sending data to the server
    });

   
// otp



   
  </script>
</body>

</html>
