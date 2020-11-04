
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
		String Fname = request.getParameter("fname");
	    String Lname = request.getParameter("lname");
	    String Email = request.getParameter("email");
	    String Phno = request.getParameter("phno");
	    String Pass = request.getParameter("cpass");

	//INSERT TO TABLE

	//Connection con=null;
	Statement stmt = null;

	try {
		
		if((Fname!=null)||(Lname!=null)||(Email!=null)||(Phno!=null)||(Pass!=null))
		{
		//Class.forName("com.mysql.jdbc.Driver");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
		"root", "");

		stmt = connection.createStatement();
		String query = "INSERT INTO admins VALUES('" + Fname + "','" + Lname + "','" + Email + "' ,'" + Phno + "', '" + Pass + "')";
		int resultFlag = stmt.executeUpdate(query);
		if (0 != resultFlag) {
			String username=(String)session.getAttribute("email");
			session.setAttribute("user",Email);
			response.sendRedirect("Show.jsp");
		} else {
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Error Registering User! Try again later!');");
			out.println("</script>");
		}
		
	}
	else
	{
		response.sendRedirect("Admin_Reg.jsp");
	}
	} catch (Exception e) {
		System.out.println(e);

	}
	%>
</body>
</html>