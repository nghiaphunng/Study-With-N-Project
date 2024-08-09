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

<title>Cộng đồng</title>

<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	String pathAva = "View/User/avatar/img/";
   	request.setAttribute("path", path);
%>

<!-- file css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- cho icon tiktok -->
<link rel="stylesheet" href="View/Home/css/viewhome.css">
<link rel="stylesheet" href="View/Home/css/viewmenu.css">
<link rel="stylesheet" href="View/Home/css/view_toc_collapsible.css">
<link rel="stylesheet" href="View/Home/css/popup.css">

<link rel="stylesheet" href="View/User/css/style.css">
<link rel="stylesheet" href="View/User/css/post_style.css">
<link rel="stylesheet" href="View/User/css/icon.css">

<link rel="stylesheet" href="View/User/css/style.css">
<link rel="stylesheet" href="View/User/css/post_style.css">
<link rel="stylesheet" href="View/User/css/icon.css">
<link rel="stylesheet" href="View/User/css/tooltip.css">
<link rel="stylesheet" href="View/User/css/socialstats.css">

<link rel="stylesheet" href="View/Comment/css/comment.css">

</head>
<body>
	<%
		User user = (User) session.getAttribute("sessionUser");
	%>
	<!--thêm header-->
	<jsp:include page="/View/Home/menu.jsp"></jsp:include>
	
	<div class="split left user-intro">
		
	</div>
	
	<div class="split center" id="result-display">		
		<div id="show-post-user">
			<c:forEach items="${listPost }" var="post">
				<div class="post-container" id="post-${post.getPostId()}">
					<div class="info-post">
						<img src="${post.getUserAvatarURL() }" alt="User Avatar" class="avatar">
						<div class="info-general-post">
							<a href="UserInforPageForward?userid=${post.getUserId() }" class="name-user-post" style="cursor: pointer;">${post.getUserName() }</a>
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
								<img src="<%=user.getUserAvatarURL() %>" alt="User Avatar" class="avatar">
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
								<img src="<%=user.getUserAvatarURL() %>" alt="User Avatar" class="avatar">
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
	
	<div class="split right">
				
	</div>
	
	<!-- javascript -->
	<script type="text/javascript">
		var centerPage = document.getElementById('result-display');
		centerPage.onscroll = function() {
		  if (centerPage.scrollTop + centerPage.clientHeight >= centerPage.scrollHeight - 10) {
			  var number = document.getElementsByClassName('post-container').length;
			  LoadPostCommunityUser(number);
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
	
</body>
</html>