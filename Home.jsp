<%
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Hash the password (This is just a placeholder, you should use a secure hashing algorithm)
    String hashedPassword = password; // Placeholder, replace with actual hashing logic

    try {
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/system_station", "root", "9353");
        Statement stmt = conn.createStatement();

        // Use prepared statement to prevent SQL injection
        PreparedStatement pstmt = conn.prepareStatement(
            "SELECT 'admin' AS designation, adminname FROM admin WHERE adminname = ? AND adpass = ? " +
            "UNION " +
            "SELECT 'customer' AS designation, username FROM register WHERE username = ? AND password = ? " +
            "UNION " + // Added space after UNION
            "SELECT 'delivery' AS designation, d_name FROM service WHERE d_name = ? AND d_pass = ?"
        );
        pstmt.setString(1, username);
        pstmt.setString(2, hashedPassword);
        pstmt.setString(3, username);
        pstmt.setString(4, hashedPassword);
        pstmt.setString(5, username);
        pstmt.setString(6, hashedPassword);
        ResultSet rs = pstmt.executeQuery();

        if (rs.next()) {
            String designation = rs.getString("designation");
            if (designation.equals("admin")) {
                // Redirect to admin page
                response.sendRedirect("Admindashboard.jsp");
            } else if (designation.equals("delivery")) {
                // Redirect to delivery page (fixed typo)
                response.sendRedirect("delivery.jsp");
            } else if (designation.equalsIgnoreCase("customer")) {
                // Redirect to home page
                %>

<!DOCTYPE html>
<html>
<head>
    
   <link rel="stylesheet" href="web.css">
   <title>System Station.in</title>
   <link rel="icon" type="image/x-icon" href="images/logo2.png">
   <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
   
</head>
<body>
    <script src="https://unpkg.com/aos@next/dist/aos.js"></script>
    <script>
        AOS.init();
    </script>

    <div class="main"><BR>
        <marquee scrollamount="18"><B>EXTRA 5% DISCOUNT FOR ORDERS ABOVE &#8377;20,999/-</B></marquee>
    </div>
    <div class="smain">
        <div class="logo">
            <a href="Home.jsp?username=<%= username %>&password=<%= password %>">
                <img src="images/logo2.png" style="height: 80px; width: 120px;" onclick="op">
            </a>
        </div>
        <div class="cont">
            <ul type="none">
            <b>
                <li style="color:white;font-size:30px;font-family:system-ui, -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, 'Open Sans', 'Helvetica Neue', sans-serif;cursor:pointer">System Station</li>
                <li class="dropdown"><a href="Home.jsp?username=<%= username %>&password=<%= password %>" id="head">Home</a></li>
                
                <li class="dropdown"><a href="laptop.html" id="head">Laptops</a></li>

                <li class="dropdown"><a href="computer.html" id="head">Computers</a>
                  
                </li>
                <li class="dropdown"><a href="peripherals.html" id="head">Peripherals</a>
                    
                </li>
                <li class="dropdown"><a href="laptopspares.html" id="head">Laptop Spares</a>
                    
                </li>
               
                <li class="dropdown"><a href="others.html" id="head">Others</a>

                <li class="dropdown"><a href="" id="head">|</a>
                    
                </li>
               </b>
            </ul>
        </div>
        
        <div class="order">
            <a href="Myorders.jsp">
                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                <abbr title="My Order">
                    <img src="images/orderlogo1.png" style="height: 25px; margin-top:32px;">
            </a>
        </div>
        <div class="wish">
            <a href="wishlist.jsp">
                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                <abbr title="WishList">
                    <img src="images/wish1.png" style="height: 25px;">
            </a>
        </div>
        <div class="cart">
            <form action="cart.jsp" method="post">
                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                <abbr title="Cart">
                    <button style="background-color:transparent; border:none; cursor:pointer;">
                        <img src="images/cart1.png" style="height: 25px;">
                    </button>
            </form>
        </div>
        <div class="profile"><br>
            <a href="ViewProfile.jsp?u=<%=rs.getString(2)%>"><abbr title="Profile"><img src="images/profile1.png" style="height: 28px;"></a>
        </div>
        <div class="login"><br>
            <a href="logout.html"><abbr title="Logout"> <img src="images/logout.png" style="height: 25px;"></abbr></a>
        </div>        
    </div>
    <div class="tmain">
        <b>Discover Digital Delights</b>
    </div>
    <!-- <div class="title">
        <div class="banner"></div>
        <div class="name">
            <span>S</span>
            <span>Y</span>
            <span>S</span>
            <span>T</span>
            <span>E</span>
            <span>M</span>
            <span>-</span>
            <span>S</span>
            <span>T</span>
            <span>A</span>
            <span>T</span>
            <span>I</span>
            <span>O</span>
            <span>N</span>
        </div>
    </div> -->

<!-- <img src="images/b1.jpg" alt="" style="width: 100%; height: 500px;"> -->
<!-- Slideshow container -->

   <div class="slideshow-container" >

        <div class="mySlides fade">
            <div class="numbertext">1 / 4</div>
            <img src="images/banner/b1.png" style="width:100%;height: 600px;">
            <!--<div class="text">Caption Text</div>-->
        </div>
    
        <div class="mySlides fade">
            <div class="numbertext">2 / 4</div>
            <img src="images/banner/b2.png" style="width:100%;height: 600px;">
            <!--<div class="text">Caption Two</div>-->
        </div>
    
        <div class="mySlides fade">
            <div class="numbertext">3 / 4</div>
            <img src="images/banner/b3.png" style="width:100%;height: 600px;">
            <!--<div class="text">Caption Three</div>-->
        </div>

        <div class="mySlides fade">
            <div class="numbertext">4 / 4</div>
            <img src="images/banner/b5.png" style="width:100%;height: 600px;">
            <!--<div class="text">Caption Four</div>-->
        </div>
    
    </div>

    <!-- js -->
    <script>
        let slideIndex = 0;
        showSlides();
        
        function showSlides() {
          let i;
          let slides = document.getElementsByClassName("mySlides");
          
          for (i = 0; i < slides.length; i++) {
            slides[i].style.display = "none";  
          }
          slideIndex++;
          if (slideIndex > slides.length) {slideIndex = 1}    
          
          slides[slideIndex-1].style.display = "block";  
          
          setTimeout(showSlides, 3000); // Change image every 3 seconds
        }
        </script>
  

    <!-- <div class="SRP" style="box-shadow: rgba(0, 0, 0, 0.2) 0px 0px 5px 5px ;"> -->
    <!-- arrivals -->
    
    <div class="card2" >
        <div data-aos="fade-up">
        <div style="display: flex;margin-top: 10px;margin-left: 30px;">
            <h2 >Latest Arrivals</h2>
            <a href="Latest-arrivals.html" style=" margin-left: 1150px; font-size: large;">View All</a>
        </div>
        </div>
        <div data-aos="fade-up">
            <div class="c">
                <div class="homecontent">
                    <a href="delle2422hn.html" style="text-decoration: none;">
                        <img class="lazyloaded" src="images/products/latest/a1.jpg" style="width:100%; height: 70%; margin:auto;"> 
                            
                                <p class="desc" ><b>Dell E2422HN 24 Inch Full HD LED-Backlit LCD Monitor</p>
                                <p class="amt">&#8377;1,363.00</b> <del>&#8377;29,599.00</del></p>
                    </a>
                            <form action="cart1.jsp" method="post">                            
                                <input type="hidden" name="prodId" value="4859" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                            <p style="margin-left:-80px;" class="btn" >
                                <button  onclick="" style="">Add to Cart</button></p>
                            </form>

                            <form action="address1.jsp" method="post">                            
                                <input type="hidden" name="prodId" value="4859" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                            <p style="margin-top:-30px;margin-left:75px;" class="btn">
                                <button style="margin-left: 2px;">Buy Now</button>
                            </p>
                            </form>
                </div>
            </div>
            
            <div class="c">
                <div class="homecontent">
                    <a href="DisplayPortCable.html" style="text-decoration: none;">
                        <img class="lazyloaded" src="images/products/latest/a2.jpg" style="width:100%; height: 70%; margin:auto;">
                            
                                <p class="desc"><b>Display Port to Display Port Cable- Female-to-Female </p>
                                <p class="amt">&#8377;1,100.00</b> <del>&#8377;1,750.00</del> </p>
                    </a>
                            <form action="cart1.jsp" method="post">
                                <input type="hidden" name="prodId" value="5214" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                                <p style="margin-left: -80px;" class="btn" >
                                    <button  onclick="">Add to Cart</button></p>
                            </form>
                            <form action="address1.jsp" method="post">
                                <input type="hidden" name="prodId" value="5214" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                                <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                                    <button style="margin-left: 2px;">Buy Now</button>
                                </p>
                            </form>
                        
                </div>
            </div>

            <div class="c">
                <div class="homecontent">
                    <a href="Lenovomonitor.html" style="text-decoration: none;">
                        <img class="lazyloaded" src="images/products/latest/a3.jpg" style="width:100%; height: 70%; margin:auto;">
                            
                                <p class="desc"><b>Lenovo ThinkVision S24e-2023.8 FHD Monitor </p>
                                <p class="amt">&#8377;8,373.00</b><del>&#8377;12,050.00</del> </p>
                    </a>
                            <form action="cart1.jsp" method="post">
                                <input type="hidden" name="prodId" value="2789" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                                <p style="margin-left: -80px;" class="btn" >
                                    <button  onclick="">Add to Cart</button></p>
                            </form>
                            <form action="address1.jsp" method="post">
                                <input type="hidden" name="prodId" value="2789" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                                <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                                    <button style="margin-left: 2px;">Buy Now</button>
                                </p>
                            </form>

                </div>
            </div>

            <div class="c">
                <div class="homecontent">
                    <a href="WesternDigital1TB.html" style="text-decoration: none;">
                        <img class="lazyloaded" src="images/products/latest/a4.jpg" style="width:100%; height: 70%; margin:auto;">
                            
                                <p class="desc"><b>Western Digital 1TB SATA7200RPM 3.5 Desktop Hard Disk</p>
                                <p class="amt">&#8377;2,700.00</b><del>&#8377;3,999.00</del> </p>
                    </a>
                            <form action="cart1.jsp" method="post">
                                <input type="hidden" name="prodId" value="3489" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                                <p style="margin-left: -80px;" class="btn" >
                                    <button  onclick="">Add to Cart</button></p>
                            </form>
                            <form action="address1.jsp" method="post">
                                <input type="hidden" name="prodId" value="3489" style="border:none;" readonly>
                                <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                                <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                                <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                                    <button style="margin-left: 2px;">Buy Now</button>
                                </p>
                            </form>
                        
                </div>
            </div>
            
        </div>
    </div>

    <div class="card3" >
        <div data-aos="fade-up">
        <div style="display: flex;margin-top: 20px;margin-left: 30px;">
            <h2 >Best Selling</h2>
            <a href="Best-selling.html" style=" margin-left: 1200px; font-size: large;">View All</a>
        </div>
        </div>
        <div data-aos="fade-up">
        <div class="c">
            <div class="homecontent">
                <a href="acer12gen.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/best selling/acer.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc" ><b>Acer Aspire Lite 12th Gen Intel Core i5-1235U Thin and Light Laptop</p>
                    <p class="amt">&#8377;47,990.00</b> <del>&#8377;52,520.00</del> </p>
                </a>
                    <form action="cart1.jsp" method="post"> 
                        <input type="hidden" name="prodId" value="4785" style="border:none;" readonly>
                        <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                        <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                        <p style="margin-left: -80px;" class="btn">
                        <button>Add to Cart</button></p>
                    </form>

                    <form action="address1.jsp" method="post"> 
                        <input type="hidden" name="prodId" value="4785" style="border:none;" readonly>
                        <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                        <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                        <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                        <button style="margin-left: 2px;">Buy Now</button></p>
                    </form>
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="LemoreleUSB.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/best selling/usb.jpg" style="width:100%; height: 70%; margin:auto;">
                    <input type="hidden" name="prodId" value="5741" style="border:none;" readonly>
                    <p class="desc"><b>Lemorele USB C Docking Station for Laptop, 10 in 1 Triple Display Monitors</p>
                    <p class="amt">&#8377;2,699.00</b> <del>&#8377;3,599.00</del> </p>
                </a>
                    <form action="cart1.jsp" method="post"> 
                        <input type="hidden" name="prodId" value="5741" style="border:none;" readonly>
                        <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                        <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                        <p style="margin-left: -80px;" class="btn">
                        <button>Add to Cart</button></p>
                    </form>

                    <form action="address1.jsp" method="post">
                        <input type="hidden" name="prodId" value="5741" style="border:none;" readonly>
                        <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                        <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                        <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                        <button style="margin-left: 2px;">Buy Now</button></p>
                    </form>
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="ZEBRONICSGamingCPU.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/best selling/cpu.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>ZEBRONICS Glass Raptor Mid-Tower Premium Gaming Cabinet CPU</p>
                    <p class="amt">&#8377;8,829.00</b><del>&#8377;12,050.00</del> </p>
                </a>
                    <form action="cart1.jsp" method="post">
                        <input type="hidden" name="prodId" value="3657" style="border:none;" readonly>
                        <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                        <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                        <p style="margin-left: -80px;" class="btn">
                        <button>Add to Cart</button></p>
                    </form>

                    <form action="address1.jsp" method="post">
                        <input type="hidden" name="prodId" value="3657" style="border:none;" readonly>
                        <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                        <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                        <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                        <button style="margin-left: 2px;">Buy Now</button></p>
                    </form>
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="asusdesktop.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/best selling/compu.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>ASUS Vivo AiO V222 All-in-One Desktop</p>
                    <p class="amt">&#8377;28,990.00</b><del>&#8377;32,999.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1459" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                        <button>Add to Cart</button></p>
                </form>

                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1459" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
            </div>
        </div>
        
        </div>
    </div>

  
    <div class="card5" >
        <div data-aos="fade-up">
        <div style="display: flex;display: flex;margin-top: 20px;margin-left: 30px;">
            <h2 >Printers</h2>
            <a href="Printer.html" style=" margin-left: 1250px; font-size: large;">View All</a>
        </div>
        </div>
        <div data-aos="fade-up">
        <div class="c">
            <div class="homecontent">
                <a href="hpsmarttank.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/printer/hp p.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc" ><b>HP Smart Tank 529 AIO Colour Printer (Upto 6000 Black & 6000 Colour Pages Included in The Box)</p>
                    <p class="amt">&#8377;10,363.00</b> <del>&#8377;19,599.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="2378" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
                </form>

                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="2378" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="SmartWiFiPrinter.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/printer/hp p2.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>HP Smart Tank 585 All-in-one WiFi Colour Printer (Upto 6000 Black and 6000 Colour Pages)</p>
                    <p class="amt">&#8377;11,100.00</b> <del>&#8377;19,750.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="2496" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
                </form>
                    
                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="2496" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
                
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="HPDeskjet.html" style="text-decoration: none;">
                <img class="lazyloaded" src="images/products//printer/hp3.jpg" style="width:100%; height: 70%; margin:auto;">
                
                <p class="desc"><b>HP Deskjet 2331 Colour Printer, Scanner and Copier for Home/Small Office</p>
                <p class="amt">&#8377;3,773.00</b><del>&#8377;5,050.00</del> </p>
            </a>
            <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1078" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
            </form>

            <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1078" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
            </form>
                
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="HPInkAdvantage.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/printer/hp4.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>HP Ink Advantage 4278 Printer, Automatic Document Feeder Simple Setup Smart App, Ideal for Home.</p>
                    <p class="amt">&#8377;6,999.00</b><del>&#8377;9,999.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="7568" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button> </p>
                </form>

                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="7568" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button> </p>
                </form>
               
            </div>
        </div>
        </div>
    
    </div>
    <div class="card6" >
        <div data-aos="fade-up">
        <div style="display: flex;margin-top: 20px;margin-left: 30px;">
            <h2 >Antivirus</h2>
            <a href="antivirus.html" style=" margin-left: 1250px; font-size: large;">View All</a>
        </div>
        </div>
        <div data-aos="fade-up">
        <div class="c">
            <div class="homecontent">
                <a href="QuickHealLatestVersion1.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/anti virus/a3y.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc" ><b>Quick Heal | Total Security | Latest Version | 2 Users | 3 Years </p>
                    <p class="amt">&#8377;2,863.00</b> <del>&#8377;4,599.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="4287" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
                </form>

                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="4287" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
                
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="QuickHealRenewalUpgrade.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/anti virus/a1.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>Quick Heal | Total Security Renewal Upgrade Gold pack | 1 User | 3 years </p>
                    <p class="amt">&#8377;1,100.00</b> <del>&#8377;1,750.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1247" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
                </form>

                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1247" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
                
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="QuickhealInternetSecurity.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/anti virus/inter.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>Quick Heal Internet Security Latest Version - 1 PC, 1 Year </p>
                    <p class="amt">&#8377;699.00</b><del>&#8377;1,050.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1423" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
                </form>


                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="1423" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
                
            </div>
        </div>
        <div class="c">
            <div class="homecontent">
                <a href="McAfeeAntivirus.html" style="text-decoration: none;">
                    <img class="lazyloaded" src="images/products/anti virus/mac.jpg" style="width:100%; height: 70%; margin:auto;">
                    
                    <p class="desc"><b>McAfee Antivirus 2024 | 1 Device, 3 Year | Antivirus Internet Security Software</p>
                    <p class="amt">&#8377;660.00</b><del>&#8377;999.00</del> </p>
                </a>
                <form action="cart1.jsp" method="post">
                    <input type="hidden" name="prodId" value="9874" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-left: -80px;" class="btn">
                    <button>Add to Cart</button></p>
                </form>

                <form action="address1.jsp" method="post">
                    <input type="hidden" name="prodId" value="9874" style="border:none;" readonly>
                    <input type="hidden" name="un" value="<%=username%>" style="border:none;" readonly>
                    <input type="hidden" name="pwd" value="<%=password%>" style="border:none;" readonly>
                    <p style="margin-top: -30px;margin-left: 75px;" class="btn">
                    <button style="margin-left: 2px;">Buy Now</button></p>
                </form>
            </div>
        </div>
      </div>
    </div>

    <div class="card7" style="border: 2px solid white; background-color:grey" >
        <div data-aos="fade-up">
        <h2 style="padding: 20px; text-align: center; ">Why Buy from System Station</h2>
        <p style="text-align: center;">System Station India&#0146;s first Microsoft Authorised Refurbisher offers its customers Affordable, Warranted and Authentic IT systems. We always ensure the performance and the features offered are absolutely unfaltering. 
            We strive towards our mission &#0147;Make Computers Affordable for everyone&#148; thereby bridging the digital divide in our country.</p>
            </div>
            <div data-aos="zoom-in">
            <div class="content">
                <img src="images/s1.png"><br>
                <p>Genuine Windows Licensed systems</p>
            </div>
            <div class="content">
                <img src="images/s2.png"><br>
                <p>Warranty backed systems</p>
            </div>
            <div class="content">
                <img src="images/s3.png"><br>
                <p>Affordable</p>
            </div>
            <div class="content">
                <img src="images/s4.png"><br>
                <p>Checked, Verified ,Certified Refurbished systems</p>
            </div>
            <div class="content">
                <img src="images/s5.png"><br>
                <p>&#147;Almost new&#148; like experience</p>
            </div>
            <div class="content">
                <img src="images/s6.png"><br>
                <p>Computer Protection plan available (Add on AMC)</p>
            </div>
            <div class="content">
                <img src="images/s7.png"><br>
                <p>Environment friendly</p>
            </div>
            <div class="content">
                <img src="images/s8.png"><br>
                <p>PAN India Delivery</p>
            </div>
            <div class="content">
                <img src="images/s9.png"><br>
                <p>Certified third party service locations in major cities</p>
            </div>
        </div>
        </div>
    </div>

    <div data-aos="fade-up">
    <div class="bottom">
        <div class="info">
            <h1><b>SUPPORT</b></h1><br>
            <p><a class="abc" href="contactus.html">Contact Us</a></p>
        </div>

        <div class="info">
            <h1><b>INFORMATION</b></h1><br>
            <p><a class="abc" href="footer/aboutus.html">About Us</a></p>
            <p><a  class="abc" href="footer/refurbish.html">Refurbishing Information</a></p>
            <p><a class="abc" href="footer/installation.html">Installation</a></p>
        </div>

        <div class="info">
            <h1>POLICIES</h1><br>
           <p> <a class="abc" href="footer/privacypolicy.html">Privacy & Policy</a></p>
            <p><a class="abc" href="footer/termscondition.html">Terms & Condition</a></p>
            <p><a class="abc" href="footer/cancelrefund.html">Cancel & Refund Policy</a></p>
            <p><a class="abc" href="footer/shipping.html">Shipping & Delivery Policy</a></p>
        </div>

        <div class="info">
            <h1>FAQ&#0145;S</h1><br>
         
           <p> <a class="abc" href="footer/warrenty.html">Warrenty Upgrade</a></p>
            <p><a class="abc" href="footer/installation.html">Installation & Configuration</a></p>
            <p><a class="abc" href="footer/exchange.html">Exchange & Buy Pack</a></p>
        </div><br>     

    </div>
    </div>

    <div data-aos="fade-up">
    <div class="bot2">
        <img src="footer/bottom.png" style="height: 80px; width: 70%;" >
    </div>
    </div>

    <div data-aos="fade-up">
    <div class="bot3">
       <b><a href="footer/termscondition.html">Terms & Condition</a></b> 
    </div>

    </div>

    <div class="bot4">
        <img src="footer/payment_icon.png" style="height: 80px; width: 70%;" >
    </div>
    

</body>
</html>

                <%
            }
        } else {
            // Check if the username exists in the database
        rs = stmt.executeQuery("SELECT * FROM register WHERE username='" + username + "'");
            if (rs.next()) {
%>
                <script>
                    alert("You have Entered Wrong credentials");
                    window.location.href = "login.html";
                </script>
<%
            } else {
%>
                <script>
                    alert("You have not registered yet. Please sign up");
                    window.location.href = "register1.html";
                </script>
<%
            }
            // Redirect back to the login page
%>
            <script>
                
            </script>
<%
        }
    } catch (Exception e) {
        out.println(e);
    } 
%>

