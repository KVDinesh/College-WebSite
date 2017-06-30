<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->
<!DOCTYPE HTML>
<html>
	<head>
		<title>legend Website Template | Home :: W3layouts</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<meta name="keywords" content="legend iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/responsiveslides.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
	<script type="text/javascript" src="hai.js">
		<script src="js/responsiveslides.min.js"></script>
		<script type="text/javascript">

function getAlert(){
	alert("Faculty Aleardy exits");
	
	
}


</script>
		
		  <script>
		  
		    // You can also use "$(window).load(function() {"
			    $(function () {
			
			      // Slideshow 1
			      $("#slider1").responsiveSlides({
			        maxwidth: 1600,
			        speed: 600
			      });
			});
		  </script>
	</head>
	<body onload="getAlert();getStates(); getBranch(); getSection();">
		<!---start-wrap---->
		
			<!---start-header---->
			<div class="header">
				<div class="wrap">
				<!---start-logo---->
				<div class="logo">
					<a href="index.html"><img src="images/logo.png" title="logo" /></a>
				</div>
				<!---end-logo---->
				<!---start-search---->
				<div class="top-search-bar">
					<div class="header-top-nav">
						<ul>
						</ul>
					</div>
				</div>
				<div class="clear"> </div>
				</div>
			</div>
				<div class="clear"> </div>
				<div class="header-nav">
					<div class="wrap">
					<div class="left-nav">
						<ul>
							<li class="active"></li>
							<li><a href="Registration.html">Student Reg</a></li>
							<li><a href="FacultyRegisteration.html">Faculty Reg</a></li>
							<li><a href="UpdateSaerch.html">Edit Student</a></li>
							<li><a href="faculty.html">Edit faculty</a></li>
							<li><a href="FacultyLogout.jsp">Logout</a></li>
							<li><a href="AdminSearch.jsp">Student Search</a></li>
								<li><a href="Subjectsadd.jsp">Subject Adding</a></li>
						</ul>
					</div>
					<div class="right-social-icons">
						<ul>
								</ul>
					</div>
					<div class="clear"> </div>
				</div>
				<!---start-search---->
			</div>
			<!---end-header---->
			<!--start-image-slider---->
			<div class="wrap">
					<div class="image-slider">
						<!-- Slideshow 1 -->
					    <ul class="rslides" id="slider1">
					      <li><img src="images/slide1.jpg" alt=""></li>
					      <li><img src="images/slide2.jpg" alt=""></li>
					      <li><img src="images/slide1.jpg" alt=""></li>
					    </ul>
						 <!-- Slideshow 2 -->
					</div>
					<!--End-image-slider---->
					<!---start-content---->
					<div class="content">
						<div class="section group">
						<form action="FacultyRegister" method="post">
<div id="insideBody" height="302px" width="802px" align="center">
<table cellpadding="8px" cellspacing=""  align="center">
<tr><td>Faculty Id</td><td><input type="text" name="employeeid" id="empid" pattern="[0-9]{1,10}"  title="Format: should contain only Numbers" required/></td></tr>
<tr><td>Password</td><td> <input type="password" name="password" id="password" pattern="[A-Za-z0-9@_]{8,16}" title="Format: should not contain special charecters except @ and _ and length should be betwwen 8 and 16" required/></td></tr>
<tr><td>Employee Name </td><td><input type="text" name="name" id="name" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>DOB </td><td><input type="date" name="dob" id="dob" max="1990-12-31" min="1950-12-31" required/></td></tr>
<tr><td>Contact </td><td><input type="text" name="contact" id="contact" pattern="^[7-9]?([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9." required/></td></tr>
<tr><td>Email </td><td><input type="email" name="email" id="email" required/></td></tr>
<tr><td>Gender</td><td> <input type="radio" name="gender" id="male" value="male" required>Male</input>
<input type="radio" name="gender" id="female" value="female" required>Female</input></td></tr>
<tr><td>Address</td><td><input type="text" name="address" id="address" rows="6" cols="55" pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _ and"  required/></td></tr>
<tr><td>State</td><td><select id="state" name="state" onchange="getCities()" required></select></td></tr>
<tr><td>City</td><td><select id="city" name="city" required></select></td></tr>
</table>


<input type="submit" value="Register" >
<input type="reset" value="reset">
</div>
</form>

					</div>
					<!-- <div class="image group">
						<div class="grid span_2_of_3">
							<h3>Lorem Ipsum is simply dummy text </h3>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore. </p>
							<div class="button"><span><a href="#">Read More</a></span></div>
						</div>
						<div class="grid images_3_of_1">
							<h3>Testimonials</h3>
							<p><img src="images/quotes_alt.png"> &nbsp;Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.</p>
							<a href="#">- Lorem ipsum.<span>Usa</span></a>
						</div>
					</div>
				</div> -->
					<!---End-content---->
					<div class="clear"> </div>
				</div>
					<div class="footer"> 
						<div class="wrap"> 
						<div class="footer-left">
							<ul>
								<li><a href="Registration.html">Student Registration </a></li>
							<li><a href="FacultyRegisteration.html">Faculty Registration </a></li>
							<li><a href="UpdateSaerch.html">Update Student Details</a></li>
							<li><a href="faculty.html">Update faculty Details</a></li>
							<li><a href="FacultyLogout.jsp">Logout</a></li>
							<li><a href="AdminSearch.jsp">Student Search</a></li>
								<li><a href="Subjectsadd.jsp">Subject Adding</a></li>
							</ul>
						</div>
						<div class="footer-right">
							<p>Legend &#169 All Rights Reserved | Design By <a href="http://w3layouts.com/">W3Layouts</a></p>
						</div>
						<div class=="clear"> </div>
					</div>
					<div class="clear"> </div>
		<!---end-wrap---->
		</div>
	</body>
</html>

