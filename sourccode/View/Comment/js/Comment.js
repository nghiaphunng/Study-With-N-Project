function SendCommentCourse(courseId){
	var xhttp;
	var comment_content = document.form_comment.comment_content.value;
	comment_content = processText(comment_content);
	var url = "SendCommentCourse?content="+comment_content+"&courseId="+courseId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("show_comment_container").innerHTML = data;
			document.form_comment.comment_content.value = '';
		}
	}
	
	xhttp.open("POST", url, true);
	xhttp.send();
}

function DeleteCommentCourse(commentId, courseId){
	var xhttp;
	var url="DeleteCommentCourse?commentId="+commentId+"&courseId="+courseId;
	if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("show_comment_container").innerHTML = data;
		}
	}
	xhttp.open("POST", url, true);
	xhttp.send();
}

function SendCommentPost(postId){
	var xhttp;
	var form = document.getElementById('form-comment-' + postId);
	var comment_content = form.elements['comment-content-post'].value;
	comment_content = processText(comment_content);
	var url = "SendCommentPost?content="+comment_content+"&postId="+postId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById('show-comment-post-popup-' + postId).innerHTML = data;
			form.elements['comment-content-post'].value = '';
		}
	}
	
	xhttp.open("GET", url, true);
	xhttp.send();
}

function DeleteCommentPost(commentId, postId){
	var xhttp;
	var url="DeleteCommentPost?commentId="+commentId+"&postId="+postId;
	if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById('show-comment-post-popup-' + postId).innerHTML = data;
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}

function DisplayCommentPost(postId){
	var xhttp;
	var url="DisplayCommentPost?postId="+postId;
	if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById('show-comment-post-popup-' + postId).innerHTML = data;
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}