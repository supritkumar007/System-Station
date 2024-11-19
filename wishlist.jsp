<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <link rel="icon" type="image/x-icon" href="images/logo2.png">
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Wishlist</title>
    <!-- Include any CSS files if needed -->
    
    <link href="https://stackpath.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="wishlist.css">
</head>
<body>
<center> <h2 class="wishlist-title" style="padding-top:30px;font-size:50px">My Wishlist</h2></center>

    <%
        Connection conn = null;
        PreparedStatement pstmt = null;
        ResultSet rs = null;

        try {
            // Establish database connection
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");

            // Prepare SQL query to fetch product details based on prod_id
            String sql = "SELECT * FROM wishlist";
            pstmt = conn.prepareStatement(sql);
            
            // Execute the query
            rs = pstmt.executeQuery();

            // Display the fetched product details
            while (rs.next()) {
                int prodId = rs.getInt("prod_id");
                String productName = rs.getString("prod_name");
                String productDescription = rs.getString("prod_desc");
                double productPrice = rs.getDouble("prod_price");
                String prodImg = rs.getString("prod_img");
    %>

<div class="py-3 py-md-5">
        <div class="container">
    
            <div class="row">
                <div class="col-md-12">
                    <div class="shopping-cart">

                        <div class="cart-header d-none d-sm-none d-mb-block d-lg-block">
                            <div class="row">
                                <div class="col-md-6">
                                    <h4>Products name</h4>
                                </div>
                                <div class="col-md-2">
                                    <h4>Price</h4>
                                </div>
                               
                                <div class="col-md-2">
                                    <h4>Remove</h4>
                                </div>

                            </div>
                        </div>
                        
                        
                        <div class="cart-item">
                            <div class="row">
                                <div class="col-md-6 my-auto">
                                    
                                        <label class="product-name">
                                            <img src="<%=prodImg%>" style="width: 90px; height: 90px" alt="">
                                            <h5><%= productName %></h5>
                                            <h6> <%= productDescription %>  </h6>
                                        </label>
                                    
                                </div>
                                <div class="col-md-2 my-auto">
                                    <label class="price"><%= productPrice %> </label>
                                </div>
                              
                                <div class="col-md-2 col-5 my-auto">
                                    <div class="remove">
                                        <a href="delete_wishlist.jsp?id=<%= prodId %>" class="btn btn-danger btn-sm">
                                            <i class="fa fa-trash"></i> Remove
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>             
                            

                        </div>
                                
                    </div>
                </div>
            </div>

        </div>
    </div>
<%
        } // End of while loop
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // Close database resources
        try { if (rs != null) rs.close(); } catch (Exception e) {}
        try { if (pstmt != null) pstmt.close(); } catch (Exception e) {}
        try { if (conn != null) conn.close(); } catch (Exception e) {}
    }
%>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0-beta1/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
