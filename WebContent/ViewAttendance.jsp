<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="java.text.DateFormat"%>
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
<table border="1">
<tr><th>Hall Ticket No</th><th>Name</th><th>Total Number of sessions</th><th>Number of sessions attended</th><th>Monthly attendaance Percentage</th><th>Month</th></tr>
<% 
//HttpSession session=request.getSession(false);
String hallno=(String)session.getAttribute("user");
System.out.println(hallno);
Connection con=null;
Statement st=null,st1=null,st2=null;
ResultSet rs=null,rs1=null,rs2=null;
con=DBConnection.getMyConnection();
DateFormat dateFormat = new SimpleDateFormat("yyyy/MM/dd");
Date date = new Date();
String systemDate=dateFormat.format(date);
String year1=systemDate.substring(0,4);
int year=Integer.parseInt(year1);
try{
for(int i=01,j=02;i<13&&j<14;i++,j++)
{
	
	if(j==13){
		
		year=year+1;
		j=01;
	}
	
	st=con.createStatement();
	String query="Select  A.HALLTKNO, A.NAME, count(B.STATUS), sum(B.STATUS), to_char(to_date('"+year+"/"+i+"/01', 'yyyy/mm/dd'), 'Month') from STUD_DETAILS A, ATTDNCE B, STUD_DET_ATT C where A.HALLTKNO=C.HALLTKNO and B.ATTED_ID=C.ATTED_ID and A.HALLTKNO='"+hallno+"' and B.DAT between TO_DATE ('"+year+"/"+i+"/01', 'yyyy/mm/dd') and TO_DATE ('"+year+"/"+j+"/01', 'yyyy/mm/dd')  group by A.HALLTKNO, A.NAME";
	System.out.println(query);
	rs=st.executeQuery(query);
	double a,b,c;
	if(rs.next()){
		a=rs.getDouble(3);
		b=rs.getDouble(4);
		c=(b/a)*100;
%>		
	<tr><td><%=rs.getString(1) %></td><td><%=rs.getString(2) %></td><td><%=a %></td><td><%=b%></td><td><%=c%></td><td><%=rs.getString(5) %></td></tr>
	
		
<% 	}
	else{
	st1=con.createStatement();
	String query1="Select HALLTKNO, NAME, to_char(to_date('"+year+"/"+i+"/01', 'yyyy/mm/dd'), 'Month') from STUD_DETAILS where HALLTKNO='"+hallno+"'";
	rs1=st1.executeQuery(query1);
	if(rs1.next()){
	
	
	
	%>
	
	
		<tr><td><%=hallno%></td><td><%= rs1.getString(2) %></td><td>0</td><td>0</td><td>0</td><td><%= rs1.getString(3) %></td></tr>
		
<%} 	}
}
st2=con.createStatement();
String query2="Select  A.HALLTKNO, A.NAME, count(B.STATUS), sum(B.STATUS) from STUD_DETAILS A, ATTDNCE B, STUD_DET_ATT C where A.HALLTKNO=C.HALLTKNO and B.ATTED_ID=C.ATTED_ID and A.HALLTKNO='"+hallno+"' group by A.HALLTKNO, A.NAME";
rs2=st2.executeQuery(query2);
double x,y,z;
if(rs2.next())
{
	x=rs2.getDouble(3);
	y=rs2.getDouble(4);
	z=(y/x)*100;
%>
total percentage<input type="text" value="<%= z %>">


<% }


}
finally{
	if(rs2!=null)
	{
		rs2.close();
		
	}
	if(st2!=null)
	{
		st2.close();
		
	}
	if(rs1!=null)
	{
		rs1.close();
		
	}
	if(st1!=null)
	{
		st1.close();
		
	}
	if(rs!=null)
	{
		rs.close();
		
	}
	if(st!=null)
	{
		st.close();
		
	}
	if(con!=null)
	{
		con.close();
		
	}
}







%>
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