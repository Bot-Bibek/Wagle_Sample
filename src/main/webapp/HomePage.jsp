<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@page import="com.informatics.models.ProductDetails"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.informatics.SaveProductDetails.SaveProductsDetails"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Value Point</title>
    <link rel="shortcut icon" type="image" href="./image/favicon.png">
    <link rel="stylesheet" type = "text/css"  href="style.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.2.0/css/all.min.css">
    <!-- bootstrap links -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC" crossorigin="anonymous">
    <!-- bootstrap links -->
    <!-- fonts links -->
    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">
    <!-- fonts links -->
</head>
<body>
</head>
<body>
	
<form action="HomePage" method = "post">
<%
session = request.getSession();
String user = (String) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("SignIn.jsp");
} 
%>
</form>

    <!-- top navbar -->
    <div class="top-navbar">
        <div class="top-icons">
          <a href="https://www.twitter.com"><i  class="fa-brands fa-twitter"></i></a>
          <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook-f"></i></a>
          <a href="https://www.instagram.com"><i class="fa-brands fa-instagram"></i></a>
        </div>
        <div class="other-links">
            <!-- <button id="btn-login"><a href="SignIn.jsp">Login</a></button> -->
            <button id="btn-signup"><a href="LogOut.jsp">Log Out</a></button>
            <a href="MyDetail.jsp"><i class="fa-solid fa-user"></i></a>
            <a href ="Cart.jsp"><i class = "fa-solid fa-cart-shopping"></i></a>
        </div>
    </div>
    <!-- top navbar -->

        <!-- navbar -->
        <nav class="navbar navbar-expand-lg" id="navbar">
            <div class="container-fluid">
              <a class="navbar-brand" href="HomePage.jsp"><img src="./image/logo.png" alt="" width="180px"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span><i class="fa-solid fa-bars" style="color: white;"></i></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="HomePage.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Men.jsp">For Him</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="Women.jsp">For Her</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="HomePage.jsp">Unisex</a>
            
                  <li class="nav-item">
                    <a class="nav-link" href="about.html">About Us</a>
                  </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact Us</a>
                  </li>
                </ul>
               
               
                <form class="d-flex" action="Search.jsp" method = "post">
                  <input class="form-control me-2" type="text" placeholder="Search" name="search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit" id="search-btn">Search</button>
                </form>
              </div>
            </div>
          </nav>
        <!-- navbar -->
        
        

	
	<!-- home content -->
        <section class="home">
            <div class="content">
                <h3>Biggest Clothes Sale
                    <br> <span>Up To 50% Off</span>
                </h3>
                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Atque culpa, totam sed maxime animi facilis!</p>
                <form action="Cart.jsp">
                <button id="shopnow" >Shop Now</button>
                </form>
            </div>
            <div class="img">
                <img src="<%= request.getContextPath()%>/image/p13.png" alt="">
            </div>
        </section>
	
	<style>
  #hightolowform {
    display: flex;
    justify-content: center;
    align-items: center;
    margin-bottom: 20px;
  }
  
  #hightolowform button {
    background-color: #ffffff;
    border: 1px solid #cccccc;
    color: #333333;
    padding: 10px 20px;
    font-size: 16px;
    margin-right: 10px;
    cursor: pointer;
  }

  #hightolowform button[name="highToLow"] {
    background-color: #ffffff;
  }

  #hightolowform button[name="lowToHigh"] {
    background-color: #ffffff;
  }
</style>
	
	
	<!-- product cards -->
    <div class="container" id="product-cards">
    <h1 class="text-center">PRODUCT</h1>
    <form id="hightolowform" method="post">
  <button type="submit" name="highToLow">($) High to Low</button>
  <button type="submit" name="lowToHigh">($) Low to High</button>
</form>
    <div class="row" style="margin-top: 30px;">
        <% DatabaseConnection Dc = new DatabaseConnection();
           try {
               Class.forName("com.mysql.cj.jdbc.Driver");
            Connection conn = Dc.getConnect();
            String query = "select * from product_details ";
            
            if (request.getParameter("highToLow") != null) {
                query = "SELECT * FROM product_details ORDER BY product_price DESC";
            } else if (request.getParameter("lowToHigh") != null) {
                query = "SELECT * FROM product_details ORDER BY product_price ASC";
            }
            
            PreparedStatement Ps = conn.prepareStatement(query);
            ResultSet Rs = Ps.executeQuery();
            
            while(Rs.next()){
                String product_image = Rs.getString("product_image");
                String product_name = Rs.getString("product_name");
                String product_description = Rs.getString("product_description");
                Integer product_price = Rs.getInt("product_price");
                Integer product_id = Rs.getInt("product_id");
                Integer product_quantity = Rs.getInt("product_quantity");
                %>
         <div class="col-md-3 py-3 py-md-0">
             <div class="card">
                 <img src="<%= request.getContextPath()%>/image/<%= product_image%>" alt = ""><br>
                 <div class="card-body">
                     <h3><%= product_name %></h3>
                     <p><%= product_description %></p>
                     <div class="star">
                         <i class="fas fa-star checked"></i>
                         <i class="fas fa-star checked"></i>
                         <i class="fas fa-star checked"></i>
                         <i class="fas fa-star checked"></i>
                         <i class="fas fa-star checked"></i>
                     </div>
                     
              <div>
  <label for="quantity">Quantity:</label>
  <input type="number" id="quantity" name="quantity" min="1" max="<%= product_quantity %>" value="<%= product_quantity %>">
</div>

<h5>$ <%= product_price %><span>
  <button onclick="addToCart(<%= product_id %>, '<%= product_name %>', <%= product_price %>)" style="text-decoration:none; color:#1c2e4a; background-color: #fff; border: none; padding: 5px 10px; cursor: pointer;"> 
  <i class="fa-solid fa-cart-shopping"></i>
</button>

</span></h5>

<script>
  function addToCart(productId, productName, productPrice) {
    // Get the quantity entered by the user
    var quantity = document.getElementById("quantity").value;

    // Check if the quantity is valid
    if (quantity <= 0) {
      alert("qunatity is invalid or product is out of stock");
      return;
    }
    if (quantity >= 2) {
        alert("SORRY! YOU CAN ADD 1 QUANTITY AT A TIME");
        return;
      }
    if (quantity > <%= product_quantity %>) {
      alert("The quantity entered is more than the available quantity");
      return;
    }

    // Send a request to the server to add the item to the cart
    fetch('http://localhost:8080/Course_work/AddToCartServlet', {
      method: 'POST',
      headers: {
        'Content-Type': 'application/json'
      },
      body: JSON.stringify({
        id: productId,
        name: productName,
        price: productPrice,
        quantity: quantity
        
      })
    }).then(function(response) {
      if (response.ok) {
        alert('Product added to cart!');

        // Prepare the SQL statement with placeholders for parameters
        const sql = "UPDATE product_details SET product_quantity = product_quantity - 1 WHERE product_name = ?";
        const product_name = productName;

        // Send a request to the server to update the product quantity
        fetch('http://localhost:8080/Course_work/UpdateProductQuantityServlet', {
          method: 'POST',
          headers: {
            'Content-Type': 'application/json'
          },
          body: JSON.stringify({
            product_name: product_name,
            sql: sql
          })
        }).then(function(response) {
          if (response.ok) {
            // Redirect to the cart page
             window.location.href = 'HomePage.jsp'; 
          } else {
            alert('Error updating product quantity');
          }
        }).catch(function(error) {
          console.error('Error updating product quantity:', error);
          alert('Error updating product quantity');
        });
      } else {
        alert('Error adding product to cart');
      }
    }).catch(function(error) {
      console.error('Error adding product to cart:', error);
      alert('Error adding product to cart');
    });
  }
</script>





 </div>
             </div>
         </div>
         <% }
            } catch (Exception e) {
               e.printStackTrace();
            }
         %>
    </div>
</div>
       
           <a href="products.html" id="viewmorebtn">View More</a>         
	
	
	
	

<!-- footer -->
<footer id="footer" style="margin-top: 50px;">
  <div class="footer-top">
      <div class="container">
          <div class="row">
              <div class="col-lg-3 col-md-6 footer-content">
                  <h3>Value Point</h3>
                  <p>Style that speaks value - Discover the best at Value Point.</p>
                  <p>
                      Nepal <br>
                      USA <br>
                      Canada <br>
                  </p>
                  <strong><i class="fas fa-phone"></i> Phone: <strong>+977 9805867141</strong></strong><br>
                  <strong><i class="fa-solid fa-envelope"></i> Email: <strong>valuepoint@gmail.com</strong></strong>
              </div>
              <div class="col-lg-3 col-md-6 footer-links">
                  <h4>Usefull Links</h4>
                  <ul>
                    <li><a href="HomePage.jsp">Home</a></li>
                    <li><a href="about.html">About</a></li>
                    <li><a href="contact.html">Contact</a></li>
                    <li><a href="#">Services</a></li>
                    <li><a href="#">Privacy policy</a></li>
                  </ul>
              </div>
              <div class="col-lg-3 col-md-6 footer-links">
                  <h4>Our Services</h4>
                  <p>All kinds of Men and Women Fashion </p>
                  <ul>
                    <li><a href="Men.jsp">Men</a></li>
                    <li><a href="Women.jsp">Women</a></li>
                    <li><a href="HomePage.jsp">Unisex</a></li>
                  </ul>
              </div>
              <div class="col-lg-3 col-md-6 footer-links">
                  <h4>Our Social Network</h4>
                  <p>Connect with fashion enthusiasts, discover the latest trends, and shop for affordable and stylish clothing.</p>
                  <div class="socail-links mt-3">
                      <a href="https://www.twitter.com" class="twiiter"><i class="fa-brands fa-twitter"></i></a>
                      <a href="https://www.facebook.com" class="twiiter"><i class="fa-brands fa-facebook-f"></i></a>
                      <a href="https://www.googleplus.com" class="twiiter"><i class="fa-brands fa-google-plus"></i></a>
                      <a href="https://www.instagram.com" class="twiiter"><i class="fa-brands fa-instagram"></i></a>
                      <a href="https://www.linkedin.com" class="twiiter"><i class="fa-brands fa-linkedin-in"></i></a>
                  </div>
              </div>
          </div>
      </div>
  </div>
  <hr>
  <div class="container py-4">
      <div class="copyright">
          &copy; Copyright <strong>Value Point</strong>.All Rights Reserved
      </div>
      </div>
  </footer>
  <!-- footer -->
  
  <!-- <a href="#" class="arrow"><i><img src="./image/up-arrow.png" alt="" width="50px"></i></a>
  
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   -->
  </body>
  </html>