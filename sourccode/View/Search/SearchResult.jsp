<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Kết quả tìm kiếm</title>

<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	request.setAttribute("path", path);
%>

</head>
<body>
	<h2 style="font-size: 35px;color: ">Kết quả tìm kiếm</h2>
	
	<c:if test="${not empty searchCourseList}">
		<h2 style="color: blue; font-size: 25px;">Các môn học được tìm thấy</h2>
		<div id="course_container">
			<c:forEach items="${searchCourseList}" var="course">
				<div class="course_item">
					<img class="course_img" alt="error" src="${path}/View/mon-hoc/${course.getCourseCategoryFolder()}/${course.getCourseURL()}.png">
					<a class="course_title" href="CourseForward?courseId=${course.getCourseId()}">${course.getCourseName()}</a>
					<div class="course_desc">${course.getDescribe()}</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test="${not empty searchUserList}">
		<h2 style="color: blue; font-size: 25px;">Các tài khoản người dùng được tìm thấy</h2>
		<div class="followers-group"> <!-- tên class được lặp lại từ phần hiển thị danh sách follwer trên profileuser.jsp -->
			<c:forEach items="${searchUserList}" var="user">
				<div class="follower-item">	
					<img alt="error" class="avatar" src="${user.getUserAvatarURL() }">	
					<div class="info-follower">
						<c:if test="${sessionUser.getUserId() == user.getUserId() }">
							<a href="ProfileForward" class="fullname-follower"><strong>${user.getFullName() }</strong></a>
						</c:if>
						<c:if test="${sessionUser != null && sessionUser.getUserId() != user.getUserId()}">
							<a href="UserInforPageForward?userid=${user.getUserId() }" class="fullname-follower"><strong>${user.getFullName() }</strong></a>
						</c:if>
						<c:if test="${sessionUser == null}">
							<div class="fullname-follower"><strong>${user.getFullName() }</strong></div>
						</c:if>
						
						
						<div class="loginname-follower">${user.getUserName() }</div>
						<div class="birthday-follower">${user.getBirthday() }</div>
					</div>
					<div class="social-stats">
						<br>
						<div class="">${user.getNumberFollower() } Follower</div>
						<div class="">${user.getNumberFollowing() } Đang Follow</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</c:if>
	
	<c:if test="${not empty listPost}">
		<h2 style="color: blue; font-size: 25px;">Các bài viết được tìm thấy</h2>
		<div id="show-post-user">	
			<c:forEach items="${listPost }" var="post">
				<div class="post-container">
					<div class="info-post">
						<img src="${post.getUserAvatarURL() }" alt="User Avatar" class="avatar">
						<div class="info-general-post">
							<c:if test="${sessionUser.getUserId() == post.getUserId() }">
									<a href="ProfileForward" class="name-user-post" style="font-weight: bold;">${post.getUserName() }</a>
							</c:if>
							<c:if test="${sessionUser != null && sessionUser.getUserId() != post.getUserId()}">
									<a href="UserInforPageForward?userid=${post.getUserId() }" class="name-user-post" style="font-weight: bold;">${post.getUserName() }</a>
							</c:if>
							<c:if test="${sessionUser == null}">
									<div style="font-weight: bold;">${post.getUserName() }</div>
							</c:if>
								
							<div class="time-up-post">
								<c:if test="${sessionUser.getUserId() == post.getUserId() }">
									<a href="FindPostIdUser?postid=${post.getPostId() }">${post.getCreatedAt() }</a>
								</c:if>
								<c:if test="${sessionUser != null && sessionUser.getUserId() != post.getUserId()}">
									<a href="FindPostIdOfOtherUser?postid=${post.getPostId() }&infoUserId=${post.getUserId()}">${post.getCreatedAt() }</a>
								</c:if>
								<c:if test="${sessionUser == null}">
									${post.getCreatedAt() }
								</c:if>
								
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
				</div>
			</c:forEach>
		</div>
	</c:if>
</body>
</html>