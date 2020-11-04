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
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link rel="shortcut icon" href="img/fav.png">
<meta name="author" content="CodePixar">
<meta name="description" content="">
<meta name="keywords" content="">
<meta charset="UTF-8">
<title>Show_orders</title>
<link rel="stylesheet" href="css/linearicons.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/font-awesome.min.css">
<link rel="stylesheet" href="css/themify-icons.css">
<link rel="stylesheet" href="css/nice-select.css">
<link rel="stylesheet" href="css/nouislider.min.css">
<link rel="stylesheet" href="css/bootstrap.css">
<link rel="stylesheet" href="css/main.css">


	<script src="js/vendor/jquery-2.2.4.min.js"></script>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.11.0/umd/popper.min.js"
		integrity="sha384-b/U6ypiBEHpOf/4+1nzFpr53nxSS+GLCkfwBdFNTxtclqqenISfwAzpKaMNFNmj4"
		crossorigin="anonymous"></script>
	<script src="js/vendor/bootstrap.min.js"></script>
	<script src="js/jquery.ajaxchimp.min.js"></script>
	<script src="js/jquery.nice-select.min.js"></script>
	<script src="js/jquery.sticky.js"></script>
	<script src="js/nouislider.min.js"></script>
	<script src="js/jquery.magnific-popup.min.js"></script>
	<script src="js/owl.carousel.min.js"></script>

	<script
		src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCjCGmQ0Uq4exrzdcL6rvxywDDOvfAu6eE"></script>
	<script src="js/gmaps.min.js"></script>
	<script src="js/main.js"></script>


<script>
		$(document).ready(function()
		{
			$("#quan").keyup(function(){
				total();
			});
			
			//total
			function total()
			{
				var price=$("#price").val();
				var quan=$("#quan").val();
				var p=parseInt(price);
				var q= parseInt(quan);
				var t=p*q;
				$("#total").html(t);
			}
		});
</script>

</head>

<body>


	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="Show.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
					
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
					<input type="text" class="form-control" id="search_input" placeholder="Search Here">
					<button type="submit" class="btn"></button>
					<span class="lnr lnr-cross" id="close_search" title="Close Search"></span>
				</form>
			</div>
		</div>
	</header>
	<!-- End Header Area -->

	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		<div class="container">
			<div class="breadcrumb-banner d-flex flex-wrap align-items-center justify-content-end">
				<div class="col-first">
					<h1>ORDERS</h1>
					
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<section class="cart_area">
		<div class="container">
			<div class="cart_inner">
				<div class="table-responsive">
					<table class="table">
						<thead>
							<tr>
								<th scope="col">Buyer Name</th>
								<th scope="col">Email ID</th>
								<th scope="col">Contact No.</th>
								<th scope="col">Product Name</th>
								<th scope="col">Product ID</th>
								<th scope="col">Price</th>
								<th scope="col">Clear order</th>
								<th scope="col">Invoice</th>
							</tr>
						</thead>
						<tbody>

	<%	
	 
	 	try	
	  	{
				ResultSet rs=null;	
				Statement stmt =null;
				PreparedStatement ps=null;
				Connection connection=null;
				
			String user = session.getAttribute("user").toString();
			String id=request.getParameter("u");
			Class.forName("com.mysql.cj.jdbc.Driver");
			
			//Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
			connection = DriverManager.getConnection("jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC","root", "");
			
			stmt = connection.createStatement();
			String query="select * from Orders";
			rs=stmt.executeQuery(query);
				
			while(rs.next())
			{


	

		%>
			
		<!-- item box starts here -->		
			
							<tr>
							
								<td>
									<div class="media">
										
										<div class="media-body">
											<p><input type="hidden" id="name" name="name" value="<%=rs.getString("name") %>"><%=rs.getString("name") %></p>
										</div>
									</div>
								</td>
							
								
								<td>
									<div class="media">
										
										<div class="media-body">
											<p><input type="hidden" id="mail" name="mail"  value="<%=rs.getString("buyer") %>"><%=rs.getString("buyer") %></p>
										</div>
									</div>
								</td>
								
								<td>
									<div class="media">
										
										<div class="media-body">
											<p><input type="hidden" id="phone" name="phone" value="<%=rs.getString("phone") %>"><%=rs.getString("phone") %></p>
										</div>
									</div>
								</td>
								
								<td>
									<div class="media">
										
										<div class="media-body">
											<p><input type="hidden" id="proname" name="proname" value="<%=rs.getString("ProName") %>"><%=rs.getString("ProName") %></p>
										</div>
									</div>
								</td>
								<td>
									<h5><input type="hidden" id="proid" name="proid" value="<%=rs.getString("ProId") %>"><%=rs.getString("ProId") %></h5>
								</td>
								<td>
									<h5><input type="hidden" id="proprice" name="proprice" value="<%=rs.getString("Pro_price") %>">&#x20b9; <%=rs.getString("Pro_price") %></h5>
								</td>
								<td>
								<form action="Order_Clear.jsp?u=<%=rs.getString("ProId")%>" method="post">
									<input type="hidden" name="customer" value="<%=rs.getString("buyer")%>">
									<button type="submit" value="<%=rs.getString("ProId")%>" class="btn btn-outline-secondary"><b class="fa fa-check"></b></button>
								</form>
								</td>
								<td>
									<!-- <a href="Recipt.jsp?id=<%//=rs.getString("ProId")%>">get invoice</a> -->
									<form action="ReciptAdmin.jsp?id=<%=rs.getString("ProId")%>" method="post">
									<input type="hidden" id="name" name="name" value="<%=rs.getString("name") %>">
									<input type="hidden" id="mail" name="mail"  value="<%=rs.getString("buyer") %>">
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

      
	
	%>
							<tr class="out_button_area">
								<td></td>
								<td></td>
								<td>
									
								</td>
							</tr>
						</tbody>
					</table>
				</div>
			</div>
		</div>
	</section>


	
	<!--================End Cart Area =================-->

	<!-- start footer Area -->
	<footer class="footer-area section_gap">
		<div class="container">
			<div class="row">
				<div class="col-lg-3  col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>About Us</h6>
						<p>Right place for your businesses to grow with verified product suppliers. </p>
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
						<p>Follow us in Instagram to get the latest updates of your
							favorite brands.</p>
					</div>
				</div>
				<div class="col-lg-2 col-md-6 col-sm-6">
					<div class="single-footer-widget">
						<h6>Follow Us</h6>
						<p>Let us be social</p>
						<div class="footer-social d-flex align-items-center">
							<a
								href="https://www.facebook.com/pages/category/Amateur-Sports-Team/CLUB-10-Sports-1021053097973122/"><i
								class="fa fa-facebook"></i></a> <a
								href="https://www.facebook.com/pages/category/Amateur-Sports-Team/CLUB-10-Sports-1021053097973122/"><i
								class="fa fa-instagram"></i></a>
						</div>
					</div>
				</div>
			</div>
			<div
				class="footer-bottom d-flex justify-content-center align-items-center flex-wrap">
				<p class="footer-text m-0">
					Copyright &copy;
					<script>document.write(new Date().getFullYear());</script>
					This website is created <i class="fa fa-heart-o" aria-hidden="true"></i>
					by <a href="#" target="_blank">Atul Ashish Xalxo </a>and <a
						href="https://www.facebook.com/alan.donald" target="_blank">Alan
						B Thomas</a>

				</p>
			</div>
		</div>
	</footer>
	<!-- End footer Area -->

</body>

</html>