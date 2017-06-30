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
function disable(){
	document.getElementById("DIV").style.visibility="hidden";
	document.getElementById("DIV").style.display="none";
}


function submitAttendance(student, ses, date){
	//alert(student);
	//alert(ses);
	if(student==0||student==null||student==""||student=="null"){
		alert("There are no students as per user slection criteria");
		
	}
	else{
		for(var j=0;j<ses;j++){
			for(var i=0; i<student;i++){
				
				var sesid="ses"+j;
				var stat="attd"+i;
				var rollno=document.getElementById(i).value;
				var session=document.getElementById(sesid).value;
				var status=document.getElementById(stat).value;
				
				var xml=new XMLHttpRequest();
				var url="EnterAttendance?students="+rollno+"&session="+session+"&status="+status+"&date="+date;
				xml.open("POST",url, true);
				xml.send();
				xml.onreadystatechange=function(){
					if(xml.status==200&&xml.readyState==4){
						var response=xml.responseXML;
						//var fid=response.getElementsByTagName("subjectid");
						
					if(i==student&&j==ses){
						alert("updated successfully");
					}		
						
					}
					
				}
			
			
			}
		}
		
	}
	//alert("attendance added successfully ");
	
}
function changed(a){
	var b=document.getElementById(a).value;
	//alert(b);
	
	 if(b<0&&b>1){
		alert("Attendence should contain Either 0 or 1");
		document.getElementById(a).value=0;
	}
	else if(b==0){
		document.getElementById(a).value=1;
		
			}
	else if(b==1){
		document.getElementById(a).value=0;
	}
	
}

</script>
</head>
<body onload="disable()">
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
Connection con=null;
Statement st=null;
ResultSet rs=null;
String count=request.getParameter("text");
String date=request.getParameter("date");
String subject=request.getParameter("subject");
String section=request.getParameter("Section");
String[] sessions=request.getParameterValues("checkbox");
%>

<table border="2">
<tr><th>Roll Number</th><th>Student Name</th><th>Session</th></tr>
<%

	con=DBConnection.getMyConnection();
	st=con.createStatement();
	String query="Select  A.HALLTKNO, A.NAME from STUD_DETAILS A,SUBJECT B,SEMESTER C,SECTION D where (A.SEM_ID=C.SEM_ID and B.SEM_ID=C.SEM_ID and B.SUB_ID="+subject+") and (A.SEC_ID=D.SEC_ID and D.SEC_ID=(select SEC_ID from SECTION where SEC_NAME='"+section+"'))";
	System.out.println(query+""+count+""+date+""+subject+""+section);
	rs=st.executeQuery(query);
	int i=0;

	while(rs.next()){
		
		String addid="attd"+i;

	%>
	<tr><td><input type="text" id="<%=i%>" value="<%=rs.getString(1) %>" name="<%=i%>" readonly></td><td><%=rs.getString(2)%></td><td><input type="text" id="<%=addid%>" name="text" onkeypress="changed('<%=addid%>')" value="1"  maxlength="1" autofocus /></td></tr>
	<%
	
	i++;
}
	%>
	</table>
	<%
	for(int j=0;j<sessions.length;j++){	
		String s="ses"+j;
		%>
		
		
		<input type="text" id="<%=s%>" value="<%=sessions[j]%>" name="<%=s%>" style="visibility: hidden;"></input>

<%		
	 }
	
	
%>





<input type="button" value="Submit" onclick="submitAttendance('<%=i%>','<%=sessions.length%>','<%=date%>')" >


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
							<p>Legend &#169 All Rights Reserved | Design By <a href="http://w3layouts.com/">dkss</a></p>
						</div>
						<div class=="clear"> </div>
					</div>
					<div class="clear"> </div>
		<!---end-wrap---->
		</div>



</body>
</html>