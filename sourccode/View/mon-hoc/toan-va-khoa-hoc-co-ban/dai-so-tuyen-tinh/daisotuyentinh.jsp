<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jstl/core_rt" prefix="c" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Đại số tuyến tính</title>
<meta name="viewport" content="width=device-width, initial-scale=1"/>

<% 	String path = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+request.getContextPath(); 
%>

<!-- file css -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewhome.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/viewmenu.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/view_toc_collapsible.css">
<link rel="stylesheet" href="<%=path %>/View/Home/css/popup.css">

<link rel="stylesheet" href="<%=path %>/View/mon-hoc/style.css">
<link rel="stylesheet" href="<%=path %>/View/Comment/css/comment.css">

</head>
<body>
	<!--thêm header-->
	<jsp:include page="/View/Home/menu.jsp"></jsp:include>
	
	<div class="split left">
		
	</div>
	
	<div class="split center" id="result-display">	
		<h2>Đang trong giai đoạn hoàn thành</h2>
	</div>
	
	<div class="split right">
		
	</div>
	
	<!-- file javascript -->
	<script type="text/javascript" src="<%=path %>/View/Home/js/TocCollapsible.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Home/js/popup.js"></script>
	<script type="text/javascript" src="<%=path %>/View/Search/js/Search.js"></script>
	
	<script type="text/javascript" src="<%=path %>/View/Comment/js/Comment.js"></script>
</body>
</html>