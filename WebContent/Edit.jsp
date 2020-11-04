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
	
</head >

<body>
<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		
	</section>
	<!-- End Banner Area -->

<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="login.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					
				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->
	
		<section class="login_box_area section_gap" style="margin-top:1px" >
		<div class="container shadow " style="background-image:url('')" >
			<div class="row justify-content-center">
				<div class="col-lg-6 p-80">

<% 				ResultSet rs=null;	
				Statement stmt =null;
				PreparedStatement ps=null;
				Connection connection=null;
			Class.forName("com.mysql.cj.jdbc.Driver");
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
			
			stmt = connection.createStatement();
			String u=request.getParameter("u");
			//String id=request.getParameter("u");
			String query="select * from Products where ProId='"+u+"'";
			rs=stmt.executeQuery(query);
				
			while(rs.next())
			{


%>

	<form action="Editing.jsp" method="post"> 
			<input type="hidden" name="ProId" value="<%=rs.getString("ProId")%>"/>
			
			<div class="form-group">
				<label style="color:orange;">Product name</label>
				<input type="text" style="color:gray;" class="form-control" name="ProName" value="<%=rs.getString("ProName")%>" placeholder="product name">
			</div>
			
			<div class="form-group">
				<label style="color:orange;">Product Type</label>
				<input type="text" style="color:gray;" class="form-control" name="ProType" value="<%=rs.getString("ProType")%>" placeholder="product type">
			</div>
			<div class="form-group">
				<label style="color:orange;">Product description</label>
				<input type="text" style="color:gray;" class="form-control" name="ProDesc" value="<%=rs.getString("ProDesc")%>" placeholder="product desciption">
			</div>
			<div class="form-group">
				<label style="color:orange;text-style:bold;">Product price</label>
				<input type="text" style="color:gray;" class="form-control" name="ProPrice" value="<%=rs.getString("ProPrice")%>" placeholder="product price">
			</div>
			<%
				} 
			%>
			<div class="row  justify-content-center" style="margin:30px">
			 	<div class="">
					<button type="submit" class="btn btn-outline-secondary">update</button>
					<a href="Show.jsp" class="btn btn-danger" style="background-color:orange;border-color:orange;">Back</a>
				</div>
			</div>
	</form>
	</div>
	</div>
	</div>
	</section>
	
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		
	</section>
	<!-- End Banner Area -->
</body>
</html>

