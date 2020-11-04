<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    
<%@ page import="java.io.*,java.util.*, java.sql.*"%>

<!DOCTYPE html>
<html lang="zxx" class="no-js">
<head>

	<meta charset="ISO-8859-1">
	<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
	<link rel="shortcut icon" href="img/fav.png">
	<meta name="author" content="CodePixar">
	<meta name="description" content="">
	<meta name="keywords" content="">
	<meta charset="UTF-8">
	<title>Club10Sports</title>

	<link rel="stylesheet" href="css/linearicons.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/main.css">
	
	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>
	<!--gmaps Js-->
	<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>
	
</head>
<body>
		<%ResultSet rs=null;	
		Statement stmt =null;
		PreparedStatement ps=null;
		Connection connection=null;
		try
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
	
			String ProId =request.getParameter("ProId");
			String ProName =request.getParameter("ProName");
			String ProType =request.getParameter("ProType");
			String ProDesc =request.getParameter("ProDesc");
			String ProPrice =request.getParameter("ProPrice");
			
			if((ProId!=null)&&(ProName!=null)&&(ProType!=null)&&(ProDesc!=null)&&(ProPrice!=null))
			{
				String qry="update Products set ProName=?,ProType=?,ProDesc=?,ProPrice=? where ProId='"+ProId+"'";
				ps=connection.prepareStatement(qry);
				ps.setString(1,ProName);
				ps.setString(2,ProType);
				ps.setString(3,ProDesc);
				ps.setString(4,ProPrice);
				/*ps.executeUpdate();
				response.sendRedirect("Index.jsp");*/
				
				int i = ps.executeUpdate();
				if(i > 0)
				{
					out.print("Record Updated Successfully");
					response.sendRedirect("Show.jsp");
				}
				else
				{
					out.print("There is a problem in updating Record.");
				}
				%>
				
		<% }
			else
			{%>
				<h1>not running</h1>
				<h6>id--><% out.println(ProId);%></h6>
				<h6>name--><% out.println(ProName);%></h6>
				<h6>type--><% out.println(ProType);%></h6>
				<h6>description--><% out.println(ProDesc);%></h6>
				<h6>price--><% out.println(ProPrice);%></h6>
			<%}
		}
		catch(SQLException qry)
			{
			request.setAttribute("error", qry);
			out.println(qry);
			}
			%>



</body>
</html>