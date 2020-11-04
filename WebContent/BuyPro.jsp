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
	<link rel="stylesheet" href="css/font-awesome.min.css">
	<link rel="stylesheet" href="css/themify-icons.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/owl.carousel.css">
	<link rel="stylesheet" href="css/nice-select.css">
	<link rel="stylesheet" href="css/nouislider.min.css">
	<link rel="stylesheet" href="css/ion.rangeSlider.css" />
	<link rel="stylesheet" href="css/ion.rangeSlider.skinFlat.css" />
	<link rel="stylesheet" href="css/magnific-popup.css">
	<link rel="stylesheet" href="css/main.css">
	
	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js" integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
	 crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/countdown.js"></script>
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
		
		

		%>

	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="Home.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
					
					<!-- user session  
							<div class="d-flex align-items-end" style="padding:50px;">
								<h6><% //out.println(user); %></h6>
							</div>-->
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					
					
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						
					</div>
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
	
	
	
	<section class="order_details section_gap" style="margin-top:100px">
		<div class="container">
			<h3 class="title_confirmation">Thank you. Your order has been received.</h3>
				
			<div class="order_details_table">
				<h1>Order Details</h1>
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
							<th></th>
								<th scope="col"><h4>Product</h4></th>
								<th scope="col"><h4>Quantity</h4></th>
								<th scope="col"><h4>Total</h4></th>
								<th></th>
							</tr>
						</thead>
						<tbody>
	
	
		<%
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
		Statement stmt=connection.createStatement();
		ResultSet rs=stmt.executeQuery("select * from users where mail='"+user+"'");
		if(rs.next())
		{
		PreparedStatement ps = connection.prepareStatement("INSERT INTO orders VALUES(?,?,?,?,?,?)");
		ps.setString(1, user);
		ps.setString(2, Pro_id);
		ps.setString(3, Pro_name);
		ps.setString(4, Pro_price);
		ps.setString(5, rs.getString("f_name"));
		ps.setString(6, rs.getString("phone"));
		ps.executeUpdate();
		}
		
	
		
	 }
		
		if((user!=null)||(Pro_name!=null)||(Pro_price!=null)||(Pro_id!=null))
		{
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "");
			Statement stat = connection.createStatement();
			stat.executeUpdate("delete from cart where Pro_Id='"+Pro_id+"'");
			
			
			
		}
		
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
							<td></td>
								<td>
									<p><%=rs.getString("ProName") %></p>
								</td>
								<td>
									<h5>x 01</h5>
								</td>
								<td>
									<p>&#x20b9;<%=rs.getString("ProPrice") %></p>
								</td>
							</tr>
							<tr>
							<td></td>
								<td>
									<h4>Subtotal</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								<td>
									<p>&#x20b9; <%=rs.getString("ProPrice") %></p>
								</td>
							</tr>
							<tr>
							<td></td>
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
							<td></td>
								<td>
									<h4>Total</h4>
								</td>
								<td>
									<h5></h5>
								</td>
								
								<td>
									<p>&#x20b9; <b id="total"><%=rs.getString("ProPrice") %></b></p>
								</td>
							</tr>
						
				
							
				<!-- adding delivery charge 
				<script type="text/javascript">
					$(document).ready(function()
							{
								var a=<%//=rs.getString("ProPrice")%>;
								var price=parseInt(a);
								var b=a+50;
								$("#total").html(b);
								$("#total").css("color","black");
							});
				
				</script>-->
				
				
				
				
			<%
			}
			
		}
		
		%>					<tr>
								<td></td>
								<td></td>
								<td>
									
									<div class="col-md-12 form-group" class="d-flex justify-items-center" style="margin-top:10px">
										<form action="Orders.jsp" method="post" >
											<button type="submit" value="submit" name="submit" class="btn btn-outline-success" style="width:50%"> OK </button>
										</form>
									</div>
								</td>
								<td></td>
								<td></td>
							</tr>
						</tbody>
						</table>
		<% 
		
	} 
	catch (Exception e) 
	{
		System.out.println(e);

	}
	%>				
	
					</div>
		
				</div>
			</div>
	</section>
	
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
						<h6>Newsletter</h6>
						<p>Stay update with our latest updates</p>
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
	</footer>
	<!-- End footer Area -->
	
</body>
</html>