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
		 
<script type="text/javascript" src="Subjects.js"></script>
<script type="text/javascript">
function fun(){
	
	var todayDate = new Date();
	 //need to add one to get current month as it is start with 0
	 var todayMonth = todayDate.getMonth();
	 var todayDay = todayDate.getDate();
	 var todayYear = todayDate.getFullYear();
	 var todayDateText = todayYear + "-" + todayMonth + "-" + todayDay;
	// alert(todayDate);
	//alert(todayDateText);
var	d1=document.getElementById("date1").value;
	//alert(d1);
	var date=d1.substring(8,10);
	//alert(date);
	//alert(todayDay);
	if(d1>todayDateText&&todayDay<date){
		alert("please select correct date");
		 
		
	}
}



</script>
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
<form action="SessionSelection.jsp" method="post" align="center">
<table align="center" style="font-size:large; font-weight: bold;">
<tr><td>Choose Subject:</td><td><select id="subject" name="subject" required></select></td></tr>
<tr><td>Choose Section:</td><td><input type="radio" id="A" value="A" name="Section" required>A</input>
<input type="radio" id="B" value="B" name="Section">B</input> 
<input type="radio" id="C" value="C" name="Section">C</input></td></tr> 
<tr><td>Date:<input type="date" name="date" id="date1" onchange="fun()" required/></td></tr>
<tr><td><input type="checkbox" name="checkbox" id="11" value="1" onclick="add()">1st Period</input></td></tr>
<tr><td><input type="checkbox" name="checkbox" id="22" value="2" onclick="add()">2nd Period</input></td></tr> 
<tr><td><input type="checkbox" name="checkbox" id="33" value="3" onclick="add()">3rd Period</input></td></tr> 
<tr><td><input type="checkbox" name="checkbox" id="44" value="4" onclick="add()">4th Period</input></td></tr> 
<tr><td><input type="checkbox" name="checkbox" id="55" value="5" onclick="add()">5th Period</input></td></tr> 
<tr><td><input type="checkbox" name="checkbox" id="66" value="6" onclick="add()">6th Period</input></td></tr> 
<tr><td><input type="checkbox" name="checkbox" id="77" value="7" onclick="add()">7th Period</input></td></tr> 
 
<tr><td><input type="submit" value="Submit" id="submit"/></td></tr>
<tr><td>Selected Subjects</td><td><textarea cols="50" rows="6" id="textarea" ></textarea></td></tr>

</table>
<input style="visibility: hidden" type="text" name="text" id="count" />
</form>
<table align="center" border="1" cellpadding="10">

</table>
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
							<p>Legend &#169 All Rights Reserved | Design By <a href="http://w3layouts.com/">W3Layouts</a></p>
						</div>
						<div class=="clear"> </div>
					</div>
					<div class="clear"> </div>
		<!---end-wrap---->
		</div>

</body>
</html>