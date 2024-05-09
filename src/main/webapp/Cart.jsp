<%@page import="java.sql.SQLException"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Shopping cart</title>
<meta charset="utf-8">
 <meta content="width=device-width, initial-scale=1.0" name="viewport">

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
    
    <main id="main" class="main">

    <div class="pagetitle">
      <h1>                 Shopping Cart </h1>
     
    </div><!-- End Page Title -->

    <section class="section">
      <div class="row">
        <div class="col-lg-12">

          <div class="card">
            <div class="card-body">
              <h5 class="card-title">Cart Details </h5>
              
              <!-- Table with stripped rows -->
              <table class="table datatable">
                <thead>
                  <tr>
                    <th scope="col">Product Name</th>
            <th scope="col">Price</th>
            <th scope="col">Quantity</th>
            <th scope="col">Total Price</th>
                  </tr>
                </thead>
 <%
session = request.getSession();
String user = (String) session.getAttribute("user");
if (user == null) {
    response.sendRedirect("SignIn.jsp");
} 
%> 
                <tbody>
                  
                    <%
DatabaseConnection dc = new DatabaseConnection();

try {
    Class.forName("com.mysql.cj.jdbc.Driver");
    Connection con = dc.getConnect();

    String query = "SELECT pname, SUM(pprice) AS total_price, SUM(pquantity) AS total_quantity FROM cart WHERE person = ? GROUP BY pname";
    
    PreparedStatement ps = con.prepareStatement(query);
    ps.setString(1, user);
    ResultSet rs = ps.executeQuery();

    while(rs.next()){
        String product_name = rs.getString("pname");
        double product_price = rs.getDouble("total_price");
        int product_quantity = rs.getInt("total_quantity");
        double total_price = product_price * product_quantity;
%>   
        
     	<tr>
            <th scope="row"><%=product_name%></th>
			<td><%=product_price%></td>
			<td><%=product_quantity%></td>
			<td><%=total_price%></td>
		</tr>
        
         
<%
    }
    con.close();
} catch(SQLException ex) {
    out.println("An error occurred while processing your request.");
    out.println("Error message: " + ex.getMessage());
} catch(ClassNotFoundException ex) {
    out.println("An error occurred while processing your request.");
    out.println("Error message: " + ex.getMessage());
} 
%>
                  
                </tbody>
              </table>
              <!-- End Table with stripped rows -->
            </div>
          </div>

        </div>
      </div>
    </section>

  </main>
</body>
</html>
