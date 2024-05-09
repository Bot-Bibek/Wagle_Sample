<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.informatics.SaveCategoryDetails.SaveCategoryDetails"%>
<%@page import="com.informatics.models.CategoryDetails"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<<meta charset="utf-8">
 <meta content="width=device-width, initial-scale=1.0" name="viewport">
<title>Admin Dashboard</title>

<!-- Favicons -->
<link href="assets/img/favicon.png" rel="icon">
<link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

<!-- Google Fonts -->
<link href="https://fonts.gstatic.com" rel="preconnect">
<link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Nunito:300,300i,400,400i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

<!-- Vendor CSS Files -->
<link href="css/bootstrap.min.css" rel="stylesheet">
<link href="css/bootstrap-icons.css" rel="stylesheet">


<!-- Template Main CSS File -->
<link href="css/style.css" rel="stylesheet">
</head>
<body>




   <!-- ======= Header ======= -->
  <header id="header" class="header fixed-top d-flex align-items-center">

    <div class="d-flex align-items-center justify-content-between">
      <a href="index.html" class="logo d-flex align-items-center">
        <img src="assets/img/logo.png" alt="">
        <span class="d-none d-lg-block">Value Point</span>
      </a>
      <i class="bi bi-list toggle-sidebar-btn"></i>
    </div><!-- End Logo -->

    <div class="search-bar">
      <form class="search-form d-flex align-items-center" method="POST" action="#">
        <input type="text" name="query" placeholder="Search" title="Enter search keyword">
        <button type="submit" title="Search"><i class="bi bi-search"></i></button>
      </form>
    </div><!-- End Search Bar -->

    <nav class="header-nav ms-auto">
      <ul class="d-flex align-items-center">

        <li class="nav-item d-block d-lg-none">
          <a class="nav-link nav-icon search-bar-toggle " href="#">
            <i class="bi bi-search"></i>
          </a>
        </li><!-- End Search Icon-->

        <li class="nav-item dropdown pe-3">

          <a class="nav-link nav-profile d-flex align-items-center pe-0" href="#" data-bs-toggle="dropdown">
            <img src="assets/img/profile-img.jpg" alt="Profile" class="rounded-circle">
            <span class="d-none d-md-block dropdown-toggle ps-2">Gautam</span>
          </a><!-- End Profile Iamge Icon -->

          <ul class="dropdown-menu dropdown-menu-end dropdown-menu-arrow profile">
            <li class="dropdown-header">
              <h6>Roshan Gautam</h6>
              <span>Admin</span>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-person"></i>
                <span>My Profile</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="users-profile.html">
                <i class="bi bi-gear"></i>
                <span>Account Settings</span>
              </a>
            </li>
            <li>
              <hr class="dropdown-divider">
            </li>

            <li>
              <a class="dropdown-item d-flex align-items-center" href="">
                <i class="bi bi-box-arrow-right"></i>
                <span>Sign Out</span>
              </a>
            </li>

          </ul><!-- End Profile Dropdown Items -->
        </li><!-- End Profile Nav -->

      </ul>
    </nav><!-- End Icons Navigation -->

  </header><!-- End Header -->




<!-- ======= Sidebar ======= -->
<aside id="sidebar" class="sidebar">

  <ul class="sidebar-nav" id="sidebar-nav">

    <li class="nav-item">
      <a class="nav-link " href="AdminPage.jsp">
        <i class="bi bi-grid"></i>
        <span>Dashboard</span>
      </a>
    </li><!-- End Dashboard Nav -->
    
    
    <li class="nav-item">
      <a class="nav-link collapsed" href="users-profile.html">
        <i class="bi bi-person"></i>
        <span>Profile</span>
      </a>
    </li><!-- End Profile Page Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#forms-nav" data-bs-toggle="collapse" href="#">
          <i class="bi bi-journal-text"></i>
          <span>Add Product</span>
          <i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="forms-nav" class="nav-content collapse" data-bs-parent="#sidebar-nav">
          <li>
            <a href = "Product.jsp">
              <i class="bi bi-circle"></i>
                  <span>Add New Product</span>
            </a>
          </li>
      </ul>
  </li>
  <!-- End Forms Nav -->
  <li class="nav-item">
    <a class="nav-link collapsed" href="Category.jsp">
      <i class="bi bi-card-list"></i>
      <span>Add Category</span>
    </a>
  </li><!-- End Register Page Nav -->

    <li class="nav-item">
      <a class="nav-link collapsed" data-bs-target="#tables-nav" data-bs-toggle="collapse" href="#">
        <i class="bi bi-layout-text-window-reverse"></i><span>Records</span><i class="bi bi-chevron-down ms-auto"></i>
      </a>
      <ul id="tables-nav" class="nav-content collapse " data-bs-parent="#sidebar-nav">
        <li>
          <a href="UserRecords.jsp">
            <i class="bi bi-circle"></i><span>User Details</span>
          </a>
        </li>
        <li>
          <a href="OrderList.jsp">
            <i class="bi bi-circle"></i><span>Order Details</span>
          </a>
        </li>
        <li>
          <a href="Product.jsp">
            <i class="bi bi-circle"></i><span>Product Details</span>
          </a>
        </li>
      </ul>
    </li><!-- End Tables Nav -->



    <li class="nav-item">
      <a class="nav-link collapsed" href="LogOut">
        <i class="bi bi-box-arrow-in-right"></i>
        <span>Logout</span>
      </a>
    </li><!-- End Login Page Nav -->
  </ul>

</aside><!-- End Sidebar-->



<main id="main" class="main">

    <div class="pagetitle">
      <h1>Add Product</h1>
      <nav>
        <ol class="breadcrumb">
          <li class="breadcrumb-item"><a href="AdminPage.jsp">Home</a></li>
          <li class="breadcrumb-item">Add</li>
          <li class="breadcrumb-item active">Product</li>
        </ol>
      </nav>
    </div><!-- End Page Title --> 

    <section class="section">
      <div class="row">
        <div class="col-lg-6">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Add New Product</h5>

                <!-- General Form Elements -->
                <form action="AddProduct" method="post" enctype="multipart/form-data">
                <div class="row mb-3">
                        <label for="inputName" class="col-sm-2 col-form-label">Name</label>
                        <div class="col-sm-10">
                          <input type = "text" class="form-control" name = "product_name" placeholder = "Enter Product Name" required>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label for="inputPrice" class="col-sm-2 col-form-label">Price</label>
                        <div class="col-sm-10">
                          <input type = "text" class="form-control" name = "product_price" placeholder = "Enter Product Price" required>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label for="inputQuantity" class="col-sm-2 col-form-label">Quantity</label>
                        <div class="col-sm-10">
                          <input type = "text" class="form-control" name = "product_quantity" placeholder = "Enter Product Quantity" required>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label for="inputImage" class="col-sm-2 col-form-label">File Upload</label>
                        <div class="col-sm-10">
                          <input type="file"  class="form-control" id="formFile" name="product_image" >
                        </div>
                      </div>
      
                      <div class="row mb-3">
                        <label for="inputDescription" class="col-sm-2 col-form-label">Description</label>
                        <div class="col-sm-10">
                          <textarea class="form-control" style="height: 100px" name = "product_description" placeholder = "Enter Product Description" required></textarea>
                        </div>
                      </div>
                        </div>
                      </div>
      
                      <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">Select</label>
                        <div class="col-sm-10">
                          <select class="form-select" aria-label="Default select example" name = "product_category"> <!-- product_category = category_id -->
                              <option>Choose the Category</option>
                              <%
                              DatabaseConnection dc =  new DatabaseConnection();
                              try {
                                  Class.forName("com.mysql.cj.jdbc.Driver");
                                  Connection con = dc.getConnect();
                                  
                                  
                                  String query = "select * from category_details";
                                  
                                  PreparedStatement ps = con.prepareStatement(query);
                                  ResultSet rs = ps.executeQuery();
                                  
                                  
                                  while(rs.next()){
                                      %>
                                      <option value="<%=rs.getInt("category_id")%>"><%out.println(rs.getString("category_name"));%></option>
                                      <%
                                  }
                                  
                              } catch (ClassNotFoundException e) {
                                  // TODO Auto-generated catch block
                                  e.printStackTrace();
                              }
                              %>
                              </select>
                        </div>
                      </div>
                      <div class="row mb-3">
                        <label class="col-sm-2 col-form-label">       </label>
                        <div class="col-sm-10">
                          <button type="submit" class="btn btn-primary">Add Product</button>
                        </div>
                      </div>
                
                </form>
                

              <!-- End General Form Elements -->
            </div>
          </div>
        </div>
      </div>
    </section>

  </main><!-- End #main -->



<a href="#" class="back-to-top d-flex align-items-center justify-content-center"><i class="bi bi-arrow-up-short"></i></a>

<!-- Vendor JS Files -->

<script src="js/bootstrap.bundle.min.js"></script>
<script src="js/apexchart.js"></script>



<!-- Template Main JS File -->
<script src="js/main.js"></script>







</body>
</html>