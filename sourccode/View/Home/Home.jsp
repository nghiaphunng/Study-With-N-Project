<%@page import="java.text.Normalizer"%>
<%@page import="BEAN.User"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>

<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1"/>
<meta charset="UTF-8">
<title>Trang chủ</title>

<% 
	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
	request.setAttribute("path", path);
%>

<!-- file css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewhome.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewmenu.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/view_toc_collapsible.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/popup.css">


<link rel="stylesheet" href="<%=path %>/View/User/css/style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/post_style.css">
<link rel="stylesheet" href="<%=path %>/View/User/css/icon.css">

<link rel="stylesheet" href="<%=path %>/View/User/css/socialstats.css">

</head>
<body>
	<!--thêm header-->
	<jsp:include page="menu.jsp"></jsp:include>
	
	<div id="main">
		<div class="split left">
			<h2 style="text-align: center;color: orange;">Tài liệu học tập</h2>
			
			<c:forEach items="${listCourse }" var="courseType">
				<button class="course_title_collapsible">${courseType.key }</button>
				<div class="list_course">
					<ol>
						<c:forEach items="${courseType.value }" var="course">
							<li>
				  				<a href="CourseForward?courseId=${course.getCourseId()}">${course.getCourseName()}</a>
				  			</li>	
				  		</c:forEach>
					</ol>	
				</div>
			</c:forEach>
			
			<br>
		</div>
	
		<div class="split center" id="result-display">	
			<h2>Các môn học mới được cập nhật</h2>	
			<div id="course_container">
				<c:forEach items="${searchCourseList}" var="course">
					<div class="course_item">
						<img class="course_img" alt="error" src="${path}/View/mon-hoc/${course.getCourseCategoryFolder()}/${course.getCourseURL()}.png">
						<a class="course_title" href="CourseForward?courseId=${course.getCourseId()}">${course.getCourseName()}</a>
						<div class="course_desc">${course.getDescribe()}</div>
					</div>
				</c:forEach>
			</div>
			
			<br>
		</div>
		
		<div class="split right">
				
		</div>
	</div>
	
	<!-- file javascript -->
	<script type="text/javascript" src="<%=path %>/View/Home/js/TocCollapsible.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/popup.js"></script>

	<script type="text/javascript" src="<%=path %>/View/Search/js/Search.js"></script>
	
</body>
</html>