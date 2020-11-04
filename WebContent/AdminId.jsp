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
	String username = request.getParameter("userName");
	String password = request.getParameter("password");
	String usertype = "", parkingSlotID = "";


	try {
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
		"root", "");

		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT Email FROM Admins WHERE Fname=\"" + username + "\" AND Pass=\"" + password + "\"");

		if (resultSet.next()) {
			
			out.println("<script type=\"text/javascript\">");
			out.println("alert('Login Successful');");
			out.println("</script>");
			out.println("welcome");
			String name_ses=(String)session.getAttribute("username");
			session.setAttribute("user", username);
			response.sendRedirect("Home.jsp");
		} else {
			out.print("not valid");
			out.print("<script type=\"text/javascript\">");
			out.print("alert('Invalid login details');");
			out.print("</script>");
			response.sendRedirect("login.jsp");
		}

	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>