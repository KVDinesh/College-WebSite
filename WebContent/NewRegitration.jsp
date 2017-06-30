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
		<script src="hai.js">
</script>
		
		<script src="js/responsiveslides.min.js"></script>
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
	<body onload=" getStates(); getBranch(); getSection();">
	
	
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
						<form action="Register" method="post">
<div id="insideBody" align="left">
<table cellpadding="8px" cellspacing=""  >
<tr><td>Hall ticket No</td><td><input type="text" name="hallno" id="hallno"  pattern="[A-Za-z0-9]{8,12}"  title="Format: Combination of Alphabet,Numbers and length should be between 8 and 12  " required/></td></tr>
<tr><td>Password</td><td> <input type="password" name="password" id="password" pattern="[A-Za-z0-9@_]{8,16}" title="Format: should not contain special charecters except @ and _ and length should be betwwen 8 and 16" required/></td></tr>
<tr><td>Name </td><td><input type="text" name="name" id="name"  pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>DOB </td><td><input type="date" name="dob" id="dob" max="1995-12-31" min="1950-12-31" required/></td></tr>
<tr><td>Contact </td><td><input type="text" name="contact" id="contact" pattern="^[7-9]([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9." required/></td></tr>
<tr><td>FatherName </td><td><input type="text" name="fathername" id="fathername" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>FatherOccupation</td><td> <input type="text" name="fatheroccu" id="fatheroccu" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>MotherName </td><td><input type="text" name="mothername" id="hallno" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>MotherOccupation </td><td><input type="text" name="motheroccu" id="motheroccu" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>ParentsContact </td><td><input type="text" name="parcont" id="parcont" pattern="^[7-9]([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9."  required/></td></tr>
<tr><td>Email </td><td><input type="email" name="email" id="email" required/></td></tr>
<tr><td>Gender</td><td> <input type="radio" name="gender" id="male" value="male" required>Male</input>
<input type="radio" name="gender" id="female" value="female" required>Female</input></td></tr>
<tr><td>Branch</td><td><select id="branch" name="branch" onchange="getyear();" required></select></td></tr>
<tr><td>Year</td><td><select id="year" name="year" onchange="getSemester()" required></select></td></tr>
<tr><td>Semester</td><td><select id="semester" name="semester" required></select></td></tr>
<tr><td>House Number</td><td><input type="text" name="houseNumber" id="houseNo"  pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _"  required/></td></tr>
<tr><td>Colony</td><td><input type="text" name="colony" id="colony" pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _"  required/></td></tr>
<tr><td>Address</td><td><input type="text" name="address" id="address"  pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _" required/></td></tr>
<tr><td>State</td><td><select id="state" name="state" onchange="getCities()" required></select></td></tr>
<tr><td>City</td><td><select id="city" name="city"></select></td></tr>


<tr><td>Section</td><td><select id="section" name="section" required></select></td></tr>



</table>
<input type="submit" value="Register" align="left">
<input type="reset" value="reset" align="left">
</div>
</form>

					</div>
					<div class="image group"></div>
				</div>
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
							<p>Legend &#169 All Rights Reserved | Design By <a href="http://w3layouts.com/">dkss</a></p>
						</div>
						<div class=="clear"> </div>
					</div>
					<div class="clear"> </div>
		<!---end-wrap---->
		</div>
	</body>
</html>

