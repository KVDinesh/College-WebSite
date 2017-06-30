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
<script type="text/javascript" src="hai.js">
	
	
</script>
<script type="text/javascript">


</script>

<%

String hallno=(String)session.getAttribute("user");

Connection con=null;
Statement st=null;
ResultSet rs=null;
System.out.println(hallno);
if(hallno!=null){
	con=DBConnection.getMyConnection();
	st=con.createStatement();
	String sql="select A.FAC_ID, A.FAC_NAME, A.FAC_PASS, A.FAC_GENDER, A.FAC_CONT, A.FAC_ADDRESS, A.FAC_DOB, A.EMAIL, C.STATE_NAME, D.CITY_NAME  from FACULTY_DET  A, STATE C, CITY D where A.FAC_ID='"+hallno+"' and A.CITY_ID=D.CITY_ID and D.STATE_ID=C.STATE_ID";
	System.out.print(sql);
	rs=st.executeQuery(sql);
	if(rs.next()){
		String date=rs.getString("FAC_DOB");
		System.out.println("jashgkjahsgljas"+date);
		String dob1=date.substring(0,10);
		
%>
<script type="text/javascript" src="facultyprofile.js">
</script>
</head>

<body onload="getDisabled(); gender();">
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


<form action="FacultyRegister" method="post">
<div id="insideBody" height="302px" width="802px" align="center">
<table cellpadding="8px" cellspacing=""  align="center">
<tr><td>Faculty Id</td><td><input type="type" name="employeeid" id="empid"  pattern="[0-9]{1,15}"  title="Format: should contain only Numbers"   value="<%=rs.getString("FAC_ID") %>"  required/></td></tr>
<tr><td>Password</td><td> <input type="password" name="password" id="password"  pattern="[A-Za-z0-9@_]{8,16}" title="Format: should not contain special charecters except @ and _ and length should be betwwen 8 and 16" value="<%=rs.getString("FAC_PASS") %>" required/></td></tr>
<tr><td>Employee Name </td><td><input type="text" name="name" id="name" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet"  value="<%=rs.getString("FAC_NAME") %>" required/></td></tr>
<tr><td>DOB </td><td><input type="date" name="dob" id="dob" max="1990-12-31" min="1950-12-31" value="<%=dob1 %>" required/></td></tr>
<tr><td>Contact </td><td><input type="type" name="contact" id="contact" pattern="^[7-9]?([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9."  value="<%=rs.getString("FAC_CONT") %>" required/></td></tr>
<tr><td>Email </td><td><input type="email" name="email" id="email" value="<%=rs.getString("EMAIL") %>" required/></td></tr>
<tr><td>Gender</td><td> <input type="radio" name="gender" id="male"  value="<%=rs.getString("FAC_GENDER") %>" required>Male</input>
			<input type="radio" name="gender" id="female" value="female" required>Female</input></td></tr>
			<tr><td>Address</td><td><input name="address" id="address"  value="<%=rs.getString("FAC_ADDRESS") %>" required/></td></tr>
<tr><td>State</td><td><select id="state" name="state" onchange="getCities()" required>
<option><%=rs.getString("STATE_NAME") %></option>>
</select></td></tr>
<tr><td>City</td><td><select id="city" name="city" required>
<option><%=rs.getString("CITY_NAME") %></option>
</select></td></tr>
</table>


</div>
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
							<p>Legend &#169 All Rights Reserved | Design By <a href="http://w3layouts.com/">W3Layouts</a></p>
						</div>
						<div class=="clear"> </div>
					</div>
					<div class="clear"> </div>
		<!---end-wrap---->
		</div>



</body>
<% } 
	}%>
</html>