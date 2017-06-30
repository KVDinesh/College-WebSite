// JavaScript Document
function checkUser(){
	var user=document.getElementById("username").value;
	var pass=document.getElementById("password").value;
	if(user!=null&&user==""){
		alert("Enter Username");
	}
	else if(pass!=null&&pass==""){
		alert("Enter Password");
	}
	
	else if(document.getElementById("faculty").checked){
		if(isNaN(user)){
			alert("Faculty username accepts only numbers");
			document.getElementById("username").value="";
			document.getElementById("password").value="";
		}
		{
	    var xml=new XMLHttpRequest();
	    var url="UserChecking?action=faculty&user="+user+"&pass="+pass+"";
		xml.open("POST", url, true);
		xml.send();
		xml.onreadystatechange=function(){
			if(xml.status==200&&xml.readyState==4){
				var response=xml.responseXML;
				var res=response.getElementsByTagName("user");
				var finalresponse=res[0].childNodes[0].nodeValue;
				//alert(finalresponse);
				if("hai"==finalresponse){
					//alert("hello");
					document.location.href="index2.html";
					
				}
				else{
					alert("please enter valid username or password");
					document.getElementById("username").value="";
					document.getElementById("password").value="";
				}
			}
		}}
		
	//document.location.href='http://localhost:9090/CampusConnect/FacultyHome.jsp';
		
	}
	else if(document.getElementById("admin").checked){
		var xml=new XMLHttpRequest();
	    var url="UserChecking?action=admin&user="+user+"&pass="+pass+"";
	    xml.open("POST", url, true);
		xml.send();
		xml.onreadystatechange=function(){
			if(xml.status==200&&xml.readyState==4){
				var response=xml.responseXML;
				var res=response.getElementsByTagName("user");
				var finalresponse=res[0].childNodes[0].nodeValue;
				if(finalresponse=="true"){
					document.location.href="index1.html";
					
				}
				else{
					alert("please enter valid username and password");
					document.getElementById("username").value="";
					document.getElementById("password").value="";
			}
		}
	//document.location.href="AdminHome.jsp";
	}
	}
	else if(document.getElementById("student").checked){
		var xml=new XMLHttpRequest();
	    var url="UserChecking?action=student&user="+user+"&pass="+pass+"";
	    xml.open("POST", url, true);
		xml.send();
		xml.onreadystatechange=function(){
			if(xml.status==200&&xml.readyState==4){
				var response=xml.responseXML;
				var res=response.getElementsByTagName("user");
				var finalresponse=res[0].childNodes[0].nodeValue;
				if(finalresponse=="true"){
					document.location.href="index3.html";
					
				}
				else{
					alert("please enter valid username and password");
					document.getElementById("username").value="";
					document.getElementById("password").value="";
			}
		}
		
	//document.location.href="StudentHome.jsp";
	}
	}
	else
	{ 
	alert("Please select the user type");
	}
	}


function checkusername(){
	var user=document.getElementById("username").value;
	if(user!=null&&user==""){
		alert("Enter Username");
	}
	else if(document.getElementById("faculty").checked){


		var xml=new XMLHttpRequest();
	    var url="UserChecking?action=facultypassword&user="+user;
	    xml.open("POST", url, true);
		xml.send();
		xml.onreadystatechange=function(){
			if(xml.status==200&&xml.readyState==4){
				var response=xml.responseXML;
				var res=response.getElementsByTagName("user");
				var finalresponse=res[0].childNodes[0].nodeValue;
				if(finalresponse=="true"){
					alert("Your password is sent to your email id");
					
				}
				else{
					alert("please enter valid username");
					document.getElementById("username").value="";
					document.getElementById("password").value="";
			}
		}
		
	//document.location.href="StudentHome.jsp";
	}
	
		
	
		
	}
	else if(document.getElementById("admin").checked){
		alert("Your User name & Password  are realated to your job role..");
	
	}
	else if(document.getElementById("student").checked){

		var xml=new XMLHttpRequest();
	    var url="UserChecking?action=studentpasswor&user="+user;
	    xml.open("POST", url, true);
		xml.send();
		xml.onreadystatechange=function(){
			if(xml.status==200&&xml.readyState==4){
				var response=xml.responseXML;
				var res=response.getElementsByTagName("user");
				var finalresponse=res[0].childNodes[0].nodeValue;
				if(finalresponse=="true"){
					alert("Your password is sent to your email id");
					
				}
				else{
					alert("please enter valid username");
					document.getElementById("username").value="";
					document.getElementById("password").value="";
			}
		}
		
	//document.location.href="StudentHome.jsp";
	}
	
		
	}
	else{
		alert("please select the user type");
	}
}

