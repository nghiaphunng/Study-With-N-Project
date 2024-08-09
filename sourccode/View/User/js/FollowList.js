function DisplayFollowing(){
	var xhttp;
	var url = "GetFollowingList";
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("change-activity-info-group").innerHTML = data;
			TogglePopupPost();
		}
	}		
	xhttp.open("GET", url, true);
	xhttp.send();
}
function DisplayFollower(){
	var xhttp;
	var url = "GetFollowerList";
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("change-activity-info-group").innerHTML = data;
			TogglePopupPost();
		}
	}		
	xhttp.open("GET", url, true);
	xhttp.send();
}

function DisplayFollowingOfOtherUser(userId){
	var xhttp;
	var url = "GetFollowingListOfOtherUser?userId=" + userId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("change-activity-info-group").innerHTML = data;
		}
	}		
	xhttp.open("GET", url, true);
	xhttp.send();
}

function DisplayFollowerOfOtherUser(userId){
	var xhttp;
	var url = "GetFollowerListOfOtherUser?userId=" + userId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("change-activity-info-group").innerHTML = data;
		}
	}		
	xhttp.open("GET", url, true);
	xhttp.send();
}

function DeleteFollow(visitingUserId, infoUserId){
	var xhttp;
	var url = "DeleteFollowController?visitingUserId=" + visitingUserId+"&infoUserId="+infoUserId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			location.reload();
		}
	}		
	xhttp.open("GET", url, true);
	xhttp.send();
}

function InsertFollow(visitingUserId, infoUserId){
	var xhttp;
	var url = "InsertFollowController?visitingUserId=" + visitingUserId+"&infoUserId="+infoUserId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			location.reload();
		}
	}		
	xhttp.open("GET", url, true);
	xhttp.send();
}