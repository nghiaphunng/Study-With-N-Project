<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Hiển thị bình luận</title>
<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	String pathAva = "View/User/avatar/img/";
%>
</head>
<body>
	<!-- hiển thị bình luận -->
 	<c:forEach items="${listCmt}" var="cmt">
				<div class="list-comment">
					<img src="${cmt.getUserAvatarURL()}" alt="User Avatar" class="avatar">
					<div class="comment-content">
						<c:if test="${sessionUser.getUserId() == cmt.getUserId() }">
								<a class="username" href="ProfileForward" class="name-user-post" style="font-weight: bold;">${cmt.getFullNameUser() }</a>
						</c:if>
						<c:if test="${sessionUser != null && sessionUser.getUserId() != cmt.getUserId()}">
								<a class="username" href="UserInforPageForward?userid=${cmt.getUserId() }" class="name-user-post" style="font-weight: bold;">${cmt.getFullNameUser() }</a>
						</c:if>
						<c:if test="${sessionUser == null}">
								<div class="username">${cmt.getFullNameUser() }</div>
						</c:if>
						<div class="comment-text">${cmt.getContent() }</div>
					</div>
					<c:if test="${sessionUser.getUserId() == cmt.getUserId() }">
						<button type="button" class="delete-comment-btn" onclick="DeleteCommentCourse(${cmt.getCommentId()}, ${cmt.getPostId()})"><i style="font-size:30px;color:red;" class="fa fa-close"></i></button>
					</c:if>	
				</div>
			</c:forEach>
</body>
</html>