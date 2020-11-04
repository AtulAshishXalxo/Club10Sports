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
			
			String user= session.getAttribute("user").toString();
		

		%>
	<form action ="reg.jsp" method="post">
	<!-- Start Header Area -->
	<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="Admin.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
					<!-- user session  -->
							<div class="d-flex align-items-end" style="padding:50px;">
								<h4></h4>
							</div>
					
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
						<span class="icon-bar"></span>
					</button>
					<!-- Collect the nav links, forms, and other content for toggling -->
					<div class="collapse navbar-collapse offset" id="navbarSupportedContent">
						<ul class="nav navbar-nav menu_nav ml-auto">
							<li class="nav-item"><a class="nav-link" href="Show.jsp">My Product</a></li>
							
							
							<li class="nav-item active"><a class="nav-link" href="logout">Logout</a></li>
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
					<h1>UPLOAD HERE</h1>
						<!-- <h1><% //out.println(user); %></h1>  -->
				</div>
			</div>
		</div>
	</section>
	<!-- End Banner Area -->

	<!--================Login Box Area =================-->
	<form class="row login_form" action="http://localhost:8080/Club10Sports/Admin" method="post" id="contactForm" novalidate="novalidate" enctype="multipart/form-data">
						
	
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_form_inner">
						<div class="hover" >
							<h4>UPLOAD PRODUCT IMAGE </h4>
							                <div class="input-group mb-3 px-2 py-2 rounded-pill bg-white shadow-sm" style="margin-top:80px">
             								   <input type="file" id="image_up" name="image_up "class=" form-control border-0">
          								 		
          								 		<select name="category" id="category">
   													<option>category</option>
   													<option>cricket</option>
   													<option>football</option>
   													<option>badminton</option>
   													<option>volleyball</option>
   													<option>basketball</option>
   												</select>
          								  </div>
   											
          								   <div class="image-area mt-4">
          								   		<img id="imageResult" src="#" alt="" class="img-fluid rounded shadow-sm mx-auto d-block">
          								   	</div>
											<label id="upload-label" for="image_up" class="font-weight-light text-muted align-items-center"></label>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>PRODUCT DETAILS</h3>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="ProName" id="ProName"  placeholder="Product Name" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Product Name'" required="required" autocomplete="off">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="ProType" id="ProType"  placeholder="Type" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Type'" required="required" required="required" autocomplete="off">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="ProId" id="ProId" placeholder="Id" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'" required="required" autocomplete="off">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="ProDesc" id="ProDesc" placeholder="Description" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Description'" required="required" autocomplete="off">
							</div>
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" name="ProPrice"  id="ProPrice" placeholder="Price" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Price'" required="required" autocomplete="off">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">Given details are correct and authorised</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" id="btn_img" value="submit" class="primary-btn">Upload Product</button>
							</div>
						
					</div>
				</div>
			</div>
		</div>
</form>
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

							<!--<form target="_blank" novalidate="true" action="https://spondonit.us12.list-manage.com/subscribe/post?u=1462626880ade1ac87bd9c93a&amp;id=92a4423d01" method="get" class="form-inline">

								<div class="d-flex flex-row">

									<input class="form-control" name="EMAIL" placeholder="Enter Email" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Enter Email '"
									 required="" type="email">


									<button class="click-btn btn btn-default"><i class="fa fa-long-arrow-right" aria-hidden="true"></i></button>
									<div style="position: absolute; left: -5000px;">
										<input name="b_36c4fd991d266f23781ded980_aefe40901a" tabindex="-1" value="" type="text">
									</div>

									
								</div>
								<div class="info"></div>
							</form>-->
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
	
	
        
 <script>
 		function readURL(input) {
	    if (input.files && input.files[0]) {
	        var reader = new FileReader();

	        reader.onload = function (e) {
	            $('#imageResult')
	                .attr('src', e.target.result);
	        };
	        reader.readAsDataURL(input.files[0]);
	    }
	}

	$(function () {
	    $('#image_up').on('change', function () {
	        readURL(input);
	    });
	});

	/*  show img name */
	var input = document.getElementById( 'image_up' );
	var infoArea = document.getElementById( 'upload-label' );

	input.addEventListener( 'change', showFileName );
	function showFileName( event ) {
	  var input = event.srcElement;
	  var fileName = input.files[0].name;
	  infoArea.textContent = 'File name: ' + fileName;
	}
</script>

	
	
	</form>
</body>

</html>