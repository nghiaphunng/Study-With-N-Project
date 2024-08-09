function ClickFollow(userId, postId){
	var xhttp;
	var url = "ClickFollowController?userId="+userId+"&postId="+postId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById('display-like-list-' + postId).innerHTML = data;
		}
	}
	
	xhttp.open("GET", url, true);
	xhttp.send();
}

function DeleteFollow(userId){
	var xhttp;
	var url="DeleteFollowController?userId="+userId+"&postId="+postId;
	if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById('display-like-list-' + postId).innerHTML = data;
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}