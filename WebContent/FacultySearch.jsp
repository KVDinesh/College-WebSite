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
<script src="hai.js"></script>
<script type="text/javascript">
function search(){
	//alert("hai");
	var hall=document.getElementById("hallno").value;
	var name=document.getElementById("name").value;
	var dob=document.getElementById("dob").value;
	var contact=document.getElementById("contact").value;
	
	var fatheroccupu=document.getElementById("fatheroccu").value;
	
	var motherocc=   document.getElementById("motheroccu").value;
	
	var branch=   document.getElementById("branch").value; 
	
	var year=   document.getElementById("year").value;
	var city=   document.getElementById("city").value;
	var sec=   document.getElementById("section").value;
	var house=   document.getElementById("houseNo").value;
	var colony=   document.getElementById("colony").value;
	var state=   document.getElementById("state").value;
	
	var sem=   document.getElementById("semester").value;
	
	

	var xml=new XMLHttpRequest();
	var url="search?hall="+hall+"&name="+name+"&dob="+dob+"&contact="+contact+"&fatheroccu="+fatheroccupu+"&motherocc="+motherocc+"&branch="+branch+"&year="+year+"&branch="+branch+"&sec="+sec+"&house="+house+"&colony="+colony+"&state="+state+"&sem="+sem+"&city="+city;
	
//	alert(url);
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
	//	alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var hall=response.getElementsByTagName("hallno");
			var name=response.getElementsByTagName("name");
			var dob=response.getElementsByTagName("DOB");
			var contact=response.getElementsByTagName("CONTACT");
			var gender=response.getElementsByTagName("GENDER");
			var fathername=response.getElementsByTagName("FATHERNAME");
			var fatherocc=response.getElementsByTagName("FATHER_OCC");
			var mothername=response.getElementsByTagName("MOTHERNAME");
			var motherocc=response.getElementsByTagName("MOTHER_OCC");
			var parentcont=response.getElementsByTagName("PARENT_CONT");
			var year=response.getElementsByTagName("YEAR");
			var houseno=response.getElementsByTagName("HOUSENO");
			var colony=response.getElementsByTagName("COLONY");
			var address=response.getElementsByTagName("ADDRESS");
			var city=response.getElementsByTagName("city");
			var sem=response.getElementsByTagName("sem");
			var branch=response.getElementsByTagName("branch");
			var sec=response.getElementsByTagName("sec");
			var email=response.getElementsByTagName("email");
			var res=response.getElementsByTagName("result");
			//alert(res[0].childNodes[0].nodeValue);
			if(res[0].childNodes[0].nodeValue=="true"){
			
			var info="";
			var table="<table>";
			table+="<tr><th>hallno</th><th>name</th><th>DOB</th><th>CONTACT</th><th>GENDER</th><th>FATHERNAME</th><th>FATHER_OCC</th><th>MOTHERNAME</th><th>MOTHER_OCC</th><th>PARENT_CONT</th><th>YEAR</th><th>HOUSENO</th><th>COLONY</th><th>ADDRESS</th><th>city</th><th>sem</th><th>branch</th><th>sec</th><th>email</th><th>result</th></tr>";
			for(var i=0;i<hall.length;i++){
				table+="<tr><td>"+hall[i].childNodes[0].nodeValue+"</td><td>"+name[i].childNodes[0].nodeValue+"</td><td>"+dob[i].childNodes[0].nodeValue+"</td><td>"+contact[i].childNodes[0].nodeValue+"</td><td>"+gender[i].childNodes[0].nodeValue+"</td><td>"+fathername[i].childNodes[0].nodeValue+"</td><td>"+fatherocc[i].childNodes[0].nodeValue+"</td><td>"+mothername[i].childNodes[0].nodeValue+"</td><td>"+motherocc[i].childNodes[0].nodeValue+"</td><td>"+parentcont[i].childNodes[0].nodeValue+"</td><td>"+year[i].childNodes[0].nodeValue+"</td><td>"+houseno[i].childNodes[0].nodeValue+"</td><td>"+colony[i].childNodes[0].nodeValue+"</td><td>"+address[i].childNodes[0].nodeValue+"</td><td>"+city[i].childNodes[0].nodeValue+"</td><td>"+sem[i].childNodes[0].nodeValue+"</td><td>"+branch[i].childNodes[0].nodeValue+"</td><td>"+sec[i].childNodes[0].nodeValue+"</td><td>"+email[i].childNodes[0].nodeValue+"</td></tr>";	
				
			}
			table+="</table>";
			info+=table;
			document.getElementById("results").innerHTML=info;
			}
			else{
				
				document.getElementById("results").innerHTML="<H1>O search results found for your search criteria<H1>";
				
			}
		}
			
			
			
		}	
		
	
	
}


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
<form>
<table cellpadding="8px" cellspacing=""  >
<tr><td>Hall ticket No</td><td><input type="text" name="hallno" id="hallno" /></td></tr>
<tr><td>Name </td><td><input type="text" name="name" id="name" /></td></tr>
<tr><td>DOB </td><td><input type="date" name="dob" id="dob"  /></td></tr>
<tr><td>Contact </td><td><input type="number" name="contact" id="contact"  /></td></tr>

<tr><td>FatherOccupation</td><td> <input type="text" name="fatheroccu" id="fatheroccu"  /></td></tr>

<tr><td>MotherOccupation </td><td><input type="text" name="motheroccu" id="motheroccu"  /></td></tr>
<tr><td>ParentsContact </td><td><input type="number" name="parcont" id="parcont"  /></td></tr>
<tr><td>Branch</td><td><select id="branch" name="branch" onchange="getyear();"  ></select></td></tr>
<tr><td>Year</td><td><select id="year" name="year" onchange="getSemester()"  ></select></td></tr>
<tr><td>Semester</td><td><select id="semester" name="semester"  ></select></td></tr>
<tr><td>House Number</td><td><input type="text" name="houseNumber" id="houseNo"  /></td></tr>
<tr><td>Colony</td><td><input type="text" name="colony" id="colony"  /></td></tr>
<tr><td>Address</td><td><input type="text" name="address" id="address"  /></td></tr>
<tr><td>State</`td><td><select id="state" name="state" onchange="getCities()"  ></select></td></tr>
<tr><td>City</td><td><select id="city" name="city"></select></td></tr>


<tr><td>Section</td><td><select id="section" name="section"  ></select></td></tr>



</table>
<input type="button" value="search" onclick="search()" align="left">

<input type="reset" value="reset" align="left">
<div id="results"></div>
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

