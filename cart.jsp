<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
<link rel="icon" type="image/x-icon" href="images/logo2.png">
<meta charset="utf-8">
<title>Shopping Cart</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
<style>
body{
    background-image: url(https://images.rawpixel.com/image_800/cHJpdmF0ZS9sci9pbWFnZXMvd2Vic2l0ZS8yMDIyLTA1L3JtMjY3LW51bm55LTA0Yi5qcGc.jpg);
    background-size: cover;
    backdrop-filter: blur(3px);
}

.container{
  width: 90%;
  margin: auto;
  padding: 10px 0px 0px 20px;
}


  .cart-product-img { width: 90px; }
  .product-desc { font-size: 14px; }
  .remove-item { color: #999; }
  .total-price { font-weight: bold; }
  /* CSS for the middle table */
.cart table {
    width: 100%;
    border-collapse: collapse;
    margin-bottom: 20px;
    
}

.cart table th,
.cart table td {
    border: 2px solid #white;
    padding: 15px;
    text-align: left;
}

.cart table th {
    background-color: #f2f2f2;
    color: #333;
}

.cart table tbody tr:nth-child(even) {
    background-color: #f9f9f9;
}

.cart table tbody tr:hover {
    background-color: #f5f5f5;
}
.cart-product-img {
    width: 90px;
}

</style>

<script>
  function updateTotalPrice(row) {
    var quantity = row.querySelector(".quantity").value;
    if (quantity == 0) {
        row.remove(); // Remove the row if quantity is zero
        updateCartTotal(); // Update the cart total after removing the row
    } else {
        var price = parseFloat(row.querySelector(".price").innerText);
        var totalPrice = quantity * price;
        row.querySelector(".total-price").innerText = totalPrice.toFixed(2);
        updateCartTotal();
    }
}

function updateCartTotal() {
    var cartTotal = 0.0;
    var rows = document.querySelectorAll("tbody tr");
    if (rows.length === 0) { // Check if the cart is empty
        document.getElementById("cart-total").innerText = "null"; // Set total to null if cart is empty
        localStorage.removeItem("cartTotal"); // Remove cart total from localStorage if cart is empty
        return;
    }
    rows.forEach(function(row) {
        var totalPrice = parseFloat(row.querySelector(".total-price").innerText);
        cartTotal += totalPrice;
        document.getElementById("cart-total").innerText = cartTotal.toFixed(2);
    });
    

    // Store the cart total value in localStorage
    //localStorage.setItem("cartTotal", cartTotal.toFixed(2));
}

// Function to retrieve cart total value from localStorage on page load
//window.onload = function() {
  //  var savedCartTotal = localStorage.getItem("cartTotal");
    //if (savedCartTotal !== null) { // Check if cart total is saved in localStorage
      //  document.getElementById("cart-total").innerText = savedCartTotal;
    //} else {
        //document.getElementById("cart-total").innerText = "null"; // Set total to null if no saved value found
    //}
//};

</script>



</head>
<body>
  <%-- <form action="cartaddress.jsp" method="post"> --%>
    <center> <h1 class="cart-title" style="padding-top:20px"><b>My Cart</b></h1></center>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container">
      <div class="row">
        <div class="col-md-9">
          <div class="cart">
            <div class="cart-header">
                <h5 style="font-size:20px"><b>Items in Cart</b></h5>
            </div>
            <div class="cart-footer" style="margin-left:65%">
              <p><b>*First Add your Quantity to the right of each item.</b></p>
            </div>

            <table>
              <thead>
                  <tr>
                      <th>Remove</th>
                      <th>Image</th>
                      <th>Name</th>
                      <th>Category</th>
                      <th>Description</th>
                      <th>Price</th>
                      <th>Quantity</th>
                      <th>Total Price</th>
                  </tr>
              </thead>
              <tbody>
              
                  <%
			String s1=request.getParameter("un");
      String s2=request.getParameter("pwd");
                      try {
                          Class.forName("com.mysql.jdbc.Driver");
                          Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
                          Statement stmt = conn.createStatement();
                          ResultSet rs = stmt.executeQuery("SELECT * FROM cart");
      
                          while (rs.next()) {
                              
                                // Retrieve data for each cart item
                                Integer prodId = Integer.parseInt(rs.getString("prod_id"));
                                
                                String productCategory = rs.getString("prod_cat");
                                String productName = rs.getString("prod_name");
                                String productDescription = rs.getString("prod_desc");
                                double productPrice = rs.getDouble("prod_price");
                                String prod_img = rs.getString("prod_img");

                            
                              %>


                              <tr>

                              <td><a href="delete_cart.jsp?id=<%= prodId %>" style="text-decoration:none;color:red;border:2px solid red"><b>Remove</b></a></td>
                              <td><img src="<%=prod_img%>" class='cart-product-img' alt='Product Image'></td>
                              <td><%= productName %></td>
                              <td><%= productCategory %></td>
                              <td><%= productDescription %></td>
                              <td class='price'><%= productPrice %></td>
                              <td><input type='number' class='quantity'   onchange='updateTotalPrice(this.parentNode.parentNode)' required></td>
                              <td class='total-price'><%= productPrice %></td>
                              </tr>
                              <%
                          }

                          rs.close();
                          stmt.close();
                          conn.close();
                      } catch (Exception e) {
                          out.println("Error: " + e.getMessage());
                      }
                  %>
              </tbody>
          </table>

            
          </div>
        </div>
        
        <div class="col-md-3">
          <div class="cart-summary">
            <div class="cart-header">
              <h5>Cart Summary</h5>
            </div>

            <div class="cart-content">
              <span>Total</span>
               <h2> &#8377;<span id="cart-total" name="cart-total">0.00</span></h2>
              <hr>
              <%-- <span class="small text-muted">
                *Applicable sales tax will be applied for certain countries
              </span> --%>
              <div class="actions">
                <a href="cartaddress.jsp?user=<%=s1%>&pw=<%=s2%>" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> Checkout</a>
                
              </div> 
            </div>
          </div>
        
          <div class="support">
            <div class="support-header">
              <h5>Support</h5>
            </div>
            <div class="support-content">
              <h3><i class="fa fa-phone"></i> +91 76248 04287</h3>
              <span class="small">
                Contact us for any questions. We're available 24/7.
              </span>
            </div>
          </div>
        </div>
      </div>
    </div>
    <%-- </form> --%>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

</body>
</html>
