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
      String Pro_cat=request.getParameter("cat");
		
		           
      
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
					<a class="navbar-brand logo_h" href="Home.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
					
					<!-- user session  -->
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
				<%}%>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					
					
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item active"><a class="nav-link" href="http://localhost:8080/Club10Sports/Home.jsp">Home</a></li>
							
							<li class="nav-item submenu dropdown">
							
								<a href="#" class="nav-link dropdown-toggle" data-toggle="dropdown" role="button" aria-haspopup="true"
								 aria-expanded="false">Category</a>
								<ul class="dropdown-menu">
									<li class="nav-item"><a class="nav-link" href="Category.jsp?cat=cricket">cricket</a></li>
									<li class="nav-item"><a class="nav-link" href="Category.jsp?cat=football">football</a></li>
									<li class="nav-item"><a class="nav-link" href="Category.jsp?cat=basketball">basketball</a></li>
									<li class="nav-item"><a class="nav-link" href="Category.jsp?cat=volleyball">volleyball</a></li>
									<li class="nav-item"><a class="nav-link" href="Category.jsp?cat=badminton">badminton</a></li>
								</ul>
							</li>
							
					
							<li class="nav-item"><a class="nav-link" href="Orders.jsp">My Orders</a></li>
						<li class="nav-item "><a class="nav-link" href="logout">Logout</a></li>
							<li class="nav-item "><a class="nav-link" href="Contact.jsp">Contact</a></li>
						</ul>
						<ul class="nav navbar-nav navbar-right">
							<li class="nav-item"><a href="Cart.jsp" class="cart"><span class="ti-bag"></span></a></li>
							
							
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
	
	
	<!-- start banner Area -->
	<section class="banner-area">
		<div class="container">
			<div class="row fullscreen align-items-center justify-content-start">
				<div class="col-lg-12">
					<div class="active-banner-slider owl-carousel">
						<!-- single-slide -->
						<div class="row single-slide align-items-center d-flex">
							<div class="col-lg-5 col-md-6">
								<div class="banner-content">
									<h1> Hot Collection!</h1>
									<h4>For Basketball Fans</h4>
									<p>Believe that voice that says you can run a little faster, and you can throw a little harder. That for you, the laws of physic are only merely a suggestion.</p>
							
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid" src="img/banner/banner-img.png" alt="">
								</div>
							</div>
						</div>
						<!-- single-slide -->
						<div class="row single-slide">
							<div class="col-lg-5">
								<div class="banner-content">
									<h1>New Runner<br>Collection!</h1>
									<p>Luck is the last time wish of those who want to believe that winning can happen by accident. Sweat, on the other hand, is for those who know its a choice. So decide now. Because destiny waits for no man.</p>
									
								</div>
							</div>
							<div class="col-lg-7">
								<div class="banner-img">
									<img class="img-fluid" src="img/banner/shoe1.png" alt="">
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- End banner Area -->
	
	
	<!-- start features Area -->
	<section class="features-area section_gap">
		<div class="container">
			<div class="row features-inner">
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/services/icon1.png" alt="">
						</div>
						<h6>Free Delivery</h6>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/services/icon2.png" alt="">
						</div>
						<h6>Return Policy</h6>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/services/f-icon3.png" alt="">
						</div>
						<h6>24/7 Support</h6>
					</div>
				</div>
				<!-- single features -->
				<div class="col-lg-3 col-md-6 col-sm-6">
					<div class="single-features">
						<div class="f-icon">
							<img src="img/services/icon4.png" alt="">
						</div>
						<h6>Secure Payment</h6>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- end features Area -->
	
	
	
	<div class="container" style="margin-top:50px">
		<div class="row justify-content-center">
	 <%	
	 Statement stmt = null;
	 OutputStream img;
	 	try	
	  	{
	  		Class.forName("com.mysql.cj.jdbc.Driver");
			Connection connection = DriverManager.getConnection(
			"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
			"root", "");
			
			
			stmt = connection.createStatement();
			ResultSet rs=stmt.executeQuery("select * from products where ProCat='"+Pro_cat+"' ");
			while(rs.next())
			{
			
	

		%>
			
		<!-- item box starts here -->		
			
						<div class="col-lg-3 col-md-6">
						<div class="single-product" >
							<div id="show p8" >
							
							<% 
					
							Blob blob=rs.getBlob("ProImg");
							byte byteArray[] =blob.getBytes(1,(int)blob.length());
							/*response.setContentType("image/jpg");
							img =response.getOutputStream();
							img.write(byteArray);
							img.flush();
							img.close();*/
							String encodedImage=Base64.getEncoder().encodeToString(byteArray);
							String pic="data:image/jgp;base64,"+encodedImage;
							%>
							<img src="<%=pic %>" style="height:150px;width:100%">
							
						
							</div>
							<div class="product-details">
								<h6 class="d-flex justify-content-center" style="overflow:hidden;background-color:orange; border-radius:3px; padding:5px;"><%=rs.getString("ProName") %></h6>
								<div class="price">
								
									
								<!--<h6 class="l-through">&#x20b9; 210.00</h6>
								--></div>
								<span>
								<button type="button" id="ProPrice" name="ProPrice" value="<%=rs.getString("ProPrice")%>" style="background-color:white;color:black;border-radius:3px;">&#x20b9;<%=rs.getString("ProPrice")%></button>
								</span>
								<div class="price" style="background-color:; border-radius:3px; padding:5px;margin-top:15px; ">
									<h5 id="detail" >Details</h5>
									<%=rs.getString("ProDesc")%>
								</div>
								<div class="prd-bottom row justify-content-center" >

									<a href="HomeTo.jsp?Id=<%=rs.getString("ProId")%>"  class="social-info">
										<span class="ti-bag"></span>
										<p class="hover-text" name="bag" >add to bag</p>
									</a>
									<a href="Buy.jsp?Id=<%=rs.getString("ProId")%>"  class="social-info">
										<span class="lnr lnr-heart"></span>
										<p class="hover-text" name="buy" >Buy</p>
									</a>
									
								</div>
							</div>
						</div>
					</div>
				
	<%
			}
  		}
  		catch(Exception e)
  		{
  				out.println(e);
  		}

      
	
	%>

	</div>
</div>
	
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
						<p>Follow us on Instagram to get the latest updates of your favorite brands.</p>
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