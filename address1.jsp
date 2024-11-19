<%@ page import="java.sql.*" %>
<%@ page import="java.io.*" %>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <link rel="icon" type="image/x-icon" href="images/logo2.png">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>System station</title>
  <style>
  :root {
      --color-gray: #737888;
      --color-lighter-gray: #e3e5ed;
      --color-light-gray: #f7f7fa;
    }

    *,
    *:before,
    *:after {
      box-sizing: inherit;
    }

    html {
      font-family: "Inter", sans-serif;
      font-size: 14px;
      box-sizing: border-box;
    }

    @supports (font-variation-settings: normal) {
      html {
        font-family: "Inter var", sans-serif;
      }
    }

    body {
      margin: 0;
      background-image:url(https://i.pinimg.com/736x/c3/08/8d/c3088d9f1552adc0baff48fd96306411.jpg);
      background-size: cover;
      backdrop-filter: blur(10px);
    }

    h1 {
      margin-bottom: 1rem;
    }

    p {
      color: var(--color-gray);
    }

    hr {
      height: 1px;
      width: 100%;
      background-color: var(--color-light-gray);
      border: 0;
      margin: 2rem 0;
    }

    .container {
      max-width: 40rem;
      padding: 10vw 2rem 0;
      margin: 0 auto;
      height: 100vh;
    }

    .form {
      display: grid;
      grid-gap: 1rem;
    }

    .field {
      width: 100%;
      display: flex;
      flex-direction: column;
      border: 1px solid var(--color-lighter-gray);
      padding: .5rem;
      border-radius: .25rem;
    }

    .field__label {
      color: var(--color-gray);
      font-size: 0.6rem;
      font-weight: 300;
      text-transform: uppercase;
      margin-bottom: 0.25rem
    }

    .field__input {
      padding: 0;
      margin: 0;
      border: 0;
      outline: 0;
      font-weight: bold;
      font-size: 1rem;
      width: 100%;
      -webkit-appearance: none;
      appearance: none;
      background-color: transparent;
    }

    .field:focus-within {
      border-color: #000;
    }

    .fields {
      display: grid;
      grid-gap: 1rem;
    }

    .fields--2 {
      grid-template-columns: 1fr 1fr;
    }

    .fields--3 {
      grid-template-columns: 1fr 1fr 1fr;
    }

    .button {
      background-color: #000;
      text-transform: uppercase;
      font-size: 0.8rem;
      font-weight: 600;
      display: block;
      color: #fff;
      width: 100%;
      padding: 1rem;
      border-radius: 0.25rem;
      border: 0;
      cursor: pointer;
      outline: 0;
      margin-top:-30px
    }

    .button:focus-visible {
      background-color: #333;
    }

    span.price {
      float: right;
      color: grey;
    }

    .col-25 {
      padding: 0 16px;
    }

    .container {
      background-color: #f2f2f2;
      padding: 5px 20px 15px 20px;
      border: 1px solid lightgrey;
      border-radius: 3px;
      box-shadow: 0px 10px 50px black  ;
    }

    .order {
            border: 2px solid #f5f3f3;
            border-radius: 5%;
            padding: 10px;
            margin-bottom :20px;
            width: 75%;
            
            align-items: center;
            background-color: #ffff;
        }
        .order{
            margin: auto;
            margin-bottom: 20px;
            box-shadow:  5px 8px 8px rgba(0, 0, 0,  0.2);
        }
        
        .order img {
            width: 100px;
            height: 100px;
            margin-right: 10px;
            float: left;
        }
        .order .details {
            float: left;
            width: calc(100% - 120px);
        }
</style>
</head>
<body>
<form action="payment.jsp" method="post">
<div class="container">
  <h1>Shipping</h1>
  <p>Please check for your shipping details.</p>
  <hr />
  <div class="form">
    <%  
        String prodId = request.getParameter("prodId");
        String username = request.getParameter("un");
        String password = request.getParameter("pwd");
        Connection conn = null;
        PreparedStatement productStmt = null;
        PreparedStatement registerStmt = null;
        PreparedStatement priceStmt = null;
        ResultSet rs = null;

        try {
            // Connect to the database
            Class.forName("com.mysql.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost/system_station", "root", "9353");

            // Retrieve data from the product table based on prodId
            
            String productQuery = "SELECT * FROM product WHERE prod_id = ?";
            productStmt = conn.prepareStatement(productQuery);
            productStmt.setString(1, prodId);
            rs = productStmt.executeQuery();

            // Display product details
            if (rs.next()) {
    %>
    <input type="hidden" name="prodId" value="<%=rs.getString("prod_id")%>" style="border:none;" readonly>
    
            <div class="order">
                <a href="#"><img src="<%= rs.getString("prod_img") %>" alt="Product Image"></a>
                <div class="details">
                    <p><strong><%= rs.getString("prod_name") %></strong></p>
                    <p><%= rs.getString("prod_desc") %></p>
                </div>
            </div>
    <%
            }
            

            // Retrieve data from the register table based on username
            
            String registerQuery = "SELECT * FROM register WHERE username = ?";
            registerStmt = conn.prepareStatement(registerQuery);
            registerStmt.setString(1, username);
            rs = registerStmt.executeQuery();

            // Display user details
            if (rs.next()) {
    %>
            <input type="hidden" name="un" value="<%=username%>">
            <input type="hidden" name="pwd" value="<%=password%>">
            <div class="fields fields">
                <label class="field">
                    <span class="field__label" for="firstname">Full Name</span>
                    <input class="field__input" type="text" name="fname" value="<%= rs.getString("fname") %>" />
                </label>
            </div>
            <label class="field">
                <span class="field__label" for="address">Address</span>
                <input class="field__input" type="text" id="address" name="address" value="<%= rs.getString("address") %>" />
            </label>
            <div class="form">
                <div class="fields fields--2">
                    <label class="field">
                        <span class="field__label" for="firstname">Email</span>
                        <input class="field__input" type="text" name="email" value="<%= rs.getString("email") %>" />
                    </label>
                    <label class="field">
                        <span class="field__label" for="lastname">PhoneNo</span>
                        <input class="field__input" type="text" name="phno" value="<%= rs.getString("mobileno") %>" />
                    </label>
                </div>
                <div class="fields fields--3">
                    <label class="field">
                        <span class="field__label" for="zipcode">Pin code</span>
                        <input class="field__input" type="text" id="zipcode" value="<%= rs.getString("pincode") %>" />
                    </label>
                    <label class="field">
                        <span class="field__label" for="city">City</span>
                        <input class="field__input" type="text" id="city" value="<%= rs.getString("city") %>" />
                    </label>
                    <label class="field">
                        <span class="field__label" for="state">State</span>
                        <input class="field__input" type="text" id="state" value="<%= rs.getString("state") %>" />
                    </label>
                </div>
            </div>
    <%
    } 
      String priceQuery = "SELECT * FROM product WHERE prod_id = ?";
            priceStmt = conn.prepareStatement(priceQuery);
            priceStmt.setString(1, prodId);
            rs = priceStmt.executeQuery();

            if (rs.next()) {
              %>
              </div>
              <div class="col-25">
                <div class="Product">
                  <h4>Cart <span class="price" style="color:black"><i class="fa fa-shopping-cart"></i> <b></b></span></h4>
                  <p><%= rs.getString("prod_name") %><span class="price">&#8377;<%= rs.getString("prod_price") %></span></p>       
                  <h4>Total <span class="price" style="color:black"><b>&#8377;<%= rs.getString("prod_price") %></b></span></h4>
                  <hr>
                  
                  <button class="button"><a href="" style="color:white;text-decoration:none;">Continue</a></button>

                </div>
              </div>
              
              <%
            }
        }   
         catch (SQLException | ClassNotFoundException e) {
            out.println("An error occurred: " + e.getMessage());
            e.printStackTrace();
        } finally {
            // Close resources
            try {
                if (rs != null) rs.close();
                if (productStmt != null) productStmt.close();
                if (registerStmt != null) registerStmt.close();
                if (priceStmt != null) priceStmt.close();
                if (conn != null) conn.close();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }
    %>
  </div>
</div>
</form>
</body>
</html>