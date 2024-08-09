<%@page import="BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=IUTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta charset="UTF-8">
<title>Bình luận</title>
</head>
<body>
	<!-- nhập bình luận -->
	<%
		if(session.getAttribute("sessionUser") == null){
	%>
		<div class="comment-form">
		  <textarea class="comment-textarea" placeholder="Đăng nhập để viết bình luận..." disabled="disabled"></textarea>
		  <button type="button" class="submit-button" disabled="disabled">Bình luận</button>
		</div>
	<%
		}else{
			String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath();
			User user = (User) session.getAttribute("sessionUser");
			String urlAvatar = user.getUserAvatarURL();
	%>
	<div class="comment-container">
		<img src="<%=urlAvatar %>" alt="User Avatar" class="avatar">
		<form name="form_comment">
		  <textarea class="comment-textarea" placeholder="Viết bình luận tại đây..." name="comment_content" required="required"></textarea>
		  <button type="button" class="submit-button" data-courseid="<%=request.getAttribute("courseId") %>" onclick="SendCommentCourse(this.getAttribute('data-courseid'))">Bình luận</button>
		</form>
	</div>
	<%
		}
	%>
</body>
</html>