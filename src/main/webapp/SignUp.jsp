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
              <a class="navbar-brand" href="DHomePage.jsp"><img src="./image/logo.png" alt="" width="180px"></a>
              <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
                <span><i class="fa-solid fa-bars" style="color: white;"></i></span>
              </button>
              <div class="collapse navbar-collapse" id="navbarSupportedContent">
                <ul class="navbar-nav me-auto mb-2 mb-lg-0">
                  <li class="nav-item">
                    <a class="nav-link active" aria-current="page" href="DHomePage.jsp">Home</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="DMen.jsp">For Him</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="DWomen.jsp">For Her</a>
                  </li>
                  <li class="nav-item">
                    <a class="nav-link" href="DHomePage.jsp">Unisex</a>
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


       
        
        
        
        
<form action = "Register" method = "post"  enctype = "multipart/form-data" >
 <!-- login -->
        <div class="container login">
            <div class="row">
                <div class="col-md-4" id="side1">
                    <h3>Welcome Back!!</h3>
                    <p>Signup into valuepoint.</p>
                    <div id="btn"><a href="SignIn.jsp">Login</a></div>
                </div>
                <div class="col-md-8" id="side2">
                    <h3>Create Account</h3>
                    <div class="inp">
                        <input type="text" name = "user_name" placeholder="Name" required>
                        <input type="email" name = "user_email" placeholder="Email" required>
                        <input type="contact" name = "user_contact" placeholder="Contact" required>
                        <input type="password" name = "user_password" placeholder="Password" required>
                        <input type="file"  name="user_image" ><br>
<div id="login"><input type = "submit" name = "submit"  value = "SIGN UP"></div>
<a href = "SignIn.jsp">I already have an account</a>
                    </div>
                    <p> </p>
                    <div class="icons">
                        <i class="fa-brands fa-twitter"></i>
                        <i class="fa-brands fa-facebook-f"></i>
                        <i class="fa-brands fa-instagram"></i>
                   
            </div>
        </div>
        <!-- login -->
</form>

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
                    <li><a href="DHomePage.jsp">Home</a></li>
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
                    <li><a href="DMen.jsp">Men</a></li>
                    <li><a href="DWomen.jsp">Women</a></li>
                    <li><a href="DHomePage.jsp">Unisex</a></li>
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



















