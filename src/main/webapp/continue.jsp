<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
<style>
    h1 {
        text-align: center;
        font-size: 36px;
        margin-top: 50px;
    }
    
    button {
        display: block;
        margin: 0 auto;
        padding: 20px 40px;
        font-size: 24px;
        color: #fff;
        background-color: #007bff;
        border: none;
        border-radius: 10px;
        cursor: pointer;
        transition: all 0.3s ease-in-out;
    }
    
    button:hover {
        transform: scale(1.1);
        background-color: #0062cc;
    }
</style>
</head>
<body>
<%
session = request.getSession();
String user = (String)session.getAttribute("user");
if(user == null){
	response.sendRedirect("SignIn.jsp");
}
%>
<h1>Welcome to Value Point</h1>
<form action="HomePage.jsp" method="post">
    <button>Continue</button>
</form>
</body>
</html>
