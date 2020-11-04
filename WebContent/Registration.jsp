<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="zxx" class="no-js">

	<head>
	<meta charset="ISO-8859-1">
		<meta charset="utf-8">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">

		<!-- MATERIAL DESIGN ICONIC FONT -->
		<link rel="stylesheet" href="fonts/material-design-iconic-font/css/material-design-iconic-font.min.css">
		
		<!-- STYLE CSS -->
		<link rel="stylesheet" href="css/style.css">
	<link rel="stylesheet" href="css/bootstrap.css">
	<link rel="stylesheet" href="css/main.css">
	
	
	
	  <script src="jQuery/jquery-3.5.1.js"></script>
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



<section class="banner-area">

<header class="header_area sticky-header">
		<div class="main_menu">
			<nav class="navbar navbar-expand-lg navbar-light main_box">
				<div class="container">
					<!-- Brand and toggle get grouped for better mobile display -->
					<a class="navbar-brand logo_h" href="login.jsp"><img src="img/logos.png" height="100px" width="170px"></a>
					
					
				</div>
			</nav>
		</div>
		
		</header>
		<!--  regBox -->
		<div class="wrapper" style="background-image: url();">
			<div class="inner">
				<form onsubmit=" return validation();"  action="RegistrationCheck.jsp" method="post"  name="myform" style="margin-top:150px" >
				
					<h3>User Form</h3>
					<div class="form-group-reg">
						<div class="form-wrapper-reg">
							<label for="fname" style="color:black" id="lblnm">First Name</label>
							<input type="text" class="form-control" name="fname" id="fname" autocomplete="off">
							<h6 id="fnameCheck" style="color:orange"></h6>
						</div>
						<div class="form-wrapper-reg">
							<label for="lname" style="color:black">Last Name</label>
							<input type="text" class="form-control" name="lname" id="lname" autocomplete="off">
							<h6 id="lnameCheck" style="color:orange"></h6>
						</div>
					</div>
					<div class="form-wrapper-reg ">
						<label for="email" style="color:black">Email</label>
						<input type="text" class="form-control" name="email" id="email" autocomplete="off">
						<h6 id="emailCheck" style="color:orange"></h6>
					</div>
					<div class="form-wrapper-reg">
							<label for="phno" style="color:black">Phone number</label>
							<input type="text" class="form-control" name="phno" id="phno" autocomplete="off">
							<h6 id="PhnoCheck" style="color:orange"></h6>
						</div>
					<div class="form-wrapper-reg">
						<label for="pass" style="color:black">Password</label>
						<input type="password" class="form-control" name="pass" id="pass" autocomplete="off">
						<h6 id="passCheck" style="color:orange"></h6>
					</div>
					<div class="form-wrapper-reg">
						<label for="cpass" style="color:black">Confirm Password</label>
						<input type="password" class="form-control" name="cpass" id="cpass" autocomplete="off">
						<h6 id="cpassCheck" style="color:orange"></h6>
					</div>
					<div class="form-wrapper-reg">
							<label for="address" style="color:black" id="addlbl">Address</label>
							<input type="text" class="form-control" name="address" id="address" autocomplete="off" style="height:100px">
							<h6 id="addressCheck" style="color:orange"></h6>
						</div>
				<!-- 	<div class="checkbox">
						<label>
							<input type="checkbox" > I accept the Terms of Use & Privacy Policy.
							<span class="checkmark"></span>
						</label>
					</div> -->
					<div class="col-md-12 form-group" class="d-flex justify-items-center" style="margin-top:10px">
								<button type="submit" value="submit" name="submit" class="primary-btn">Submit</button>
							</div>
							
				</form>
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
Copyright &copy;<script>document.write(new Date().getFullYear());</script> This website is created <i class="fa fa-heart-o" aria-hidden="true"></i> by <a href="https://www.facebook.com/alan.donald" target="_blank">Atul Ashish Xalxo </a>and <a href="#" target="_blank">Alan B Thomas</a>

			</div>
		</div>
	</footer>
	<!-- End footer Area -->
	<script type="text/javascript">
		
		function validation()
		{
			var f_name=document.getElementById("fname").value;
			var l_name=document.getElementById("lname").value;
			var Email=document.getElementById("email").value;
			var Phno=document.getElementById("phno").value;
			var Pass=document.getElementById("pass").value;
			var Cpass=document.getElementById("cpass").value;
			var	add=document.getElementById("address").value;
			
			//fname
			if(f_name=="")
				{
					document.getElementById("fnameCheck").innerHTML="*please fill the first name";
					return false;
				}	
			if(!isNaN(f_name))
			{
				document.getElementById("fnameCheck").innerHTML="*only characters are allowed";
				return false;
				}
			if((f_name.length<=2)||(f_name.length>=20))
			{
			document.getElementById("fnameCheck").innerHTML="*first name must have length between 2 and 20";
			return false;
			}
			
			
			//lname
			if(l_name=="")
			{
				document.getElementById("lnameCheck").innerHTML="*please fill the last name";
				return false;
			}
			if(!isNaN(l_name))
			{
				document.getElementById("lnameCheck").innerHTML="*only characters are allowed";
				return false;
				}
			if((l_name.length<=2)||(f_name.length>=20))
			{
			document.getElementById("lnameCheck").innerHTML="*first name must have length between 2 and 20";
			return false;
			}
			
			
			//email
			if(Email=="")
			{
				document.getElementById("emailCheck").innerHTML="*please fill the email id";
				return false;
			}
			if(Email.indexOf('@')<=0)
				{
				document.getElementById("emailCheck").innerHTML="*invalid email id please check @ position";
				return false;
				}
			if((Email.charAt(Email.length-4)!='.')&&(Email.charAt(Email.length-3)!='.'))
			{
			document.getElementById("emailCheck").innerHTML="*. invalid position";
			return false;
			}
			
			//phone	
			if(Phno=="")
			{
				document.getElementById("PhnoCheck").innerHTML="*please fill your phone number";
				return false;
			}
			if(isNaN(Phno))
			{
				document.getElementById("PhnoCheck").innerHTML="*please write digits only";
				return false;
				}
			if(Phno.length!=10)
			{
			document.getElementById("PhnoCheck").innerHTML="*enter 10 digits number only";
			return false;
			}
			
			
			//password
			if(Pass=="")
			{
				document.getElementById("passCheck").innerHTML="*password can not be empty";
				return false;
			}
			if((Pass.length<=5)||(Pass.length>=20))
			{
			document.getElementById("passCheck").innerHTML="*password must have length between 5 and 20";
			return false;
			}
			
			
			//confirm password
			if(Cpass=="")
			{
				document.getElementById("cpassCheck").innerHTML="*field can't be empty";
				return false;
			}
			if(Cpass!=Pass)
				{
				document.getElementById("cpassCheck").innerHTML="*password not matching";
				return false;
				}
			
			//address
			if(add=="")
			{
				document.getElementById("addressCheck").innerHTML="*address can not be empty";
				return false;
			}
			if(add.length<=5)
			{
			document.getElementById("addressCheck").innerHTML="*password must have more value";
			return false;
			}
		}
	
			
	</script>
	
	</body>
</html>
