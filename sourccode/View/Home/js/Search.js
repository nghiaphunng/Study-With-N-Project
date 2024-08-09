function SearchName(content, scope){
	if(content.length > 2){
		var xhttp;
		var url = "SearchController?search="+content+"&scope="+scope;
		if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
		else{
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				var data = xhttp.responseText;
				document.getElementById("result-display").innerHTML = data;
			}
		}
		
		xhttp.open("GET", url, true);
		xhttp.send();
	}
	else if(content.length == 0){
		location.reload();
	}
}