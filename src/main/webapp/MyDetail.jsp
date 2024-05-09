<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@page import="com.informatics.password.PasswordEnDe"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<!DOCTYPE html>
<html>
<meta charset="ISO-8859-1">
<head>
	<link rel="stylesheet" href="style.css">
	<title>My Personal Information</title>
</head>
<body>
	<h1 class = "heading">My Personal Information</h1>

	<table class = "table">
		<%

try {
    // your code that may throw an exception
    Class.forName("com.mysql.cj.jdbc.Driver");
    DatabaseConnection dc = new DatabaseConnection();
    Connection conn = dc.getConnect();

    String query = "select * from user_details where user_name='" + session.getAttribute("user") + "'";
    
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
            <td><img src="<%= request.getContextPath()%>/user_image/<%= user_image%>" alt = ""></td>
        </tr>
        <tr>
         	<th>User Name</th>
            <td><%=user_name%></td>
        </tr>
        <tr>
            <th>Email</th>
			<td><%=user_email%></td>
        </tr>
        <tr>
        	<th>Contact</th>
            <td><%=user_contact%></td>
        </tr>
        <tr>
            <%  String dbEncryptedPassword = user_password;
                // Decrypt the password using the PasswordEnDe class
                String decryptedPassword = PasswordEnDe.decrypt(dbEncryptedPassword);
                      
            %>
            <th>Password</th>
            <td><%= decryptedPassword %></td>
        </tr>
        </table>
        
        <form action="updateDetails.jsp" method="post">
        	<input type="hidden" name="user_image" value='<%= user_image%>'>
		    <input type="hidden" name="user_name" value='<%= user_name%>'>
		    <input type="hidden" name="user_email" value='<%= user_email%>'>
		    <input type="hidden" name="user_contact" value='<%= user_contact%>'>
		    <input type="hidden" name="user_password" value='<%= decryptedPassword %>'>
		     <Center>
		    <button type="submit" id = btn-update>Update Details</button>
		    </Center>
		</form>
<%
    }
} catch(Exception e) {
    // handle the exception
} finally {
	
    // close any open resources here
}
%>	
</body>
</html>