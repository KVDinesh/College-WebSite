function getFacultySubjects(ABC){
	document.getElementById("textarea").disabled=true
	var xml=new XMLHttpRequest();
	var url="DropDownData?action=facattendance&facultyid="+ABC+""; 
	xml.open("POST",url, true);
	xml.send();
	xml.onreadystatechange=function(){
		if(xml.status==200&&xml.readyState==4){
			var response=xml.responseXML;
			var fid=response.getElementsByTagName("subjectid");
			var fname=response.getElementsByTagName("subjectname");
			var sub=document.getElementById("subject");
			if(sub.length!=null){
				sub.innerHTML="<option>select</option>";
				
			}
			for(var i=0;i<fid.length;i++){
				var option=document.createElement("option");
				option.text=fname[0].childNodes[0].nodeValue;
				option.id=fid[0].childNodes[0].nodeValue;
				option.value=fid[0].childNodes[0].nodeValue;
				sub.add(option);
				
			}
			
		}
		
	}
	}
	
function add() {
	var text=document.getElementById("textarea");
	text.innerHTML=null;
	var count=0;
	for(var i=1; i<=7;i++){
		var j=i+""+i;
		//alert(i);
		if(document.getElementById(j).checked){
			//alert(j);
			if(text.innerHTML!=""){
				text.disabled=false;
			text.innerHTML+="\n"+document.getElementById(j).value;
			count++;
			text.disabled=true;
			}
			else{
				text.disabled=false;
				text.innerHTML+=document.getElementById(j).value;
				count++;
				text.disabled=true;
			}
		}
		
	}
	//alert(count);
	document.getElementById("count").value=count;
	
}