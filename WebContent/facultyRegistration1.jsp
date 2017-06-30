<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<script type="text/javascript" src="hai.js">
	
	
</script>
<script type="text/javascript">

function getAlert(){
	alert("Faculty Registration failed, please try again");
	
	
}


</script>


</head>

<body  onload="getAlert();getStates(); getBranch(); getSection();">
<a href="AdminHome.jsp">Home Page</a><br>
<a href="Registration.html">Student Registration </a><br>

<a href="UpdateSaerch.html">Update Student Details</a><br>
<a href="faculty.html">Update faculty Details</a><br>
<a href="FacultyLogout.jsp">Logout</a><br>
<a href="AdminSearch.jsp">Student Search</a><br>
<a href="Subjectsadd.jsp">Subject Adding</a><br>

<form action="FacultyRegister" method="post">
<div id="insideBody" height="302px" width="802px" align="center">
<table cellpadding="8px" cellspacing=""  align="center">
<tr><td>Faculty Id</td><td><input type="text" name="employeeid" id="empid" pattern="[0-9]{1,10}"  title="Format: should contain only Numbers" required/></td></tr>
<tr><td>Password</td><td> <input type="password" name="password" id="password" pattern="[A-Za-z0-9@_]{8,16}" title="Format: should not contain special charecters except @ and _ and length should be betwwen 8 and 16" required/></td></tr>
<tr><td>Employee Name </td><td><input type="text" name="name" id="name" pattern="[a-zA-Z- ']+"  title="Format: should contain only Alphabet" required/></td></tr>
<tr><td>DOB </td><td><input type="date" name="dob" id="dob" max="1990-12-31" min="1950-12-31" required/></td></tr>
<tr><td>Contact </td><td><input type="text" name="contact" id="contact" pattern="^[7-9]?([0-9]{9})" title="Format: should contain exactly 10 Numbers and should start with 7,8 and 9." required/></td></tr>
<tr><td>Email </td><td><input type="email" name="email" id="email" required/></td></tr>
<tr><td>Gender</td><td> <input type="radio" name="gender" id="male" value="male" required>Male</input>
<input type="radio" name="gender" id="female" value="female" required>Female</input></td></tr>
<tr><td>Address</td><td><input type="text" name="address" id="address" rows="6" cols="55" pattern="[^'$%*()=|+#!]{1,45}" title="Format: should not contain special charecters except @,-,/ and _ and"  required/></td></tr>
<tr><td>State</td><td><select id="state" name="state" onchange="getCities()" required></select></td></tr>
<tr><td>City</td><td><select id="city" name="city" required></select></td></tr>
</table>

<input type="submit" value="Register" >
<input type="reset" value="reset">
</div>
</form>
</body>
</html>