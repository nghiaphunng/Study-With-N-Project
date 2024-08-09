function DisplayLikePost(postId){
	var xhttp;
	var url="DisplayLikePost?postId="+postId;
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

function ProcessClickLikePost(postId, isUserLiked){
		var xhttp;
		var url = "ProcessClickLikePost?postId="+postId+"&isUserLiked="+isUserLiked;
		if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
		else{
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				var data = xhttp.responseText;
				document.getElementById('show-comment-post-' + postId).innerHTML = data;
			}
		}
		
		xhttp.open("GET", url, true);
		xhttp.send();
	}