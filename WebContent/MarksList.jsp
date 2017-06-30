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
<script type="text/javascript">

function markssubmit(count,subject, MID){
	//alert(count);
	//alert(subject);
	var mid=document.getElementById("mid").value;
	var xml=new XMLHttpRequest();
	//alert(mid);
	//alert(MID);
if(MID=="external"){
	for(var i=0; i<=count;i++){
		alert(count);
		var abc="attd"+i;
	var hallno=document.getElementById(i).value;
	var marks=document.getElementById(abc).value;
	//alert(marks);
	if(marks<0||marks>75){
		alert("the marks you entered are invalid");
	}
	else{
		
		
	var url="Marksinsertion?hallno="+hallno+"&marks="+marks+"&subject="+subject+"&mid="+MID; 
	xml.open("POST",url, true);
	xml.send();
	xml.onreadystatechange=function(){
		if(xml.status==200&&xml.readyState==4){
			var response=xml.responseXML;
			//alert(count+"  "+i);
			if(i==count){
				alert("marks added successfully");
			}
	
	
}}}}
	}else{
		for(var i=0; i<=count;i++){
			alert(count);
			var abc="attd"+i;
		var hallno=document.getElementById(i).value;
		var marks=document.getElementById(abc).value;
		//alert(marks);
		if(marks<0||marks>25){
			alert("the marks you entered are invalid");
		}
		else{
			
			
		var url="Marksinsertion?hallno="+hallno+"&marks="+marks+"&subject="+subject+"&mid="+MID; 
		xml.open("POST",url, true);
		xml.send();
		xml.onreadystatechange=function(){
			if(xml.status==200&&xml.readyState==4){
				var response=xml.responseXML;
				//alert(count+"  "+i);
				if(i==count){
					alert("marks added successfully");
				}
		
	}}}}
		
		
	}
	}

</script>
</head>
<body>
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
<% 
String section=request.getParameter("Section");
String subject=request.getParameter("subject");
String Mid=request.getParameter("Mid");
Connection con= null;
Statement st=null;
ResultSet rs=null;
con=DBConnection.getMyConnection();
st=con.createStatement();
String query="Select  A.HALLTKNO, A.NAME from STUD_DETAILS A,SUBJECT B,SEMESTER C,SECTION D where (A.SEM_ID=C.SEM_ID and B.SEM_ID=C.SEM_ID and B.SUB_ID="+subject+") and (A.SEC_ID=D.SEC_ID and D.SEC_ID=(select SEC_ID from SECTION where SEC_NAME='"+section+"'))";
System.out.println(query);
rs=st.executeQuery(query);
%>
<h1><label id="mid" value="<%=Mid%>"><%=Mid%> Marks</label></h1>
<table border="1" >
<tr><th>Hall Ticket Number</th><th>Name</th><th>Marks</th></tr>

<%
int i=0;
while(rs.next())
{
	String addid="attd"+i;

	%>
	<tr><td><input type="text" id="<%=i%>" value="<%=rs.getString(1) %>" name="<%=i%>" readonly></td><td><%=rs.getString(2)%></td><td><input type="number" id="<%=addid%>" name="text"  maxlength="3" autofocus /></td></tr>
	<%
	
	i++;
	
}

%>
    
</table>
<input type="button" value="Submit" onclick="markssubmit('<%=i%>','<%= subject %>','<%=Mid%>')"/>
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