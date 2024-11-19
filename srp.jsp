<%@ page import="java.sql.*" %>
<%@ page import="java.util.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<title>Shopping Cart Checkout</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css" rel="stylesheet">
</head>
<body>
    <center> <h2 style="color: #ffffff;background-color: black;">My Cart </h2></center>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
    <div class="container">
      <div class="wrapper wrapper-content animated fadeInRight">
        <div class="row">
          <div class="col-md-9">
            <div class="ibox">
              <div class="ibox-title">
                  <h5>Items in your cart</h5>
              </div>

              <div class="ibox-content">
                <div class="table-responsive">
                  <table class="table shoping-cart-table">
                    <tbody>
                      <!-- JSP code to retrieve and display cart items -->
                      <% 
                        // Database operations
                        Connection conn = null;
                        Statement stmt = null;
                        ResultSet rs = null;

                        // double totalPrice = 0;

                        try {
                            // Load the MySQL JDBC driver
                            Class.forName("com.mysql.cj.jdbc.Driver");

                            // Connect to the database
                            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");

                            // Prepare and execute the SQL query to fetch cart items
                            stmt = conn.createStatement();
                            rs = stmt.executeQuery("SELECT * FROM cart");

                            // Iterate through the result set and display cart items
                            while (rs.next()) {
                                // Retrieve data for each cart item
                                // Integer prodId = Integer.parseInt(rs.getString("product_id"));
                                
                                String productCategory = rs.getString("prod_cat");
                                String productName = rs.getString("prod_name");
                                String productDescription = rs.getString("prod_desc");
                                double productPrice = rs.getDouble("prod_price");
                                // String un = rs.getString("user");

                                // // Get the quantity entered by the user
                                // int q1 = Integer.parseInt(request.getParameter("quantity"));

                                // // Calculate total price of each product (actual price multiplied by quantity)
                                // double totalPricePerProduct = productPrice * q1;

                                // totalPrice += totalPricePerProduct;
                      %>
                      <tr class="product">
                        <td width="90">
                          <!-- Placeholder for product image -->
                          <div class="cart-product-imitation">
                            <img src="" alt="">
                          </div>
                        </td>
                        
                        <td class="desc">
                          <h3><a href="#" class="text-navy"><%= productCategory %></a></h3>
                          <p class="small"><%= productName %></p>
                          <dl class="small m-b-none">
                            <dt>Description lists</dt>
                            <dd><%= productDescription %></dd>
                          </dl>
                          <div class="m-t-sm">
                            <a href="" class="text-muted"><i class="fa fa-trash"></i> Remove item</a>

                          </div>
                        </td>
                        
                        <td>
                          <p class="price"><%= productPrice %></p>
                          <s class="small text-muted">₹230,00</s>
                        </td>
                        
                        <td width="65">
                          <input type="text" class="form-control" placeholder="1" name="quantity" class="quantity" onclick="updateTotal()">
                        </td>
                      
                        <td>
                          <!-- Display total price of each product -->
                          <div class="total">Total: 35,000</div>
                        </td>
                        <script>
                          function updateTotal() {
                            var totalPrice = 0;
                            var products = document.querySelectorAll('.product');
                            products.forEach(function(product) {
                              var priceElement = product.querySelector('.price');
                              var quantityElement = product.querySelector('.quantity');
                              var price = parseFloat(priceElement.innerText.replace('₹', '').replace(',', ''));
                              var quantity = parseInt(quantityElement.value);
                              totalPrice += price * quantity;
                            });
                            document.querySelector('.total').innerText = 'Total: ₹' + totalPrice.toFixed(2);
                          }
</script>
                      </tr>
                      <% 
                            }
                        } catch (Exception e) {
                            e.printStackTrace();
                        } finally {
                            // Close database resources
                            try { if (rs != null) rs.close(); } catch (Exception e) {}
                            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
                            try { if (conn != null) conn.close(); } catch (Exception e) {}
                        }
                      %>
                      <!-- End of JSP code to retrieve and display cart items -->
                    </tbody>
                  </table>
                </div>
              </div>

              <div class="ibox-content">
                <button class="btn btn-primary pull-right"><i class="fa fa fa-shopping-cart"></i> Checkout</button>
                <button class="btn btn-white"><i class="fa fa-arrow-left"></i> Continue shopping</button>
              </div>
            </div>
          </div>
          
          <!-- Sidebar for cart summary and support -->
          <div class="col-md-3">
            <div class="ibox">
              <!-- Cart summary -->
              <div class="ibox-title">
                <h5>Cart Summary</h5>
              </div>

              <div class="ibox-content">
                <span>Total</span>
                <!-- Display total price of all products in the cart -->
                <h2 class="font-bold" id="totalAmount">800</h2>
                <hr>
                <span class="text-muted small">
                  *For United States, France and Germany applicable sales tax will be applied
                </span>
                <div class="m-t-sm">
                  <div class="btn-group">
                    <a href="#" class="btn btn-primary btn-sm"><i class="fa fa-shopping-cart"></i> Checkout</a>
                    <a href="#" class="btn btn-white btn-sm"> Cancel</a>
                  </div>
                </div> 
              </div>
            </div>
          
            <!-- Support section -->
            <div class="ibox">
              <div class="ibox-title">
                <h5>Support</h5>
              </div>
              <div class="ibox-content text-center">
                <h3><i class="fa fa-phone"></i> +43 100 783 001</h3>
                <span class="small">
                  Please contact with us if you have any questions. We are available 24h.
                </span>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

<script src="https://code.jquery.com/jquery-1.10.2.min.js"></script>
<script src="https://netdna.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>

<script>
  // Function to calculate and display the total cart price
  function updateTotal() {
    var totalPrice = 0;
    var products = document.querySelectorAll('.product');
    products.forEach(function(product) {
      var priceElement = product.querySelector('.price');
      var quantityElement = product.querySelector('.quantity');
      var price = parseFloat(priceElement.innerText); // Assuming price is already in the correct format
      var quantity = parseInt(quantityElement.value);
      totalPrice += price * quantity;
    });
    document.querySelector('#totalAmount').innerText = totalPrice.toFixed(2); // Displaying total price in the cart summary
  }

  // Add event listener for quantity change on page load
  window.addEventListener('load', function() {
    updateTotal();
  });

  // Add event listener for quantity change
  document.querySelectorAll('.quantity').forEach(function(input) {
    input.addEventListener('change', updateTotal);
  });
</script>


</body>
</html>