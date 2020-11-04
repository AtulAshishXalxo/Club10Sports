<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>


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

	<%
		
					String user= session.getAttribute("user").toString();
					String name=request.getParameter("name");
					String phone=request.getParameter("phone");
					String mail=request.getParameter("mail");
		           
      
	 %>
	 <div class="" style="margin-bottom:0px;margin-left:450px;">
	<img src="img/logos.png" height="100px" width="170px">
	</div>
	
	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="Show.jsp"><img
						src="img/logos.png" height="100px" width="170px"></a>
						<!-- user session -->
										<%	
				Class.forName("com.mysql.cj.jdbc.Driver");
			Connection con = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "");
			
			
			Statement statmt = con.createStatement();
			ResultSet rst=statmt.executeQuery("select f_name from users where mail='"+user+"' ");
			if(rst.next())
			{%>	
							<div class="d-flex align-items-end" style="padding:50px;">
								<h6><%=rst.getString("f_name") %></h6>
							</div> 
							<%} %>
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="icon-bar"></span> <span class="icon-bar"></span> <span
							class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item "><a class="nav-link" href="http://localhost:8080/Club10Sports/Show.jsp">My Product</a></li>
					
							
						<li class="nav-item active"><a class="nav-link" href="Show_Orders.jsp">Orders</a></li>
						<li class="nav-item"><a class="nav-link" href="logout">Logout</a></li>
						
							</ul>
					</div>

				</div>
			</nav>
		</div>
		<div class="search_input" id="search_input_box">
			<div class="container">
				<form class="d-flex justify-content-between">
					<input type="text" class="form-control" id="search_input"
						placeholder="Search Here">
					<button type="submit" class="btn"></button>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->


<!--================Order Details Area =================-->
	<section class="order_details section_gap">
		<div class="container" id="invoice">
				
		<div style="float:right;margin-right:20px"><button type="button" id="download" onclick="printPdf();" class="btn btn-outline-primary">download</button></div>
			<div class="order_details_table">
				<h2>Order Details</h2>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><h4>Product</h4></th>
								<th scope="col"><h4>Quantity</h4></th>
								<th scope="col"><h4>Total</h4></th>
							</tr>
						</thead>
						<tbody>
						
	<%
		String Pro_id=request.getParameter("id");
	 Statement stmt = null;
	 OutputStream img;
	 	try	
	  	{
	 		if(Pro_id!=null)
			{
			
				Class.forName("com.mysql.cj.jdbc.Driver");
				Connection connection = DriverManager.getConnection(
				"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
				"root", "");
				Statement stat = connection.createStatement();
				ResultSet rs=stat.executeQuery("Select * from products where ProId='"+Pro_id+"'");
				while(rs.next())
				{
			%>
							<tr>
									<td>
										<p style="color:orange"><%=rs.getString("ProName") %></p>
									</td>
									<td>
										<p style="color:orange">x 01</p>
									</td>
									<td>
										<p style="color:orange">&#x20b9;<%=rs.getString("ProPrice") %></p>
									</td>
								</tr>
								<tr>
									<td>
										<h4>Product Id :&nbsp<%=rs.getString("ProId") %></h4>
									</td>
									<td>
										<h5>subtotal </h5>
									</td>
									<td>
										<p>&#x20b9;<%=rs.getString("ProPrice") %></p>
									</td>
								</tr>
								<tr>
									<td>
										<h4>Shipping</h4>
									</td>
									<td>
										<h5></h5>
									</td>
									<td>
										<p>Flat rate: &#x20b9; 0.00</p>
									</td>
								</tr>
								<tr>
									<td>
										<h4>Total</h4>
									</td>
									<td>
										<h5></h5>
									</td>
									<td>
										<p>&#x20b9; <b id="total" ><%=rs.getString("ProPrice")%></b></p>
									</td>
								</tr>
							</tbody>
						</table>
					</div>
					
					
					<!-- adding delivery charge -->
					<script type="text/javascript">
						
						function printPdf()
						{
							window.print();
						}
					</script>
					
					
					
					
				<%
				}
			}
				
				if(Pro_id!=null)
				{
				
					Class.forName("com.mysql.cj.jdbc.Driver");
					Connection connection = DriverManager.getConnection(
					"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
					"root", "");
					Statement stat = connection.createStatement();
					ResultSet rs=stat.executeQuery("Select * from users where mail='"+mail+"'");
					while(rs.next())
					{
				%>
				<div style="margin-top:40px">	
					<div class="row">
						<div class="col-md-4">
							<h6>Buyer Name :<i> <%=rs.getString("f_name") %>&nbsp<%=rs.getString("l_name") %></i></h6>
						</div>
						<div class="col-md-4">
							<h6>Contact No : <i><%=rs.getString("phone") %></i></h6>
						</div>
						<div class="col-md-4">
						<h6>Mail Id :<i> <%=rs.getString("mail") %></i></h6>
						</div>
						<div class="col-md-8" style="margin-top:20px">
						<h6>Address :<i> <%=rs.getString("address") %></i></h6>
						</div>
					</div>	
					
				</div>
				<%}
				
			}
			
			else
			{
				response.sendRedirect("Cart.jsp");
			}
		} 
		catch (Exception e) 
		{
			System.out.println(e);

		}
		%>
			
				</div>
			</div>
		</section>


	<section>
	
		
	
	</section>




<!--================End Order Details Area =================-->

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>
							Right place for your businesses to grow with verified product suppliers. 
						</p>
					</div>
				</div>
				<div class="col-lg-4  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Contact Us</h6>
						<p>Club10Sports@gmail.com</p>
						<p>Contact No : 6201509975</p>
						<div class="" id="mc_embed_signup">

						</div>
					</div>
				</div>
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget mail-chimp">
						<h6 class="mb-20">Instragram Feed</h6>
						<p>Follow us in instagram to get the latest updates of your favorite brands.</p>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a href="https://www.facebook.com/pages/category/Amateur-Sports-Team/CLUB-10-Sports-1021053097973122/"><i class="fa fa-facebook"></i></a>
							<a href="https://www.facebook.com/pages/category/Amateur-Sports-Team/CLUB-10-Sports-1021053097973122/"><i class="fa fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0">
Copyright &copy;<script>document.write(new Date().getFullYear());</script> This website is created <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="#" target="_blank">Atul Ashish Xalxo </a>and <a href="https://www.facebook.com/alan.donald" target="_blank">Alan B Thomas</a>

</p>

			</div>
		</div>
		<div class="d-flex justify-content-center" >
		<p style="color:black;">This receipt is auto-generated and issued by Club10Sports.</p>
		</div>
	</footer>
	<!-- End footer Area -->

	


	
</body>
</html>