<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
		<%
		response.setHeader("Cache-Control" , "no-cache,no-store,must-revalidat");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expiress","0");

		if(session.getAttribute("user")==null)
		{
			response.sendRedirect("login.jsp");
		}
		%>
</body>
</html>