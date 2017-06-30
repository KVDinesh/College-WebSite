function getDisabled(){
   document.getElementById("hallno").disabled = true;
  // document.getElementById("submit").style.visibility="hidden";
   document.getElementById("password").disabled = true;
   document.getElementById("name").disabled = true;
   document.getElementById("dob").disabled = true;
   document.getElementById("contact").disabled = true;
   document.getElementById("fathername").disabled = true;
   document.getElementById("fatheroccu").disabled = true;
   document.getElementById("MOTHER").disabled = true;
   document.getElementById("motheroccu").disabled = true;
   document.getElementById("parcont").disabled = true;
   document.getElementById("branch").disabled = true;
   document.getElementById("year").disabled = true;
   document.getElementById("city").disabled = true;
   document.getElementById("section").disabled = true;
   document.getElementById("houseNo").disabled = true;
   document.getElementById("colony").disabled = true;
   document.getElementById("state").disabled = true;
   document.getElementById("address").disabled = true;
   document.getElementById("semester").disabled = true;
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
	document.getElementById("hallno").disabled = true;
	  
	   document.getElementById("password").disabled = false;
	   document.getElementById("name").disabled = false;
	   document.getElementById("dob").disabled = false;
	   document.getElementById("contact").disabled = false;
	   document.getElementById("fathername").disabled = false;
	   document.getElementById("fatheroccu").disabled = false;
	   document.getElementById("MOTHER").disabled = false;
	   document.getElementById("motheroccu").disabled = false;
	   document.getElementById("parcont").disabled = false;
	   document.getElementById("branch").disabled = false;
	   document.getElementById("year").disabled = false;
	   document.getElementById("city").disabled = false;
	   document.getElementById("section").disabled = false;
	//   document.getElementById("submit").style.visibility="visible";
	   document.getElementById("houseNo").disabled = false;
	   document.getElementById("colony").disabled = false;
	   document.getElementById("state").disabled = false;
	   document.getElementById("address").disabled = false;
	   document.getElementById("semester").disabled = false;
	   document.getElementById("female").disabled=false;
	   document.getElementById("male").disabled=false;
	   document.getElementById("email").disabled = false;
	}
	
	
	
	
	
function getyear(){
	var b=document.getElementById("branch").value;
	if(b==null||b=="select"){
		alert("please select the branch first");
	}else{
var xml=new XMLHttpRequest();
var url="DropDownData?action=year";
xml.open("POST",url , true);
xml.send();
//alert("hai");
xml.onreadystatechange=function(){
	//alert(xml.readyState);
	if(xml.readyState==4&&xml.status==200){
		
		var response=xml.responseXML;
		var yearid=response.getElementsByTagName("year-id");
		var yearname=response.getElementsByTagName("year-name");
		
		var dropdown=document.getElementById("year");
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
	
}}
}

function getSection(){
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=section";
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var yearid=response.getElementsByTagName("section-id");
			var yearname=response.getElementsByTagName("section-name");
			
			var dropdown=document.getElementById("section");
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
	
function getBranch(){
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=branch";
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var yearid=response.getElementsByTagName("branch-id");
			var yearname=response.getElementsByTagName("branch-name");
			
			var dropdown=document.getElementById("branch");
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
	
function getSemester(){
	
				
	
			var year=document.getElementById("year").value;
			//alert(year);
			var branchid=document.getElementById("branch").value;
//alert(branchid);
			if(year==null||year=="select"){				
				alert("Please select year first");
				
			}
			else{
			

			var xml=new XMLHttpRequest();
	var url="DropDownData?action=semester&branchid="+branchid+"&year="+year;
	///alert(url);	
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var yearid=response.getElementsByTagName("sem-id");
			var yearname=response.getElementsByTagName("sem-name");
			
			var dropdown=document.getElementById("semester");
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
	var hall=document.getElementById("hallno").value;
	  // document.getElementById("submit").style.visibility="hidden";
	 var pass=document.getElementById("password").value;
	 var name=document.getElementById("name").value;
	 var dob=document.getElementById("dob").value;
	 var con=document.getElementById("contact").value;
	 var fathname=document.getElementById("fathername").value;
	 var email=document.getElementById("email").value;
	 var fathoccu=document.getElementById("fatheroccu").value;
	 var mothname=document.getElementById("MOTHER").value;
	 var mothoccu=document.getElementById("motheroccu").value;
	 var parcon=document.getElementById("parcont").value;
	 if(document.getElementById("male").checked){
		 
		 var gender="male";
	 }
	 else{
		 var gender="female"; 
	 }
	 
	
	 var branch=document.getElementById("branch").value;
	 var year=document.getElementById("year").value;
	 var city=document.getElementById("city").value;
	 var sec=document.getElementById("section").value;
	 var houseno=document.getElementById("houseNo").value;
	 var col=document.getElementById("colony").value;
	 var state=document.getElementById("state").value;
	 var add=document.getElementById("address").value;
	 var sem=document.getElementById("semester").value;
	
	 if(branch=="select"||branch==null){
		 alert("please select the branch");
		 
	 }
	 else if(year=="select"||year==null){
		 alert("Please select the Year");
		 
	 }
	 else if(sem=="select"||sem==null){
		 alert("Please select the semester");
		 
	 }
	 else if(sec=="select"){
		 alert("Please select the Section");
	 }
	  
	 else if(state=="select"){
		 alert("Please select the state");
	 }
	 else if(city=="select"){
		 alert("Please select the city");
	 }
	 else{
	

	var url="UpdateProfile?hallno="+hall+"&password="+pass+"&name="+name+"&dob="+dob+"&contact="+con+"&fathername="+fathname+"&fatheroccu="+fathoccu+"&mothername="+mothname+"&motheroccu="+mothoccu+"&parcont="+parcon+"&branch="+branch+"&year="+year+"&city="+city+"&section="+sec+"&houseNumber="+houseno+"&colony="+col+"&state="+state+"&address="+add+"&semester="+sem+"&gender="+gender+"&email="+email+"";
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
		
			
		}
		
		
		
	}	
	

}

}

	
	
	
	
