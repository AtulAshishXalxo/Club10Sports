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
		String user= session.getAttribute("user").toString();
		String Pro_name = request.getParameter("ProName");
		String Pro_id=request.getParameter("ProId");
		String Pro_price = request.getParameter("ProPrice");
		
	//INSERT TO TABLE

	//Connection con=null;
	

	try {
		
		if((user!=null)||(Pro_name!=null)||(Pro_price!=null)||(Pro_id!=null))
		{
		//Class.forName("com.mysql.jdbc.Driver");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
		"root", "");
		
		PreparedStatement ps = connection.prepareStatement("INSERT INTO orders VALUES(?,?,?,?)");
		ps.setString(1, user);
		ps.setString(2, Pro_id);
		ps.setString(3, Pro_name);
		ps.setString(4, Pro_price);
		ps.executeUpdate();
		response.sendRedirect("Buy.jsp");
		
		%>
		
	<% }
	else
	{
		response.sendRedirect("Home.jsp");
	}
	} catch (Exception e) {
		System.out.println(e);

	}
	%>
</body>
</html>