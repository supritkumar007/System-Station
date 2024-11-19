<%@ page import="java.sql.*" %>

<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="icon" type="image/x-icon" href="titleicon.jpg">
<script src="https://smtpjs.com/v3/smtp.js"></script>
<title>Payment</title>
<style>
body {
  font-family: Arial;
  font-size: 17px;
  padding: 8px;
}

* {
  box-sizing: border-box;
}

.row {
  display: flex;
  flex-wrap: wrap;
  margin: 0 -16px;
}

.col-25 {
  -ms-flex: 25%; /* IE10 */
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
  background-color: rgb(12, 13, 74);
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
  background-color: #04AA6D;
  color: white;
  padding: 12px;
  margin: 10px 0;
  border: none;
  width: 100%;
  border-radius: 3px;
  cursor: pointer;
  font-size: 17px;
}

.btn:hover {
  background-color: #45a049;
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
    display: none;
    gap: 20px;
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

</style>
</head>
</head>


<body>
<div class="row">
  <div class="col-75">
    <div class="container">
      <h2 align="center"><u>PAYMENT DETAILS</u></h2>
      
        <div class="row">
          <div class="col-50">
            <h3>Billing Address</h3>
            <label for="fname"><i class="fa fa-user"></i> Full Name</label>
            <input type="text" id="fname" name="firstname" placeholder="muhammad adil" required>
            <label for="email"><i class="fa fa-envelope"></i> Email</label>
            <input type="email" id="email" name="email" placeholder="adil@gmail.com" required>
            <label for="adr"><i class="fa fa-phone"></i>Phone number</label>
            <input type="text" id="adr" name="address" placeholder="9358695215" required>
            <label for="city"><i class="fa fa-user"></i> Peoples  </label>
            <input type="text" id="city" name="city" placeholder="2 peoples" required>

            <div class="row">
              <div class="col-50">
                <label for="state">Date</label>
                <input type="date" id="state" name="state" value="2024-03-20">
              </div>
              <div class="col-50">
                <label for="zip">Time</label>
                <input type="time" id="zip" name="zip" value="12:30">
              </div>
            </div>
          </div>

          <div class="col-50">
            <h3>Payment</h3>
            <form id="checkout-form"> ----------------
            <div class="payop" style="float: right;">
            
            <label for="upi-id">Please Select Payment Option</label>
            <select id="payment-method" name="payment-method" style="width: 230px; height: 30px; border-radius: 20px; border: none; padding-left: 15%;">
              <option value="">--select payment option--</option>
              <option value="upi">UPI</option>
              <option value="card">Card</option>
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
            <input type="text" id="upi-id" name="upi-id" placeholder="muhammadadil@ibl" required>
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
            <input type="text" id="cname" name="cardname" placeholder="Muhammad adil" required>
            <label for="ccnum">Credit card number</label>
            <input type="text" id="ccnum" name="cardnumber" placeholder="1111-2222-3333-4444" required>
            <label for="expmonth">Exp Month</label>
            <input type="text" id="expmonth" name="expmonth" placeholder="September" required>
            <div class="row">
              <div class="col-50">
                <label for="expyear">Exp Year</label>
                <input type="text" id="expyear" name="expyear" placeholder="2029" required>
              </div>
              <div class="col-50">
                <label for="cvv">CVV</label>
                <input type="text" id="cvv" name="cvv" placeholder="352" required>
              </div>
            </div>
          </div>
        </div>
        </div>

        <!-- otp -->
        <button class="btn" onclick="sendOTP()">Confirm the Booking</button>
      </form> -------------
    </div>
  </div>
  <div class="col-25">
    <div class="container">
      <h4 align="center">Booking Price Details</h4>
      <hr>
      Base Price <span class="price">11,999.00</span></p>
      Hotel Taxes <span class="price">859.50</span></p>   <!---->
      Hotel Discount<span class="price"><del>1,500.00</del></span></p>
      Apply Coupon Discount <span class="price"><input type="che" onclick="pricefunction()" id="promo"></span></p>
      Coupon Discount<span class="price"><del>1,999.50</del></span></p>
      <hr>
      <p>Total <span class="price" id="price"><b><%=rs.getString(10)%></b></span></p>  
    </div>
  <%
conn.close();
catch(Exception e){
  out.println(e);
}
%>
  
    <!-- otp -->
    <div class="otpverify">
      <input type="text" id="otp_inp" placeholder="Enter The Transaction PIN, sent to your Email..." style="width: 100%; height: 40px; margin-top: 20px; background-color: rgb(201, 202, 201); border: 1px solid black;"><br>
      <button class="btn" id="otp-btn" style="margin-top: 80px; margin-left: -390px;" >Pay </button> 
  </div>
  </div>
</div>


<script>
  document.getElementById("payment-method").addEventListener("change", function() {
  var selectedOption = this.value;
  var upiDetails = document.getElementById("upi-details");
  var cardDetails = document.getElementById("card-details");

  if (selectedOption === "upi") {
      upiDetails.classList.add("show");
      cardDetails.classList.remove("show");
  } else if (selectedOption === "card") {
      cardDetails.classList.add("show");
      upiDetails.classList.remove("show");
  }
});

document.getElementById("checkout-form").addEventListener("submit", function(event) {
     event.preventDefault(); // Prevent form submission for demonstration purposes
    
//     // Here you can add code to handle form submission, like sending data to the server
    

});
<!-- Promo code-->

function pricefunction(){
  var x = document.getElementById("promo").value;
  
  document.getElementById("price").innerHTML = "<b>659</b>";
} 



function sendOTP() {
    const email = document.getElementById('email');
    const otpverify = document.getElementsByClassName('otpverify')[0];

    let otp_val = Math.floor(Math.random() * 100);
    
    let emailbody = `<h2>Your Transaction PIN is </h2>${otp_val}`;
    Email.send({
        SecureToken : "4de9d317-3aa2-480f-bf1a-bb233074f8cf",
        To : email.value,
        From : "travel123flow@gmail.com",
        Subject : "Payment Transaction PIN",
        Body : emailbody,
    }).then(

        message => {
            if  (message === "OK") {
                alert("Transaction PIN  is sent to your email : " + email.value);

                otpverify.style.display = "flex";
                const otp_inp = document.getElementById('otp_inp');
                const otp_btn = document.getElementById('otp-btn');

                otp_btn.addEventListener('click', () => {
                    if (otp_inp.value == otp_val) {
                      window.location.href = "booksuccess.html";
                    }
                    else{
                        alert("Invalid Transaction PIN");
                    }
                })
            }
        }
);
}

</script>

</body>

</html>