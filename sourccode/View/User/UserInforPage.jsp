<%@page import="BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">

<!-- icon visibility -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/k7ujTnHq6TsoSB1K2O9l+Y0fN4xj0K7mKjWo11hFIbgHv+j+GAYdKdLoMtf6V/4FTn3iM2dZ4+V/A==" crossorigin="anonymous" referrerpolicy="no-referrer">

<title>Trang thông tin người dùng</title>

<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
   	request.setAttribute("path", path);
%>

<!-- file css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- cho icon tiktok -->
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewhome.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewmenu.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/view_toc_collapsible.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/popup.css">

<link rel="stylesheet" href="<%=path %>/View/User/css/style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/post_style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/icon.css">

<link rel="stylesheet" href="<%=path %>/View/User/css/style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/post_style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/icon.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/tooltip.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/socialstats.css">

<link rel="stylesheet" href="<%=path %>/View/Comment/css/comment.css">

<style type="text/css">
	.btn-edit-relationshipUser{
		position: absolute;
		left: 10px;
		border: none;
		font-size: 20px;
		font-weight: bold;
		color: floralwhite;
		background-color: navy;
		cursor: pointer;
	}
	
	@keyframes changeColorUserPage{
		25% {
			color: aqua;
		}
		50% {
			color: burlywood;
		}
		75% {
			color: coral;
		}		
	}
</style>
</head>
<body>
	<%
		User user = (User) session.getAttribute("sessionUser");
		String nameAva = user.getUserAvatarURL();
	%>
	<!--thêm header-->
	<jsp:include page="/View/Home/menu.jsp"></jsp:include>
	
	<div class="split left user-intro">
		<h2 style="font-size: 30px; animation-name: changeColorUserPage; animation-duration: 4s; animation-iteration-count: infinite;">Trang cá nhân<br>của ${infoUser.getFullName() }</h2>
<!-- 		<div id="display-social-network-user"> -->
			
<!-- 		</div> -->
		
	</div>
	
	<div class="split center" id="result-display">
		<div class="header-user" style="position: relative;">
			<div class="tooltip">
			 	<img src="${infoUser.getUserAvatarURL() }" alt="User Avatar" class="avatar-profile">
				<div class="tooltiptext">
					<button onclick="TogglePopupShowAvatar()">
						Xem ảnh đại diện
					</button>				
				</div>
			</div>
			<div class="full-name">${infoUser.getFullName() }</div>
			<div class="user-name">${infoUser.getUserName() }</div>
			<c:if test="${checkIsFollowing && checkIsFollwer}">
				<button class="btn-edit-relationshipUser" id="btn-edit-relationshipUser" onclick="DeleteFollow(<%=user.getUserId() %>,${infoUser.getUserId() })">Bạn bè</button>
			</c:if>
			<c:if test="${!checkIsFollowing && checkIsFollwer}">
				<button class="btn-edit-relationshipUser" id="btn-edit-relationshipUser" onclick="DeleteFollow(<%=user.getUserId() %>,${infoUser.getUserId() })">Đang theo dõi</button>
			</c:if>
			<c:if test="${checkIsFollowing && !checkIsFollwer}">
				<button class="btn-edit-relationshipUser" id="btn-edit-relationshipUser" onclick="InsertFollow(<%=user.getUserId() %>,${infoUser.getUserId() })">Theo dõi lại</button>
			</c:if>
			<c:if test="${!checkIsFollowing && !checkIsFollwer}">
				<button class="btn-edit-relationshipUser" id="btn-edit-relationshipUser" onclick="InsertFollow(<%=user.getUserId() %>,${infoUser.getUserId() })">Theo dõi</button>
			</c:if>
		</div>
		
		<div id="popupShowAva" class="popup-container">
			<div class="popup-box">
				<h2>Ảnh đại diện</h2>
				<div style="display: flex;text-align: center;justify-content: center; ">
					<img alt="error" src="${infoUser.getUserAvatarURL() }" style="width: 90%;">
				</div>
				<button class="btn-close-popup" onclick="TogglePopupShowAvatar()"><i style="font-size:30px;color:red;margin-top: 2px;margin-right: -7px;" class="fa fa-close"></i></button>
				<br>
			</div>
		</div>
			
		<div class="activity-info" id="activity-info-group">
			<button class="btn-info  active-btn-info" onclick="ReloadPage()">Bài viết</button>
		 	<button class="btn-info" onclick="DisplayFollowerOfOtherUser(${infoUser.getUserId()})">Người theo dõi</button>
		 	<button class="btn-info" onclick="DisplayFollowingOfOtherUser(${infoUser.getUserId()})">Đang theo dõi</button>
		</div>
		
		<div id="change-activity-info-group">
			<div id="show-post-user">
				<c:forEach items="${listPostOfInfoOtherUser }" var="post">
					<div class="post-container" id="post-${post.getPostId()}">
						<div class="info-post">
							<img src="${infoUser.getUserAvatarURL() }" alt="User Avatar" class="avatar">
							<div class="info-general-post">
								<div class="name-user-post">${post.getUserName() }</div>
								<div class="time-up-post">${post.getCreatedAt() } 		
									<c:if test="${post.getVisibilityId() == 0 }">
										<i class="fa fa-globe" aria-hidden="true" title="Công khai"></i>
									</c:if>
									<c:if test="${post.getVisibilityId() == 1 }">
										<i class="fa fa-users" aria-hidden="true" title="Người theo dõi"></i>
									</c:if>
									<c:if test="${post.getVisibilityId() == 2 }">
										<i class="fa fa-lock" aria-hidden="true" title="Chỉ mình tôi"></i>
									</c:if>	
								</div>
							</div>
						</div>
					
						<!--hiển thị/chỉnh sửa title và content bài viết  -->
						<div class="content-post" id="edit-post-content-${post.getPostId()}">
							<c:if test="${not empty post.getTitle()}">
								<div id="title-post-${post.getPostId()}" class="title-post">${post.getTitle()}</div>
							</c:if>
							<c:if test="${not empty post.getOldContent()}">
								<div id="describe-post-${post.getPostId()}" class="describe-post">${post.getNewContent()}</div>
							</c:if>
						</div>
						
						<!-- phần bình luận và like -->
						<div class="comment-post" id="show-comment-post-${post.getPostId() }">
							<c:if test="${post.getUserLiked() == 1 }">
								<button onclick="ProcessClickLikePost(${post.getPostId()}, ${post.getUserLiked()})" class="show-like-post-btn"><i class="fa fa-thumbs-up" style="color: mediumslateblue;"></i> Đã Thích (${post.getLikeList().size() } lượt thích)</button>
							</c:if>
							<c:if test="${post.getUserLiked() == 0 }">
								<button onclick="ProcessClickLikePost(${post.getPostId()}, ${post.getUserLiked()})" class="show-like-post-btn"><i class="fa fa-thumbs-up" style="color: mediumslateblue;"></i> Thích (${post.getLikeList().size() } lượt thích)</button>
							</c:if>
							<button onclick="TogglePopupCommentPost(${post.getPostId()}); DisplayCommentPost(${post.getPostId()});" class="show-comment-post-btn"><i class='fas fa-comment' style="color: mediumslateblue;"></i> Bình luận</button>
						</div>
						
						<!-- Hiển thị cửa sổ bình luận -->
						<div id="popupCommentPost-${post.getPostId()}" class="popup-container">
							<div class="popup-box" style="width: 60%;">
								<!-- nội dung bài viết -->
								<div class="info-post">
									<img src="<%=nameAva %>" alt="User Avatar" class="avatar">
									<div class="info-general-post">
										<div class="name-user-post">${post.getUserName() }</div>
										<div class="time-up-post">${post.getCreatedAt() } 		
											<c:if test="${post.getVisibilityId() == 0 }">
												<i class="fa fa-globe" aria-hidden="true" title="Công khai"></i>
											</c:if>
											<c:if test="${post.getVisibilityId() == 1 }">
												<i class="fa fa-users" aria-hidden="true" title="Người theo dõi"></i>
											</c:if>
											<c:if test="${post.getVisibilityId() == 2 }">
												<i class="fa fa-lock" aria-hidden="true" title="Chỉ mình tôi"></i>
											</c:if>	
										</div>
									</div>
								</div>
				
								<!--hiển thị/chỉnh sửa title và content bài viết  -->
								<div class="content-post" id="edit-post-content-${post.getPostId()}">
									<c:if test="${not empty post.getTitle()}">
										<div id="title-post-${post.getPostId()}" class="title-post">${post.getTitle()}</div>
									</c:if>
									<c:if test="${not empty post.getOldContent()}">
										<div id="describe-post-${post.getPostId()}" class="describe-post">${post.getNewContent()}</div>
									</c:if>
								</div>
								
								<!-- hiển thị phần comment -->
								<h3 style="font-size: 20px; color: blue; margin-bottom: 5px;">Bình luận</h3>
								<div id="show-comment-post-popup-${post.getPostId()}">
									<!-- hiển thị các comment đã có -->
								</div>
								
								<!-- Nhập comment -->
								<div class="comment-container">
									<img src="<%=nameAva %>" alt="User Avatar" class="avatar">
									<form id="form-comment-${post.getPostId()}">
									  <textarea class="comment-textarea" placeholder="Viết bình luận tại đây..." name="comment-content-post" required="required" style="padding: 10px; margin: 0px 5px 0px 0px; resize: vertical;border-radius: 5px;box-sizing: content-box;max-height: 100px;height: 23px"></textarea>
									  <button type="button" class="submit-button" onclick="SendCommentPost(${post.getPostId()})" style="margin: auto 0px; padding: 0px 20px;">Bình luận</button>
									</form>
								</div>
								
								<!-- đóng cửa sổ -->
								<button data-postid="${post.getPostId()}" class="btn-close-popup" onclick="TogglePopupCommentPost(this.getAttribute('data-postid'))"><i style="font-size:30px;color:red;margin-top: 2px;margin-right: -7px;" class="fa fa-close"></i></button>
								<br>
							</div>
						</div>
					</div>
				</c:forEach>
			</div>	
			<br>
		</div>
	</div>
	
	<div class="split right">
				
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		var centerPage = document.getElementById('result-display');
		centerPage.onscroll = function() {
		  if (centerPage.scrollTop + centerPage.clientHeight >= centerPage.scrollHeight - 10) {
			  var number = document.getElementsByClassName('post-container').length;
			  LoadPostOfOtherUser(${infoUser.getUserId()}, number);
		  }
		};
		
		<!-- kích hoạt active -->
		var act_info_group = document.getElementById('activity-info-group');
        var btns = act_info_group.getElementsByClassName("btn-info");
        for (var i = 0; i < btns.length; i++) {
            btns[i].addEventListener("click", function() {
                var current = document.getElementsByClassName("active-btn-info");
                if (current.length > 0) { 
                    current[0].classList.remove("active-btn-info");
                }
                this.classList.add("active-btn-info");
            });
        }

	</script>
	
	<c:if test="${not empty posthighlight}">
		<script type="text/javascript">
			var postFound = document.getElementById('post-${posthighlight}');
			postFound.scrollIntoView();
		
			postFound.classList.add("highlightfoundpost-animation");
		
		    setTimeout(function() {
		    	postFound.classList.remove("highlightfoundpost-animation");
		    }, 4000);
		</script>
	</c:if>
	
	<!-- file javascript -->
	<script type="text/javascript" src="<%=path %>/View/Home/js/TocCollapsible.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/popup.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/ProcessTextInput.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/ReloadPage.js"></script>
	
	<script type="text/javascript" src="<%=path %>/View/Comment/js/Comment.js"></script>
	<script type="text/javascript" src="<%=path %>/View/User/js/LoadPost.js"></script>
	<script type="text/javascript" src="<%=path %>/View/User/js/TogglePost.js"></script>
	<script type="text/javascript" src="<%=path %>/View/User/js/FollowList.js"></script>
	<script type="text/javascript" src="<%=path %>/View/User/js/LikeList.js"></script>
	<script type="text/javascript" src="<%=path %>/View/User/js/ProcessFollow.js"></script>
	
	<script type="text/javascript" src="<%=path %>/View/Search/js/Search.js"></script>
	
	
	<script type="text/javascript">
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
//	 				document.getElementById('show-post-user').innerHTML += data;
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
	
	function DeleteFollow(visitingUserId, infoUserId){
		var xhttp;
		var url = "DeleteFollowController?visitingUserId="+visitingUserId+"&infoUserId="+infoUserId;
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
		var url = "InsertFollowController?visitingUserId="+visitingUserId+"&infoUserId="+infoUserId;
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
	</script>
</body>
</html>