<%@page import="BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	request.setAttribute("path", path);	
	User user = (User) session.getAttribute("sessionUser");
	String nameAva = user.getUserAvatarURL();
// 	String pathAva = "View/User/avatar/img/";
%>
<title>Bài viết</title>
</head>
<body>
	<c:forEach items="${listPost }" var="post">
					<div class="post-container" id="post-${post.getPostId()}">
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
							
							<!-- thông tin like và commet -->
							<div class="info-count-like-comment">
								<button class="count-like-post" onclick="TogglePopupLikePost(${post.getPostId()}), DisplayLikePost(${post.getPostId()}, <%=user.getUserId() %>);">Lượt thích</button>
								<button class="count-comment-post" onclick="TogglePopupCommentPost(${post.getPostId()}); DisplayCommentPost(${post.getPostId()}, <%=user.getUserId() %>);">Bình luận</button>
							</div>
							
							<!-- hiển thị danh sách lượt like -->
							<div id="popupLikePost-${post.getPostId()}" class="popup-container">
								<div class="popup-box" style="min-height: 200px;">
									<div id="display-like-list-${post.getPostId()}">

									</div>
									<!-- đóng cửa sổ -->
									<button class="btn-close-popup" onclick="TogglePopupLikePost(${post.getPostId()})"><i style="font-size:30px;color:red;margin-top: 2px;margin-right: -7px;" class="fa fa-close"></i></button>
								</div>
							</div>
							
							<!-- cục tẩy chỉnh sửa bài viết -->
							<c:if test="${sessionUser.getUserId() == post.getUserId() }">
								<button type="button" class="edit-post-btn" data-id="${post.getPostId()}" onclick="OpenModePopupPostEdit(this)">
									<i style='font-size:24px' class='fas'>&#xf12d;</i>
								</button>
							</c:if>
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
						
						<!-- phần bình luận -->
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
</body>
</html>