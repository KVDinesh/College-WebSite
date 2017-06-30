<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
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

<% 

	Connection con=null;
	Statement st=null;
	ResultSet rs=null;

	//HttpSession session1=request.getSession(false);
	String hallno=(String)session.getAttribute("user");
	//String hallno="123";
	System.out.println(hallno);
	if(hallno!=null){
		con=DBConnection.getMyConnection();
		st=con.createStatement();
		String sql="select A.HALLTKNO, A.NAME, A.PASSWORD, A.DOB, A.CONTACT, A.GENDER, A.FATHERNAME, A.FATHER_OCC, A.MOTHERNAME, A.MOTHER_OCC, A.PARENT_CONT, B.YR_NAME, A.HOUSENO, A.COLONY, A.ADDRESS, A.EMAIL, C.STATE_NAME, D.CITY_NAME, E.BRNCH_NAME, F.SEM_NAME, G.SEC_NAME from STUD_DETAILS A, YEAR B, STATE C, CITY D, BRANCH E, SEMESTER F, SECTION G where A.HALLTKNO='"+hallno+"' and A.CITY_ID=D.CITY_ID and D.STATE_ID=C.STATE_ID and A.YEAR=B.YR_ID and A.BRNCH_ID=E.BRNCH_ID and A.SEM_ID=F.SEM_ID and A.SEC_ID=G.SEC_ID ";
		System.out.print(sql);
		rs=st.executeQuery(sql);
		if(rs.next()){
			String date=rs.getString("DOB");
			System.out.println("jashgkjahsgljas"+date);
			String dob1=date.substring(0,10);
			
				
			
			
%>			

<script type="text/javascript" src="profile1.js">
</script>





</head>
			
	
			
			
			<body onload="getDisabled(); gender();" >
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
							<li><a href="ViewAttendance.jsp">View attendance</a></li>
							<li><a href="ViewMarks.jsp">View Marks</a></li>
							
							<li><a href="Search.jsp">Student Search</a></li>
							<li><a href="UpdateProfile1.jsp">Your Profile</a></li>
							<li><a href="FacultyLogout.jsp">Logout</a></li>
							
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

			
			<form action="UpdateProfile" method="post">
			<div id="insideBody" align="center">
						<table cellpadding="8px" cellspacing=""  align="center">
			<tr><td>Hall ticket No</td><td><input type="text" name="hallno" id="hallno"  pattern="[A-Za-z0-9]{8,12}"  title="Format: Combination of Alphabet,Numbers and length should be between 8 and 12  " value="<%=rs.getString("HALLTKNO") %>" required/></td></tr>
			<tr><td>Password</td><td> <input type="password" name="password" id="password" pattern="[A-Za-z0-9@_]{8,16}" title="Format: should not contain special charecters except @ and _ and length should be betwwen 8 and 16" value="<%=rs.getString("PASSWORD") %>" required/></td></tr>
			<tr><td>Name </td><td><input type="text" name="name" id="name" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet"  value="<%=rs.getString("NAME") %>" required/></td></tr>
			<tr><td>DOB </td><td><input type="date" name="dob" id="dob" max="1995-12-31" min="1950-12-31"  value="<%=dob1%>" required/></td></tr>
			<tr><td>Contact </td><td><input type="text" name="contact" id="contact" pattern="^[7-9]([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9."    value="<%=rs.getString("CONTACT") %>" required/></td></tr>
			<tr><td>FatherName </td><td><input type="text" name="fathername" id="fathername" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" value="<%=rs.getString("FATHERNAME") %>" required/></td></tr>
			<tr><td>FatherOccupation</td><td> <input type="text" name="fatheroccu" id="fatheroccu" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" value="<%=rs.getString("FATHER_OCC") %>" required/></td></tr>
			<tr><td>MotherName </td><td><input type="text" name="mothername" id="MOTHER" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" value="<%=rs.getString("MOTHERNAME") %>" required/></td></tr>
			<tr><td>MotherOccupation </td><td><input type="text" name="motheroccu" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" id="motheroccu" value="<%=rs.getString("MOTHER_OCC") %>" required/></td></tr>
			<tr><td>ParentsContact </td><td><input type="text" name="parcont" id="parcont" pattern="^[7-9]([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9."  value="<%=rs.getString("PARENT_CONT") %>" required/></td></tr>
			<tr><td>Email-ID </td><td><input type="email" name="email" id="email" value="<%=rs.getString("EMAIL") %>" required/></td></tr>
			<tr><td>Gender</td><td> <input type="radio" name="gender" id="male"  value="<%=rs.getString("GENDER") %>" required>Male</input>
			<input type="radio" name="gender" id="female" value="female" required>Female</input></td></tr>
			<tr><td>Branch</td><td><select id="branch" name="branch" onchange="getyear();" required>
			<option><%=rs.getString("BRNCH_NAME") %></option>>
			</select></td></tr>
			<tr><td>Year</td><td><select id="year" name="year" onchange="getSemester()" required>
			<option><%=rs.getString("YR_NAME") %></option>>
			</select></td></tr>
			<tr><td>Semester</td><td><select id="semester" name="semester" required>
			<option><%=rs.getString("SEM_NAME") %></option>>
			</select></td></tr>
			<tr><td>House Number</td><td><input type="text" name="houseNumber" id="houseNo" pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _ " value="<%=rs.getString("HOUSENO") %>" required/></td></tr>
			<tr><td>Colony</td><td><input type="text" name="colony" id="colony" pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _" value="<%=rs.getString("COLONY") %>" required/></td></tr>
			<tr><td>Address</td><td><input type="text" name="address" id="address" pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _" value="<%=rs.getString("ADDRESS") %>" required/></td></tr>
			<tr><td>State</td><td><select id="state" name="state" onchange="getCities()" required>
			<option><%=rs.getString("STATE_NAME") %></option>>
			</select></td></tr>
			<tr><td>City</td><td><select id="city" name="city">
			<option><%=rs.getString("CITY_NAME") %></option>>
			</select></td></tr>


			<tr><td>Section</td><td><select id="section" name="section" required>
			<option><%=rs.getString("SEC_NAME") %></option>>
			</select></td></tr>



			</table>
			
			</div>
			</form>

 			
<%		}
		
		
		
		
		
	}
	
	
%>




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
							<li><a href="ViewAttendance.jsp">View attendance</a></li>
							<li><a href="ViewMarks.jsp">View Marks</a></li>
							
							<li><a href="Search.jsp">Student Search</a></li>
							<li><a href="UpdateProfile1.jsp">Your Profile</a></li>
							<li><a href="FacultyLogout.jsp">Logout</a></li>
							
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