<%@page import="com.utility.DBConnection"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!--
Author: W3layouts
Author URL: http://w3layouts.com
License: Creative Commons Attribution 3.0 Unported
License URL: http://creativecommons.org/licenses/by/3.0/
-->

<html>
	<head>
		<title>legend Website Template | Home :: W3layouts</title>
		<link href="css/style.css" rel="stylesheet" type="text/css"  media="all" />
		<meta name="keywords" content="legend iphone web template, Andriod web template, Smartphone web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design" />
		<link href='http://fonts.googleapis.com/css?family=Ropa+Sans' rel='stylesheet' type='text/css'>
		<link rel="stylesheet" href="css/responsiveslides.css">
		<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
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
<script type="text/javascript" src="Marks.js"></script>
<%
String facultyid=(String)session.getAttribute("user");
%>

</head>
<body onload="getFacultySubjects('<%=facultyid%>')">
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
							<li><a href="Attendance.jsp">Attendance</a></li>
							<li><a href="Marks.jsp">Marks</a></li>
							<li><a href="FacultyLogout.jsp">Logout</a></li>
							<li><a href="FacultySearch.jsp">Search Student</a></li>
							<li><a href="FacultyViewProfile.jsp">Your Profile</a></li>
						
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
						<br>
						<br>

<form action="MarksList.jsp" method="get">
<table align="center" style="font-size:large; font-weight: bold;">
<tr><td>Choose Subject:</td><td><select id="subject" name="subject" required></select></td></tr>
<tr><td>Choose Section:</td><td><input type="radio" id="A" value="A" name="Section" required>A</input>
<input type="radio" id="B" value="B" name="Section">B</input> 
<input type="radio" id="C" value="C" name="Section">C</input></td></tr> 
<tr><td>Choose Midterm:</td><td><input type="radio" id="Mid1" value="Mid1" name="Mid">Mid1</input>
<input type="radio" id="Mid2" value="Mid2" name="Mid" required>Mid2</input> 
<input type="radio" id="Mid3" value="Mid3" name="Mid">Mid3</input>
<input type="radio" id="external" value="external" name="Mid">External</input></td></tr>
<tr><td><input type="submit" value="Submit" id="submit"/></td></tr>
</table>
</form>
<br>
<br>
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
								<li class="active"></li>
							<li><a href="Attendance.jsp">Attendance</a></li>
							<li><a href="Marks.jsp">Marks</a></li>
							<li><a href="FacultyLogout.jsp">Logout</a></li>
							<li><a href="FacultySearch.jsp">Search Student</a></li>
							<li><a href="FacultyViewProfile.jsp">Your Profile</a></li>
						
							</ul>
						</div>
						<div class="footer-right">
							<p>Legend &#169 All Rights Reserved | Design By dkss</p>
						</div>
						<div class=="clear"> </div>
					</div>
					<div class="clear"> </div>
		<!---end-wrap---->
		</div>



</body>
</html>