<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<html>
<head>
<%
session = request.getSession();
String user = (String)session.getAttribute("user");
if(user == null){
	response.sendRedirect("SignIn.jsp");
}
%>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Value Point</title>
    <link rel="shortcut icon" type="image" href="./image/favicon.png">
    <link rel="stylesheet" href="style.css">
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

    <!-- top navbar -->
    <div class="top-navbar">
        <div class="top-icons">
          <a href="https://www.twitter.com"><i  class="fa-brands fa-twitter"></i></a>
          <a href="https://www.facebook.com/"><i class="fa-brands fa-facebook-f"></i></a>
          <a href="https://www.instagram.com"><i class="fa-brands fa-instagram"></i></a>
        </div>
        <div class="other-links">
            <button id="btn-login"><a href="SignIn.jsp">Login</a></button>
            <button id="btn-signup"><a href="SignUp.jsp">Sign up</a></button>
            <a href="SignIn.jsp"><i class="fa-solid fa-user"></i></a>
        </div>
    </div>
    <!-- top navbar -->

        <!-- navbar -->
        <nav class="navbar navbar-expand-lg" id="navbar">
            <div class="container-fluid">
              <a class="navbar-brand" href="HomePage.jsp"></a>
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
                  <!-- <li class="nav-item dropdown">
                    <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                      Category
                    </a>
                    <ul class="dropdown-menu" aria-labelledby="navbarDropdown" style="background-color: #1c1c50;">
                      <li><a class="dropdown-item" href="#">Groceries & Pets</a></li>
                      <li><a class="dropdown-item" href="#">Health & Beauty</a></li>
                      <li><a class="dropdown-item" href="#">Mens's Fashion</a></li>
                      <li><a class="dropdown-item" href="#">Electronic Devices</a></li>
                      <li><a class="dropdown-item" href="#">Sports & Outdoor</a></li>
                      <li><a class="dropdown-item" href="#">TV & Home Appliances</a></li>
                      <li><a class="dropdown-item" href="#">Automotive & Motorbike</a></li>
                    </ul>
                  </li> -->
                  <li class="nav-item">
                    <a class="nav-link" href="about.html">About Us</a>
                  </li>
                <li class="nav-item">
                    <a class="nav-link" href="contact.html">Contact Us</a>
                  </li>
                </ul>
               
               
                <form class="d-flex" action="DSearch.jsp" method = "post">
                  <input class="form-control me-2" type="text" placeholder="Search" name="search" aria-label="Search">
                  <button class="btn btn-outline-success" type="submit" id="search-btn">Search</button>
                </form>
              </div>
            </div>
          </nav>
        <!-- navbar -->
        
        
        
        
<!-- product cards -->
<div class="container" id="product-cards">
    <h1 class="text-center">SEARCH FOR PRODUCT</h1>
    <div class="row" style="margin-top: 30px;">
        <%  
        // Get the search query from the form
        String searchQuery = request.getParameter("search");

        // Check if the search query is not null and has at least 1 character
        if (searchQuery != null && searchQuery.length() >= 1) {
            // Use the search query to retrieve matching products from the database
            DatabaseConnection dc = new DatabaseConnection();
            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                Connection con = dc.getConnect();

                String query = "SELECT * FROM product_details WHERE product_name LIKE ?";
                PreparedStatement ps = con.prepareStatement(query);
                ps.setString(1, searchQuery.charAt(0) + "%" + searchQuery.substring(1) + "%");
                ResultSet rs = ps.executeQuery();

                // Display the matching products
                boolean noResultsFound = true; // flag to check if no results were found
                while (rs.next()) {
                    noResultsFound = false; // reset flag to false
                    String product_image = rs.getString("product_image");
                    String product_name = rs.getString("product_name");
                    String product_description = rs.getString("product_description");
                    String product_price = rs.getString("product_price");
                    Integer product_id = rs.getInt("product_id");
                    Integer product_quantity = rs.getInt("product_quantity");
        %>
                    <div class="col-md-3 py-3 py-md-0">
                        <div class="card">
                            <img src="<%= request.getContextPath()%>/image/<%= product_image%>" alt =><br>
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
  <button onclick="addToCart(<%= product_id %>, '<%= product_name %>', <%= product_price %>)" style="text-decoration:none; color:#1c2e4a; background-color: #fff; border: 1px solid #1c2e4a; padding: 5px 10px; cursor: pointer;"> 
    ADD TO CART <i class="fa-solid fa-cart-shopping"></i>
  </button>
</span></h5>

<script>
  function addToCart(productId, productName, productPrice) {
    // Get the quantity entered by the user
    var quantity = document.getElementById("quantity").value;

    // Check if the quantity is valid
    if (quantity <= 0) {
      alert("Please enter a valid quantity");
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
             window.location.href = 'Search.jsp'; 
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
</script></div>
                        </div>
                    </div>
        <%          } // closing brace for while loop
                rs.close();
                ps.close();
                con.close();

                if (noResultsFound) {
                    %><h1>No Result Found</h1><%
                }
            } catch (ClassNotFoundException e) {
                e.printStackTrace();
            } catch (Exception e) {
                e.printStackTrace();
            }
        } else {
            %><h1>No Result Found</h1><%
        }
        %>
    </div>
</div>











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
  </footer>
  <!-- footer -->
  
  <!-- <a href="#" class="arrow"><i><img src="./image/up-arrow.png" alt="" width="50px"></i></a>
  
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM" crossorigin="anonymous"></script>
   -->
  </body>
  </html>
