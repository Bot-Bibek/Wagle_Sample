<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="com.informatics.password.PasswordEnDe" %>

<%@ page session="false" language="java" import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Save Updated Details</title>
</head>
<body>
    <%
    // Get the current session
    HttpSession session = request.getSession();

  /*   try { */
    	String updateduser_image = request.getParameter("updateduser_image");
    	String updateduser_name = request.getParameter("updateduser_name");
    	String updateduser_email = request.getParameter("updateduser_email");
    	String updateduser_contact = request.getParameter("updateduser_contact");
    	String encryptedPassword = PasswordEnDe.encrypt(request.getParameter("updateduser_password"));
    	String currentUsername = session.getAttribute("user").toString();
         
    	// Update the database with the updated values
    	Class.forName("com.mysql.cj.jdbc.Driver");
    	DatabaseConnection dc = new DatabaseConnection();
    	Connection conn = dc.getConnect();

    	PreparedStatement ps = conn.prepareStatement("UPDATE user_details SET user_image=?, user_name=?, user_email=?, user_contact=?, user_password=? WHERE user_name=?");
    	ps.setString(1, updateduser_image);
    	ps.setString(2, updateduser_name);
    	ps.setString(3, updateduser_email);
    	ps.setString(4, updateduser_contact);
        ps.setString(5, encryptedPassword);
        ps.setString(6, (String) session.getAttribute("user"));

    	int rowsUpdated = ps.executeUpdate();

    	if (rowsUpdated > 0) {
    		%>
            <jsp:forward page="SignIn.jsp"/>
            <%
    	} else {
    		%>
            <jsp:include page="updateDetails.jsp"/>
            <%
    	}


  /*   } catch(Exception e) {
        // Handle any exceptions
        out.println("<p>Exception occurred: " + e.getMessage() + "</p>");
    } */
    %>
</body>
</html>