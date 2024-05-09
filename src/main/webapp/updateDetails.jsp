<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.informatics.password.PasswordEnDe"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>

   
<!DOCTYPE html>
<html>
<head>
	<link rel="stylesheet" href="style.css">
	<meta charset="ISO-8859-1">
<head>
	<title>My Personal Information</title>
</head>
<body>
	<h1 class = "heading">My Personal Information</h1>

	<form action="saveupdateddetails.jsp" method="POST">
    <input type="hidden" name="saveDetails" value="true">
    <table class = "table">
        <%
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            DatabaseConnection dc = new DatabaseConnection();
            Connection conn = dc.getConnect();

            String query = "select * from user_details where user_name='" + session.getAttribute("user") + "'";
            
            System.out.println(session.getAttribute("user"));

            PreparedStatement ps = conn.prepareStatement(query);
            ResultSet rs = ps.executeQuery();

            while(rs.next()){
            	String user_image = rs.getString("user_image");
            	String user_name = rs.getString("user_name");
            	String user_email = rs.getString("user_email");
            	String user_contact = rs.getString("user_contact");
            	String user_password = rs.getString("user_password");
            	
        %>
        <tr>
        	<th>User Image</th>
            <td><input type="file" name="updateduser_image" value="<%=user_image%>"></td>
        </tr>
        <tr>
        	<th>User Name</th>
            <td><input type="text" name="updateduser_name" value="<%=user_name%>"></td>
        </tr>
        <tr>
        	<th>Email</th>
            <td><input type="text" name="updateduser_email" value="<%=user_email%>"></td>
        </tr>
        <tr>
        	<th>Contact</th>
            <td><input type="text" name="updateduser_contact" value="<%=user_contact%>"></td>
        </tr>
        <%  String dbEncryptedPassword = user_password;
            String decryptedPassword = PasswordEnDe.decrypt(dbEncryptedPassword);
        %>
        <tr>
        	<th>Password</th>
            <td><input type="text" name="updateduser_password" value='<%= decryptedPassword %>'></td>
        </tr>
        <% } %> 
    </table>
    <Center>
    <button type="submit" id = "btn-save">Save Details</button>
    </Center>
</form>
<%
    } catch(Exception e) {
        // handle the exception
    } finally {
        // close any open resources here
    }
%>
</body>
</html>