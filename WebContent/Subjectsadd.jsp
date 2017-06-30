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
		 <script type="text/javascript" src="hai.js"></script>
<script type="text/javascript">
function getfaculty(){
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=faculty";
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var yearid=response.getElementsByTagName("faculty-id");
			var yearname=response.getElementsByTagName("faculty-name");
			
			var dropdown=document.getElementById("faculty");
			if(dropdown.length!=null){
				dropdown.innerHTML="<option>select</option>";
				
			}
			for(var i=0; i<yearid.length;i++){
				//alert("hai");
				var option=document.createElement("option");
				option.text=yearname[i].childNodes[0].nodeValue;
				option.id=yearid[i].childNodes[0].nodeValue;
				option.value=yearid[i].childNodes[0].nodeValue;
			dropdown.add(option);	
			}
			
			
			
		}	
		
	}
	

}
function addSubject(){
	var facid=document.getElementById("faculty").value;
	var hai=facid;
	//alert(facid);
	var branchid=document.getElementById("branch").value;
	var year=document.getElementById("year").value;
	var semester=document.getElementById("semester").value;
	var subid=document.getElementById("subject").value;
	if(facid!=null&&facid==""){
		
		alert("Please Enter the Username");
	}
	
	
	
	else if(branchid!=null&&branchid=="select"){
		
		alert("please select the branch");
	}
	
	else if(year!=null&&year=="select"){
		
		alert("please select the year");
	}
	
	else if(semester!=null&&semester=="select"){
		
		alert("please select the semester");
	}
	
	
	else if(subid!=null&&subid=="select"){
		
		alert("please select the subject");
	}
	else{
		
		var xml=new XMLHttpRequest();
		//alert(facid);
		var url="SubjectInsertion?fac="+facid+"&subject="+subid+"&semester="+semester+"&year="+year+"&branch="+branchid+"";
		xml.open("POST",url , true);
		xml.send();
		//alert("hai");
		xml.onreadystatechange=function(){
			//alert(xml.readyState);
			if(xml.readyState==4&&xml.status==200){
				
				var response=xml.responseXML;
				var semid=response.getElementsByTagName("responsetext");
				alert(semid[0].childNodes[0].nodeValue);
				document.location.href="Subjectsadd.jsp";
				document.getElementById("iframe").contentDocument.location.reload(true);
				//document.getElementById("table").r
		
			}
	
	
		}

	
	}

}
</script>
</head>
<body onload="getBranch(); getSection();getfaculty()"><!---start-wrap---->
		
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
						<br>
						<br>

<table id="table" cellpadding="8px" cellspacing=""  align="center">
<tr><td>Select the Faculty</td><td><select id="faculty"></select></td></tr>
<tr><td>Branch</td><td><select id="branch" name="branch" onchange="getyear();" required></select></td></tr>
<tr><td>Year</td><td><select id="year" name="year" onchange="getSemester()" required></select></td></tr>
<tr><td>Semester</td><td><select id="semester" name="semester" onchange="getSubject();"></select></td></tr>
<tr><td>Subject</td><td><select id="subject" name="subject"></select></td></tr>
<tr><td><input type="button"  value="Add Subject" onclick="addSubject()"></td></tr>
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