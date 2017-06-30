<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
</table>
<table target="iframe" id="table" cellpadding="8px" cellspacing=""  align="center">
<tr><td>Branch</td><td><select id="branch" name="branch" onchange="getyear();" required></select></td></tr>
<tr><td>Year</td><td><select id="year" name="year" onchange="getSemester()" required></select></td></tr>
<tr><td>Semester</td><td><select id="semester" name="semester" onchange="getSubject();"></select></td></tr>
<tr><td>Subject</td><td><select id="subject" name="subject"></select></td></tr>
<tr><td><input type="button"  value="Add Subject" onclick="addSubject()"></td></tr>
</table>

<iframe name="iframe" id="iframe" height="300px" width="800px" scrolling="no" frameborder="0" align="middle">
</iframe>


</body>
</html>