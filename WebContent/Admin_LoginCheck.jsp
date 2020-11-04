
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>


<%@ page import="java.io.*,java.util.*, java.sql.*"%>
<!DOCTYPE html>
<html>
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

	<%
	String userMail = request.getParameter("userName");
	String password = request.getParameter("password");
	String usertype = "", parkingSlotID = "";
	
	//String url="jdbc:oracle:thin:@ICOSAHEDRON:1521/XE";
	//String userName="SYSTEM";
	//String passcode="1234";

	try {
		
		if((userMail!=null)||(password!=null))
		{
		// Class.forName("com.mysql.jdbc.Driver");
		Class.forName("com.mysql.cj.jdbc.Driver");
		// Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
		Connection connection = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
		"root", "");

		Statement statement = connection.createStatement();
		ResultSet resultSet = statement.executeQuery("SELECT * FROM Admins WHERE Email=\"" + userMail + "\" AND Pass=\"" + password + "\"");
		
		
		
		
		if (resultSet.next()) {
			
			out.print("<script type=\"text/javascript\">");
			out.print("alert('Login Successful');");
			out.print("</script>");
			out.print("welcome");
			String name_ses=(String)session.getAttribute("username");
			session.setAttribute("user", userMail);
			response.sendRedirect("Show.jsp");
		} else {%>
					<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		
	</section>
	<!-- End Banner Area -->	
			
		<section class="login_box_area section_gap">
		<div class="container" style="padding:5px">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img">
						<img class="img-fluid" src="img/poster1.jpg" alt="">
						
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h1>No user found......</h1>
						<b>if you are admin please check your details</b>
					<!-- 	<div class="hover" style="margin-top:25px">
							<form action="Admin_Login.jsp" method="post">
								<button type="submit" class="primary-btn" value="submit">Register</button>
							</form>
						</div> -->
						<div style="margin-top:10px;padding-bottom:20px">
							<!-- <a href="Admin_Login.jsp" style="color:gray">skip</a>
							 --><form action="Admin_Login.jsp" method="post">
								<button type="submit" class="primary-btn" value="submit">Login</button>
							</form>
						</div>	
					</div>
				</div>
			</div>
		</div>
	</section>
		<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		
	</section>
	<!-- End Banner Area -->
		<%}
		}
		else
		{
			response.sendRedirect("Admin_Login.jsp");
		}
		
	} catch (Exception e) {
		out.print(e);
	}
	%>
</body>
</html>