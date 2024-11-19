<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
	<link rel="icon" type="image/x-icon" href="images/logo2.png">
	<title>Delivery Verification</title>
	<link rel="stylesheet" href="emailotp.css">
	<script src="https://smtpjs.com/v3/smtp.js">
    </script>
</head>
<body>
	<%
        String email=request.getParameter("e");
        String oid=request.getParameter("o");
        %>
	<div class="form">
		<h1>System Station</h1><hr>
		<h1>Customer Email ID:</h1>
		<input type="hidden" id="o_id" name="o_id" value="<%=oid%>">
        <input type="email" id="email" name="email" value="<%=email%>" placeholder="Enter Email..." readOnly>
		<div class="otpverify">
			<input type="text" id="otp_inp" placeholder="Enter the OTP sent to your Email...">
			<button class="btn" id="otp-btn">Verify</button>
		</div>
		<button class="btn" onclick="sendOTP()">Send OTP</button>
	</div>	
	<script src="deliveryotp.js"></script>

</body>
</html>