<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.io.*,java.util.*, java.sql.*"%>
    
    <%
		response.setHeader("Cache-Control" , "no-cache,no-store,must-revalidat");
		response.setHeader("Pragma","no-cache");
		response.setHeader("Expiress","0");

		if(session.getAttribute("user")==null)
		{
			response.sendRedirect("login.jsp");
		}
		%>
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
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			
		</div>
	</section>
	<!-- End Banner Area -->
	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="Home.jsp"><img
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
					<div class="collapse navbar-collapse offset"
						id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="Home.jsp">Home</a></li>
							
									
							<li class="nav-item active"><a class="nav-link" href="Orders.jsp">My Orders</a></li>

							<li class="nav-item"><a class="nav-link"
								href="logout">Logout</a></li>

							<li class="nav-item"><a class="nav-link" href="Contact.jsp">Contact</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="Cart.jsp" class="cart"><span
									class="ti-bag"></span></a></li>
							
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
	
	
	    <div class="justify-content-center p-9" style="margin:50px">
		<h1 class="justify-content-center">YOUR ORDERS</h1>
		</div>
					<!-- 	<div class="single-product shadow p-3 mb-5 bg-white rounded"  >
							
							<div class="product-details " style="height:180px;background-color:orange;">
								<div class="card"  style="height:250px;border-radius:9px;background-color:orange;">
									<div class="card-body shadow p-3  bg-white rounded" >
									Add New Product
									<div class="d-flex justify-content-center " style="border-radius:1000px;background-color:orange;margin-top:30px;padding:20px;">
									<a class="nav-link" href="Admin.jsp"><i class="fa fa-plus " aria-hidden="true" style="height:10px;font-size:60px;padding:9px;color:white;"></i></a>
									</div>
									</div>
										
								</div>
							</div>
						</div>
					</div> -->
					
					
					
	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col"><h4>Product</h4></th>
								<th scope="col"><h4>Price</h4></th>
								<th scope="col"><h4>Product Id</h4></th>
								<th scope="col"><h4>Invoice</h4></th>
							</tr>
						</thead>
						<tbody>
		
	 <%	
	 Statement stmt = null;
	 Connection connection=null;
	 	try	
	  	{
	  		Class.forName("com.mysql.cj.jdbc.Driver");
			connection = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "");
			
			
			stmt = connection.createStatement();
			ResultSet rs=stmt.executeQuery("select * from orders where buyer=\""+user+"\"");
			while(rs.next())
			{
			
	

		%>
			
							<tr>
								<td>
									<div class="media">
										
										<div class="media-body">
											<p><input type="hidden" id="name" value="<%=rs.getString("ProName") %>"><%=rs.getString("ProName") %></p>
										</div>
									</div>
								</td>
								<td>
									<h5><input type="hidden" id="price" value="<%=rs.getString("Pro_Price") %>">&#x20b9; <%=rs.getString("Pro_price") %></h5>
								</td>
								<td>
									<h5><input type="hidden" id="price" value="<%=rs.getString("ProId") %>"><%=rs.getString("ProId") %></h5>
								</td>
								<td>
									<!-- <a href="Recipt.jsp?id=<%//=rs.getString("ProId")%>">get invoice</a> -->
									<form action="Recipt.jsp?id=<%=rs.getString("ProId")%>" method="post">
										<button type="submit" class="btn btn-outline-secondary" ><b class="fa fa-download"></b></button>
									</form>
									
								</td>
							</tr>
					
							
				
	<%
			}
  		}
  		catch(Exception e)
  		{
  				out.println(e);
  		}
	 	finally
	 	{
	 		try
	 		{
	 			if(connection!=null)
	 			{
	 				connection.close();
	 			}
	 		}
	 		catch(Exception e)
	 		{
	 			
	 		}
	 	}

      
	
	%>
	
							<tr class="out_button_area">
								
								<td>
									<div class="checkout_btn_inner d-flex align-items-center">
										<a class="gray_btn" href="Home.jsp" style="color:black">Continue Shopping</a> 
									<!-- 	<a class="primary-btn" href="Confirmation.jsp">Proceed to checkout</a> -->
									</div>
								</td>
							</tr>
						</tbody>
					</table>
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