<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<link rel="stylesheet" href="style.css">
<meta charset="ISO-8859-1">
<title>Product Information</title>
</head>
<body>
<h1 class = "heading">Product Information</h1>

<%
    try {
        Class.forName("com.mysql.cj.jdbc.Driver");
        DatabaseConnection dc = new DatabaseConnection();
        Connection con = dc.getConnect();
        
        String product_id = request.getParameter("product_id");
        
        String query = "select * from product_details where product_id = ?";
        
        PreparedStatement ps = con.prepareStatement(query);
        ps.setString(1, product_id);
        ResultSet rs = ps.executeQuery();
        
        if (rs.next()){
            String product_name = rs.getString("product_name");
            int product_price = rs.getInt("product_price");
            int product_category = rs.getInt("product_category");
            int product_quantity = rs.getInt("product_quantity");
            String product_description = rs.getString("product_description");
        %>
        <form action="SaveUpdatedRecords" method="post">
        <table class="table">
            <tr>
                <th>Product Name</th>
                <td><input type="text" name="updated_product_name" value="<%=product_name%>"></td>
            </tr>
            <tr>
                <th>Product Price</th>
                <td><input type="text" name="updated_product_price" value="<%=product_price%>"></td>
            </tr>
            <tr>
                <th>Product Category</th>
                <td><input type="text" name="updated_product_category" value="<%=product_category%>"></td>
            </tr>
            <tr>
                <th>Product Quantity</th>
                <td><input type="text" name="updated_product_quantity" value='<%= product_quantity %>'></td>
            </tr>
            <tr>
                <th>Product Description</th>
                <td><input type="text" name="updated_product_description" value='<%= product_description %>'></td>
            </tr>
            </table>
            <input type="hidden" name="product_id" value="<%=product_id%>">
            <Center>
	    <button type="submit" id = "btn-save">Save Details</button>
	    </Center>
        </form>
        <% } else { %>
        <p>No records found for the specified product id.</p>
        <% }
    } catch(Exception e) {
        // handle the exception
    }
%>
</body>
</html>
