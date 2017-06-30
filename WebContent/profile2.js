function getDisabled(){
   document.getElementById("empid").disabled = true;
   document.getElementById("submit").style.visibility="hidden";
   document.getElementById("password").disabled = true;
   document.getElementById("name").disabled = true;
   document.getElementById("dob").disabled = true;
   document.getElementById("contact").disabled = true;
   document.getElementById("state").disabled = true;
   document.getElementById("city").disabled = true;
   document.getElementById("address").disabled = true;
  
   document.getElementById("email").disabled = true;
   
   
   
   
}

function gender(){
	
	var gender=document.getElementById("male").value;
	if(gender=="male"){
		document.getElementById("male").checked=true;
		document.getElementById("male").disabled=true;
		document.getElementById("female").disabled=true;
	}
	else{
		document.getElementById("female").checked=true;
		document.getElementById("female").disabled=true;
		document.getElementById("male").disabled=true;
	}
	
}




function getEnabled(){
	document.getElementById("empid").disabled = true;
	  
	   document.getElementById("password").disabled = false;
	   document.getElementById("name").disabled = false;
	   document.getElementById("dob").disabled = false;
	   document.getElementById("contact").disabled = false;
	   document.getElementById("city").disabled = false;
	   document.getElementById("submit").style.visibility="visible";
	   document.getElementById("state").disabled = false;
	   document.getElementById("address").disabled = false;
	   document.getElementById("female").disabled=false;
	   document.getElementById("male").disabled=false;
	   document.getElementById("email").disabled = false;
	}
	
	
	
	
	



function getStates(){
	
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=state";
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var yearid=response.getElementsByTagName("state-id");
			var yearname=response.getElementsByTagName("state-name");
			
			var dropdown=document.getElementById("state");
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




function getCities(){
	
	var stateid=document.getElementById("state").value;
	
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=city&state="+stateid+"";
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var yearid=response.getElementsByTagName("state-id");
			var yearname=response.getElementsByTagName("state-name");
			
			var dropdown=document.getElementById("city");
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


function sendData(){
	
	//alert("haiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiiii");
	var hall=document.getElementById("empid").value;
	  // document.getElementById("submit").style.visibility="hidden";
	 var pass=document.getElementById("password").value;
	 var name=document.getElementById("name").value;
	 var dob=document.getElementById("dob").value;
	 var con=document.getElementById("contact").value;
	
	 var email=document.getElementById("email").value;
	 
	 if(document.getElementById("male").checked){
		 
		 var gender="male";
	 }
	 else{
		 var gender="female"; 
	 }
	 
	
	
	 var city=document.getElementById("city").value;
	 
	 var state=document.getElementById("state").value;
	 var add=document.getElementById("address").value;
	
	
	
	 if(state=="select"){
		 alert("Please select the state");
	 }
	 else if(city=="select"){
		 alert("Please select the city");
	 }
	 else{
	

	var url="FacultyUpdating?hallno="+hall+"&password="+pass+"&name="+name+"&dob="+dob+"&contact="+con+"&city="+city+"&state="+state+"&address="+add+"&gender="+gender+"&email="+email+"";
	//alert(url);	
	var xml=new XMLHttpRequest();
	xml.open("POST",url , true);
	xml.send();
	xml.onreadystatechange=function(){
	//alert(xml.readyState);
	if(xml.readyState==4&&xml.status==200){
		
		var response=xml.responseXML;
		var user=response.getElementsByTagName("user");
		var message=response.getElementsByTagName("message");
		
		alert(message[0].childNodes[0].nodeValue);
		document.location.href="FacultyProfileUpdate.jsp";
			
		}
		
		
		
	}	
	

}

}

	
	
	
	
