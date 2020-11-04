
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
<body >

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
					<a class="navbar-brand logo_h" href="Home.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
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
	<%
		String user= session.getAttribute("user").toString();
		String Pro_id=request.getParameter("Id");


	try {
		
		
		//Class.forName("com.mysql.jdbc.Driver");
		Class.forName("com.mysql.cj.jdbc.Driver");
		Connection connection = DriverManager.getConnection(
		"jdbc:mysql://localhost:3306/test?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC",
		"root", "");
		
		
		Statement stmt=connection.createStatement();
		String query="select * from products where ProId='"+Pro_id+"'";
		ResultSet rs=stmt.executeQuery(query);
		while(rs.next())
		{%>
							
		
		
		<section class="login_box_area section_gap" >
		<div class="container shadow" >
			<div class="row">
				
				<div class="col-lg-6"  style="background-image:url('img/stadium1.jpg');padding:10px;width:100%;">
					<div class="login_form_inner" style="padding-top:10px;margin-top:50px;" >
						<h1 style="color:white">WELCOME TO OUR PAYMENT PORTAL </h1><i class="fa f-smile" aria-hidden="true"></i>
							
						</div>
					</div>
					<div class="col-lg-6"  style="background-color:;padding:10px;width:100%; border:5px;">
					<div style="margin-bottom:20px;">
					
					
							<form onsubmit="return validation();" action="BuyPro.jsp" method="post" >
								<input type="hidden" name="user" value="<%=rs.getString("userEmail")%>">
								<input type="hidden" name="ProName" value="<%=rs.getString("ProName") %>">
								<input type="hidden" name="ProId" value="<%=rs.getString("ProId") %>">
								<input type="hidden" name="ProPrice" value="<%=rs.getString("ProPrice") %>">
								
								
								
								<div class="row">
									<div class="col-md-8 d-flex justify-content-end" >
										<b>CREDIT CARD PAYMENT</b>
									</div>
									
									
									<div class="col-md-4 text-right" style="margin-top:-5">
											<img src="img/services/visa.jpg" style="height:35px;width:40px">
											<img src="img/services/master.png" style="height:25px;width:40px">
											<img src="img/services/amex.png" style="height:40px;width:40px">
									</div>
								</div>
								<div class="row" style="margin-top:10px">
									<div class="col-md-8">
										<h6>Product:</h6><%=rs.getString("ProName")%>
									</div>
									<div class="col-md-4">
										<h6>Price:</h6><%=rs.getString("ProPrice") %>
									</div>
								</div>
								
								<div style="margin-top:10px">
								<label for="cc-number" class="control-label">CARD NUMBER</label>
									<input type="text" id="cc-number" style="border:1px solid skyblue" class="input-lg form-control cc-number" autocomplete="cc-number" placeholder="**** **** ****  ****" name="">
									<h6 id="cn" style="color:orange"></h6>
								</div>
								
								<div class="row">
									<div class="col-md-6">
										<label for="cc-exp" class="control-label">CARD EXPIRY</label>
										<input type="text" id="cc-exp" style="border:1px solid skyblue"class="input-lg form-control cc-exp" autocomplete="cc-exp" placeholder="** / **" name="">
									<h6 id="ex" style="color:orange"></h6>
									</div>
									<div class="col-md-6">
										<label for="cc-cv" class="control-label">CARD CVC</label>
										<input type="text" id="cc-cv" style="border:1px solid skyblue" class="input-lg form-control cc-ecv" autocomplete="cc-cv" placeholder="***" name="">
										<h6 id="cv" style="color:orange"></h6>
									</div>
									
								</div>
								
								<div class="form-group">
									<label for="numeric" class="control-label">CARD HOLDER NAME</label>
									<input type="text" id="cc-name" class="input-lg form-control" style="border:1px solid skyblue">
									<h6 id="nm" style="color:orange"></h6>
								</div>
								
								<input type="submit" class="btn btn-outline-success form-control" value="MAKE PAYMENT" style="hight:100px; width:200px;padding:8px;border-radius:40px;margin-top:10px;margin-left:180px">
								<a href="Home.jsp" class="d-flex justify-content-around" style="margin-top:10px">cancel</a>
							</form>
						</div>
					</div>
				</div>
			</div>
	</section>
		
		<%
		}
	
	} 
	catch (Exception e) 
	{
		out.println(e);

	}
	%>
		
		<script type="text/javascript">
		
		function validation()
		{
			var cnum=document.getElementById("cc-number").value;
			var cex=document.getElementById("cc-exp").value;
			var ccv=document.getElementById("cc-cv").value;
			var cnm=document.getElementById("cc-name").value;
			
			//number
			if(cnum=="")
				{
					document.getElementById("cn").innerHTML="*enter card number";
					return false;
				}	
			if(isNaN(cnum))
			{
				document.getElementById("cn").innerHTML="*only digits are allowed";
				return false;
				}
			if((cnum.length<=0)||(cnum.length>=17))
			{
			document.getElementById("cn").innerHTML="*card number must have 16 digit value";
			return false;
			}
			
			
			//expiry
			if(cex=="")
			{
				document.getElementById("ex").innerHTML="*please fill the expiry date";
				return false;
			}
			
			if(cex.indexOf('/')<=1)
			{
			document.getElementById("ex").innerHTML="*invalid / position";
			return false;
			}
			if((cex.charAt(cex.length-3)!='/'))
			{
			document.getElementById("ex").innerHTML="*invalid format";
			return false;
			}
				//cv
			if(ccv=="")
			{
				document.getElementById("cv").innerHTML="*please fill your cv number";
				return false;
			}
			if(isNaN(ccv))
			{
				document.getElementById("cv").innerHTML="*please write digits only";
				return false;
				}
			if(ccv.length!=3)
			{
			document.getElementById("cv").innerHTML="*enter 3 digits number only";
			return false;
			}
			
			
			//name
			if(cnm=="")
			{
				document.getElementById("nm").innerHTML="*name can not be empty";
				return false;
			}
			if((cnm.length<=2)||(cnm.length>=20))
			{
			document.getElementById("nm").innerHTML="*name format not verified";
			return false;
			}
			
			if(!isNaN(cnm))
			{
				document.getElementById("nm").innerHTML="*only characters allowed";
				return false;
				}
		}
	
			
	</script>
	<!-- Start Banner Area -->
	<section class="banner-area organic-breadcrumb">
		
	</section>
	<!-- End Banner Area -->
	
</body>
</html>