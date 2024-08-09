function UpPostUser(mode){
	var xhttp;
	var post_scope = document.form_up_post.post_scope.value;
	var title_post = document.form_up_post.title_post.value;
	var old_content_post = document.form_up_post.content_post.value;
	var new_content_post;
	if(old_content_post != ""){
		new_content_post = encodeURIComponent(processText(old_content_post));
		old_content_post = encodeURIComponent(processTextNewLine(old_content_post));
		var url = "PostUserController?scope="+post_scope+"&title="+title_post+"&newcontent="+new_content_post+"&oldcontent="+old_content_post+"&mode="+mode;
		if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
		else{
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				var data = xhttp.responseText;
				document.getElementById("show-post-user").innerHTML = data;
				TogglePopupPost();
			}
		}		
		xhttp.open("POST", url, true);
		xhttp.send();
	}
}

function ShowPostUserByScope(scope){
	var xhttp;
	var url = "ShowPostUserByScope?scope="+scope+"&offset=0";
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
			document.getElementById("show-post-user").innerHTML = data;
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}

function LoadShowPostUserByScope(scope, numberpost){
	var xhttp;
	var url = "ShowPostUserByScope?scope="+scope+"&offset="+numberpost;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
// 				document.getElementById('show-post-user').innerHTML += data;
			if (data.trim() != "") {
                appendPostsToDOM(data); // Thêm bài viết vào DOM
            }
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}

function LoadPostOfOtherUser(userId, numberpost){
	var xhttp;
	var url = "LoadPostOfOtherUser?&offset="+numberpost+"&userId="+userId;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
// 				document.getElementById('show-post-user').innerHTML += data;
			if (data.trim() != "") {
                appendPostsToDOM(data); // Thêm bài viết vào DOM
            }
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}

function LoadPostCommunityUser(numberpost){
	var xhttp;
	var url = "LoadPostCommunityUser?&offset="+numberpost;
	if(window.XMLHttpRequest){
		xhttp = new XMLHttpRequest();
	}
	else{
		xhttp = new ActiveXObject("Microsoft.XMLHTTP");
	}
	
	xhttp.onreadystatechange = function(){
		if(xhttp.readyState == 4){
			var data = xhttp.responseText;
// 				document.getElementById('show-post-user').innerHTML += data;
			if (data.trim() != "") {
                appendPostsToDOM(data); // Thêm bài viết vào DOM
            }
		}
	}
	xhttp.open("GET", url, true);
	xhttp.send();
}

function appendPostsToDOM(data) {
    var showPostUser = document.getElementById('show-post-user');
    var tempDiv = document.createElement('div');
    tempDiv.innerHTML = data;

    // Lọc bỏ các bài viết bị trùng lặp
    var newPosts = tempDiv.getElementsByClassName('post-container');
    for (var i = 0; i < newPosts.length; i++) {
        var postId = newPosts[i].getAttribute('id');
        if (!document.getElementById(postId)) {
            showPostUser.appendChild(newPosts[i]);
        }
    }
}
	
function EditPostUser(mode,postid){
	var xhttp;
	var post_scope = document.form_edit_post.post_scope_edit.value;
	var title_post = document.form_edit_post.title_post_edit.value;
	var old_content_post = document.form_edit_post.content_post_edit.value;
	var new_content_post;
	if(old_content_post != ""){
		new_content_post = encodeURIComponent(processText(old_content_post));
		old_content_post = encodeURIComponent(processTextNewLine(old_content_post));
		var url = "PostUserController?scope="+post_scope+"&title="+title_post+"&newcontent="+new_content_post+"&oldcontent="+old_content_post+"&mode="+mode+"&postid="+postid;
		if(window.XMLHttpRequest){
			xhttp = new XMLHttpRequest();
		}
		else{
			xhttp = new ActiveXObject("Microsoft.XMLHTTP");
		}
		
		xhttp.onreadystatechange = function(){
			if(xhttp.readyState == 4){
				var data = xhttp.responseText;
				document.getElementById("show-post-user").innerHTML = data;
			}
		}
		
		xhttp.open("POST", url, true);
		xhttp.send();
	}
}

function OpenModePopupPostEdit(button){
    var postId = button.getAttribute('data-id');
    var titleDiv = document.getElementById('title-post-' + postId);
    var contentDiv = document.getElementById('describe-post-' + postId);
    
    var titleValue = titleDiv ? titleDiv.innerText : '';
    var contentValue = contentDiv ? contentDiv.innerText : '';

    var formHTML = '<form id="edit-form-' + postId + '" name="form_edit_post">';	
    // Thêm input title vào form
    formHTML += '<strong>Chủ đề</strong>'
   	//Thêm select phạm vi bài viết 
       formHTML +=  '<select name="post_scope_edit" style="margin-left: 10px;border: 2px solid;">'
   				+		'<option value="0">Công khai</i></option>'
           		+		'<option value="1">Người theo dõi</i></option>'
           		+		'<option value="2">Chỉ mình tôi</i></option>'
   				+	'</select>'
    formHTML += '<br><input type="text" name="title_post_edit" style="width: 100%; margin-top: 10px;border: 3px solid;" id="title-input-' + postId + '" value="' + titleValue + '" data-initial-value="' + titleValue + '" /><br><br>';
    // Thêm textarea content vào form
    formHTML += '<strong>Nội dung</strong><br>'
    formHTML += '<textarea name="content_post_edit" style="max-height: 200px; width: 100%;max-width: 100%; margin-top: 10px;border: 3px solid;" id="content-textarea-' + postId + '" data-initial-value="' + contentValue + '">' + contentValue + '</textarea>';
    
    // Thêm nút Lưu chỉnh sửa và Xóa bài viết vào form
    formHTML += '<div class="btn-mode-edit">'
    formHTML += '<button type="button" onclick="EditPostUser(2,' + postId + ')">Lưu chỉnh sửa</button>';
    formHTML += '<button type="button" onclick="EditPostUser(3,' + postId + ')">Xóa bài viết</button>';
    formHTML += '</div>'
    formHTML += '</form>';
    
    // Đưa form vào content-post
    document.getElementById('edit-post-content-' + postId).innerHTML = formHTML;
    
    // Thay đổi cục tẩy thành X để thoát
    button.innerHTML = '<i style="font-size:30px;color:red" class="fa fa-close"></i>';
    button.onclick = function() { cancelEdit(postId); };
}

function cancelEdit(postId) {
    var form = document.getElementById('edit-form-' + postId);
    var titleInput = form.querySelector('#title-input-' + postId);
    var contentTextarea = form.querySelector('#content-textarea-' + postId);
    var editButton = document.querySelector('[data-id="' + postId + '"]');

    //đưa về ban đầu
    var originalTitle = titleInput.getAttribute('data-initial-value');
    var originalContent = contentTextarea.getAttribute('data-initial-value');

    var originalHTML = '';
    if (originalTitle) {
        originalHTML += '<div id="title-post-' + postId + '" class="title-post">' + originalTitle + '</div>';
    }
    if (originalContent) {
        originalHTML += '<div id="describe-post-' + postId + '" class="describe-post">' + originalContent + '</div>';
    }

    document.getElementById('edit-post-content-' + postId).innerHTML = originalHTML;

   	//cục tẩy chỉnh sửa
    editButton.innerHTML = '<i style="font-size:24px" class="fas">&#xf12d;</i>';
    editButton.onclick = function() { OpenModePopupPostEdit(this); };
}