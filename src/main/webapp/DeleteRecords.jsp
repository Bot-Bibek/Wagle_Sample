<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="com.informatics.DatabaseConnection.DatabaseConnection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
DatabaseConnection dc = new DatabaseConnection();

try {
	Class.forName("com.mysql.cj.jdbc.Driver");
	Connection con = dc.getConnect();
	
	String product_id = request.getParameter("product_id");
				
	String query = "delete from product_details where product_id = ?"; 
	
	PreparedStatement ps = con.prepareStatement(query);
	
	ps.setString(1, product_id);
	int result = ps.executeUpdate();
	
	if(result > 0){ // if result is updated or recorded in database(the value of result is 1)
		RequestDispatcher forwardDispatcher = request.getRequestDispatcher("ProductRecords.jsp");
		forwardDispatcher.forward(request, response);
	}else{ // if result is not updated or recorded in database(the value of result is -1)
		RequestDispatcher includeDispatcher = request.getRequestDispatcher("DeleteRecords.jsp");
		includeDispatcher.include(request, response);
	}
} catch (Exception e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}

%>

</body>
</html>