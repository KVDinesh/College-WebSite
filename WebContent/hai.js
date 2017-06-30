
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

function getyears(){
	
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
	
}
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
	//alert(url);	
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



function getSemesters(hallno){
	var year=document.getElementById("year").value;
	//alert(year);
		if(year==null||year=="select"){				
		alert("Please select year first");
		
	}
	else{
	

	var xml=new XMLHttpRequest();
var url="DropDownData?action=semesters&year="+year+"&hallno="+hallno;
//alert(url);	
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

function getMarks(hallno){
	var year=document.getElementById("year").value;
	var sem=document.getElementById("semester").value;
	//alert(year);
		if(year==null||year=="select"){				
		alert("Please select year first");
		
	}
		else if(sem==null||sem=="select"){
			alert("Please select the Semester");
		}
	else{
	
		

	var xml=new XMLHttpRequest();
	
var url="GettingMarks?attribute1="+sem+"&attribute2="+year+"&attribute3="+hallno;
//alert(url);	
xml.open("POST",url , true);
xml.send();
//alert("hai");
xml.onreadystatechange=function(){
//alert(xml.readyState);
if(xml.readyState==4&&xml.status==200){
	//alert("hello");
	var response=xml.responseXML;
	var s=response.getElementsByTagName("s");
	//alert("hai");
	var mid=response.getElementsByTagName("mid");
	var mid1=response.getElementsByTagName("mid1");
	var mid2=response.getElementsByTagName("mid2");
	var mid3=response.getElementsByTagName("mid3");
	var external=response.getElementsByTagName("external");
	var externalmarks=response.getElementsByTagName("externalmarks");
	//var semester=document.getElementById("semester");
	var table=document.getElementById("hai");
	if(sem<8){

		var div1="";
		
		div1+="<table border='1'>";
		div1+="<tr><th>Subject</th><th>Mid-I marks(25)</th><th>Mid-II marks(25)</th><th>Mid-III marks(25)</th><th>Mid Average</th><th>External Marks(75)</th><th>Total</th></tr>";
		for(var i=0; i<s.length;i++){
			var a=s[i].childNodes[0].nodeValue;
			var b=mid1[i].childNodes[0].nodeValue;
			var c=mid2[i].childNodes[0].nodeValue;
			var d=mid3[i].childNodes[0].nodeValue;
			var e=external[i].childNodes[0].nodeValue;
			 if(b==null||""==b||b=="null"){
				b=0;
			}
			if(c==null||""==c||c=="null"){
				c=0;
			}
			if(d==null||""==d||d=="null"){
				d=0;
			}
			if(e==null||""==e||e=="null"){
				e=0;
			}
			alert(a+" "+b+"   "+c+" "+d+"  "+e);
			
			var x=parseFloat(b);
			var y=parseFloat(c);
			var z=parseFloat(d);
			var t1=parseFloat(e);
			var f=(x+y+z)/3;
			var g=f+t1;
			div1+="<tr><td>"+a+"</td><td>"+b+"</td><td>"+c+"</td><td>"+d+"</td><td>"+f+"</td><td>"+e+"</td><td>"+g+"</td></tr>";
			
		}
		
		div1+="</table>";
		table.innerHTML=div1;	
		
		
		
		
		
	}
	
	else{
	
	var div1="";
	
	div1+="<table border='1'>";
	div1+="<tr><th>Subject</th><th>Mid-I marks(25)</th><th>Mid-II marks(25)</th><th>Mid Average(25)</th><th>External Marks(75)</th><th>Total(100)</th></tr>";
	for(var i=0; i<s.length;i++){
		var a=s[i].childNodes[0].nodeValue;
		var b=mid1[i].childNodes[0].nodeValue;
		var c=mid2[i].childNodes[0].nodeValue;
		var d=mid3[i].childNodes[0].nodeValue;
		var e=external[i].childNodes[0].nodeValue;
		if(b==null||""==b||b=="null"){
			b=0;
		}
		if(c==null||""==c||c=="null"){
			c=0;
		}
		if(d==null||""==d||d=="null"){
			d=0;
		}
		if(e==null||""==e||e=="null"){
			e=0;
		}
		alert(a+" "+b+"   "+c+" "+d+"  "+e);
		var x=parseFloat(b);
		var y=parseFloat(c);
		var z=parseFloat(e);
		//alert(x+""+y);
		var f=(x+y)/2;
		
		var g=f+z;
	
		div1+="<tr><td>"+a+"</td><td>"+b+"</td><td>"+c+"</td><td>"+f+"</td><td>"+e+"</td><td>"+g+"</td></tr>";
		}
	
	div1+="</table>";
	table.innerHTML=div1;
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
function getSubject(){
	var semid=document.getElementById("semester").value;
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=subject&semid="+semid+"";
	xml.open("POST",url , true);
	xml.send();
	//alert("hai");
	xml.onreadystatechange=function(){
		//alert(xml.readyState);
		if(xml.readyState==4&&xml.status==200){
			
			var response=xml.responseXML;
			var semid=response.getElementsByTagName("subject-id");
			var semname=response.getElementsByTagName("subject-name");
			
			var dropdown=document.getElementById("subject");
			if(dropdown.length!=null){
				dropdown.innerHTML="<option>select</option>";
				
			}
			for(var i=0; i<semid.length;i++){
				//alert("hai");
				var option=document.createElement("option");
				option.text=semname[i].childNodes[0].nodeValue;
				option.id=semid[i].childNodes[0].nodeValue;
				option.value=semid[i].childNodes[0].nodeValue;
			dropdown.add(option);	
			}
			
			
			
		}	
		
	}
	}	


